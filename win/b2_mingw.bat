@echo off
bootstrap --prefix=D:\Programs\boost\boost-1_73 gcc
echo "1. done"
rem b2 --clean --prefix=D:\Programs\boost --build-type=complete --j4 --layout=versioned toolset=gcc --without-context --without-coroutine variant=debug link=shared threading=multi runtime-link=shared  stage install

b2 --layout=system --without-python --without-locale toolset=gcc variant=debug link=shared threading=multi runtime-link=shared address-model=64 stage
echo "2. done"

b2 --prefix=D:\Programs\boost\boost-1_73 --layout=system --without-python --without-locale toolset=gcc variant=debug link=shared threading=multi runtime-link=shared address-model=64 install
echo "3. done"

cd /D D:\Programs\boost
mklink /D include D:\Programs\boost\boost-1_73\include\boost-1_73
mklink /D lib D:\Programs\boost\boost-1_73\lib



echo "All. done"
