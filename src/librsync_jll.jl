# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule librsync_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("librsync")
JLLWrappers.@generate_main_file("librsync", UUID("6c5fa084-3dbe-5c56-adb0-3ea4e9e901c0"))
end  # module librsync_jll
