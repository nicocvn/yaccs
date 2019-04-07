# ---------------------------------------------------------------------------- #
# yaccs / flags / clang static linking on linux
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable static linking.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_clang_static)
    return()
endif()
set(__yaccs_clang_static 1)


# Enable static build.
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_DEBUG "-Wl,-lpthread")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_DEBUG "-Wl,-lc")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_DEBUG "-Wl,-lc++abi")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_DEBUG "-Wl,-ldl")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_DEBUG "-Wl,-lgcc")
#
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELEASE "-Wl,-lpthread")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELEASE "-Wl,-lc")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELEASE "-Wl,-lc++abi")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELEASE "-Wl,-ldl")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELEASE "-Wl,-lgcc")
#
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO "-Wl,-lpthread")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO "-Wl,-lc")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO "-Wl,-lc++abi")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO "-Wl,-ldl")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO "-Wl,-lgcc")
#
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL "-Wl,-lpthread")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL "-Wl,-lc")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL "-Wl,-lc++abi")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL "-Wl,-ldl")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL "-Wl,-lgcc")
