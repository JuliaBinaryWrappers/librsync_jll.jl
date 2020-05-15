# Autogenerated wrapper script for librsync_jll for x86_64-apple-darwin14
export rdiff, librsync

using Zlib_jll
using Bzip2_jll
using Popt_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "DYLD_FALLBACK_LIBRARY_PATH"
LIBPATH_default = "~/lib:/usr/local/lib:/lib:/usr/lib"

# Relative path to `rdiff`
const rdiff_splitpath = ["bin", "rdiff"]

# This will be filled out by __init__() for all products, as it must be done at runtime
rdiff_path = ""

# rdiff-specific global declaration
function rdiff(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(rdiff_path)
    end
end


# Relative path to `librsync`
const librsync_splitpath = ["lib", "librsync.2.3.0.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
librsync_path = ""

# librsync-specific global declaration
# This will be filled out by __init__()
librsync_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const librsync = "@rpath/librsync.2.dylib"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"librsync")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Zlib_jll.PATH_list, Bzip2_jll.PATH_list, Popt_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Zlib_jll.LIBPATH_list, Bzip2_jll.LIBPATH_list, Popt_jll.LIBPATH_list,))

    global rdiff_path = normpath(joinpath(artifact_dir, rdiff_splitpath...))

    push!(PATH_list, dirname(rdiff_path))
    global librsync_path = normpath(joinpath(artifact_dir, librsync_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global librsync_handle = dlopen(librsync_path)
    push!(LIBPATH_list, dirname(librsync_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

