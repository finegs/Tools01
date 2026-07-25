cmake_minimum_required(VERSION 3.16.3)

project(aa)

# Set a default build type to Debug if none was specified
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "Choose the type of build." FORCE)
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()


set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# find_package(SimpleITK)
add_executable( aa aa.cpp )
# target_link_libraries ( sitk_example ${SimpleITK_LIBRARIES} )
