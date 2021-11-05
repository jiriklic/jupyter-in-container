FROM jupyterlab-img

LABEL maintainer="Jiri Klic <web@jiriklic.com>"


# RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends \


# RUN mkdir temp && cd temp \

# RUN XEUS_PREFIX=/usr/local/xeus-cling \
#     && wget -O /tmp/miniforge.sh https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-$(uname -m).sh \
#     && chmod +x /tmp/miniforge.sh \
#     && mkdir -p ${XEUS_PREFIX} \
#     && /tmp/miniforge.sh -bfp ${XEUS_PREFIX} -u \
#     && rm /tmp/miniforge.sh \
#     # Add miniforge to the path temporarily
#     %% export PATH="$PATH:${XEUS_PREFIX}/bin" \
#     # Install dependencies
#     && conda install -c conda-forge -y cmake "xeus>=2.0,<3.0" cling=0.8 clangdev=5.0.0 llvmdev=5 "nlohmann_json>=3.9.1,<3.10" "cppzmq>=4.6.0,<5" "xtl>=0.7,<0.8" pugixml "cxxopts>=2.1.1,<2.2"
#     # Install xeus-cling
#     && rm -rf /tmp/xeus-cling \
#     && cd /tmp \
#     && git clone https://github.com/jupyter-xeus/xeus-cling.git \
#     && cd xeus-cling \
#     # 0.13.0
#     && git checkout $(git describe --tags $(git rev-list --tags --max-count=1)) \
#     && mkdir -p build && cd build \
#     && cmake -D CMAKE_INSTALL_PREFIX=${XEUS_PREFIX} -D CMAKE_INSTALL_LIBDIR=${XEUS_PREFIX}/lib -D DOWNLOAD_GTEST=ON .. \
#     && make install -j$(nproc) \
#     && rm -rf /tmp/xeus-cling \
#     # Remove build dependencies
#     && conda clean -y -f \
#     && cd ${XEUS_PREFIX}
