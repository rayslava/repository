# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ROCM_VERSION="7.2.0"

PYTHON_COMPAT=( python3_{11,12,13} )
DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=poetry
DISTUTILS_SINGLE_IMPL=1

inherit cmake cuda rocm linux-info distutils-r1

TINY_LLAMAS_COMMIT="99dd1a73db5a37100bd4ae633f4cfce6560e1567"

DESCRIPTION="Port of Facebook's LLaMA model in C/C++"
HOMEPAGE="https://github.com/ggml-org/llama.cpp"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ggml-org/llama.cpp.git"
else
	MY_PV="b${PV#0_pre}"
	SRC_URI="https://github.com/ggml-org/llama.cpp/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/llama.cpp-${MY_PV}"
	KEYWORDS="~amd64"
fi

SRC_URI+="
	examples? (
		https://huggingface.co/ggml-org/tiny-llamas/resolve/${TINY_LLAMAS_COMMIT}/stories15M-q4_0.gguf
			-> ggml-org_models_tinyllamas_stories15M-q4_0-${TINY_LLAMAS_COMMIT}.gguf
	)
"

LICENSE="MIT"
SLOT="0"
CPU_FLAGS_X86=( avx avx2 f16c )

# wwma USE explained here: https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md#hip
IUSE="curl openblas +openmp blis rocm cuda opencl openssl vulkan flexiblas wmma examples python"

REQUIRED_USE="
	?? (
		openblas
		blis
		flexiblas
	)
	wmma? (
		rocm
	)
	python? ( ${PYTHON_REQUIRED_USE} )
"

# curl is needed for pulling models from huggingface
# numpy is used by convert_hf_to_gguf.py
CDEPEND="
	curl? ( net-misc/curl:= )
	openblas? ( sci-libs/openblas:= )
	openmp? ( llvm-runtimes/openmp:= )
	blis? ( sci-libs/blis:= )
	flexiblas? ( sci-libs/flexiblas:= )
	rocm? (
		>=dev-util/hip-${ROCM_VERSION}:=
		>=sci-libs/hipBLAS-${ROCM_VERSION}:=
		wmma? (
			>=sci-libs/rocWMMA-${ROCM_VERSION}:=
		)
	)
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	openssl? ( dev-libs/openssl:= )
"
DEPEND="${CDEPEND}
	opencl? ( dev-util/opencl-headers )
	vulkan? (
		dev-util/spirv-headers
		dev-util/vulkan-headers
	)
"
RDEPEND="${CDEPEND}
	dev-python/numpy
	opencl? ( dev-libs/opencl-icd-loader )
	vulkan? ( media-libs/vulkan-loader )
	python? (
		${PYTHON_DEPS}
		$(python_gen_cond_dep '
			dev-python/numpy[${PYTHON_USEDEP}]
			dev-python/tqdm[${PYTHON_USEDEP}]
			dev-python/pyyaml[${PYTHON_USEDEP}]
			dev-python/requests[${PYTHON_USEDEP}]
			sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
			sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
		')
	)
"
BDEPEND="media-libs/shaderc
	python? (
		${PYTHON_DEPS}
		$(python_gen_cond_dep '
			dev-python/poetry-core[${PYTHON_USEDEP}]
		')
	)
"

pkg_setup() {
	use python && python-single-r1_pkg_setup
	if use rocm; then
		linux-info_pkg_setup
		if linux-info_get_any_version && linux_config_exists; then
			if ! linux_chkconfig_present HSA_AMD_SVM; then
				ewarn "To use ROCm/HIP, you need to have HSA_AMD_SVM option enabled in your kernel."
			fi
		fi
	fi
}

src_prepare() {
	use cuda && cuda_src_prepare
	cmake_src_prepare
	if use examples; then
		mkdir -p "${BUILD_DIR}/tinyllamas" || die
		cp "${DISTDIR}/ggml-org_models_tinyllamas_stories15M-q4_0-${TINY_LLAMAS_COMMIT}.gguf" \
			"${BUILD_DIR}/tinyllamas/stories15M-q4_0.gguf" || die
	fi
}

src_configure() {
	local mycmakeargs=(
		-DLLAMA_BUILD_TESTS=OFF
		-DLLAMA_BUILD_EXAMPLES=$(usex examples)
		-DLLAMA_BUILD_SERVER=ON
		-DCMAKE_SKIP_BUILD_RPATH=ON
		-DGGML_NATIVE=0	# don't set march
		-DGGML_RPC=ON
		-DLLAMA_CURL=$(usex curl)
		-DLLAMA_OPENSSL=$(usex openssl)
		-DBUILD_NUMBER="1"
		-DGENTOO_REMOVE_CMAKE_BLAS_HACK=ON
		-DGGML_CUDA=$(usex cuda)
		-DGGML_OPENCL=$(usex opencl)
		-DGGML_OPENMP=$(usex openmp)
		-DGGML_VULKAN=$(usex vulkan)

		# avoid clashing with whisper.cpp
		-DCMAKE_INSTALL_LIBDIR="${EPREFIX}/usr/$(get_libdir)/llama.cpp"
		-DCMAKE_INSTALL_RPATH="${EPREFIX}/usr/$(get_libdir)/llama.cpp"
	)

	if use openblas ; then
		mycmakeargs+=(
			-DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS
		)
	fi

	if use blis ; then
		mycmakeargs+=(
			-DGGML_BLAS=ON -DGGML_BLAS_VENDOR=FLAME
		)
	fi

	if use flexiblas; then
		mycmakeargs+=(
			-DGGML_BLAS=ON -DGGML_BLAS_VENDOR=FlexiBLAS
		)
	fi

	if use cuda; then
		local -x CUDAHOSTCXX="$(cuda_gccdir)"
		# tries to recreate dev symlinks
		cuda_add_sandbox
		addpredict "/dev/char/"
	fi

	if use rocm; then
		rocm_use_hipcc
		mycmakeargs+=(
			-DGGML_HIP=ON -DAMDGPU_TARGETS=$(get_amdgpu_flags)
			-DGGML_HIP_ROCWMMA_FATTN=$(usex wmma)
		)
	fi

	cmake_src_configure
}

python_compile() {
	cd "${S}/gguf-py" || die
	distutils-r1_python_compile
}

python_install() {
	cd "${S}/gguf-py" || die
	distutils-r1_python_install
}

src_compile() {
	cmake_src_compile
	use python && distutils-r1_src_compile
}

src_install() {
	cmake_src_install
	dobin "${BUILD_DIR}/bin/rpc-server"

	# avoid clashing with whisper.cpp
	rm -rf "${ED}/usr/include"

	use python && distutils-r1_src_install
}
