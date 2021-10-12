FROM jupyterlab-img

LABEL maintainer="Jiri Klic <web@jiriklic.com>"


RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends \
            gdal-bin \
            libgdal-dev \
    # Verify the gdal-bin installation
    && gdalinfo --version \
    # export environment variables for the compiler
    && export CPLUS_INCLUDE_PATH=/usr/include/gdal \
    && export C_INCLUDE_PATH=/usr/include/gdal


RUN python -m pip install --upgrade pip \
    # install same version of GDAL bindings as gdal-bin
    GDAL==$(gdalinfo --version | grep -o  '[0-9]\.[0-9]\.[0-9]') \
    rasterio \
    geopandas
