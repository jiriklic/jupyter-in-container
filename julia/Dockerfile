FROM jupyterlab-img

LABEL maintainer="Jiri Klic <web@jiriklic.com>"


RUN mkdir temp && cd temp \
    && wget https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-1.6.3-linux-x86_64.tar.gz \
    && tar -xvzf julia-1.6.3-linux-x86_64.tar.gz \
    && sudo cp -r julia-1.6.3 /opt/ \
    && sudo ln -s /opt/julia-1.6.3/bin/julia /usr/local/bin/julia \
    && cd .. && sudo rm -rf temp

RUN julia -e 'using Pkg; \
	          Pkg.add("IJulia")'
