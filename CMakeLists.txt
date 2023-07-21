# This file is part of Silver
# 
# Silver is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation, either version 3 of the License, or any later version.
# 
# Silver is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along with Silver. If not, see
# <https://www.gnu.org/licenses/>.

# Ensure that minimum cmake version is available (v3.18.0).
# For some reason, modern versions of cmake does not happen to obey the FATAL_ERROR on `cmake_minimum_required`.
# Therefore, we ensure a manual version check.
cmake_minimum_required(VERSION 3.18.0 FATAL_ERROR)
if(CMAKE_VERSION VERSION_LESS "3.18.0")
    message(FATAL_ERROR "silver requires CMake version 3.18.0 or newer")
endif()

# Initialize the CMake project
project(silver LANGUAGES CXX)

