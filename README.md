# odin-gl: opengl loader in Odin

Includes procedures to load OpenGL function pointers. Currently only supports the `core` profile, up to version 4.5. Based on the output from the [glad](https://github.com/Dav1dde/glad) webservice using 4.5 `core`.

Uses the official `opengl_constants.odin` in `Odin/core` for constant defines. 

Also includes some helper functions, such as a simple shader loader.

#### Note: You will be required to pass your own GetProcAddress equivalent (wglGetProcAddress, glXGetProcAddress, glfwGetProcAddress, etc.)

## Todo:

    - Add forward compatability profile, potentially splitting into multiple files.
    - Automatic version detection.
    - Odin wrappers
