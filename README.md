# odin-gl: opengl loader in Odin

Includes procedures to load OpenGL function pointers. Currently only supports the `core` profile, up to version 4.6. Based on the output from the [glad](https://github.com/Dav1dde/glad) webservice using 4.6 `core`.

#### Note: You will be required to pass your own GetProcAddress equivalent (wglGetProcAddress, glXGetProcAddress, glfwGetProcAddress, etc.), for example:

```go
gl.load_up_to(4, 5, proc(p: rawptr, name: cstring) do (cast(^rawptr)p)^ = glfw.GetProcAddress(name); );
```
[odin-glfw](https://github.com/vassvik/odin-glfw) also provides a useful helper you can pass straight to `gl.load_up_to`:
```go
gl.load_up_to(4, 5, glfw.set_proc_address);
```

#### NOTE: It is recommended to put this into the shared collection:
```
cd /path/to/Odin/shared
git clone https://github.com/vassvik/odin-gl.git
```

## Extra utility procedures (Outdated. See the end of `gl.odin`)

Some useful helper procedures can be found in `helpers.odin`, for tasks such as:

 - loading vertex, fragment and compute shaders (from source or files) using `load_shaders_file`, `load_shaders_source`, `load_compute_file` and `load_compute_source`
 - grabbing uniform and attribute locations using `get_uniform_location` and `get_attribute_location`
 - getting all active uniforms from a program using `get_uniforms_from_program`
 - hot reloading of shaders (windows only right now) using `update_shader_if_changed` and `update_shader_if_changed_compute`

