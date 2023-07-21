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

# This function ensures that the current CMake configuration is, in fact, an out-of-source build. This is done by getting the
# Realpath to the top-level source and binary directory and comparing them. By getting the real path, we potentially remove the
# case where the build directory is a symlink to the source directory.
function(AssertOutOfSourceBuild)
    get_filename_component(SOURCE_DIR "${CMAKE_SOURCE_DIR}" REALPATH)
    get_filename_component(BINARY_DIR "${CMAKE_BINARY_DIR}" REALPATH)

    if(SOURCE_DIR STREQUAL BINARY_DIR)
        message("")
        message("================================================================================")
        message("|| Silver discourages in-source builds as they tend to pollute the current ")
        message("|| working directory and VCS. To prevent this, silver strictly requires an ")
        message("|| out-of-source build configuration.")
        message("||")
        message("|| In an out-of-source configuration, a dedicated directory is used to store")
        message("|| build related files and artifacts generated as a result of build runs. This")
        message("|| ensures that the project work tree is clean during the build process.")
        message("||")
        message("|| To achieve this, follow these steps:")
        message("||")
        message("||  ==> Pull a clean commit from the origin")
        message("||  ==> Create a dedicated directory (ex: build)")
        message("||      --> mkdir \"build\"")
        message("||  ==> Configure CMake to use the newly created directory")
        message("||      --> cmake -S <SOURCE_DIR> -B \"build\" <...YOUR_OPTIONS>")
        message("||  ==> Build required target(s) by directing the appropriate build directory")
        message("||      --> cmake --build \"build\" --target all")
        message("||")
        message("|| NOTE: This current configuration run should have created various artifacts")
        message("||       including, but not limited to ")
        message("||           - CMakeCache.txt")
        message("||           - CMakeFiles/")
        message("||           - cmake_install.cmake")
        message("||           - MakeFile")
        message("||             ::")
        message("||             ;;")
        message("||       Ensure to remove them, either manually or by restore the commit then")
        message("||       proceed with the above mentioned steps to create the desired")
        message("||       out-of-source build configuration.")
        message("||")
        message("EE Silver requires out-of-source build configuration")
        message("================================================================================")
        message("")

        message(FATAL_ERROR)
    endif()
endfunction()

AssertOutOfSourceBuild()
