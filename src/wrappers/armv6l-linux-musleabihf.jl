# Autogenerated wrapper script for librsync_jll for armv6l-linux-musleabihf
export librsync, rdiff

using Bzip2_jll
using Popt_jll
using Zlib_jll
JLLWrappers.@generate_wrapper_header("librsync")
JLLWrappers.@declare_library_product(librsync, "librsync.so.2")
JLLWrappers.@declare_executable_product(rdiff)
function __init__()
    JLLWrappers.@generate_init_header(Bzip2_jll, Popt_jll, Zlib_jll)
    JLLWrappers.@init_library_product(
        librsync,
        "lib/librsync.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        rdiff,
        "bin/rdiff",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
