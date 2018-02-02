# odin-gl: opengl loader in Odin

Includes procedures to load OpenGL function pointers. Currently only supports the `core` profile, up to version 4.6. Based on the output from the [glad](https://github.com/Dav1dde/glad) webservice using 4.6 `core`.

Uses the official `opengl_constants.odin` in `Odin/core` for constant defines. 

#### Note: You will be required to pass your own GetProcAddress equivalent (wglGetProcAddress, glXGetProcAddress, glfwGetProcAddress, etc.), for example:

```go
gl.load_up_to(4, 5, proc(p: rawptr, name: string) do (cast(^rawptr)p)^ = glfw.GetProcAddress(&name[0]); );
```

#### NOTE: It is recommended to put this into the shared collection:
```
cd Odin/shared
git clone https://github.com/vassvik/odin-gl.git
```


## Extra utility procedures (Outdated. See the end of `gl.odin`)

`odin-gl` currently contains two utility procedures.

The following procedure loads a vertex and fragment shader from files, with error checking:
```go
load_shaders :: proc(vertex_shader_filename, fragment_shader_filename: string) -> (program: u32, success: bool)
```

The following procedure grabs all the active uniforms in the given program and outputs a map of `Uniform_Info` instances, that contains information about uniform location, size (1, 2, 3 or 4), type (an enum), and its name as an Odin-string:
```go
get_uniforms_from_program :: proc(program: u32) -> (uniforms: map[string]Uniform_Info)
```

