@REM Remove build folder
@REM rd /s /q build 
@REM Generate CMakeFiles
cmake -Bbuild -DCMAKE_BUILD_TYPE=Debug -DPAHO_WITH_SSL=ON -DPAHO_BUILD_SHARED=ON -DPAHO_BUILD_STATIC=ON -DPAHO_BUILD_SAMPLES=ON -DPAHO_HIGH_PERFORMANCE=ON -DPAHO_USE_SELECT=OFF -DCMAKE_INSTALL_PREFIX=D:\\Programs\\share -DOPENSSL_ROOT_DIR=D:\\Programs\\share -DCMAKE_PREFIX_PATH=D:\\Programs\\share
@REM Build
cmake --build build --target ALL_BUILD -- /t:Rebuild /m:8
cmake --build build --target install
