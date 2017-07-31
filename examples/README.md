# OpenGL examples using gl.odin

Odin is not currently set up to look for libs in folders other than in system libs or locally, so all the necessary files are included here.

Includes glfw.odin from [https://github.com/vassvik/odin-glfw](https://github.com/vassvik/odin-glfw) (including Windows binaries), and font.odin from [https://github.com/vassvik/odin-gl_font](https://github.com/vassvik/odin-gl_font) (including the binary font file).

Fill in the correct path to your odin executable (has to be Odin/odin at the moment) in the Makefile, then build and run with `make <example>`. This will clean up all the temp files afterwards.
