cmake_minimum_required(VERSION 3.8)

include($ENV{ZEPHYR_BASE}/cmake/app/boilerplate.cmake NO_POLICY_SCOPE)
project(NONE)

#target_sources(app PRIVATE client.c)
target_sources(app PRIVATE server.c)
target_include_directories(
    app PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/open62541/include
    ${CMAKE_CURRENT_SOURCE_DIR}/open62541/arch/posix
    ${CMAKE_CURRENT_SOURCE_DIR}/open62541/arch
    ${CMAKE_CURRENT_SOURCE_DIR}/open62541/plugins
    ${CMAKE_CURRENT_SOURCE_DIR}/open62541/BUILD/src_generated
)

add_library(libopen62541 STATIC IMPORTED)
set_target_properties(libopen62541 PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/open62541/BUILD/bin/libopen62541.a)
target_link_libraries(app PUBLIC libopen62541)

zephyr_get_include_directories_for_lang_as_string(C includes)
zephyr_get_system_include_directories_for_lang_as_string(C system_includes)
zephyr_get_compile_definitions_for_lang_as_string(C definitions)
zephyr_get_compile_options_for_lang_as_string(C options)

add_custom_target(
  outputexports
  COMMAND echo CC="${CMAKE_C_COMPILER}"
  COMMAND echo AR="${CMAKE_AR}"
  COMMAND echo Z_CFLAGS="${system_includes} ${includes} ${definitions} ${options}"
  VERBATIM
  USES_TERMINAL
)
