// Swapping argument orders:
//     (\^)*(i8|u8|i16|u16|i32|u32|i64|u64|f32|f64|rawptr|int|uint) ([\w_]+)
//     $3: $1$2

import_load "opengl_constants.odin";


load_up_to :: proc(major, minor : int, set_proc_address: proc(p: rawptr, name: string)) {
    match major*10+minor {
        case 45: load_4_5(set_proc_address); fallthrough;
        case 44: load_4_4(set_proc_address); fallthrough;
        case 43: load_4_3(set_proc_address); fallthrough;
        case 42: load_4_2(set_proc_address); fallthrough;
        case 41: load_4_1(set_proc_address); fallthrough;
        case 40: load_4_0(set_proc_address); fallthrough;
        case 33: load_3_3(set_proc_address); fallthrough;
        case 32: load_3_2(set_proc_address); fallthrough;
        case 31: load_3_1(set_proc_address); fallthrough;
        case 30: load_3_0(set_proc_address); fallthrough;
        case 21: load_2_1(set_proc_address); fallthrough;
        case 20: load_2_0(set_proc_address); fallthrough;
        case 15: load_1_5(set_proc_address); fallthrough;
        case 14: load_1_4(set_proc_address); fallthrough;
        case 13: load_1_3(set_proc_address); fallthrough;
        case 12: load_1_2(set_proc_address); fallthrough;
        case 11: load_1_1(set_proc_address); fallthrough;
        case 10: load_1_0(set_proc_address);
    }
}

/* 
Type conversion overview: 
    typedef unsigned int GLenum;     -> u32
    typedef unsigned char GLboolean; -> u8
    typedef unsigned int GLbitfield; -> u32
    typedef signed char GLbyte;      -> i8
    typedef short GLshort;           -> i16
    typedef int GLint;               -> i32
    typedef unsigned char GLubyte;   -> u8
    typedef unsigned short GLushort; -> u16
    typedef unsigned int GLuint;     -> u32
    typedef int GLsizei;             -> i32
    typedef float GLfloat;           -> f32
    typedef double GLdouble;         -> f64
    typedef char GLchar;             -> u8
    typedef ptrdiff_t GLintptr;      -> int
    typedef ptrdiff_t GLsizeiptr;    -> int
    typedef int64_t GLint64;         -> i64
    typedef uint64_t GLuint64;       -> u64

    void*                            -> rawptr
*/

sync_t :: #type ^struct {};
debug_proc_t :: proc(source: u32, type_: u32, id: u32, severity: u32, length: i32, message: ^u8, userParam: rawptr) #cc_c;


// VERSION_1_0
CullFace:               proc(mode: u32)                                                                                                                   #cc_c;
FrontFace:              proc(mode: u32)                                                                                                                   #cc_c;
Hint:                   proc(target: u32, mode: u32)                                                                                                      #cc_c;
LineWidth:              proc(width: f32)                                                                                                                  #cc_c;
PointSize:              proc(size: f32)                                                                                                                   #cc_c;
PolygonMode:            proc(face: u32, mode: u32)                                                                                                        #cc_c;
Scissor:                proc(x: i32, y: i32, width: i32, height: i32)                                                                                     #cc_c;
TexParameterf:          proc(target: u32, pname: u32, param: f32)                                                                                         #cc_c;
TexParameterfv:         proc(target: u32, pname: u32, params: ^f32)                                                                                       #cc_c;
TexParameteri:          proc(target: u32, pname: u32, param: i32)                                                                                         #cc_c;
TexParameteriv:         proc(target: u32, pname: u32, params: ^i32)                                                                                       #cc_c;
TexImage1D:             proc(target: u32, level: i32, internalformat: i32, width: i32, border: i32, format: u32, type_: u32, pixels: rawptr)              #cc_c;
TexImage2D:             proc(target: u32, level: i32, internalformat: i32, width: i32, height: i32, border: i32, format: u32, type_: u32, pixels: rawptr) #cc_c;
DrawBuffer:             proc(buf: u32)                                                                                                                    #cc_c;
Clear:                  proc(mask: u32)                                                                                                                   #cc_c;
ClearColor:             proc(red: f32, green: f32, blue: f32, alpha: f32)                                                                                 #cc_c;
ClearStencil:           proc(s: i32)                                                                                                                      #cc_c;
ClearDepth:             proc(depth: f64)                                                                                                                  #cc_c;
StencilMask:            proc(mask: u32)                                                                                                                   #cc_c;
ColorMask:              proc(red: u8, green: u8, blue: u8, alpha: u8)                                                                                     #cc_c;
DepthMask:              proc(flag: u8)                                                                                                                    #cc_c;
Disable:                proc(cap: u32)                                                                                                                    #cc_c;
Enable:                 proc(cap: u32)                                                                                                                    #cc_c;
Finish:                 proc()                                                                                                                            #cc_c;
Flush:                  proc()                                                                                                                            #cc_c;
BlendFunc:              proc(sfactor: u32, dfactor: u32)                                                                                                  #cc_c;
LogicOp:                proc(opcode: u32)                                                                                                                 #cc_c;
StencilFunc:            proc(func: u32, ref: i32, mask: u32)                                                                                              #cc_c;
StencilOp:              proc(fail: u32, zfail: u32, zpass: u32)                                                                                           #cc_c;
DepthFunc:              proc(func: u32)                                                                                                                   #cc_c;
PixelStoref:            proc(pname: u32, param: f32)                                                                                                      #cc_c;
PixelStorei:            proc(pname: u32, param: i32)                                                                                                      #cc_c;
ReadBuffer:             proc(src: u32)                                                                                                                    #cc_c;
ReadPixels:             proc(x: i32, y: i32, width: i32, height: i32, format: u32, type_: u32, pixels: rawptr)                                            #cc_c;
GetBooleanv:            proc(pname: u32, data: ^u8)                                                                                                       #cc_c;
GetDoublev:             proc(pname: u32, data: ^f64)                                                                                                      #cc_c;
GetError:               proc() -> u32                                                                                                                     #cc_c;
GetFloatv:              proc(pname: u32, data: ^f32)                                                                                                      #cc_c;
GetIntegerv:            proc(pname: u32, data: ^i32)                                                                                                      #cc_c;
GetString:              proc(name: u32) -> ^u8                                                                                                            #cc_c;
GetTexImage:            proc(target: u32,  level: i32, format: u32, type_: u32, pixels: rawptr)                                                           #cc_c;
GetTexParameterfv:      proc(target: u32, pname: u32, params: ^f32)                                                                                       #cc_c;
GetTexParameteriv:      proc(target: u32, pname: u32, params: ^i32)                                                                                       #cc_c;
GetTexLevelParameterfv: proc(target: u32, level: i32, pname: u32, params: ^f32)                                                                           #cc_c;
GetTexLevelParameteriv: proc(target: u32, level: i32, pname: u32, params: ^i32)                                                                           #cc_c;
IsEnabled:              proc(cap: u32) -> u8                                                                                                              #cc_c;
DepthRange:             proc(near: f64, far: f64)                                                                                                         #cc_c;
Viewport:               proc(x: i32, y: i32, width: i32, height: i32)                                                                                     #cc_c;

load_1_0 :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    set_proc_address(&CullFace,               "glCullFace\x00");
    set_proc_address(&FrontFace,              "glFrontFace\x00");
    set_proc_address(&Hint,                   "glHint\x00");
    set_proc_address(&LineWidth,              "glLineWidth\x00");
    set_proc_address(&PointSize,              "glPointSize\x00");
    set_proc_address(&PolygonMode,            "glPolygonMode\x00");
    set_proc_address(&Scissor,                "glScissor\x00");
    set_proc_address(&TexParameterf,          "glTexParameterf\x00");
    set_proc_address(&TexParameterfv,         "glTexParameterfv\x00");
    set_proc_address(&TexParameteri,          "glTexParameteri\x00");
    set_proc_address(&TexParameteriv,         "glTexParameteriv\x00");
    set_proc_address(&TexImage1D,             "glTexImage1D\x00");
    set_proc_address(&TexImage2D,             "glTexImage2D\x00");
    set_proc_address(&DrawBuffer,             "glDrawBuffer\x00");
    set_proc_address(&Clear,                  "glClear\x00");
    set_proc_address(&ClearColor,             "glClearColor\x00");
    set_proc_address(&ClearStencil,           "glClearStencil\x00");
    set_proc_address(&ClearDepth,             "glClearDepth\x00");
    set_proc_address(&StencilMask,            "glStencilMask\x00");
    set_proc_address(&ColorMask,              "glColorMask\x00");
    set_proc_address(&DepthMask,              "glDepthMask\x00");
    set_proc_address(&Disable,                "glDisable\x00");
    set_proc_address(&Enable,                 "glEnable\x00");
    set_proc_address(&Finish,                 "glFinish\x00");
    set_proc_address(&Flush,                  "glFlush\x00");
    set_proc_address(&BlendFunc,              "glBlendFunc\x00");
    set_proc_address(&LogicOp,                "glLogicOp\x00");
    set_proc_address(&StencilFunc,            "glStencilFunc\x00");
    set_proc_address(&StencilOp,              "glStencilOp\x00");
    set_proc_address(&DepthFunc,              "glDepthFunc\x00");
    set_proc_address(&PixelStoref,            "glPixelStoref\x00");
    set_proc_address(&PixelStorei,            "glPixelStorei\x00");
    set_proc_address(&ReadBuffer,             "glReadBuffer\x00");
    set_proc_address(&ReadPixels,             "glReadPixels\x00");
    set_proc_address(&GetBooleanv,            "glGetBooleanv\x00");
    set_proc_address(&GetDoublev,             "glGetDoublev\x00");
    set_proc_address(&GetError,               "glGetError\x00");
    set_proc_address(&GetFloatv,              "glGetFloatv\x00");
    set_proc_address(&GetIntegerv,            "glGetIntegerv\x00");
    set_proc_address(&GetString,              "glGetString\x00");
    set_proc_address(&GetTexImage,            "glGetTexImage\x00");
    set_proc_address(&GetTexParameterfv,      "glGetTexParameterfv\x00");
    set_proc_address(&GetTexParameteriv,      "glGetTexParameteriv\x00");
    set_proc_address(&GetTexLevelParameterfv, "glGetTexLevelParameterfv\x00");
    set_proc_address(&GetTexLevelParameteriv, "glGetTexLevelParameteriv\x00");
    set_proc_address(&IsEnabled,              "glIsEnabled\x00");
    set_proc_address(&DepthRange,             "glDepthRange\x00");
    set_proc_address(&Viewport,               "glViewport\x00");
}


// VERSION_1_1
DrawArrays:        proc(mode: u32, first: i32, count: i32)                                                                                     #cc_c;
DrawElements:      proc(mode: u32, count: i32, type_: u32, indices: rawptr)                                                                    #cc_c;
PolygonOffset:     proc(factor: f32, units: f32)                                                                                               #cc_c;
CopyTexImage1D:    proc(target: u32, level: i32, internalformat: u32, x: i32, y: i32, width: i32, border: i32)                                 #cc_c;
CopyTexImage2D:    proc(target: u32, level: i32, internalformat: u32, x: i32, y: i32, width: i32, height: i32, border: i32)                    #cc_c;
CopyTexSubImage1D: proc(target: u32, level: i32, xoffset: i32, x: i32, y: i32, width: i32)                                                     #cc_c;
CopyTexSubImage2D: proc(target: u32, level: i32, xoffset: i32, yoffset: i32, x: i32, y: i32, width: i32, height: i32)                          #cc_c;
TexSubImage1D:     proc(target: u32, level: i32, xoffset: i32, width: i32, format: u32, type_: u32, pixels: rawptr)                            #cc_c;
TexSubImage2D:     proc(target: u32, level: i32, xoffset: i32, yoffset: i32, width: i32, height: i32, format: u32, type_: u32, pixels: rawptr) #cc_c;
BindTexture:       proc(target: u32, texture: u32)                                                                                             #cc_c;
DeleteTextures:    proc(n: i32, textures: ^u32)                                                                                                #cc_c;
GenTextures:       proc(n: i32, textures: ^u32)                                                                                                #cc_c;
IsTexture:         proc(texture: u32) -> u8                                                                                                    #cc_c;

load_1_1 :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    set_proc_address(&DrawArrays,        "glDrawArrays\x00");
    set_proc_address(&DrawElements,      "glDrawElements\x00");
    set_proc_address(&PolygonOffset,     "glPolygonOffset\x00");
    set_proc_address(&CopyTexImage1D,    "glCopyTexImage1D\x00");
    set_proc_address(&CopyTexImage2D,    "glCopyTexImage2D\x00");
    set_proc_address(&CopyTexSubImage1D, "glCopyTexSubImage1D\x00");
    set_proc_address(&CopyTexSubImage2D, "glCopyTexSubImage2D\x00");
    set_proc_address(&TexSubImage1D,     "glTexSubImage1D\x00");
    set_proc_address(&TexSubImage2D,     "glTexSubImage2D\x00");
    set_proc_address(&BindTexture,       "glBindTexture\x00");
    set_proc_address(&DeleteTextures,    "glDeleteTextures\x00");
    set_proc_address(&GenTextures,       "glGenTextures\x00");
    set_proc_address(&IsTexture,         "glIsTexture\x00");
}


// VERSION_1_2
DrawRangeElements: proc(mode: u32, start: u32, end: u32, count: i32, type_: u32, indices: rawptr)                                                                        #cc_c;
TexImage3D:        proc(target: u32, level: i32, internalformat: i32, width: i32, height: i32, depth: i32, border: i32, format: u32, type_: u32, pixels: rawptr)         #cc_c;
TexSubImage3D:     proc(target: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, format: u32, type_: u32, pixels: rawptr) #cc_c;
CopyTexSubImage3D: proc(target: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, x: i32, y: i32, width: i32, height: i32)                                      #cc_c;

load_1_2 :: proc(set_proc_address: proc(p: rawptr, name: string)) {

    set_proc_address(&DrawRangeElements, "glDrawRangeElements\x00");
    set_proc_address(&TexImage3D,        "glTexImage3D\x00");
    set_proc_address(&TexSubImage3D,     "glTexSubImage3D\x00");
    set_proc_address(&CopyTexSubImage3D, "glCopyTexSubImage3D\x00");
}


// VERSION_1_3
ActiveTexture:           proc(texture: u32)                                                                                                                                      #cc_c;
SampleCoverage:          proc(value: f32, invert: u8)                                                                                                                            #cc_c;
CompressedTexImage3D:    proc(target: u32, level: i32, internalformat: u32, width: i32, height: i32, depth: i32, border: i32, imageSize: i32, data: rawptr)                      #cc_c;
CompressedTexImage2D:    proc(target: u32, level: i32, internalformat: u32, width: i32, height: i32, border: i32, imageSize: i32, data: rawptr)                                  #cc_c;
CompressedTexImage1D:    proc(target: u32, level: i32, internalformat: u32, width: i32, border: i32, imageSize: i32, data: rawptr)                                               #cc_c;
CompressedTexSubImage3D: proc(target: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, format: u32, imageSize: i32, data: rawptr) #cc_c;
CompressedTexSubImage2D: proc(target: u32, level: i32, xoffset: i32, yoffset: i32, width: i32, height: i32, format: u32, imageSize: i32, data: rawptr)                           #cc_c;
CompressedTexSubImage1D: proc(target: u32, level: i32, xoffset: i32, width: i32, format: u32, imageSize: i32, data: rawptr)                                                      #cc_c;
GetCompressedTexImage:   proc(target: u32, level: i32, img: rawptr)                                                                                                              #cc_c;

load_1_3 :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    set_proc_address(&ActiveTexture,           "glActiveTexture\x00");
    set_proc_address(&SampleCoverage,          "glSampleCoverage\x00");
    set_proc_address(&CompressedTexImage3D,    "glCompressedTexImage3D\x00");
    set_proc_address(&CompressedTexImage2D,    "glCompressedTexImage2D\x00");
    set_proc_address(&CompressedTexImage1D,    "glCompressedTexImage1D\x00");
    set_proc_address(&CompressedTexSubImage3D, "glCompressedTexSubImage3D\x00");
    set_proc_address(&CompressedTexSubImage2D, "glCompressedTexSubImage2D\x00");
    set_proc_address(&CompressedTexSubImage1D, "glCompressedTexSubImage1D\x00");
    set_proc_address(&GetCompressedTexImage,   "glGetCompressedTexImage\x00");
}


// VERSION_1_4
BlendFuncSeparate: proc(sfactorRGB: u32, dfactorRGB: u32, sfactorAlpha: u32, dfactorAlpha: u32) #cc_c;
MultiDrawArrays:   proc(mode: u32, first: ^i32, count: ^i32, drawcount: i32)                    #cc_c;
MultiDrawElements: proc(mode: u32, count: ^i32, type_: u32, indices: ^rawptr, drawcount: i32)   #cc_c;
PointParameterf:   proc(pname: u32, param: f32)                                                 #cc_c;
PointParameterfv:  proc(pname: u32, params: ^f32)                                               #cc_c;
PointParameteri:   proc(pname: u32, param: i32)                                                 #cc_c;
PointParameteriv:  proc(pname: u32, params: ^i32)                                               #cc_c;
BlendColor:        proc(red: f32, green: f32, blue: f32, alpha: f32)                            #cc_c;
BlendEquation:     proc(mode: u32)                                                              #cc_c;


load_1_4 :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    set_proc_address(&BlendFuncSeparate, "glBlendFuncSeparate\x00");
    set_proc_address(&MultiDrawArrays,   "glMultiDrawArrays\x00");
    set_proc_address(&MultiDrawElements, "glMultiDrawElements\x00");
    set_proc_address(&PointParameterf,   "glPointParameterf\x00");
    set_proc_address(&PointParameterfv,  "glPointParameterfv\x00");
    set_proc_address(&PointParameteri,   "glPointParameteri\x00");
    set_proc_address(&PointParameteriv,  "glPointParameteriv\x00");
    set_proc_address(&BlendColor,        "glBlendColor\x00");
    set_proc_address(&BlendEquation,     "glBlendEquation\x00");
}


// VERSION_1_5
GenQueries:           proc(n: i32, ids: ^u32)                                 #cc_c;
DeleteQueries:        proc(n: i32, ids: ^u32)                                 #cc_c;
IsQuery:              proc(id: u32) -> u8                                     #cc_c;
BeginQuery:           proc(target: u32, id: u32)                              #cc_c;
EndQuery:             proc(target: u32)                                       #cc_c;
GetQueryiv:           proc(target: u32, pname: u32, params: ^i32)             #cc_c;
GetQueryObjectiv:     proc(id: u32, pname: u32, params: ^i32)                 #cc_c;
GetQueryObjectuiv:    proc(id: u32, pname: u32, params: ^u32)                 #cc_c;
BindBuffer:           proc(target: u32, buffer: u32)                          #cc_c;
DeleteBuffers:        proc(n: i32, buffers: ^u32)                             #cc_c;
GenBuffers:           proc(n: i32, buffers: ^u32)                             #cc_c;
IsBuffer:             proc(buffer: u32) -> u8                                 #cc_c;
BufferData:           proc(target: u32, size: int, data: rawptr, usage: u32)  #cc_c;
BufferSubData:        proc(target: u32, offset: int, size: int, data: rawptr) #cc_c;
GetBufferSubData:     proc(target: u32, offset: int, size: int, data: rawptr) #cc_c;
MapBuffer:            proc(target: u32, access: u32) -> rawptr                #cc_c;
UnmapBuffer:          proc(target: u32) -> u8                                 #cc_c;
GetBufferParameteriv: proc(target: u32, pname: u32, params: ^i32)             #cc_c;
GetBufferPointerv:    proc(target: u32, pname: u32, params: ^rawptr)          #cc_c;

load_1_5 :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    set_proc_address(&GenQueries,           "glGenQueries\x00");
    set_proc_address(&DeleteQueries,        "glDeleteQueries\x00");
    set_proc_address(&IsQuery,              "glIsQuery\x00");
    set_proc_address(&BeginQuery,           "glBeginQuery\x00");
    set_proc_address(&EndQuery,             "glEndQuery\x00");
    set_proc_address(&GetQueryiv,           "glGetQueryiv\x00");
    set_proc_address(&GetQueryObjectiv,     "glGetQueryObjectiv\x00");
    set_proc_address(&GetQueryObjectuiv,    "glGetQueryObjectuiv\x00");
    set_proc_address(&BindBuffer,           "glBindBuffer\x00");
    set_proc_address(&DeleteBuffers,        "glDeleteBuffers\x00");
    set_proc_address(&GenBuffers,           "glGenBuffers\x00");
    set_proc_address(&IsBuffer,             "glIsBuffer\x00");
    set_proc_address(&BufferData,           "glBufferData\x00");
    set_proc_address(&BufferSubData,        "glBufferSubData\x00");
    set_proc_address(&GetBufferSubData,     "glGetBufferSubData\x00");
    set_proc_address(&MapBuffer,            "glMapBuffer\x00");
    set_proc_address(&UnmapBuffer,          "glUnmapBuffer\x00");
    set_proc_address(&GetBufferParameteriv, "glGetBufferParameteriv\x00");
    set_proc_address(&GetBufferPointerv,    "glGetBufferPointerv\x00");
}


// VERSION_2_0
BlendEquationSeparate:    proc(modeRGB: u32, modeAlpha: u32)                                                             #cc_c;
DrawBuffers:              proc(n: i32, bufs: ^u32)                                                                       #cc_c;
StencilOpSeparate:        proc(face: u32, sfail: u32, dpfail: u32, dppass: u32)                                          #cc_c;
StencilFuncSeparate:      proc(face: u32, func: u32, ref: i32, mask: u32)                                                #cc_c;
StencilMaskSeparate:      proc(face: u32, mask: u32)                                                                     #cc_c;
AttachShader:             proc(program: u32, shader: u32)                                                                #cc_c;
BindAttribLocation:       proc(program: u32, index: u32, name: ^u8)                                                      #cc_c;
CompileShader:            proc(shader: u32)                                                                              #cc_c;
CreateProgram:            proc() -> u32                                                                                  #cc_c;
CreateShader:             proc(type_: u32) -> u32                                                                        #cc_c;
DeleteProgram:            proc(program: u32)                                                                             #cc_c;
DeleteShader:             proc(shader: u32)                                                                              #cc_c;
DetachShader:             proc(program: u32, shader: u32)                                                                #cc_c;
DisableVertexAttribArray: proc(index: u32)                                                                               #cc_c;
EnableVertexAttribArray:  proc(index: u32)                                                                               #cc_c;
GetActiveAttrib:          proc(program: u32, index: u32, bufSize: i32, length: ^i32, size: ^i32, type_: ^u32, name: ^u8) #cc_c;
GetActiveUniform:         proc(program: u32, index: u32, bufSize: i32, length: ^i32, size: ^i32, type_: ^u32, name: ^u8) #cc_c;
GetAttachedShaders:       proc(program: u32, maxCount: i32, count: ^i32, shaders: ^u32)                                  #cc_c;
GetAttribLocation:        proc(program: u32, name: ^u8) -> i32                                                           #cc_c;
GetProgramiv:             proc(program: u32, pname: u32, params: ^i32)                                                   #cc_c;
GetProgramInfoLog:        proc(program: u32, bufSize: i32, length: ^i32, infoLog: ^u8)                                   #cc_c;
GetShaderiv:              proc(shader: u32, pname: u32, params: ^i32)                                                    #cc_c;
GetShaderInfoLog:         proc(shader: u32, bufSize: i32, length: ^i32, infoLog: ^u8)                                    #cc_c;
GetShaderSource:          proc(shader: u32, bufSize: i32, length: ^i32, source: ^u8)                                     #cc_c;
GetUniformLocation:       proc(program: u32, name: ^u8) -> i32                                                           #cc_c;
GetUniformfv:             proc(program: u32, location: i32, params: ^f32)                                                #cc_c;
GetUniformiv:             proc(program: u32, location: i32, params: ^i32)                                                #cc_c;
GetVertexAttribdv:        proc(index: u32, pname: u32, params: ^f64)                                                     #cc_c;
GetVertexAttribfv:        proc(index: u32, pname: u32, params: ^f32)                                                     #cc_c;
GetVertexAttribiv:        proc(index: u32, pname: u32, params: ^i32)                                                     #cc_c;
GetVertexAttribPointerv:  proc(index: u32, pname: u32, pointer: ^rawptr)                                                 #cc_c;
IsProgram:                proc(program: u32) -> u8                                                                       #cc_c;
IsShader:                 proc(shader: u32) -> u8                                                                        #cc_c;
LinkProgram:              proc(program: u32)                                                                             #cc_c;
ShaderSource:             proc(shader: u32, count: i32, string: ^^u8, length: ^i32)                                      #cc_c;
UseProgram:               proc(program: u32)                                                                             #cc_c;
Uniform1f:                proc(location: i32, v0: f32)                                                                   #cc_c;
Uniform2f:                proc(location: i32, v0: f32, v1: f32)                                                          #cc_c;
Uniform3f:                proc(location: i32, v0: f32, v1: f32, v2: f32)                                                 #cc_c;
Uniform4f:                proc(location: i32, v0: f32, v1: f32, v2: f32, v3: f32)                                        #cc_c;
Uniform1i:                proc(location: i32, v0: i32)                                                                   #cc_c;
Uniform2i:                proc(location: i32, v0: i32, v1: i32)                                                          #cc_c;
Uniform3i:                proc(location: i32, v0: i32, v1: i32, v2: i32)                                                 #cc_c;
Uniform4i:                proc(location: i32, v0: i32, v1: i32, v2: i32, v3: i32)                                        #cc_c;
Uniform1fv:               proc(location: i32, count: i32, value: ^f32)                                                   #cc_c;
Uniform2fv:               proc(location: i32, count: i32, value: ^f32)                                                   #cc_c;
Uniform3fv:               proc(location: i32, count: i32, value: ^f32)                                                   #cc_c;
Uniform4fv:               proc(location: i32, count: i32, value: ^f32)                                                   #cc_c;
Uniform1iv:               proc(location: i32, count: i32, value: ^i32)                                                   #cc_c;
Uniform2iv:               proc(location: i32, count: i32, value: ^i32)                                                   #cc_c;
Uniform3iv:               proc(location: i32, count: i32, value: ^i32)                                                   #cc_c;
Uniform4iv:               proc(location: i32, count: i32, value: ^i32)                                                   #cc_c;
UniformMatrix2fv:         proc(location: i32, count: i32, transpose: u8, value: ^f32)                                    #cc_c;
UniformMatrix3fv:         proc(location: i32, count: i32, transpose: u8, value: ^f32)                                    #cc_c;
UniformMatrix4fv:         proc(location: i32, count: i32, transpose: u8, value: ^f32)                                    #cc_c;
ValidateProgram:          proc(program: u32)                                                                             #cc_c;
VertexAttrib1d:           proc(index: u32, x: f64)                                                                       #cc_c;
VertexAttrib1dv:          proc(index: u32, v: ^f64)                                                                      #cc_c;
VertexAttrib1f:           proc(index: u32, x: f32)                                                                       #cc_c;
VertexAttrib1fv:          proc(index: u32, v: ^f32)                                                                      #cc_c;
VertexAttrib1s:           proc(index: u32, x: i16)                                                                       #cc_c;
VertexAttrib1sv:          proc(index: u32, v: ^i16)                                                                      #cc_c;
VertexAttrib2d:           proc(index: u32, x: f64, y: f64)                                                               #cc_c;
VertexAttrib2dv:          proc(index: u32, v: ^f64)                                                                      #cc_c;
VertexAttrib2f:           proc(index: u32, x: f32, y: f32)                                                               #cc_c;
VertexAttrib2fv:          proc(index: u32, v: ^f32)                                                                      #cc_c;
VertexAttrib2s:           proc(index: u32, x: i16, y: i16)                                                               #cc_c;
VertexAttrib2sv:          proc(index: u32, v: ^i16)                                                                      #cc_c;
VertexAttrib3d:           proc(index: u32, x: f64, y: f64, z: f64)                                                       #cc_c;
VertexAttrib3dv:          proc(index: u32, v: ^f64)                                                                      #cc_c;
VertexAttrib3f:           proc(index: u32, x: f32, y: f32, z: f32)                                                       #cc_c;
VertexAttrib3fv:          proc(index: u32, v: ^f32)                                                                      #cc_c;
VertexAttrib3s:           proc(index: u32, x: i16, y: i16, z: i16)                                                       #cc_c;
VertexAttrib3sv:          proc(index: u32, v: ^i16)                                                                      #cc_c;
VertexAttrib4Nbv:         proc(index: u32, v: ^i8)                                                                       #cc_c;
VertexAttrib4Niv:         proc(index: u32, v: ^i32)                                                                      #cc_c;
VertexAttrib4Nsv:         proc(index: u32, v: ^i16)                                                                      #cc_c;
VertexAttrib4Nub:         proc(index: u32, x: u8, y: u8, z: u8, w: u8)                                                   #cc_c;
VertexAttrib4Nubv:        proc(index: u32, v: ^u8)                                                                       #cc_c;
VertexAttrib4Nuiv:        proc(index: u32, v: ^u32)                                                                      #cc_c;
VertexAttrib4Nusv:        proc(index: u32, v: ^u16)                                                                      #cc_c;
VertexAttrib4bv:          proc(index: u32, v: ^i8)                                                                       #cc_c;
VertexAttrib4d:           proc(index: u32, x: f64, y: f64, z: f64, w: f64)                                               #cc_c;
VertexAttrib4dv:          proc(index: u32, v: ^f64)                                                                      #cc_c;
VertexAttrib4f:           proc(index: u32, x: f32, y: f32, z: f32, w: f32)                                               #cc_c;
VertexAttrib4fv:          proc(index: u32, v: ^f32)                                                                      #cc_c;
VertexAttrib4iv:          proc(index: u32, v: ^i32)                                                                      #cc_c;
VertexAttrib4s:           proc(index: u32, x: i16, y: i16, z: i16, w: i16)                                               #cc_c;
VertexAttrib4sv:          proc(index: u32, v: ^i16)                                                                      #cc_c;
VertexAttrib4ubv:         proc(index: u32, v: ^u8)                                                                       #cc_c;
VertexAttrib4uiv:         proc(index: u32, v: ^u32)                                                                      #cc_c;
VertexAttrib4usv:         proc(index: u32, v: ^u16)                                                                      #cc_c;
VertexAttribPointer:      proc(index: u32, size: i32, type_: u32, normalized: u8, stride: i32, pointer: rawptr)          #cc_c;

load_2_0 :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    set_proc_address(&BlendEquationSeparate,    "glBlendEquationSeparate\x00");
    set_proc_address(&DrawBuffers,              "glDrawBuffers\x00");
    set_proc_address(&StencilOpSeparate,        "glStencilOpSeparate\x00");
    set_proc_address(&StencilFuncSeparate,      "glStencilFuncSeparate\x00");
    set_proc_address(&StencilMaskSeparate,      "glStencilMaskSeparate\x00");
    set_proc_address(&AttachShader,             "glAttachShader\x00");
    set_proc_address(&BindAttribLocation,       "glBindAttribLocation\x00");
    set_proc_address(&CompileShader,            "glCompileShader\x00");
    set_proc_address(&CreateProgram,            "glCreateProgram\x00");
    set_proc_address(&CreateShader,             "glCreateShader\x00");
    set_proc_address(&DeleteProgram,            "glDeleteProgram\x00");
    set_proc_address(&DeleteShader,             "glDeleteShader\x00");
    set_proc_address(&DetachShader,             "glDetachShader\x00");
    set_proc_address(&DisableVertexAttribArray, "glDisableVertexAttribArray\x00");
    set_proc_address(&EnableVertexAttribArray,  "glEnableVertexAttribArray\x00");
    set_proc_address(&GetActiveAttrib,          "glGetActiveAttrib\x00");
    set_proc_address(&GetActiveUniform,         "glGetActiveUniform\x00");
    set_proc_address(&GetAttachedShaders,       "glGetAttachedShaders\x00");
    set_proc_address(&GetAttribLocation,        "glGetAttribLocation\x00");
    set_proc_address(&GetProgramiv,             "glGetProgramiv\x00");
    set_proc_address(&GetProgramInfoLog,        "glGetProgramInfoLog\x00");
    set_proc_address(&GetShaderiv,              "glGetShaderiv\x00");
    set_proc_address(&GetShaderInfoLog,         "glGetShaderInfoLog\x00");
    set_proc_address(&GetShaderSource,          "glGetShaderSource\x00");
    set_proc_address(&GetUniformLocation,       "glGetUniformLocation\x00");
    set_proc_address(&GetUniformfv,             "glGetUniformfv\x00");
    set_proc_address(&GetUniformiv,             "glGetUniformiv\x00");
    set_proc_address(&GetVertexAttribdv,        "glGetVertexAttribdv\x00");
    set_proc_address(&GetVertexAttribfv,        "glGetVertexAttribfv\x00");
    set_proc_address(&GetVertexAttribiv,        "glGetVertexAttribiv\x00");
    set_proc_address(&GetVertexAttribPointerv,  "glGetVertexAttribPointerv\x00");
    set_proc_address(&IsProgram,                "glIsProgram\x00");
    set_proc_address(&IsShader,                 "glIsShader\x00");
    set_proc_address(&LinkProgram,              "glLinkProgram\x00");
    set_proc_address(&ShaderSource,             "glShaderSource\x00");
    set_proc_address(&UseProgram,               "glUseProgram\x00");
    set_proc_address(&Uniform1f,                "glUniform1f\x00");
    set_proc_address(&Uniform2f,                "glUniform2f\x00");
    set_proc_address(&Uniform3f,                "glUniform3f\x00");
    set_proc_address(&Uniform4f,                "glUniform4f\x00");
    set_proc_address(&Uniform1i,                "glUniform1i\x00");
    set_proc_address(&Uniform2i,                "glUniform2i\x00");
    set_proc_address(&Uniform3i,                "glUniform3i\x00");
    set_proc_address(&Uniform4i,                "glUniform4i\x00");
    set_proc_address(&Uniform1fv,               "glUniform1fv\x00");
    set_proc_address(&Uniform2fv,               "glUniform2fv\x00");
    set_proc_address(&Uniform3fv,               "glUniform3fv\x00");
    set_proc_address(&Uniform4fv,               "glUniform4fv\x00");
    set_proc_address(&Uniform1iv,               "glUniform1iv\x00");
    set_proc_address(&Uniform2iv,               "glUniform2iv\x00");
    set_proc_address(&Uniform3iv,               "glUniform3iv\x00");
    set_proc_address(&Uniform4iv,               "glUniform4iv\x00");
    set_proc_address(&UniformMatrix2fv,         "glUniformMatrix2fv\x00");
    set_proc_address(&UniformMatrix3fv,         "glUniformMatrix3fv\x00");
    set_proc_address(&UniformMatrix4fv,         "glUniformMatrix4fv\x00");
    set_proc_address(&ValidateProgram,          "glValidateProgram\x00");
    set_proc_address(&VertexAttrib1d,           "glVertexAttrib1d\x00");
    set_proc_address(&VertexAttrib1dv,          "glVertexAttrib1dv\x00");
    set_proc_address(&VertexAttrib1f,           "glVertexAttrib1f\x00");
    set_proc_address(&VertexAttrib1fv,          "glVertexAttrib1fv\x00");
    set_proc_address(&VertexAttrib1s,           "glVertexAttrib1s\x00");
    set_proc_address(&VertexAttrib1sv,          "glVertexAttrib1sv\x00");
    set_proc_address(&VertexAttrib2d,           "glVertexAttrib2d\x00");
    set_proc_address(&VertexAttrib2dv,          "glVertexAttrib2dv\x00");
    set_proc_address(&VertexAttrib2f,           "glVertexAttrib2f\x00");
    set_proc_address(&VertexAttrib2fv,          "glVertexAttrib2fv\x00");
    set_proc_address(&VertexAttrib2s,           "glVertexAttrib2s\x00");
    set_proc_address(&VertexAttrib2sv,          "glVertexAttrib2sv\x00");
    set_proc_address(&VertexAttrib3d,           "glVertexAttrib3d\x00");
    set_proc_address(&VertexAttrib3dv,          "glVertexAttrib3dv\x00");
    set_proc_address(&VertexAttrib3f,           "glVertexAttrib3f\x00");
    set_proc_address(&VertexAttrib3fv,          "glVertexAttrib3fv\x00");
    set_proc_address(&VertexAttrib3s,           "glVertexAttrib3s\x00");
    set_proc_address(&VertexAttrib3sv,          "glVertexAttrib3sv\x00");
    set_proc_address(&VertexAttrib4Nbv,         "glVertexAttrib4Nbv\x00");
    set_proc_address(&VertexAttrib4Niv,         "glVertexAttrib4Niv\x00");
    set_proc_address(&VertexAttrib4Nsv,         "glVertexAttrib4Nsv\x00");
    set_proc_address(&VertexAttrib4Nub,         "glVertexAttrib4Nub\x00");
    set_proc_address(&VertexAttrib4Nubv,        "glVertexAttrib4Nubv\x00");
    set_proc_address(&VertexAttrib4Nuiv,        "glVertexAttrib4Nuiv\x00");
    set_proc_address(&VertexAttrib4Nusv,        "glVertexAttrib4Nusv\x00");
    set_proc_address(&VertexAttrib4bv,          "glVertexAttrib4bv\x00");
    set_proc_address(&VertexAttrib4d,           "glVertexAttrib4d\x00");
    set_proc_address(&VertexAttrib4dv,          "glVertexAttrib4dv\x00");
    set_proc_address(&VertexAttrib4f,           "glVertexAttrib4f\x00");
    set_proc_address(&VertexAttrib4fv,          "glVertexAttrib4fv\x00");
    set_proc_address(&VertexAttrib4iv,          "glVertexAttrib4iv\x00");
    set_proc_address(&VertexAttrib4s,           "glVertexAttrib4s\x00");
    set_proc_address(&VertexAttrib4sv,          "glVertexAttrib4sv\x00");
    set_proc_address(&VertexAttrib4ubv,         "glVertexAttrib4ubv\x00");
    set_proc_address(&VertexAttrib4uiv,         "glVertexAttrib4uiv\x00");
    set_proc_address(&VertexAttrib4usv,         "glVertexAttrib4usv\x00");
    set_proc_address(&VertexAttribPointer,      "glVertexAttribPointer\x00");
}


// VERSION_2_1
UniformMatrix2x3fv: proc(location: i32, count: i32, transpose: u8, value: ^f32) #cc_c;
UniformMatrix3x2fv: proc(location: i32, count: i32, transpose: u8, value: ^f32) #cc_c;
UniformMatrix2x4fv: proc(location: i32, count: i32, transpose: u8, value: ^f32) #cc_c;
UniformMatrix4x2fv: proc(location: i32, count: i32, transpose: u8, value: ^f32) #cc_c;
UniformMatrix3x4fv: proc(location: i32, count: i32, transpose: u8, value: ^f32) #cc_c;
UniformMatrix4x3fv: proc(location: i32, count: i32, transpose: u8, value: ^f32) #cc_c;

load_2_1 :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    set_proc_address(&UniformMatrix2x3fv, "glUniformMatrix2x3fv\x00");
    set_proc_address(&UniformMatrix3x2fv, "glUniformMatrix3x2fv\x00");
    set_proc_address(&UniformMatrix2x4fv, "glUniformMatrix2x4fv\x00");
    set_proc_address(&UniformMatrix4x2fv, "glUniformMatrix4x2fv\x00");
    set_proc_address(&UniformMatrix3x4fv, "glUniformMatrix3x4fv\x00");
    set_proc_address(&UniformMatrix4x3fv, "glUniformMatrix4x3fv\x00");
}


// VERSION_3_0
 ColorMaski:                          proc(index: u32, r: u8, g: u8, b: u8, a: u8)                                                                                 #cc_c;
 GetBooleani_v:                       proc(target: u32, index: u32, data: ^u8)                                                                                     #cc_c;
 GetIntegeri_v:                       proc(target: u32, index: u32, data: ^i32)                                                                                    #cc_c;
 Enablei:                             proc(target: u32, index: u32)                                                                                                #cc_c;
 Disablei:                            proc(target: u32, index: u32)                                                                                                #cc_c;
 IsEnabledi:                          proc(target: u32, index: u32) -> u8                                                                                          #cc_c;
 BeginTransformFeedback:              proc(primitiveMode: u32)                                                                                                     #cc_c;
 EndTransformFeedback:                proc()                                                                                                                       #cc_c;
 BindBufferRange:                     proc(target: u32, index: u32, buffer: u32, offset: int, size: int)                                                           #cc_c;
 BindBufferBase:                      proc(target: u32, index: u32, buffer: u32)                                                                                   #cc_c;
 TransformFeedbackVaryings:           proc(program: u32, count: i32, varyings: ^u8, bufferMode: u32)                                                               #cc_c;
 GetTransformFeedbackVarying:         proc(program: u32, index: u32, bufSize: i32, length: ^i32, size: ^i32, type_: ^u32, name: ^u8)                               #cc_c;
 ClampColor:                          proc(target: u32, clamp: u32)                                                                                                #cc_c;
 BeginConditionalRender:              proc(id: u32, mode: u32)                                                                                                     #cc_c;
 EndConditionalRender:                proc()                                                                                                                       #cc_c;
 VertexAttribIPointer:                proc(index: u32, size: i32, type_: u32, stride: i32, pointer: rawptr)                                                        #cc_c;
 GetVertexAttribIiv:                  proc(index: u32, pname: u32, params: ^i32)                                                                                   #cc_c;
 GetVertexAttribIuiv:                 proc(index: u32, pname: u32, params: ^u32)                                                                                   #cc_c;
 VertexAttribI1i:                     proc(index: u32, x: i32)                                                                                                     #cc_c;
 VertexAttribI2i:                     proc(index: u32, x: i32, y: i32)                                                                                             #cc_c;
 VertexAttribI3i:                     proc(index: u32, x: i32, y: i32, z: i32)                                                                                     #cc_c;
 VertexAttribI4i:                     proc(index: u32, x: i32, y: i32, z: i32, w: i32)                                                                             #cc_c;
 VertexAttribI1ui:                    proc(index: u32, x: u32)                                                                                                     #cc_c;
 VertexAttribI2ui:                    proc(index: u32, x: u32, y: u32)                                                                                             #cc_c;
 VertexAttribI3ui:                    proc(index: u32, x: u32, y: u32, z: u32)                                                                                     #cc_c;
 VertexAttribI4ui:                    proc(index: u32, x: u32, y: u32, z: u32, w: u32)                                                                             #cc_c;
 VertexAttribI1iv:                    proc(index: u32, v: ^i32)                                                                                                    #cc_c;
 VertexAttribI2iv:                    proc(index: u32, v: ^i32)                                                                                                    #cc_c;
 VertexAttribI3iv:                    proc(index: u32, v: ^i32)                                                                                                    #cc_c;
 VertexAttribI4iv:                    proc(index: u32, v: ^i32)                                                                                                    #cc_c;
 VertexAttribI1uiv:                   proc(index: u32, v: ^u32)                                                                                                    #cc_c;
 VertexAttribI2uiv:                   proc(index: u32, v: ^u32)                                                                                                    #cc_c;
 VertexAttribI3uiv:                   proc(index: u32, v: ^u32)                                                                                                    #cc_c;
 VertexAttribI4uiv:                   proc(index: u32, v: ^u32)                                                                                                    #cc_c;
 VertexAttribI4bv:                    proc(index: u32, v: ^i8)                                                                                                     #cc_c;
 VertexAttribI4sv:                    proc(index: u32, v: ^i16)                                                                                                    #cc_c;
 VertexAttribI4ubv:                   proc(index: u32, v: ^u8)                                                                                                     #cc_c;
 VertexAttribI4usv:                   proc(index: u32, v: ^u16)                                                                                                    #cc_c;
 GetUniformuiv:                       proc(program: u32, location: i32, params: ^u32)                                                                              #cc_c;
 BindFragDataLocation:                proc(program: u32, color: u32, name: ^u8)                                                                                    #cc_c;
 GetFragDataLocation:                 proc(program: u32, name: ^u8) -> i32                                                                                         #cc_c;
 Uniform1ui:                          proc(location: i32, v0: u32)                                                                                                 #cc_c;
 Uniform2ui:                          proc(location: i32, v0: u32, v1: u32)                                                                                        #cc_c;
 Uniform3ui:                          proc(location: i32, v0: u32, v1: u32, v2: u32)                                                                               #cc_c;
 Uniform4ui:                          proc(location: i32, v0: u32, v1: u32, v2: u32, v3: u32)                                                                      #cc_c;
 Uniform1uiv:                         proc(location: i32, count: i32, value: ^u32)                                                                                 #cc_c;
 Uniform2uiv:                         proc(location: i32, count: i32, value: ^u32)                                                                                 #cc_c;
 Uniform3uiv:                         proc(location: i32, count: i32, value: ^u32)                                                                                 #cc_c;
 Uniform4uiv:                         proc(location: i32, count: i32, value: ^u32)                                                                                 #cc_c;
 TexParameterIiv:                     proc(target: u32, pname: u32, params: ^i32)                                                                                  #cc_c;
 TexParameterIuiv:                    proc(target: u32, pname: u32, params: ^u32)                                                                                  #cc_c;
 GetTexParameterIiv:                  proc(target: u32, pname: u32, params: ^i32)                                                                                  #cc_c;
 GetTexParameterIuiv:                 proc(target: u32, pname: u32, params: ^u32)                                                                                  #cc_c;
 ClearBufferiv:                       proc(buffer: u32, drawbuffer: i32, value: ^i32)                                                                              #cc_c;
 ClearBufferuiv:                      proc(buffer: u32, drawbuffer: i32, value: ^u32)                                                                              #cc_c;
 ClearBufferfv:                       proc(buffer: u32, drawbuffer: i32, value: ^f32)                                                                              #cc_c;
 ClearBufferfi:                       proc(buffer: u32, drawbuffer: i32, depth: f32, stencil: i32) -> rawptr                                                       #cc_c;
 GetStringi:                          proc(name: u32, index: u32) -> u8                                                                                            #cc_c;
 IsRenderbuffer:                      proc(renderbuffer: u32) -> u8                                                                                                #cc_c;
 BindRenderbuffer:                    proc(target: u32, renderbuffer: u32)                                                                                         #cc_c;
 DeleteRenderbuffers:                 proc(n: i32, renderbuffers: ^u32)                                                                                            #cc_c;
 GenRenderbuffers:                    proc(n: i32, renderbuffers: ^u32)                                                                                            #cc_c;
 RenderbufferStorage:                 proc(target: u32, internalformat: u32, width: i32, height: i32)                                                              #cc_c;
 GetRenderbufferParameteriv:          proc(target: u32, pname: u32, params: ^i32)                                                                                  #cc_c;
 IsFramebuffer:                       proc(framebuffer: u32) -> u8                                                                                                 #cc_c;
 BindFramebuffer:                     proc(target: u32, framebuffer: u32)                                                                                          #cc_c;
 DeleteFramebuffers:                  proc(n: i32, framebuffers: ^u32)                                                                                             #cc_c;
 GenFramebuffers:                     proc(n: i32, framebuffers: ^u32)                                                                                             #cc_c;
 CheckFramebufferStatus:              proc(target: u32) -> u32                                                                                                     #cc_c;
 FramebufferTexture1D:                proc(target: u32, attachment: u32, textarget: u32, texture: u32, level: i32)                                                 #cc_c;
 FramebufferTexture2D:                proc(target: u32, attachment: u32, textarget: u32, texture: u32, level: i32)                                                 #cc_c;
 FramebufferTexture3D:                proc(target: u32, attachment: u32, textarget: u32, texture: u32, level: i32, zoffset: i32)                                   #cc_c;
 FramebufferRenderbuffer:             proc(target: u32, attachment: u32, renderbuffertarget: u32, renderbuffer: u32)                                               #cc_c;
 GetFramebufferAttachmentParameteriv: proc(target: u32, attachment: u32, pname: u32, params: ^i32)                                                                 #cc_c;
 GenerateMipmap:                      proc(target: u32)                                                                                                            #cc_c;
 BlitFramebuffer:                     proc(srcX0: i32, srcY0: i32, srcX1: i32, srcY1: i32, dstX0: i32, dstY0: i32, dstX1: i32, dstY1: i32, mask: u32, filter: u32) #cc_c;
 RenderbufferStorageMultisample:      proc(target: u32, samples: i32, internalformat: u32, width: i32, height: i32)                                                #cc_c;
 FramebufferTextureLayer:             proc(target: u32, attachment: u32, texture: u32, level: i32, layer: i32)                                                     #cc_c;
 MapBufferRange:                      proc(target: u32, offset: int, length: int, access: u32) -> rawptr                                                           #cc_c;
 FlushMappedBufferRange:              proc(target: u32, offset: int, length: int)                                                                                  #cc_c;
 BindVertexArray:                     proc(array: u32)                                                                                                             #cc_c;
 DeleteVertexArrays:                  proc(n: i32, arrays: ^u32)                                                                                                   #cc_c;
 GenVertexArrays:                     proc(n: i32, arrays: ^u32)                                                                                                   #cc_c;
 IsVertexArray:                       proc(array: u32) -> u8                                                                                                       #cc_c;

load_3_0 :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    set_proc_address(&ColorMaski,                          "glColorMaski\x00");
    set_proc_address(&GetBooleani_v,                       "glGetBooleani_v\x00");
    set_proc_address(&GetIntegeri_v,                       "glGetIntegeri_v\x00");
    set_proc_address(&Enablei,                             "glEnablei\x00");
    set_proc_address(&Disablei,                            "glDisablei\x00");
    set_proc_address(&IsEnabledi,                          "glIsEnabledi\x00");
    set_proc_address(&BeginTransformFeedback,              "glBeginTransformFeedback\x00");
    set_proc_address(&EndTransformFeedback,                "glEndTransformFeedback\x00");
    set_proc_address(&BindBufferRange,                     "glBindBufferRange\x00");
    set_proc_address(&BindBufferBase,                      "glBindBufferBase\x00");
    set_proc_address(&TransformFeedbackVaryings,           "glTransformFeedbackVaryings\x00");
    set_proc_address(&GetTransformFeedbackVarying,         "glGetTransformFeedbackVarying\x00");
    set_proc_address(&ClampColor,                          "glClampColor\x00");
    set_proc_address(&BeginConditionalRender,              "glBeginConditionalRender\x00");
    set_proc_address(&EndConditionalRender,                "glEndConditionalRender\x00");
    set_proc_address(&VertexAttribIPointer,                "glVertexAttribIPointer\x00");
    set_proc_address(&GetVertexAttribIiv,                  "glGetVertexAttribIiv\x00");
    set_proc_address(&GetVertexAttribIuiv,                 "glGetVertexAttribIuiv\x00");
    set_proc_address(&VertexAttribI1i,                     "glVertexAttribI1i\x00");
    set_proc_address(&VertexAttribI2i,                     "glVertexAttribI2i\x00");
    set_proc_address(&VertexAttribI3i,                     "glVertexAttribI3i\x00");
    set_proc_address(&VertexAttribI4i,                     "glVertexAttribI4i\x00");
    set_proc_address(&VertexAttribI1ui,                    "glVertexAttribI1ui\x00");
    set_proc_address(&VertexAttribI2ui,                    "glVertexAttribI2ui\x00");
    set_proc_address(&VertexAttribI3ui,                    "glVertexAttribI3ui\x00");
    set_proc_address(&VertexAttribI4ui,                    "glVertexAttribI4ui\x00");
    set_proc_address(&VertexAttribI1iv,                    "glVertexAttribI1iv\x00");
    set_proc_address(&VertexAttribI2iv,                    "glVertexAttribI2iv\x00");
    set_proc_address(&VertexAttribI3iv,                    "glVertexAttribI3iv\x00");
    set_proc_address(&VertexAttribI4iv,                    "glVertexAttribI4iv\x00");
    set_proc_address(&VertexAttribI1uiv,                   "glVertexAttribI1uiv\x00");
    set_proc_address(&VertexAttribI2uiv,                   "glVertexAttribI2uiv\x00");
    set_proc_address(&VertexAttribI3uiv,                   "glVertexAttribI3uiv\x00");
    set_proc_address(&VertexAttribI4uiv,                   "glVertexAttribI4uiv\x00");
    set_proc_address(&VertexAttribI4bv,                    "glVertexAttribI4bv\x00");
    set_proc_address(&VertexAttribI4sv,                    "glVertexAttribI4sv\x00");
    set_proc_address(&VertexAttribI4ubv,                   "glVertexAttribI4ubv\x00");
    set_proc_address(&VertexAttribI4usv,                   "glVertexAttribI4usv\x00");
    set_proc_address(&GetUniformuiv,                       "glGetUniformuiv\x00");
    set_proc_address(&BindFragDataLocation,                "glBindFragDataLocation\x00");
    set_proc_address(&GetFragDataLocation,                 "glGetFragDataLocation\x00");
    set_proc_address(&Uniform1ui,                          "glUniform1ui\x00");
    set_proc_address(&Uniform2ui,                          "glUniform2ui\x00");
    set_proc_address(&Uniform3ui,                          "glUniform3ui\x00");
    set_proc_address(&Uniform4ui,                          "glUniform4ui\x00");
    set_proc_address(&Uniform1uiv,                         "glUniform1uiv\x00");
    set_proc_address(&Uniform2uiv,                         "glUniform2uiv\x00");
    set_proc_address(&Uniform3uiv,                         "glUniform3uiv\x00");
    set_proc_address(&Uniform4uiv,                         "glUniform4uiv\x00");
    set_proc_address(&TexParameterIiv,                     "glTexParameterIiv\x00");
    set_proc_address(&TexParameterIuiv,                    "glTexParameterIuiv\x00");
    set_proc_address(&GetTexParameterIiv,                  "glGetTexParameterIiv\x00");
    set_proc_address(&GetTexParameterIuiv,                 "glGetTexParameterIuiv\x00");
    set_proc_address(&ClearBufferiv,                       "glClearBufferiv\x00");
    set_proc_address(&ClearBufferuiv,                      "glClearBufferuiv\x00");
    set_proc_address(&ClearBufferfv,                       "glClearBufferfv\x00");
    set_proc_address(&ClearBufferfi,                       "glClearBufferfi\x00");
    set_proc_address(&GetStringi,                          "glGetStringi\x00");
    set_proc_address(&IsRenderbuffer,                      "glIsRenderbuffer\x00");
    set_proc_address(&BindRenderbuffer,                    "glBindRenderbuffer\x00");
    set_proc_address(&DeleteRenderbuffers,                 "glDeleteRenderbuffers\x00");
    set_proc_address(&GenRenderbuffers,                    "glGenRenderbuffers\x00");
    set_proc_address(&RenderbufferStorage,                 "glRenderbufferStorage\x00");
    set_proc_address(&GetRenderbufferParameteriv,          "glGetRenderbufferParameteriv\x00");
    set_proc_address(&IsFramebuffer,                       "glIsFramebuffer\x00");
    set_proc_address(&BindFramebuffer,                     "glBindFramebuffer\x00");
    set_proc_address(&DeleteFramebuffers,                  "glDeleteFramebuffers\x00");
    set_proc_address(&GenFramebuffers,                     "glGenFramebuffers\x00");
    set_proc_address(&CheckFramebufferStatus,              "glCheckFramebufferStatus\x00");
    set_proc_address(&FramebufferTexture1D,                "glFramebufferTexture1D\x00");
    set_proc_address(&FramebufferTexture2D,                "glFramebufferTexture2D\x00");
    set_proc_address(&FramebufferTexture3D,                "glFramebufferTexture3D\x00");
    set_proc_address(&FramebufferRenderbuffer,             "glFramebufferRenderbuffer\x00");
    set_proc_address(&GetFramebufferAttachmentParameteriv, "glGetFramebufferAttachmentParameteriv\x00");
    set_proc_address(&GenerateMipmap,                      "glGenerateMipmap\x00");
    set_proc_address(&BlitFramebuffer,                     "glBlitFramebuffer\x00");
    set_proc_address(&RenderbufferStorageMultisample,      "glRenderbufferStorageMultisample\x00");
    set_proc_address(&FramebufferTextureLayer,             "glFramebufferTextureLayer\x00");
    set_proc_address(&MapBufferRange,                      "glMapBufferRange\x00");
    set_proc_address(&FlushMappedBufferRange,              "glFlushMappedBufferRange\x00");
    set_proc_address(&BindVertexArray,                     "glBindVertexArray\x00");
    set_proc_address(&DeleteVertexArrays,                  "glDeleteVertexArrays\x00");
    set_proc_address(&GenVertexArrays,                     "glGenVertexArrays\x00");
    set_proc_address(&IsVertexArray,                       "glIsVertexArray\x00");
}


// VERSION_3_1
DrawArraysInstanced:       proc(mode: u32, first: i32, count: i32, instancecount: i32)                                   #cc_c;
DrawElementsInstanced:     proc(mode: u32, count: i32, type_: u32, indices: rawptr, instancecount: i32)                  #cc_c;
TexBuffer:                 proc(target: u32, internalformat: u32, buffer: u32)                                           #cc_c;
PrimitiveRestartIndex:     proc(index: u32)                                                                              #cc_c;
CopyBufferSubData:         proc(readTarget: u32, writeTarget: u32, readOffset: int, writeOffset: int, size: int)         #cc_c;
GetUniformIndices:         proc(program: u32, uniformCount: i32, uniformNames: ^u8, uniformIndices: ^u32)                #cc_c;
GetActiveUniformsiv:       proc(program: u32, uniformCount: i32, uniformIndices: ^u32, pname: u32, params: ^i32)         #cc_c;
GetActiveUniformName:      proc(program: u32, uniformIndex: u32, bufSize: i32, length: ^i32, uniformName: ^u8)           #cc_c;
GetUniformBlockIndex:      proc(program: u32, uniformBlockName: ^u8) -> u32                                              #cc_c;
GetActiveUniformBlockiv:   proc(program: u32, uniformBlockIndex: u32, pname: u32, params: ^i32)                          #cc_c;
GetActiveUniformBlockName: proc(program: u32, uniformBlockIndex: u32, bufSize: i32, length: ^i32, uniformBlockName: ^u8) #cc_c;
UniformBlockBinding:       proc(program: u32, uniformBlockIndex: u32, uniformBlockBinding: u32)                          #cc_c;

load_3_1 :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    set_proc_address(&DrawArraysInstanced,       "glDrawArraysInstanced\x00");
    set_proc_address(&DrawElementsInstanced,     "glDrawElementsInstanced\x00");
    set_proc_address(&TexBuffer,                 "glTexBuffer\x00");
    set_proc_address(&PrimitiveRestartIndex,     "glPrimitiveRestartIndex\x00");
    set_proc_address(&CopyBufferSubData,         "glCopyBufferSubData\x00");
    set_proc_address(&GetUniformIndices,         "glGetUniformIndices\x00");
    set_proc_address(&GetActiveUniformsiv,       "glGetActiveUniformsiv\x00");
    set_proc_address(&GetActiveUniformName,      "glGetActiveUniformName\x00");
    set_proc_address(&GetUniformBlockIndex,      "glGetUniformBlockIndex\x00");
    set_proc_address(&GetActiveUniformBlockiv,   "glGetActiveUniformBlockiv\x00");
    set_proc_address(&GetActiveUniformBlockName, "glGetActiveUniformBlockName\x00");
    set_proc_address(&UniformBlockBinding,       "glUniformBlockBinding\x00");
}


// VERSION_3_2
DrawElementsBaseVertex:          proc(mode: u32, count: i32, type_: u32, indices: rawptr, basevertex: i32)                                           #cc_c;
DrawRangeElementsBaseVertex:     proc(mode: u32, start: u32, end: u32, count: i32, type_: u32, indices: rawptr, basevertex: i32)                     #cc_c;
DrawElementsInstancedBaseVertex: proc(mode: u32, count: i32, type_: u32, indices: rawptr, instancecount: i32, basevertex: i32)                       #cc_c;
MultiDrawElementsBaseVertex:     proc(mode: u32, count: ^i32, type_: u32, indices: ^rawptr, drawcount: i32, basevertex: ^i32)                        #cc_c;
ProvokingVertex:                 proc(mode: u32)                                                                                                     #cc_c;
FenceSync:                       proc(condition: u32, flags: u32) -> sync_t                                                                          #cc_c;
IsSync:                          proc(sync: sync_t) -> u8                                                                                            #cc_c;
DeleteSync:                      proc(sync: sync_t)                                                                                                  #cc_c;
ClientWaitSync:                  proc(sync: sync_t, flags: u32, timeout: u64) -> u32                                                                 #cc_c;
WaitSync:                        proc(sync: sync_t, flags: u32, timeout: u64)                                                                        #cc_c;
GetInteger64v:                   proc(pname: u32, data: ^i64)                                                                                        #cc_c;
GetSynciv:                       proc(sync: sync_t, pname: u32, bufSize: i32, length: ^i32, values: ^i32)                                            #cc_c;
GetInteger64i_v:                 proc(target: u32, index: u32, data: ^i64)                                                                           #cc_c;
GetBufferParameteri64v:          proc(target: u32, pname: u32, params: ^i64)                                                                         #cc_c;
FramebufferTexture:              proc(target: u32, attachment: u32, texture: u32, level: i32)                                                        #cc_c;
TexImage2DMultisample:           proc(target: u32, samples: i32, internalformat: u32, width: i32, height: i32, fixedsamplelocations: u8)             #cc_c;
TexImage3DMultisample:           proc(target: u32, samples: i32, internalformat: u32, width: i32, height: i32, depth: i32, fixedsamplelocations: u8) #cc_c;
GetMultisamplefv:                proc(pname: u32, index: u32, val: ^f32)                                                                             #cc_c;
SampleMaski:                     proc(maskNumber: u32, mask: u32)                                                                                    #cc_c;

load_3_2 :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    set_proc_address(&DrawElementsBaseVertex,          "glDrawElementsBaseVertex\x00");
    set_proc_address(&DrawRangeElementsBaseVertex,     "glDrawRangeElementsBaseVertex\x00");
    set_proc_address(&DrawElementsInstancedBaseVertex, "glDrawElementsInstancedBaseVertex\x00");
    set_proc_address(&MultiDrawElementsBaseVertex,     "glMultiDrawElementsBaseVertex\x00");
    set_proc_address(&ProvokingVertex,                 "glProvokingVertex\x00");
    set_proc_address(&FenceSync,                       "glFenceSync\x00");
    set_proc_address(&IsSync,                          "glIsSync\x00");
    set_proc_address(&DeleteSync,                      "glDeleteSync\x00");
    set_proc_address(&ClientWaitSync,                  "glClientWaitSync\x00");
    set_proc_address(&WaitSync,                        "glWaitSync\x00");
    set_proc_address(&GetInteger64v,                   "glGetInteger64v\x00");
    set_proc_address(&GetSynciv,                       "glGetSynciv\x00");
    set_proc_address(&GetInteger64i_v,                 "glGetInteger64i_v\x00");
    set_proc_address(&GetBufferParameteri64v,          "glGetBufferParameteri64v\x00");
    set_proc_address(&FramebufferTexture,              "glFramebufferTexture\x00");
    set_proc_address(&TexImage2DMultisample,           "glTexImage2DMultisample\x00");
    set_proc_address(&TexImage3DMultisample,           "glTexImage3DMultisample\x00");
    set_proc_address(&GetMultisamplefv,                "glGetMultisamplefv\x00");
    set_proc_address(&SampleMaski,                     "glSampleMaski\x00");
}


// VERSION_3_3
BindFragDataLocationIndexed: proc(program: u32, colorNumber: u32, index: u32, name: ^u8) #cc_c;
GetFragDataIndex:            proc(program: u32, name: ^u8) -> i32                        #cc_c;
GenSamplers:                 proc(count: i32, samplers: ^u32)                            #cc_c;
DeleteSamplers:              proc(count: i32, samplers: ^u32)                            #cc_c;
IsSampler:                   proc(sampler: u32) -> u8                                    #cc_c;
BindSampler:                 proc(unit: u32, sampler: u32)                               #cc_c;
SamplerParameteri:           proc(sampler: u32, pname: u32, param: i32)                  #cc_c;
SamplerParameteriv:          proc(sampler: u32, pname: u32, param: ^i32)                 #cc_c;
SamplerParameterf:           proc(sampler: u32, pname: u32, param: f32)                  #cc_c;
SamplerParameterfv:          proc(sampler: u32, pname: u32, param: ^f32)                 #cc_c;
SamplerParameterIiv:         proc(sampler: u32, pname: u32, param: ^i32)                 #cc_c;
SamplerParameterIuiv:        proc(sampler: u32, pname: u32, param: ^u32)                 #cc_c;
GetSamplerParameteriv:       proc(sampler: u32, pname: u32, params: ^i32)                #cc_c;
GetSamplerParameterIiv:      proc(sampler: u32, pname: u32, params: ^i32)                #cc_c;
GetSamplerParameterfv:       proc(sampler: u32, pname: u32, params: ^f32)                #cc_c;
GetSamplerParameterIuiv:     proc(sampler: u32, pname: u32, params: ^u32)                #cc_c;
QueryCounter:                proc(id: u32, target: u32)                                  #cc_c;
GetQueryObjecti64v:          proc(id: u32, pname: u32, params: ^i64)                     #cc_c;
GetQueryObjectui64v:         proc(id: u32, pname: u32, params: ^u64)                     #cc_c;
VertexAttribDivisor:         proc(index: u32, divisor: u32)                              #cc_c;
VertexAttribP1ui:            proc(index: u32, type_: u32, normalized: u8, value: u32)    #cc_c;
VertexAttribP1uiv:           proc(index: u32, type_: u32, normalized: u8, value: ^u32)   #cc_c;
VertexAttribP2ui:            proc(index: u32, type_: u32, normalized: u8, value: u32)    #cc_c;
VertexAttribP2uiv:           proc(index: u32, type_: u32, normalized: u8, value: ^u32)   #cc_c;
VertexAttribP3ui:            proc(index: u32, type_: u32, normalized: u8, value: u32)    #cc_c;
VertexAttribP3uiv:           proc(index: u32, type_: u32, normalized: u8, value: ^u32)   #cc_c;
VertexAttribP4ui:            proc(index: u32, type_: u32, normalized: u8, value: u32)    #cc_c;
VertexAttribP4uiv:           proc(index: u32, type_: u32, normalized: u8, value: ^u32)   #cc_c;
VertexP2ui:                  proc(type_: u32, value: u32)                                #cc_c;
VertexP2uiv:                 proc(type_: u32, value: ^u32)                               #cc_c;
VertexP3ui:                  proc(type_: u32, value: u32)                                #cc_c;
VertexP3uiv:                 proc(type_: u32, value: ^u32)                               #cc_c;
VertexP4ui:                  proc(type_: u32, value: u32)                                #cc_c;
VertexP4uiv:                 proc(type_: u32, value: ^u32)                               #cc_c;
TexCoordP1ui:                proc(type_: u32, coords: u32)                               #cc_c;
TexCoordP1uiv:               proc(type_: u32, coords: ^u32)                              #cc_c;
TexCoordP2ui:                proc(type_: u32, coords: u32)                               #cc_c;
TexCoordP2uiv:               proc(type_: u32, coords: ^u32)                              #cc_c;
TexCoordP3ui:                proc(type_: u32, coords: u32)                               #cc_c;
TexCoordP3uiv:               proc(type_: u32, coords: ^u32)                              #cc_c;
TexCoordP4ui:                proc(type_: u32, coords: u32)                               #cc_c;
TexCoordP4uiv:               proc(type_: u32, coords: ^u32)                              #cc_c;
MultiTexCoordP1ui:           proc(texture: u32, type_: u32, coords: u32)                 #cc_c;
MultiTexCoordP1uiv:          proc(texture: u32, type_: u32, coords: ^u32)                #cc_c;
MultiTexCoordP2ui:           proc(texture: u32, type_: u32, coords: u32)                 #cc_c;
MultiTexCoordP2uiv:          proc(texture: u32, type_: u32, coords: ^u32)                #cc_c;
MultiTexCoordP3ui:           proc(texture: u32, type_: u32, coords: u32)                 #cc_c;
MultiTexCoordP3uiv:          proc(texture: u32, type_: u32, coords: ^u32)                #cc_c;
MultiTexCoordP4ui:           proc(texture: u32, type_: u32, coords: u32)                 #cc_c;
MultiTexCoordP4uiv:          proc(texture: u32, type_: u32, coords: ^u32)                #cc_c;
NormalP3ui:                  proc(type_: u32, coords: u32)                               #cc_c;
NormalP3uiv:                 proc(type_: u32, coords: ^u32)                              #cc_c;
ColorP3ui:                   proc(type_: u32, color: u32)                                #cc_c;
ColorP3uiv:                  proc(type_: u32, color: ^u32)                               #cc_c;
ColorP4ui:                   proc(type_: u32, color: u32)                                #cc_c;
ColorP4uiv:                  proc(type_: u32, color: ^u32)                               #cc_c;
SecondaryColorP3ui:          proc(type_: u32, color: u32)                                #cc_c;
SecondaryColorP3uiv:         proc(type_: u32, color: ^u32)                               #cc_c;

load_3_3 :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    set_proc_address(&BindFragDataLocationIndexed, "glBindFragDataLocationIndexed\x00");
    set_proc_address(&GetFragDataIndex,            "glGetFragDataIndex\x00");
    set_proc_address(&GenSamplers,                 "glGenSamplers\x00");
    set_proc_address(&DeleteSamplers,              "glDeleteSamplers\x00");
    set_proc_address(&IsSampler,                   "glIsSampler\x00");
    set_proc_address(&BindSampler,                 "glBindSampler\x00");
    set_proc_address(&SamplerParameteri,           "glSamplerParameteri\x00");
    set_proc_address(&SamplerParameteriv,          "glSamplerParameteriv\x00");
    set_proc_address(&SamplerParameterf,           "glSamplerParameterf\x00");
    set_proc_address(&SamplerParameterfv,          "glSamplerParameterfv\x00");
    set_proc_address(&SamplerParameterIiv,         "glSamplerParameterIiv\x00");
    set_proc_address(&SamplerParameterIuiv,        "glSamplerParameterIuiv\x00");
    set_proc_address(&GetSamplerParameteriv,       "glGetSamplerParameteriv\x00");
    set_proc_address(&GetSamplerParameterIiv,      "glGetSamplerParameterIiv\x00");
    set_proc_address(&GetSamplerParameterfv,       "glGetSamplerParameterfv\x00");
    set_proc_address(&GetSamplerParameterIuiv,     "glGetSamplerParameterIuiv\x00");
    set_proc_address(&QueryCounter,                "glQueryCounter\x00");
    set_proc_address(&GetQueryObjecti64v,          "glGetQueryObjecti64v\x00");
    set_proc_address(&GetQueryObjectui64v,         "glGetQueryObjectui64v\x00");
    set_proc_address(&VertexAttribDivisor,         "glVertexAttribDivisor\x00");
    set_proc_address(&VertexAttribP1ui,            "glVertexAttribP1ui\x00");
    set_proc_address(&VertexAttribP1uiv,           "glVertexAttribP1uiv\x00");
    set_proc_address(&VertexAttribP2ui,            "glVertexAttribP2ui\x00");
    set_proc_address(&VertexAttribP2uiv,           "glVertexAttribP2uiv\x00");
    set_proc_address(&VertexAttribP3ui,            "glVertexAttribP3ui\x00");
    set_proc_address(&VertexAttribP3uiv,           "glVertexAttribP3uiv\x00");
    set_proc_address(&VertexAttribP4ui,            "glVertexAttribP4ui\x00");
    set_proc_address(&VertexAttribP4uiv,           "glVertexAttribP4uiv\x00");
    set_proc_address(&VertexP2ui,                  "glVertexP2ui\x00");
    set_proc_address(&VertexP2uiv,                 "glVertexP2uiv\x00");
    set_proc_address(&VertexP3ui,                  "glVertexP3ui\x00");
    set_proc_address(&VertexP3uiv,                 "glVertexP3uiv\x00");
    set_proc_address(&VertexP4ui,                  "glVertexP4ui\x00");
    set_proc_address(&VertexP4uiv,                 "glVertexP4uiv\x00");
    set_proc_address(&TexCoordP1ui,                "glTexCoordP1ui\x00");
    set_proc_address(&TexCoordP1uiv,               "glTexCoordP1uiv\x00");
    set_proc_address(&TexCoordP2ui,                "glTexCoordP2ui\x00");
    set_proc_address(&TexCoordP2uiv,               "glTexCoordP2uiv\x00");
    set_proc_address(&TexCoordP3ui,                "glTexCoordP3ui\x00");
    set_proc_address(&TexCoordP3uiv,               "glTexCoordP3uiv\x00");
    set_proc_address(&TexCoordP4ui,                "glTexCoordP4ui\x00");
    set_proc_address(&TexCoordP4uiv,               "glTexCoordP4uiv\x00");
    set_proc_address(&MultiTexCoordP1ui,           "glMultiTexCoordP1ui\x00");
    set_proc_address(&MultiTexCoordP1uiv,          "glMultiTexCoordP1uiv\x00");
    set_proc_address(&MultiTexCoordP2ui,           "glMultiTexCoordP2ui\x00");
    set_proc_address(&MultiTexCoordP2uiv,          "glMultiTexCoordP2uiv\x00");
    set_proc_address(&MultiTexCoordP3ui,           "glMultiTexCoordP3ui\x00");
    set_proc_address(&MultiTexCoordP3uiv,          "glMultiTexCoordP3uiv\x00");
    set_proc_address(&MultiTexCoordP4ui,           "glMultiTexCoordP4ui\x00");
    set_proc_address(&MultiTexCoordP4uiv,          "glMultiTexCoordP4uiv\x00");
    set_proc_address(&NormalP3ui,                  "glNormalP3ui\x00");
    set_proc_address(&NormalP3uiv,                 "glNormalP3uiv\x00");
    set_proc_address(&ColorP3ui,                   "glColorP3ui\x00");
    set_proc_address(&ColorP3uiv,                  "glColorP3uiv\x00");
    set_proc_address(&ColorP4ui,                   "glColorP4ui\x00");
    set_proc_address(&ColorP4uiv,                  "glColorP4uiv\x00");
    set_proc_address(&SecondaryColorP3ui,          "glSecondaryColorP3ui\x00");
    set_proc_address(&SecondaryColorP3uiv,         "glSecondaryColorP3uiv\x00");
}


// VERSION_4_0
MinSampleShading:               proc(value: f32)                                                                        #cc_c;
BlendEquationi:                 proc(buf: u32, mode: u32)                                                               #cc_c;
BlendEquationSeparatei:         proc(buf: u32, modeRGB: u32, modeAlpha: u32)                                            #cc_c;
BlendFunci:                     proc(buf: u32, src: u32, dst: u32)                                                      #cc_c;
BlendFuncSeparatei:             proc(buf: u32, srcRGB: u32, dstRGB: u32, srcAlpha: u32, dstAlpha: u32)                  #cc_c;
DrawArraysIndirect:             proc(mode: u32, indirect: rawptr)                                                       #cc_c;
DrawElementsIndirect:           proc(mode: u32, type_: u32, indirect: rawptr)                                           #cc_c;
Uniform1d:                      proc(location: i32, x: f64)                                                             #cc_c;
Uniform2d:                      proc(location: i32, x: f64, y: f64)                                                     #cc_c;
Uniform3d:                      proc(location: i32, x: f64, y: f64, z: f64)                                             #cc_c;
Uniform4d:                      proc(location: i32, x: f64, y: f64, z: f64, w: f64)                                     #cc_c;
Uniform1dv:                     proc(location: i32, count: i32, value: ^f64)                                            #cc_c;
Uniform2dv:                     proc(location: i32, count: i32, value: ^f64)                                            #cc_c;
Uniform3dv:                     proc(location: i32, count: i32, value: ^f64)                                            #cc_c;
Uniform4dv:                     proc(location: i32, count: i32, value: ^f64)                                            #cc_c;
UniformMatrix2dv:               proc(location: i32, count: i32, transpose: u8, value: ^f64)                             #cc_c;
UniformMatrix3dv:               proc(location: i32, count: i32, transpose: u8, value: ^f64)                             #cc_c;
UniformMatrix4dv:               proc(location: i32, count: i32, transpose: u8, value: ^f64)                             #cc_c;
UniformMatrix2x3dv:             proc(location: i32, count: i32, transpose: u8, value: ^f64)                             #cc_c;
UniformMatrix2x4dv:             proc(location: i32, count: i32, transpose: u8, value: ^f64)                             #cc_c;
UniformMatrix3x2dv:             proc(location: i32, count: i32, transpose: u8, value: ^f64)                             #cc_c;
UniformMatrix3x4dv:             proc(location: i32, count: i32, transpose: u8, value: ^f64)                             #cc_c;
UniformMatrix4x2dv:             proc(location: i32, count: i32, transpose: u8, value: ^f64)                             #cc_c;
UniformMatrix4x3dv:             proc(location: i32, count: i32, transpose: u8, value: ^f64)                             #cc_c;
GetUniformdv:                   proc(program: u32, location: i32, params: ^f64)                                         #cc_c;
GetSubroutineUniformLocation:   proc(program: u32, shadertype_: u32, name: ^u8) -> i32                                  #cc_c;
GetSubroutineIndex:             proc(program: u32, shadertype_: u32, name: ^u8) -> u32                                  #cc_c;
GetActiveSubroutineUniformiv:   proc(program: u32, shadertype_: u32, index: u32, pname: u32, values: ^i32)              #cc_c;
GetActiveSubroutineUniformName: proc(program: u32, shadertype_: u32, index: u32, bufsize: i32, length: ^i32, name: ^u8) #cc_c;
GetActiveSubroutineName:        proc(program: u32, shadertype_: u32, index: u32, bufsize: i32, length: ^i32, name: ^u8) #cc_c;
UniformSubroutinesuiv:          proc(shadertype_: u32, count: i32, indices: ^u32)                                       #cc_c;
GetUniformSubroutineuiv:        proc(shadertype_: u32, location: i32, params: ^u32)                                     #cc_c;
GetProgramStageiv:              proc(program: u32, shadertype_: u32, pname: u32, values: ^i32)                          #cc_c;
PatchParameteri:                proc(pname: u32, value: i32)                                                            #cc_c;
PatchParameterfv:               proc(pname: u32, values: ^f32)                                                          #cc_c;
BindTransformFeedback:          proc(target: u32, id: u32)                                                              #cc_c;
DeleteTransformFeedbacks:       proc(n: i32, ids: ^u32)                                                                 #cc_c;
GenTransformFeedbacks:          proc(n: i32, ids: ^u32)                                                                 #cc_c;
IsTransformFeedback:            proc(id: u32) -> u8                                                                     #cc_c;
PauseTransformFeedback:         proc()                                                                                  #cc_c;
ResumeTransformFeedback:        proc()                                                                                  #cc_c;
DrawTransformFeedback:          proc(mode: u32, id: u32)                                                                #cc_c;
DrawTransformFeedbackStream:    proc(mode: u32, id: u32, stream: u32)                                                   #cc_c;
BeginQueryIndexed:              proc(target: u32, index: u32, id: u32)                                                  #cc_c;
EndQueryIndexed:                proc(target: u32, index: u32)                                                           #cc_c;
GetQueryIndexediv:              proc(target: u32, index: u32, pname: u32, params: ^i32)                                 #cc_c;

load_4_0 :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    set_proc_address(&MinSampleShading,               "glMinSampleShading\x00");
    set_proc_address(&BlendEquationi,                 "glBlendEquationi\x00");
    set_proc_address(&BlendEquationSeparatei,         "glBlendEquationSeparatei\x00");
    set_proc_address(&BlendFunci,                     "glBlendFunci\x00");
    set_proc_address(&BlendFuncSeparatei,             "glBlendFuncSeparatei\x00");
    set_proc_address(&DrawArraysIndirect,             "glDrawArraysIndirect\x00");
    set_proc_address(&DrawElementsIndirect,           "glDrawElementsIndirect\x00");
    set_proc_address(&Uniform1d,                      "glUniform1d\x00");
    set_proc_address(&Uniform2d,                      "glUniform2d\x00");
    set_proc_address(&Uniform3d,                      "glUniform3d\x00");
    set_proc_address(&Uniform4d,                      "glUniform4d\x00");
    set_proc_address(&Uniform1dv,                     "glUniform1dv\x00");
    set_proc_address(&Uniform2dv,                     "glUniform2dv\x00");
    set_proc_address(&Uniform3dv,                     "glUniform3dv\x00");
    set_proc_address(&Uniform4dv,                     "glUniform4dv\x00");
    set_proc_address(&UniformMatrix2dv,               "glUniformMatrix2dv\x00");
    set_proc_address(&UniformMatrix3dv,               "glUniformMatrix3dv\x00");
    set_proc_address(&UniformMatrix4dv,               "glUniformMatrix4dv\x00");
    set_proc_address(&UniformMatrix2x3dv,             "glUniformMatrix2x3dv\x00");
    set_proc_address(&UniformMatrix2x4dv,             "glUniformMatrix2x4dv\x00");
    set_proc_address(&UniformMatrix3x2dv,             "glUniformMatrix3x2dv\x00");
    set_proc_address(&UniformMatrix3x4dv,             "glUniformMatrix3x4dv\x00");
    set_proc_address(&UniformMatrix4x2dv,             "glUniformMatrix4x2dv\x00");
    set_proc_address(&UniformMatrix4x3dv,             "glUniformMatrix4x3dv\x00");
    set_proc_address(&GetUniformdv,                   "glGetUniformdv\x00");
    set_proc_address(&GetSubroutineUniformLocation,   "glGetSubroutineUniformLocation\x00");
    set_proc_address(&GetSubroutineIndex,             "glGetSubroutineIndex\x00");
    set_proc_address(&GetActiveSubroutineUniformiv,   "glGetActiveSubroutineUniformiv\x00");
    set_proc_address(&GetActiveSubroutineUniformName, "glGetActiveSubroutineUniformName\x00");
    set_proc_address(&GetActiveSubroutineName,        "glGetActiveSubroutineName\x00");
    set_proc_address(&UniformSubroutinesuiv,          "glUniformSubroutinesuiv\x00");
    set_proc_address(&GetUniformSubroutineuiv,        "glGetUniformSubroutineuiv\x00");
    set_proc_address(&GetProgramStageiv,              "glGetProgramStageiv\x00");
    set_proc_address(&PatchParameteri,                "glPatchParameteri\x00");
    set_proc_address(&PatchParameterfv,               "glPatchParameterfv\x00");
    set_proc_address(&BindTransformFeedback,          "glBindTransformFeedback\x00");
    set_proc_address(&DeleteTransformFeedbacks,       "glDeleteTransformFeedbacks\x00");
    set_proc_address(&GenTransformFeedbacks,          "glGenTransformFeedbacks\x00");
    set_proc_address(&IsTransformFeedback,            "glIsTransformFeedback\x00");
    set_proc_address(&PauseTransformFeedback,         "glPauseTransformFeedback\x00");
    set_proc_address(&ResumeTransformFeedback,        "glResumeTransformFeedback\x00");
    set_proc_address(&DrawTransformFeedback,          "glDrawTransformFeedback\x00");
    set_proc_address(&DrawTransformFeedbackStream,    "glDrawTransformFeedbackStream\x00");
    set_proc_address(&BeginQueryIndexed,              "glBeginQueryIndexed\x00");
    set_proc_address(&EndQueryIndexed,                "glEndQueryIndexed\x00");
    set_proc_address(&GetQueryIndexediv,              "glGetQueryIndexediv\x00");
}


// VERSION_4_1
ReleaseShaderCompiler:     proc()                                                                             #cc_c;
ShaderBinary:              proc(count: i32, shaders: ^u32, binaryformat: u32, binary: rawptr, length: i32)    #cc_c;
GetShaderPrecisionFormat:  proc(shadertype_: u32, precisiontype_: u32, range: ^i32, precision: ^i32)          #cc_c;
DepthRangef:               proc(n: f32, f: f32)                                                               #cc_c;
ClearDepthf:               proc(d: f32)                                                                       #cc_c;
GetProgramBinary:          proc(program: u32, bufSize: i32, length: ^i32, binaryFormat: ^u32, binary: rawptr) #cc_c;
ProgramBinary:             proc(program: u32, binaryFormat: u32, binary: rawptr, length: i32)                 #cc_c;
ProgramParameteri:         proc(program: u32, pname: u32, value: i32)                                         #cc_c;
UseProgramStages:          proc(pipeline: u32, stages: u32, program: u32)                                     #cc_c;
ActiveShaderProgram:       proc(pipeline: u32, program: u32)                                                  #cc_c;
CreateShaderProgramv:      proc(type_: u32, count: i32, strings: ^u8) -> u32                                  #cc_c;
BindProgramPipeline:       proc(pipeline: u32)                                                                #cc_c;
DeleteProgramPipelines:    proc(n: i32, pipelines: ^u32)                                                      #cc_c;
GenProgramPipelines:       proc(n: i32, pipelines: ^u32)                                                      #cc_c;
IsProgramPipeline:         proc(pipeline: u32) -> u8                                                          #cc_c;
GetProgramPipelineiv:      proc(pipeline: u32, pname: u32, params: ^i32)                                      #cc_c;
ProgramUniform1i:          proc(program: u32, location: i32, v0: i32)                                         #cc_c;
ProgramUniform1iv:         proc(program: u32, location: i32, count: i32, value: ^i32)                         #cc_c;
ProgramUniform1f:          proc(program: u32, location: i32, v0: f32)                                         #cc_c;
ProgramUniform1fv:         proc(program: u32, location: i32, count: i32, value: ^f32)                         #cc_c;
ProgramUniform1d:          proc(program: u32, location: i32, v0: f64)                                         #cc_c;
ProgramUniform1dv:         proc(program: u32, location: i32, count: i32, value: ^f64)                         #cc_c;
ProgramUniform1ui:         proc(program: u32, location: i32, v0: u32)                                         #cc_c;
ProgramUniform1uiv:        proc(program: u32, location: i32, count: i32, value: ^u32)                         #cc_c;
ProgramUniform2i:          proc(program: u32, location: i32, v0: i32, v1: i32)                                #cc_c;
ProgramUniform2iv:         proc(program: u32, location: i32, count: i32, value: ^i32)                         #cc_c;
ProgramUniform2f:          proc(program: u32, location: i32, v0: f32, v1: f32)                                #cc_c;
ProgramUniform2fv:         proc(program: u32, location: i32, count: i32, value: ^f32)                         #cc_c;
ProgramUniform2d:          proc(program: u32, location: i32, v0: f64, v1: f64)                                #cc_c;
ProgramUniform2dv:         proc(program: u32, location: i32, count: i32, value: ^f64)                         #cc_c;
ProgramUniform2ui:         proc(program: u32, location: i32, v0: u32, v1: u32)                                #cc_c;
ProgramUniform2uiv:        proc(program: u32, location: i32, count: i32, value: ^u32)                         #cc_c;
ProgramUniform3i:          proc(program: u32, location: i32, v0: i32, v1: i32, v2: i32)                       #cc_c;
ProgramUniform3iv:         proc(program: u32, location: i32, count: i32, value: ^i32)                         #cc_c;
ProgramUniform3f:          proc(program: u32, location: i32, v0: f32, v1: f32, v2: f32)                       #cc_c;
ProgramUniform3fv:         proc(program: u32, location: i32, count: i32, value: ^f32)                         #cc_c;
ProgramUniform3d:          proc(program: u32, location: i32, v0: f64, v1: f64, v2: f64)                       #cc_c;
ProgramUniform3dv:         proc(program: u32, location: i32, count: i32, value: ^f64)                         #cc_c;
ProgramUniform3ui:         proc(program: u32, location: i32, v0: u32, v1: u32, v2: u32)                       #cc_c;
ProgramUniform3uiv:        proc(program: u32, location: i32, count: i32, value: ^u32)                         #cc_c;
ProgramUniform4i:          proc(program: u32, location: i32, v0: i32, v1: i32, v2: i32, v3: i32)              #cc_c;
ProgramUniform4iv:         proc(program: u32, location: i32, count: i32, value: ^i32)                         #cc_c;
ProgramUniform4f:          proc(program: u32, location: i32, v0: f32, v1: f32, v2: f32, v3: f32)              #cc_c;
ProgramUniform4fv:         proc(program: u32, location: i32, count: i32, value: ^f32)                         #cc_c;
ProgramUniform4d:          proc(program: u32, location: i32, v0: f64, v1: f64, v2: f64, v3: f64)              #cc_c;
ProgramUniform4dv:         proc(program: u32, location: i32, count: i32, value: ^f64)                         #cc_c;
ProgramUniform4ui:         proc(program: u32, location: i32, v0: u32, v1: u32, v2: u32, v3: u32)              #cc_c;
ProgramUniform4uiv:        proc(program: u32, location: i32, count: i32, value: ^u32)                         #cc_c;
ProgramUniformMatrix2fv:   proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f32)          #cc_c;
ProgramUniformMatrix3fv:   proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f32)          #cc_c;
ProgramUniformMatrix4fv:   proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f32)          #cc_c;
ProgramUniformMatrix2dv:   proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f64)          #cc_c;
ProgramUniformMatrix3dv:   proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f64)          #cc_c;
ProgramUniformMatrix4dv:   proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f64)          #cc_c;
ProgramUniformMatrix2x3fv: proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f32)          #cc_c;
ProgramUniformMatrix3x2fv: proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f32)          #cc_c;
ProgramUniformMatrix2x4fv: proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f32)          #cc_c;
ProgramUniformMatrix4x2fv: proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f32)          #cc_c;
ProgramUniformMatrix3x4fv: proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f32)          #cc_c;
ProgramUniformMatrix4x3fv: proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f32)          #cc_c;
ProgramUniformMatrix2x3dv: proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f64)          #cc_c;
ProgramUniformMatrix3x2dv: proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f64)          #cc_c;
ProgramUniformMatrix2x4dv: proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f64)          #cc_c;
ProgramUniformMatrix4x2dv: proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f64)          #cc_c;
ProgramUniformMatrix3x4dv: proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f64)          #cc_c;
ProgramUniformMatrix4x3dv: proc(program: u32, location: i32, count: i32, transpose: u8, value: ^f64)          #cc_c;
ValidateProgramPipeline:   proc(pipeline: u32)                                                                #cc_c;
GetProgramPipelineInfoLog: proc(pipeline: u32, bufSize: i32, length: ^i32, infoLog: ^u8)                      #cc_c;
VertexAttribL1d:           proc(index: u32, x: f64)                                                           #cc_c;
VertexAttribL2d:           proc(index: u32, x: f64, y: f64)                                                   #cc_c;
VertexAttribL3d:           proc(index: u32, x: f64, y: f64, z: f64)                                           #cc_c;
VertexAttribL4d:           proc(index: u32, x: f64, y: f64, z: f64, w: f64)                                   #cc_c;
VertexAttribL1dv:          proc(index: u32, v: ^f64)                                                          #cc_c;
VertexAttribL2dv:          proc(index: u32, v: ^f64)                                                          #cc_c;
VertexAttribL3dv:          proc(index: u32, v: ^f64)                                                          #cc_c;
VertexAttribL4dv:          proc(index: u32, v: ^f64)                                                          #cc_c;
VertexAttribLPointer:      proc(index: u32, size: i32, type_: u32, stride: i32, pointer: rawptr)              #cc_c;
GetVertexAttribLdv:        proc(index: u32, pname: u32, params: ^f64)                                         #cc_c;
ViewportArrayv:            proc(first: u32, count: i32, v: ^f32)                                              #cc_c;
ViewportIndexedf:          proc(index: u32, x: f32, y: f32, w: f32, h: f32)                                   #cc_c;
ViewportIndexedfv:         proc(index: u32, v: ^f32)                                                          #cc_c;
ScissorArrayv:             proc(first: u32, count: i32, v: ^i32)                                              #cc_c;
ScissorIndexed:            proc(index: u32, left: i32, bottom: i32, width: i32, height: i32)                  #cc_c;
ScissorIndexedv:           proc(index: u32, v: ^i32)                                                          #cc_c;
DepthRangeArrayv:          proc(first: u32, count: i32, v: ^f64)                                              #cc_c;
DepthRangeIndexed:         proc(index: u32, n: f64, f: f64)                                                   #cc_c;
GetFloati_v:               proc(target: u32, index: u32, data: ^f32)                                          #cc_c;
GetDoublei_v:              proc(target: u32, index: u32, data: ^f64)                                          #cc_c;

load_4_1 :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    set_proc_address(&ReleaseShaderCompiler,     "glReleaseShaderCompiler\x00");
    set_proc_address(&ShaderBinary,              "glShaderBinary\x00");
    set_proc_address(&GetShaderPrecisionFormat,  "glGetShaderPrecisionFormat\x00");
    set_proc_address(&DepthRangef,               "glDepthRangef\x00");
    set_proc_address(&ClearDepthf,               "glClearDepthf\x00");
    set_proc_address(&GetProgramBinary,          "glGetProgramBinary\x00");
    set_proc_address(&ProgramBinary,             "glProgramBinary\x00");
    set_proc_address(&ProgramParameteri,         "glProgramParameteri\x00");
    set_proc_address(&UseProgramStages,          "glUseProgramStages\x00");
    set_proc_address(&ActiveShaderProgram,       "glActiveShaderProgram\x00");
    set_proc_address(&CreateShaderProgramv,      "glCreateShaderProgramv\x00");
    set_proc_address(&BindProgramPipeline,       "glBindProgramPipeline\x00");
    set_proc_address(&DeleteProgramPipelines,    "glDeleteProgramPipelines\x00");
    set_proc_address(&GenProgramPipelines,       "glGenProgramPipelines\x00");
    set_proc_address(&IsProgramPipeline,         "glIsProgramPipeline\x00");
    set_proc_address(&GetProgramPipelineiv,      "glGetProgramPipelineiv\x00");
    set_proc_address(&ProgramUniform1i,          "glProgramUniform1i\x00");
    set_proc_address(&ProgramUniform1iv,         "glProgramUniform1iv\x00");
    set_proc_address(&ProgramUniform1f,          "glProgramUniform1f\x00");
    set_proc_address(&ProgramUniform1fv,         "glProgramUniform1fv\x00");
    set_proc_address(&ProgramUniform1d,          "glProgramUniform1d\x00");
    set_proc_address(&ProgramUniform1dv,         "glProgramUniform1dv\x00");
    set_proc_address(&ProgramUniform1ui,         "glProgramUniform1ui\x00");
    set_proc_address(&ProgramUniform1uiv,        "glProgramUniform1uiv\x00");
    set_proc_address(&ProgramUniform2i,          "glProgramUniform2i\x00");
    set_proc_address(&ProgramUniform2iv,         "glProgramUniform2iv\x00");
    set_proc_address(&ProgramUniform2f,          "glProgramUniform2f\x00");
    set_proc_address(&ProgramUniform2fv,         "glProgramUniform2fv\x00");
    set_proc_address(&ProgramUniform2d,          "glProgramUniform2d\x00");
    set_proc_address(&ProgramUniform2dv,         "glProgramUniform2dv\x00");
    set_proc_address(&ProgramUniform2ui,         "glProgramUniform2ui\x00");
    set_proc_address(&ProgramUniform2uiv,        "glProgramUniform2uiv\x00");
    set_proc_address(&ProgramUniform3i,          "glProgramUniform3i\x00");
    set_proc_address(&ProgramUniform3iv,         "glProgramUniform3iv\x00");
    set_proc_address(&ProgramUniform3f,          "glProgramUniform3f\x00");
    set_proc_address(&ProgramUniform3fv,         "glProgramUniform3fv\x00");
    set_proc_address(&ProgramUniform3d,          "glProgramUniform3d\x00");
    set_proc_address(&ProgramUniform3dv,         "glProgramUniform3dv\x00");
    set_proc_address(&ProgramUniform3ui,         "glProgramUniform3ui\x00");
    set_proc_address(&ProgramUniform3uiv,        "glProgramUniform3uiv\x00");
    set_proc_address(&ProgramUniform4i,          "glProgramUniform4i\x00");
    set_proc_address(&ProgramUniform4iv,         "glProgramUniform4iv\x00");
    set_proc_address(&ProgramUniform4f,          "glProgramUniform4f\x00");
    set_proc_address(&ProgramUniform4fv,         "glProgramUniform4fv\x00");
    set_proc_address(&ProgramUniform4d,          "glProgramUniform4d\x00");
    set_proc_address(&ProgramUniform4dv,         "glProgramUniform4dv\x00");
    set_proc_address(&ProgramUniform4ui,         "glProgramUniform4ui\x00");
    set_proc_address(&ProgramUniform4uiv,        "glProgramUniform4uiv\x00");
    set_proc_address(&ProgramUniformMatrix2fv,   "glProgramUniformMatrix2fv\x00");
    set_proc_address(&ProgramUniformMatrix3fv,   "glProgramUniformMatrix3fv\x00");
    set_proc_address(&ProgramUniformMatrix4fv,   "glProgramUniformMatrix4fv\x00");
    set_proc_address(&ProgramUniformMatrix2dv,   "glProgramUniformMatrix2dv\x00");
    set_proc_address(&ProgramUniformMatrix3dv,   "glProgramUniformMatrix3dv\x00");
    set_proc_address(&ProgramUniformMatrix4dv,   "glProgramUniformMatrix4dv\x00");
    set_proc_address(&ProgramUniformMatrix2x3fv, "glProgramUniformMatrix2x3fv\x00");
    set_proc_address(&ProgramUniformMatrix3x2fv, "glProgramUniformMatrix3x2fv\x00");
    set_proc_address(&ProgramUniformMatrix2x4fv, "glProgramUniformMatrix2x4fv\x00");
    set_proc_address(&ProgramUniformMatrix4x2fv, "glProgramUniformMatrix4x2fv\x00");
    set_proc_address(&ProgramUniformMatrix3x4fv, "glProgramUniformMatrix3x4fv\x00");
    set_proc_address(&ProgramUniformMatrix4x3fv, "glProgramUniformMatrix4x3fv\x00");
    set_proc_address(&ProgramUniformMatrix2x3dv, "glProgramUniformMatrix2x3dv\x00");
    set_proc_address(&ProgramUniformMatrix3x2dv, "glProgramUniformMatrix3x2dv\x00");
    set_proc_address(&ProgramUniformMatrix2x4dv, "glProgramUniformMatrix2x4dv\x00");
    set_proc_address(&ProgramUniformMatrix4x2dv, "glProgramUniformMatrix4x2dv\x00");
    set_proc_address(&ProgramUniformMatrix3x4dv, "glProgramUniformMatrix3x4dv\x00");
    set_proc_address(&ProgramUniformMatrix4x3dv, "glProgramUniformMatrix4x3dv\x00");
    set_proc_address(&ValidateProgramPipeline,   "glValidateProgramPipeline\x00");
    set_proc_address(&GetProgramPipelineInfoLog, "glGetProgramPipelineInfoLog\x00");
    set_proc_address(&VertexAttribL1d,           "glVertexAttribL1d\x00");
    set_proc_address(&VertexAttribL2d,           "glVertexAttribL2d\x00");
    set_proc_address(&VertexAttribL3d,           "glVertexAttribL3d\x00");
    set_proc_address(&VertexAttribL4d,           "glVertexAttribL4d\x00");
    set_proc_address(&VertexAttribL1dv,          "glVertexAttribL1dv\x00");
    set_proc_address(&VertexAttribL2dv,          "glVertexAttribL2dv\x00");
    set_proc_address(&VertexAttribL3dv,          "glVertexAttribL3dv\x00");
    set_proc_address(&VertexAttribL4dv,          "glVertexAttribL4dv\x00");
    set_proc_address(&VertexAttribLPointer,      "glVertexAttribLPointer\x00");
    set_proc_address(&GetVertexAttribLdv,        "glGetVertexAttribLdv\x00");
    set_proc_address(&ViewportArrayv,            "glViewportArrayv\x00");
    set_proc_address(&ViewportIndexedf,          "glViewportIndexedf\x00");
    set_proc_address(&ViewportIndexedfv,         "glViewportIndexedfv\x00");
    set_proc_address(&ScissorArrayv,             "glScissorArrayv\x00");
    set_proc_address(&ScissorIndexed,            "glScissorIndexed\x00");
    set_proc_address(&ScissorIndexedv,           "glScissorIndexedv\x00");
    set_proc_address(&DepthRangeArrayv,          "glDepthRangeArrayv\x00");
    set_proc_address(&DepthRangeIndexed,         "glDepthRangeIndexed\x00");
    set_proc_address(&GetFloati_v,               "glGetFloati_v\x00");
    set_proc_address(&GetDoublei_v,              "glGetDoublei_v\x00");
}


// VERSION_4_2
DrawArraysInstancedBaseInstance:             proc(mode: u32, first: i32, count: i32, instancecount: i32, baseinstance: u32)                                   #cc_c;
DrawElementsInstancedBaseInstance:           proc(mode: u32, count: i32, type_: u32, indices: rawptr, instancecount: i32, baseinstance: u32)                  #cc_c;
DrawElementsInstancedBaseVertexBaseInstance: proc(mode: u32, count: i32, type_: u32, indices: rawptr, instancecount: i32, basevertex: i32, baseinstance: u32) #cc_c;
GetInternalformativ:                         proc(target: u32, internalformat: u32, pname: u32, bufSize: i32, params: ^i32)                                   #cc_c;
GetActiveAtomicCounterBufferiv:              proc(program: u32, bufferIndex: u32, pname: u32, params: ^i32)                                                   #cc_c;
BindImageTexture:                            proc(unit: u32, texture: u32, level: i32, layered: u8, layer: i32, access: u32, format: u32)                     #cc_c;
MemoryBarrier:                               proc(barriers: u32)                                                                                              #cc_c;
TexStorage1D:                                proc(target: u32, levels: i32, internalformat: u32, width: i32)                                                  #cc_c;
TexStorage2D:                                proc(target: u32, levels: i32, internalformat: u32, width: i32, height: i32)                                     #cc_c;
TexStorage3D:                                proc(target: u32, levels: i32, internalformat: u32, width: i32, height: i32, depth: i32)                         #cc_c;
DrawTransformFeedbackInstanced:              proc(mode: u32, id: u32, instancecount: i32)                                                                     #cc_c;
DrawTransformFeedbackStreamInstanced:        proc(mode: u32, id: u32, stream: u32, instancecount: i32)                                                        #cc_c;

load_4_2 :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    set_proc_address(&DrawArraysInstancedBaseInstance,             "glDrawArraysInstancedBaseInstance\x00");
    set_proc_address(&DrawElementsInstancedBaseInstance,           "glDrawElementsInstancedBaseInstance\x00");
    set_proc_address(&DrawElementsInstancedBaseVertexBaseInstance, "glDrawElementsInstancedBaseVertexBaseInstance\x00");
    set_proc_address(&GetInternalformativ,                         "glGetInternalformativ\x00");
    set_proc_address(&GetActiveAtomicCounterBufferiv,              "glGetActiveAtomicCounterBufferiv\x00");
    set_proc_address(&BindImageTexture,                            "glBindImageTexture\x00");
    set_proc_address(&MemoryBarrier,                               "glMemoryBarrier\x00");
    set_proc_address(&TexStorage1D,                                "glTexStorage1D\x00");
    set_proc_address(&TexStorage2D,                                "glTexStorage2D\x00");
    set_proc_address(&TexStorage3D,                                "glTexStorage3D\x00");
    set_proc_address(&DrawTransformFeedbackInstanced,              "glDrawTransformFeedbackInstanced\x00");
    set_proc_address(&DrawTransformFeedbackStreamInstanced,        "glDrawTransformFeedbackStreamInstanced\x00");
}

// VERSION_4_3
ClearBufferData:                 proc(target: u32, internalformat: u32, format: u32, type_: u32, data: rawptr)                                                                                                                                  #cc_c;
ClearBufferSubData:              proc(target: u32, internalformat: u32, offset: int, size: int, format: u32, type_: u32, data: rawptr)                                                                                                          #cc_c;
DispatchCompute:                 proc(num_groups_x: u32, num_groups_y: u32, num_groups_z: u32)                                                                                                                                                  #cc_c;
DispatchComputeIndirect:         proc(indirect: int)                                                                                                                                                                                            #cc_c;
CopyImageSubData:                proc(srcName: u32, srcTarget: u32, srcLevel: i32, srcX: i32, srcY: i32, srcZ: i32, dstName: u32, dstTarget: u32, dstLevel: i32, dstX: i32, dstY: i32, dstZ: i32, srcWidth: i32, srcHeight: i32, srcDepth: i32) #cc_c;
FramebufferParameteri:           proc(target: u32, pname: u32, param: i32)                                                                                                                                                                      #cc_c;
GetFramebufferParameteriv:       proc(target: u32, pname: u32, params: ^i32)                                                                                                                                                                    #cc_c;
GetInternalformati64v:           proc(target: u32, internalformat: u32, pname: u32, bufSize: i32, params: ^i64)                                                                                                                                 #cc_c;
InvalidateTexSubImage:           proc(texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32)                                                                                                  #cc_c;
InvalidateTexImage:              proc(texture: u32, level: i32)                                                                                                                                                                                 #cc_c;
InvalidateBufferSubData:         proc(buffer: u32, offset: int, length: int)                                                                                                                                                                    #cc_c;
InvalidateBufferData:            proc(buffer: u32)                                                                                                                                                                                              #cc_c;
InvalidateFramebuffer:           proc(target: u32, numAttachments: i32, attachments: ^u32)                                                                                                                                                      #cc_c;
InvalidateSubFramebuffer:        proc(target: u32, numAttachments: i32, attachments: ^u32, x: i32, y: i32, width: i32, height: i32)                                                                                                             #cc_c;
MultiDrawArraysIndirect:         proc(mode: u32, indirect: rawptr, drawcount: i32, stride: i32)                                                                                                                                                 #cc_c;
MultiDrawElementsIndirect:       proc(mode: u32, type_: u32, indirect: rawptr, drawcount: i32, stride: i32)                                                                                                                                     #cc_c;
GetProgramInterfaceiv:           proc(program: u32, programInterface: u32, pname: u32, params: ^i32)                                                                                                                                            #cc_c;
GetProgramResourceIndex:         proc(program: u32, programInterface: u32, name: ^u8) -> u32                                                                                                                                                    #cc_c;
GetProgramResourceName:          proc(program: u32, programInterface: u32, index: u32, bufSize: i32, length: ^i32, name: ^u8)                                                                                                                   #cc_c;
GetProgramResourceiv:            proc(program: u32, programInterface: u32, index: u32, propCount: i32, props: ^u32, bufSize: i32, length: ^i32, params: ^i32)                                                                                   #cc_c;
GetProgramResourceLocation:      proc(program: u32, programInterface: u32, name: ^u8) -> i32                                                                                                                                                    #cc_c;
GetProgramResourceLocationIndex: proc(program: u32, programInterface: u32, name: ^u8) -> i32                                                                                                                                                    #cc_c;
ShaderStorageBlockBinding:       proc(program: u32, storageBlockIndex: u32, storageBlockBinding: u32)                                                                                                                                           #cc_c;
TexBufferRange:                  proc(target: u32, internalformat: u32, buffer: u32, offset: int, size: int)                                                                                                                                    #cc_c;
TexStorage2DMultisample:         proc(target: u32, samples: i32, internalformat: u32, width: i32, height: i32, fixedsamplelocations: u8)                                                                                                        #cc_c;
TexStorage3DMultisample:         proc(target: u32, samples: i32, internalformat: u32, width: i32, height: i32, depth: i32, fixedsamplelocations: u8)                                                                                            #cc_c;
TextureView:                     proc(texture: u32, target: u32, origtexture: u32, internalformat: u32, minlevel: u32, numlevels: u32, minlayer: u32, numlayers: u32)                                                                           #cc_c;
BindVertexBuffer:                proc(bindingindex: u32, buffer: u32, offset: int, stride: i32)                                                                                                                                                 #cc_c;
VertexAttribFormat:              proc(attribindex: u32, size: i32, type_: u32, normalized: u8, relativeoffset: u32)                                                                                                                             #cc_c;
VertexAttribIFormat:             proc(attribindex: u32, size: i32, type_: u32, relativeoffset: u32)                                                                                                                                             #cc_c;
VertexAttribLFormat:             proc(attribindex: u32, size: i32, type_: u32, relativeoffset: u32)                                                                                                                                             #cc_c;
VertexAttribBinding:             proc(attribindex: u32, bindingindex: u32)                                                                                                                                                                      #cc_c;
VertexBindingDivisor:            proc(bindingindex: u32, divisor: u32)                                                                                                                                                                          #cc_c;
DebugMessageControl:             proc(source: u32, type_: u32, severity: u32, count: i32, ids: ^u32, enabled: u8)                                                                                                                               #cc_c;
DebugMessageInsert:              proc(source: u32, type_: u32, id: u32, severity: u32, length: i32, buf: ^u8)                                                                                                                                   #cc_c;
DebugMessageCallback:            proc(callback: debug_proc_t, userParam: rawptr)                                                                                                                                                                #cc_c;
GetDebugMessageLog:              proc(count: u32, bufSize: i32, sources: ^u32, types: ^u32, ids: ^u32, severities: ^u32, lengths: ^i32, messageLog: ^u8) -> u32                                                                                 #cc_c;
PushDebugGroup:                  proc(source: u32, id: u32, length: i32, message: ^u8)                                                                                                                                                          #cc_c;
PopDebugGroup:                   proc()                                                                                                                                                                                                         #cc_c;
ObjectLabel:                     proc(identifier: u32, name: u32, length: i32, label: ^u8)                                                                                                                                                      #cc_c;
GetObjectLabel:                  proc(identifier: u32, name: u32, bufSize: i32, length: ^i32, label: ^u8)                                                                                                                                       #cc_c;
ObjectPtrLabel:                  proc(ptr: rawptr, length: i32, label: ^u8)                                                                                                                                                                     #cc_c;
GetObjectPtrLabel:               proc(ptr: rawptr, bufSize: i32, length: ^i32, label: ^u8)                                                                                                                                                      #cc_c;

load_4_3 :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    set_proc_address(&ClearBufferData,                 "glClearBufferData\x00");
    set_proc_address(&ClearBufferSubData,              "glClearBufferSubData\x00");
    set_proc_address(&DispatchCompute,                 "glDispatchCompute\x00");
    set_proc_address(&DispatchComputeIndirect,         "glDispatchComputeIndirect\x00");
    set_proc_address(&CopyImageSubData,                "glCopyImageSubData\x00");
    set_proc_address(&FramebufferParameteri,           "glFramebufferParameteri\x00");
    set_proc_address(&GetFramebufferParameteriv,       "glGetFramebufferParameteriv\x00");
    set_proc_address(&GetInternalformati64v,           "glGetInternalformati64v\x00");
    set_proc_address(&InvalidateTexSubImage,           "glInvalidateTexSubImage\x00");
    set_proc_address(&InvalidateTexImage,              "glInvalidateTexImage\x00");
    set_proc_address(&InvalidateBufferSubData,         "glInvalidateBufferSubData\x00");
    set_proc_address(&InvalidateBufferData,            "glInvalidateBufferData\x00");
    set_proc_address(&InvalidateFramebuffer,           "glInvalidateFramebuffer\x00");
    set_proc_address(&InvalidateSubFramebuffer,        "glInvalidateSubFramebuffer\x00");
    set_proc_address(&MultiDrawArraysIndirect,         "glMultiDrawArraysIndirect\x00");
    set_proc_address(&MultiDrawElementsIndirect,       "glMultiDrawElementsIndirect\x00");
    set_proc_address(&GetProgramInterfaceiv,           "glGetProgramInterfaceiv\x00");
    set_proc_address(&GetProgramResourceIndex,         "glGetProgramResourceIndex\x00");
    set_proc_address(&GetProgramResourceName,          "glGetProgramResourceName\x00");
    set_proc_address(&GetProgramResourceiv,            "glGetProgramResourceiv\x00");
    set_proc_address(&GetProgramResourceLocation,      "glGetProgramResourceLocation\x00");
    set_proc_address(&GetProgramResourceLocationIndex, "glGetProgramResourceLocationIndex\x00");
    set_proc_address(&ShaderStorageBlockBinding,       "glShaderStorageBlockBinding\x00");
    set_proc_address(&TexBufferRange,                  "glTexBufferRange\x00");
    set_proc_address(&TexStorage2DMultisample,         "glTexStorage2DMultisample\x00");
    set_proc_address(&TexStorage3DMultisample,         "glTexStorage3DMultisample\x00");
    set_proc_address(&TextureView,                     "glTextureView\x00");
    set_proc_address(&BindVertexBuffer,                "glBindVertexBuffer\x00");
    set_proc_address(&VertexAttribFormat,              "glVertexAttribFormat\x00");
    set_proc_address(&VertexAttribIFormat,             "glVertexAttribIFormat\x00");
    set_proc_address(&VertexAttribLFormat,             "glVertexAttribLFormat\x00");
    set_proc_address(&VertexAttribBinding,             "glVertexAttribBinding\x00");
    set_proc_address(&VertexBindingDivisor,            "glVertexBindingDivisor\x00");
    set_proc_address(&DebugMessageControl,             "glDebugMessageControl\x00");
    set_proc_address(&DebugMessageInsert,              "glDebugMessageInsert\x00");
    set_proc_address(&DebugMessageCallback,            "glDebugMessageCallback\x00");
    set_proc_address(&GetDebugMessageLog,              "glGetDebugMessageLog\x00");
    set_proc_address(&PushDebugGroup,                  "glPushDebugGroup\x00");
    set_proc_address(&PopDebugGroup,                   "glPopDebugGroup\x00");
    set_proc_address(&ObjectLabel,                     "glObjectLabel\x00");
    set_proc_address(&GetObjectLabel,                  "glGetObjectLabel\x00");
    set_proc_address(&ObjectPtrLabel,                  "glObjectPtrLabel\x00");
    set_proc_address(&GetObjectPtrLabel,               "glGetObjectPtrLabel\x00");
}

// VERSION_4_4
BufferStorage:     proc(target: u32, size: int, data: rawptr, flags: u32)                                                                                               #cc_c;
ClearTexImage:     proc(texture: u32, level: i32, format: u32, type_: u32, data: rawptr)                                                                                #cc_c;
ClearTexSubImage:  proc(texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, format: u32, type_: u32, data: rawptr) #cc_c;
BindBuffersBase:   proc(target: u32, first: u32, count: i32, buffers: ^u32)                                                                                             #cc_c;
BindBuffersRange:  proc(target: u32, first: u32, count: i32, buffers: ^u32, offsets: ^int, sizes: ^int)                                                                 #cc_c;
BindTextures:      proc(first: u32, count: i32, textures: ^u32)                                                                                                         #cc_c;
BindSamplers:      proc(first: u32, count: i32, samplers: ^u32)                                                                                                         #cc_c;
BindImageTextures: proc(first: u32, count: i32, textures: ^u32)                                                                                                         #cc_c;
BindVertexBuffers: proc(first: u32, count: i32, buffers: ^u32, offsets: ^int, strides: ^i32)                                                                            #cc_c;

load_4_4 :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    set_proc_address(&BufferStorage,     "glBufferStorage\x00");
    set_proc_address(&ClearTexImage,     "glClearTexImage\x00");
    set_proc_address(&ClearTexSubImage,  "glClearTexSubImage\x00");
    set_proc_address(&BindBuffersBase,   "glBindBuffersBase\x00");
    set_proc_address(&BindBuffersRange,  "glBindBuffersRange\x00");
    set_proc_address(&BindTextures,      "glBindTextures\x00");
    set_proc_address(&BindSamplers,      "glBindSamplers\x00");
    set_proc_address(&BindImageTextures, "glBindImageTextures\x00");
    set_proc_address(&BindVertexBuffers, "glBindVertexBuffers\x00");
}

// VERSION_4_5
ClipControl:                              proc(origin: u32, depth: u32)                                                                                                                                            #cc_c;
CreateTransformFeedbacks:                 proc(n: i32, ids: ^u32)                                                                                                                                                  #cc_c;
TransformFeedbackBufferBase:              proc(xfb: u32, index: u32, buffer: u32)                                                                                                                                  #cc_c;
TransformFeedbackBufferRange:             proc(xfb: u32, index: u32, buffer: u32, offset: int, size: int)                                                                                                          #cc_c;
GetTransformFeedbackiv:                   proc(xfb: u32, pname: u32, param: ^i32)                                                                                                                                  #cc_c;
GetTransformFeedbacki_v:                  proc(xfb: u32, pname: u32, index: u32, param: ^i32)                                                                                                                      #cc_c;
GetTransformFeedbacki64_v:                proc(xfb: u32, pname: u32, index: u32, param: ^i64)                                                                                                                      #cc_c;
CreateBuffers:                            proc(n: i32, buffers: ^u32)                                                                                                                                              #cc_c;
NamedBufferStorage:                       proc(buffer: u32, size: int, data: rawptr, flags: u32)                                                                                                                   #cc_c;
NamedBufferData:                          proc(buffer: u32, size: int, data: rawptr, usage: u32)                                                                                                                   #cc_c;
NamedBufferSubData:                       proc(buffer: u32, offset: int, size: int, data: rawptr)                                                                                                                  #cc_c;
CopyNamedBufferSubData:                   proc(readBuffer: u32, writeBuffer: u32, readOffset: int, writeOffset: int, size: int)                                                                                    #cc_c;
ClearNamedBufferData:                     proc(buffer: u32, internalformat: u32, format: u32, type_: u32, data: rawptr)                                                                                            #cc_c;
ClearNamedBufferSubData:                  proc(buffer: u32, internalformat: u32, offset: int, size: int, format: u32, type_: u32, data: rawptr)                                                                    #cc_c;
MapNamedBuffer:                           proc(buffer: u32, access: u32) -> rawptr                                                                                                                                 #cc_c;
MapNamedBufferRange:                      proc(buffer: u32, offset: int, length: int, access: u32) -> rawptr                                                                                                       #cc_c;
UnmapNamedBuffer:                         proc(buffer: u32) -> u8                                                                                                                                                  #cc_c;
FlushMappedNamedBufferRange:              proc(buffer: u32, offset: int, length: int)                                                                                                                              #cc_c;
GetNamedBufferParameteriv:                proc(buffer: u32, pname: u32, params: ^i32)                                                                                                                              #cc_c;
GetNamedBufferParameteri64v:              proc(buffer: u32, pname: u32, params: ^i64)                                                                                                                              #cc_c;
GetNamedBufferPointerv:                   proc(buffer: u32, pname: u32, params: ^rawptr)                                                                                                                           #cc_c;
GetNamedBufferSubData:                    proc(buffer: u32, offset: int, size: int, data: rawptr)                                                                                                                  #cc_c;
CreateFramebuffers:                       proc(n: i32, framebuffers: ^u32)                                                                                                                                         #cc_c;
NamedFramebufferRenderbuffer:             proc(framebuffer: u32, attachment: u32, renderbuffertarget: u32, renderbuffer: u32)                                                                                      #cc_c;
NamedFramebufferParameteri:               proc(framebuffer: u32, pname: u32, param: i32)                                                                                                                           #cc_c;
NamedFramebufferTexture:                  proc(framebuffer: u32, attachment: u32, texture: u32, level: i32)                                                                                                        #cc_c;
NamedFramebufferTextureLayer:             proc(framebuffer: u32, attachment: u32, texture: u32, level: i32, layer: i32)                                                                                            #cc_c;
NamedFramebufferDrawBuffer:               proc(framebuffer: u32, buf: u32)                                                                                                                                         #cc_c;
NamedFramebufferDrawBuffers:              proc(framebuffer: u32, n: i32, bufs: ^u32)                                                                                                                               #cc_c;
NamedFramebufferReadBuffer:               proc(framebuffer: u32, src: u32)                                                                                                                                         #cc_c;
InvalidateNamedFramebufferData:           proc(framebuffer: u32, numAttachments: i32, attachments: ^u32)                                                                                                           #cc_c;
InvalidateNamedFramebufferSubData:        proc(framebuffer: u32, numAttachments: i32, attachments: ^u32, x: i32, y: i32, width: i32, height: i32)                                                                  #cc_c;
ClearNamedFramebufferiv:                  proc(framebuffer: u32, buffer: u32, drawbuffer: i32, value: ^i32)                                                                                                        #cc_c;
ClearNamedFramebufferuiv:                 proc(framebuffer: u32, buffer: u32, drawbuffer: i32, value: ^u32)                                                                                                        #cc_c;
ClearNamedFramebufferfv:                  proc(framebuffer: u32, buffer: u32, drawbuffer: i32, value: ^f32)                                                                                                        #cc_c;
ClearNamedFramebufferfi:                  proc(framebuffer: u32, buffer: u32, drawbuffer: i32, depth: f32, stencil: i32)                                                                                           #cc_c;
BlitNamedFramebuffer:                     proc(readFramebuffer: u32, drawFramebuffer: u32, srcX0: i32, srcY0: i32, srcX1: i32, srcY1: i32, dstX0: i32, dstY0: i32, dstX1: i32, dstY1: i32, mask: u32, filter: u32) #cc_c;
CheckNamedFramebufferStatus:              proc(framebuffer: u32, target: u32) -> u32                                                                                                                               #cc_c;
GetNamedFramebufferParameteriv:           proc(framebuffer: u32, pname: u32, param: ^i32)                                                                                                                          #cc_c;
GetNamedFramebufferAttachmentParameteriv: proc(framebuffer: u32, attachment: u32, pname: u32, params: ^i32)                                                                                                        #cc_c;
CreateRenderbuffers:                      proc(n: i32, renderbuffers: ^u32)                                                                                                                                        #cc_c;
NamedRenderbufferStorage:                 proc(renderbuffer: u32, internalformat: u32, width: i32, height: i32)                                                                                                    #cc_c;
NamedRenderbufferStorageMultisample:      proc(renderbuffer: u32, samples: i32, internalformat: u32, width: i32, height: i32)                                                                                      #cc_c;
GetNamedRenderbufferParameteriv:          proc(renderbuffer: u32, pname: u32, params: ^i32)                                                                                                                        #cc_c;
CreateTextures:                           proc(target: u32, n: i32, textures: ^u32)                                                                                                                                #cc_c;
TextureBuffer:                            proc(texture: u32, internalformat: u32, buffer: u32)                                                                                                                     #cc_c;
TextureBufferRange:                       proc(texture: u32, internalformat: u32, buffer: u32, offset: int, size: int)                                                                                             #cc_c;
TextureStorage1D:                         proc(texture: u32, levels: i32, internalformat: u32, width: i32)                                                                                                         #cc_c;
TextureStorage2D:                         proc(texture: u32, levels: i32, internalformat: u32, width: i32, height: i32)                                                                                            #cc_c;
TextureStorage3D:                         proc(texture: u32, levels: i32, internalformat: u32, width: i32, height: i32, depth: i32)                                                                                #cc_c;
TextureStorage2DMultisample:              proc(texture: u32, samples: i32, internalformat: u32, width: i32, height: i32, fixedsamplelocations: u8)                                                                 #cc_c;
TextureStorage3DMultisample:              proc(texture: u32, samples: i32, internalformat: u32, width: i32, height: i32, depth: i32, fixedsamplelocations: u8)                                                     #cc_c;
TextureSubImage1D:                        proc(texture: u32, level: i32, xoffset: i32, width: i32, format: u32, type_: u32, pixels: rawptr)                                                                        #cc_c;
TextureSubImage2D:                        proc(texture: u32, level: i32, xoffset: i32, yoffset: i32, width: i32, height: i32, format: u32, type_: u32, pixels: rawptr)                                             #cc_c;
TextureSubImage3D:                        proc(texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, format: u32, type_: u32, pixels: rawptr)                   #cc_c;
CompressedTextureSubImage1D:              proc(texture: u32, level: i32, xoffset: i32, width: i32, format: u32, imageSize: i32, data: rawptr)                                                                      #cc_c;
CompressedTextureSubImage2D:              proc(texture: u32, level: i32, xoffset: i32, yoffset: i32, width: i32, height: i32, format: u32, imageSize: i32, data: rawptr)                                           #cc_c;
CompressedTextureSubImage3D:              proc(texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, format: u32, imageSize: i32, data: rawptr)                 #cc_c;
CopyTextureSubImage1D:                    proc(texture: u32, level: i32, xoffset: i32, x: i32, y: i32, width: i32)                                                                                                 #cc_c;
CopyTextureSubImage2D:                    proc(texture: u32, level: i32, xoffset: i32, yoffset: i32, x: i32, y: i32, width: i32, height: i32)                                                                      #cc_c;
CopyTextureSubImage3D:                    proc(texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, x: i32, y: i32, width: i32, height: i32)                                                        #cc_c;
TextureParameterf:                        proc(texture: u32, pname: u32, param: f32)                                                                                                                               #cc_c;
TextureParameterfv:                       proc(texture: u32, pname: u32, param: ^f32)                                                                                                                              #cc_c;
TextureParameteri:                        proc(texture: u32, pname: u32, param: i32)                                                                                                                               #cc_c;
TextureParameterIiv:                      proc(texture: u32, pname: u32, params: ^i32)                                                                                                                             #cc_c;
TextureParameterIuiv:                     proc(texture: u32, pname: u32, params: ^u32)                                                                                                                             #cc_c;
TextureParameteriv:                       proc(texture: u32, pname: u32, param: ^i32)                                                                                                                              #cc_c;
GenerateTextureMipmap:                    proc(texture: u32)                                                                                                                                                       #cc_c;
BindTextureUnit:                          proc(unit: u32, texture: u32)                                                                                                                                            #cc_c;
GetTextureImage:                          proc(texture: u32, level: i32, format: u32, type_: u32, bufSize: i32, pixels: rawptr)                                                                                    #cc_c;
GetCompressedTextureImage:                proc(texture: u32, level: i32, bufSize: i32, pixels: rawptr)                                                                                                             #cc_c;
GetTextureLevelParameterfv:               proc(texture: u32, level: i32, pname: u32, params: ^f32)                                                                                                                 #cc_c;
GetTextureLevelParameteriv:               proc(texture: u32, level: i32, pname: u32, params: ^i32)                                                                                                                 #cc_c;
GetTextureParameterfv:                    proc(texture: u32, pname: u32, params: ^f32)                                                                                                                             #cc_c;
GetTextureParameterIiv:                   proc(texture: u32, pname: u32, params: ^i32)                                                                                                                             #cc_c;
GetTextureParameterIuiv:                  proc(texture: u32, pname: u32, params: ^u32)                                                                                                                             #cc_c;
GetTextureParameteriv:                    proc(texture: u32, pname: u32, params: ^i32)                                                                                                                             #cc_c;
CreateVertexArrays:                       proc(n: i32, arrays: ^u32)                                                                                                                                               #cc_c;
DisableVertexArrayAttrib:                 proc(vaobj: u32, index: u32)                                                                                                                                             #cc_c;
EnableVertexArrayAttrib:                  proc(vaobj: u32, index: u32)                                                                                                                                             #cc_c;
VertexArrayElementBuffer:                 proc(vaobj: u32, buffer: u32)                                                                                                                                            #cc_c;
VertexArrayVertexBuffer:                  proc(vaobj: u32, bindingindex: u32, buffer: u32, offset: int, stride: i32)                                                                                               #cc_c;
VertexArrayVertexBuffers:                 proc(vaobj: u32, first: u32, count: i32, buffers: ^u32, offsets: ^int, strides: ^i32)                                                                                    #cc_c;
VertexArrayAttribBinding:                 proc(vaobj: u32, attribindex: u32, bindingindex: u32)                                                                                                                    #cc_c;
VertexArrayAttribFormat:                  proc(vaobj: u32, attribindex: u32, size: i32, type_: u32, normalized: u8, relativeoffset: u32)                                                                           #cc_c;
VertexArrayAttribIFormat:                 proc(vaobj: u32, attribindex: u32, size: i32, type_: u32, relativeoffset: u32)                                                                                           #cc_c;
VertexArrayAttribLFormat:                 proc(vaobj: u32, attribindex: u32, size: i32, type_: u32, relativeoffset: u32)                                                                                           #cc_c;
VertexArrayBindingDivisor:                proc(vaobj: u32, bindingindex: u32, divisor: u32)                                                                                                                        #cc_c;
GetVertexArrayiv:                         proc(vaobj: u32, pname: u32, param: ^i32)                                                                                                                                #cc_c;
GetVertexArrayIndexediv:                  proc(vaobj: u32, index: u32, pname: u32, param: ^i32)                                                                                                                    #cc_c;
GetVertexArrayIndexed64iv:                proc(vaobj: u32, index: u32, pname: u32, param: ^i64)                                                                                                                    #cc_c;
CreateSamplers:                           proc(n: i32, samplers: ^u32)                                                                                                                                             #cc_c;
CreateProgramPipelines:                   proc(n: i32, pipelines: ^u32)                                                                                                                                            #cc_c;
CreateQueries:                            proc(target: u32, n: i32, ids: ^u32)                                                                                                                                     #cc_c;
GetQueryBufferObjecti64v:                 proc(id: u32, buffer: u32, pname: u32, offset: int)                                                                                                                      #cc_c;
GetQueryBufferObjectiv:                   proc(id: u32, buffer: u32, pname: u32, offset: int)                                                                                                                      #cc_c;
GetQueryBufferObjectui64v:                proc(id: u32, buffer: u32, pname: u32, offset: int)                                                                                                                      #cc_c;
GetQueryBufferObjectuiv:                  proc(id: u32, buffer: u32, pname: u32, offset: int)                                                                                                                      #cc_c;
MemoryBarrierByRegion:                    proc(barriers: u32)                                                                                                                                                      #cc_c;
GetTextureSubImage:                       proc(texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, format: u32, type_: u32, bufSize: i32, pixels: rawptr)     #cc_c;
GetCompressedTextureSubImage:             proc(texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, bufSize: i32, pixels: rawptr)                              #cc_c;
GetGraphicsResetStatus:                   proc() -> u32                                                                                                                                                            #cc_c;
GetnCompressedTexImage:                   proc(target: u32, lod: i32, bufSize: i32, pixels: rawptr)                                                                                                                #cc_c;
GetnTexImage:                             proc(target: u32, level: i32, format: u32, type_: u32, bufSize: i32, pixels: rawptr)                                                                                     #cc_c;
GetnUniformdv:                            proc(program: u32, location: i32, bufSize: i32, params: ^f64)                                                                                                            #cc_c;
GetnUniformfv:                            proc(program: u32, location: i32, bufSize: i32, params: ^f32)                                                                                                            #cc_c;
GetnUniformiv:                            proc(program: u32, location: i32, bufSize: i32, params: ^i32)                                                                                                            #cc_c;
GetnUniformuiv:                           proc(program: u32, location: i32, bufSize: i32, params: ^u32)                                                                                                            #cc_c;
ReadnPixels:                              proc(x: i32, y: i32, width: i32, height: i32, format: u32, type_: u32, bufSize: i32, data: rawptr)                                                                       #cc_c;
GetnMapdv:                                proc(target: u32, query: u32, bufSize: i32, v: ^f64)                                                                                                                     #cc_c;
GetnMapfv:                                proc(target: u32, query: u32, bufSize: i32, v: ^f32)                                                                                                                     #cc_c;
GetnMapiv:                                proc(target: u32, query: u32, bufSize: i32, v: ^i32)                                                                                                                     #cc_c;
GetnPixelMapusv:                          proc(map_: u32, bufSize: i32, values: ^u16)                                                                                                                              #cc_c;
GetnPixelMapfv:                           proc(map_: u32, bufSize: i32, values: ^f32)                                                                                                                              #cc_c;
GetnPixelMapuiv:                          proc(map_: u32, bufSize: i32, values: ^u32)                                                                                                                              #cc_c;
GetnPolygonStipple:                       proc(bufSize: i32, pattern: ^u8)                                                                                                                                         #cc_c;
GetnColorTable:                           proc(target: u32, format: u32, type_: u32, bufSize: i32, table: rawptr)                                                                                                  #cc_c;
GetnConvolutionFilter:                    proc(target: u32, format: u32, type_: u32, bufSize: i32, image: rawptr)                                                                                                  #cc_c;
GetnSeparableFilter:                      proc(target: u32, format: u32, type_: u32, rowBufSize: i32, row: rawptr, columnBufSize: i32, column: rawptr, span: rawptr)                                               #cc_c;
GetnHistogram:                            proc(target: u32, reset: u8, format: u32, type_: u32, bufSize: i32, values: rawptr)                                                                                      #cc_c;
GetnMinmax:                               proc(target: u32, reset: u8, format: u32, type_: u32, bufSize: i32, values: rawptr)                                                                                      #cc_c;
TextureBarrier:                           proc()                                                                                                                                                                   #cc_c;

load_4_5 :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    set_proc_address(&ClipControl,                              "glClipControl\x00");
    set_proc_address(&CreateTransformFeedbacks,                 "glCreateTransformFeedbacks\x00");
    set_proc_address(&TransformFeedbackBufferBase,              "glTransformFeedbackBufferBase\x00");
    set_proc_address(&TransformFeedbackBufferRange,             "glTransformFeedbackBufferRange\x00");
    set_proc_address(&GetTransformFeedbackiv,                   "glGetTransformFeedbackiv\x00");
    set_proc_address(&GetTransformFeedbacki_v,                  "glGetTransformFeedbacki_v\x00");
    set_proc_address(&GetTransformFeedbacki64_v,                "glGetTransformFeedbacki64_v\x00");
    set_proc_address(&CreateBuffers,                            "glCreateBuffers\x00");
    set_proc_address(&NamedBufferStorage,                       "glNamedBufferStorage\x00");
    set_proc_address(&NamedBufferData,                          "glNamedBufferData\x00");
    set_proc_address(&NamedBufferSubData,                       "glNamedBufferSubData\x00");
    set_proc_address(&CopyNamedBufferSubData,                   "glCopyNamedBufferSubData\x00");
    set_proc_address(&ClearNamedBufferData,                     "glClearNamedBufferData\x00");
    set_proc_address(&ClearNamedBufferSubData,                  "glClearNamedBufferSubData\x00");
    set_proc_address(&MapNamedBuffer,                           "glMapNamedBuffer\x00");
    set_proc_address(&MapNamedBufferRange,                      "glMapNamedBufferRange\x00");
    set_proc_address(&UnmapNamedBuffer,                         "glUnmapNamedBuffer\x00");
    set_proc_address(&FlushMappedNamedBufferRange,              "glFlushMappedNamedBufferRange\x00");
    set_proc_address(&GetNamedBufferParameteriv,                "glGetNamedBufferParameteriv\x00");
    set_proc_address(&GetNamedBufferParameteri64v,              "glGetNamedBufferParameteri64v\x00");
    set_proc_address(&GetNamedBufferPointerv,                   "glGetNamedBufferPointerv\x00");
    set_proc_address(&GetNamedBufferSubData,                    "glGetNamedBufferSubData\x00");
    set_proc_address(&CreateFramebuffers,                       "glCreateFramebuffers\x00");
    set_proc_address(&NamedFramebufferRenderbuffer,             "glNamedFramebufferRenderbuffer\x00");
    set_proc_address(&NamedFramebufferParameteri,               "glNamedFramebufferParameteri\x00");
    set_proc_address(&NamedFramebufferTexture,                  "glNamedFramebufferTexture\x00");
    set_proc_address(&NamedFramebufferTextureLayer,             "glNamedFramebufferTextureLayer\x00");
    set_proc_address(&NamedFramebufferDrawBuffer,               "glNamedFramebufferDrawBuffer\x00");
    set_proc_address(&NamedFramebufferDrawBuffers,              "glNamedFramebufferDrawBuffers\x00");
    set_proc_address(&NamedFramebufferReadBuffer,               "glNamedFramebufferReadBuffer\x00");
    set_proc_address(&InvalidateNamedFramebufferData,           "glInvalidateNamedFramebufferData\x00");
    set_proc_address(&InvalidateNamedFramebufferSubData,        "glInvalidateNamedFramebufferSubData\x00");
    set_proc_address(&ClearNamedFramebufferiv,                  "glClearNamedFramebufferiv\x00");
    set_proc_address(&ClearNamedFramebufferuiv,                 "glClearNamedFramebufferuiv\x00");
    set_proc_address(&ClearNamedFramebufferfv,                  "glClearNamedFramebufferfv\x00");
    set_proc_address(&ClearNamedFramebufferfi,                  "glClearNamedFramebufferfi\x00");
    set_proc_address(&BlitNamedFramebuffer,                     "glBlitNamedFramebuffer\x00");
    set_proc_address(&CheckNamedFramebufferStatus,              "glCheckNamedFramebufferStatus\x00");
    set_proc_address(&GetNamedFramebufferParameteriv,           "glGetNamedFramebufferParameteriv\x00");
    set_proc_address(&GetNamedFramebufferAttachmentParameteriv, "glGetNamedFramebufferAttachmentParameteriv\x00");
    set_proc_address(&CreateRenderbuffers,                      "glCreateRenderbuffers\x00");
    set_proc_address(&NamedRenderbufferStorage,                 "glNamedRenderbufferStorage\x00");
    set_proc_address(&NamedRenderbufferStorageMultisample,      "glNamedRenderbufferStorageMultisample\x00");
    set_proc_address(&GetNamedRenderbufferParameteriv,          "glGetNamedRenderbufferParameteriv\x00");
    set_proc_address(&CreateTextures,                           "glCreateTextures\x00");
    set_proc_address(&TextureBuffer,                            "glTextureBuffer\x00");
    set_proc_address(&TextureBufferRange,                       "glTextureBufferRange\x00");
    set_proc_address(&TextureStorage1D,                         "glTextureStorage1D\x00");
    set_proc_address(&TextureStorage2D,                         "glTextureStorage2D\x00");
    set_proc_address(&TextureStorage3D,                         "glTextureStorage3D\x00");
    set_proc_address(&TextureStorage2DMultisample,              "glTextureStorage2DMultisample\x00");
    set_proc_address(&TextureStorage3DMultisample,              "glTextureStorage3DMultisample\x00");
    set_proc_address(&TextureSubImage1D,                        "glTextureSubImage1D\x00");
    set_proc_address(&TextureSubImage2D,                        "glTextureSubImage2D\x00");
    set_proc_address(&TextureSubImage3D,                        "glTextureSubImage3D\x00");
    set_proc_address(&CompressedTextureSubImage1D,              "glCompressedTextureSubImage1D\x00");
    set_proc_address(&CompressedTextureSubImage2D,              "glCompressedTextureSubImage2D\x00");
    set_proc_address(&CompressedTextureSubImage3D,              "glCompressedTextureSubImage3D\x00");
    set_proc_address(&CopyTextureSubImage1D,                    "glCopyTextureSubImage1D\x00");
    set_proc_address(&CopyTextureSubImage2D,                    "glCopyTextureSubImage2D\x00");
    set_proc_address(&CopyTextureSubImage3D,                    "glCopyTextureSubImage3D\x00");
    set_proc_address(&TextureParameterf,                        "glTextureParameterf\x00");
    set_proc_address(&TextureParameterfv,                       "glTextureParameterfv\x00");
    set_proc_address(&TextureParameteri,                        "glTextureParameteri\x00");
    set_proc_address(&TextureParameterIiv,                      "glTextureParameterIiv\x00");
    set_proc_address(&TextureParameterIuiv,                     "glTextureParameterIuiv\x00");
    set_proc_address(&TextureParameteriv,                       "glTextureParameteriv\x00");
    set_proc_address(&GenerateTextureMipmap,                    "glGenerateTextureMipmap\x00");
    set_proc_address(&BindTextureUnit,                          "glBindTextureUnit\x00");
    set_proc_address(&GetTextureImage,                          "glGetTextureImage\x00");
    set_proc_address(&GetCompressedTextureImage,                "glGetCompressedTextureImage\x00");
    set_proc_address(&GetTextureLevelParameterfv,               "glGetTextureLevelParameterfv\x00");
    set_proc_address(&GetTextureLevelParameteriv,               "glGetTextureLevelParameteriv\x00");
    set_proc_address(&GetTextureParameterfv,                    "glGetTextureParameterfv\x00");
    set_proc_address(&GetTextureParameterIiv,                   "glGetTextureParameterIiv\x00");
    set_proc_address(&GetTextureParameterIuiv,                  "glGetTextureParameterIuiv\x00");
    set_proc_address(&GetTextureParameteriv,                    "glGetTextureParameteriv\x00");
    set_proc_address(&CreateVertexArrays,                       "glCreateVertexArrays\x00");
    set_proc_address(&DisableVertexArrayAttrib,                 "glDisableVertexArrayAttrib\x00");
    set_proc_address(&EnableVertexArrayAttrib,                  "glEnableVertexArrayAttrib\x00");
    set_proc_address(&VertexArrayElementBuffer,                 "glVertexArrayElementBuffer\x00");
    set_proc_address(&VertexArrayVertexBuffer,                  "glVertexArrayVertexBuffer\x00");
    set_proc_address(&VertexArrayVertexBuffers,                 "glVertexArrayVertexBuffers\x00");
    set_proc_address(&VertexArrayAttribBinding,                 "glVertexArrayAttribBinding\x00");
    set_proc_address(&VertexArrayAttribFormat,                  "glVertexArrayAttribFormat\x00");
    set_proc_address(&VertexArrayAttribIFormat,                 "glVertexArrayAttribIFormat\x00");
    set_proc_address(&VertexArrayAttribLFormat,                 "glVertexArrayAttribLFormat\x00");
    set_proc_address(&VertexArrayBindingDivisor,                "glVertexArrayBindingDivisor\x00");
    set_proc_address(&GetVertexArrayiv,                         "glGetVertexArrayiv\x00");
    set_proc_address(&GetVertexArrayIndexediv,                  "glGetVertexArrayIndexediv\x00");
    set_proc_address(&GetVertexArrayIndexed64iv,                "glGetVertexArrayIndexed64iv\x00");
    set_proc_address(&CreateSamplers,                           "glCreateSamplers\x00");
    set_proc_address(&CreateProgramPipelines,                   "glCreateProgramPipelines\x00");
    set_proc_address(&CreateQueries,                            "glCreateQueries\x00");
    set_proc_address(&GetQueryBufferObjecti64v,                 "glGetQueryBufferObjecti64v\x00");
    set_proc_address(&GetQueryBufferObjectiv,                   "glGetQueryBufferObjectiv\x00");
    set_proc_address(&GetQueryBufferObjectui64v,                "glGetQueryBufferObjectui64v\x00");
    set_proc_address(&GetQueryBufferObjectuiv,                  "glGetQueryBufferObjectuiv\x00");
    set_proc_address(&MemoryBarrierByRegion,                    "glMemoryBarrierByRegion\x00");
    set_proc_address(&GetTextureSubImage,                       "glGetTextureSubImage\x00");
    set_proc_address(&GetCompressedTextureSubImage,             "glGetCompressedTextureSubImage\x00");
    set_proc_address(&GetGraphicsResetStatus,                   "glGetGraphicsResetStatus\x00");
    set_proc_address(&GetnCompressedTexImage,                   "glGetnCompressedTexImage\x00");
    set_proc_address(&GetnTexImage,                             "glGetnTexImage\x00");
    set_proc_address(&GetnUniformdv,                            "glGetnUniformdv\x00");
    set_proc_address(&GetnUniformfv,                            "glGetnUniformfv\x00");
    set_proc_address(&GetnUniformiv,                            "glGetnUniformiv\x00");
    set_proc_address(&GetnUniformuiv,                           "glGetnUniformuiv\x00");
    set_proc_address(&ReadnPixels,                              "glReadnPixels\x00");
    set_proc_address(&GetnMapdv,                                "glGetnMapdv\x00");
    set_proc_address(&GetnMapfv,                                "glGetnMapfv\x00");
    set_proc_address(&GetnMapiv,                                "glGetnMapiv\x00");
    set_proc_address(&GetnPixelMapfv,                           "glGetnPixelMapfv\x00");
    set_proc_address(&GetnPixelMapuiv,                          "glGetnPixelMapuiv\x00");
    set_proc_address(&GetnPixelMapusv,                          "glGetnPixelMapusv\x00");
    set_proc_address(&GetnPolygonStipple,                       "glGetnPolygonStipple\x00");
    set_proc_address(&GetnColorTable,                           "glGetnColorTable\x00");
    set_proc_address(&GetnConvolutionFilter,                    "glGetnConvolutionFilter\x00");
    set_proc_address(&GetnSeparableFilter,                      "glGetnSeparableFilter\x00");
    set_proc_address(&GetnHistogram,                            "glGetnHistogram\x00");
    set_proc_address(&GetnMinmax,                               "glGetnMinmax\x00");
    set_proc_address(&TextureBarrier,                           "glTextureBarrier\x00");
}

init :: proc(set_proc_address: proc(p: rawptr, name: string)) {
    // Placeholder for loading maximum supported version
}


// Helper for loading shaders into a program

import (
    "os.odin";
    "fmt.odin";
)

load_shaders :: proc(vertex_shader_filename, fragment_shader_filename: string) -> (u32, bool) {
    // Shader checking and linking checking are identical 
    // except for calling differently named GL functions
    // it's a bit ugly looking, but meh
    check_error :: proc(id: u32, status: u32, 
                     iv_func: proc(u32, u32, ^i32) #cc_c, 
                     log_func: proc(u32, i32, ^i32, ^u8) #cc_c) -> (bool) {
        result, info_log_length : i32;
        iv_func(id, status, &result);
        iv_func(id, INFO_LOG_LENGTH, &info_log_length);

        if result == 0 {
            error_message := make([]u8, info_log_length);
            defer free(error_message);

            log_func(id, i32(info_log_length), nil, &error_message[0]);
            fmt.printf(string(error_message[0..len(error_message)-1])); 

            return true;
        }

        return false;
    }

    // Compiling shaders are identical for any shader (vertex, geometry, fragment, tesselation, (maybe compute too))
    compile_shader_from_file :: proc(shader_filename: string, shader_type: u32) -> (u32, bool) {
        shader_code, ok := os.read_entire_file(shader_filename);
        if !ok {
            fmt.printf("Could not load file \"%s\"\n", shader_filename);
            return 0, false;
        }
        defer free(shader_code);

        shader_id := CreateShader(shader_type);
        length := i32(len(shader_code));
        ShaderSource(shader_id, 1, cast(^^u8)&shader_code, &length);
        CompileShader(shader_id);

        if (check_error(shader_id, COMPILE_STATUS, GetShaderiv, GetShaderInfoLog)) {
            return 0, false;
        }

        return shader_id, true;
    }

    // only used once, but I'd just make a subprocedure(?) for consistency
    create_and_link_program :: proc(shader_ids: []u32) -> (u32, bool) {
        program_id := CreateProgram();
        for id in shader_ids {
            AttachShader(program_id, id);   
        }
        LinkProgram(program_id);

        if (check_error(program_id, LINK_STATUS, GetProgramiv, GetProgramInfoLog)) {
            return 0, false;
        }

        return program_id, true;
    }

    // actual function from here
    vertex_shader_id, ok1 := compile_shader_from_file(vertex_shader_filename, VERTEX_SHADER);
    defer DeleteShader(vertex_shader_id);

    fragment_shader_id, ok2 := compile_shader_from_file(fragment_shader_filename, FRAGMENT_SHADER);
    defer DeleteShader(fragment_shader_id);

    if (!ok1 || !ok2) {
        return 0, false;
    }

    program_id, ok := create_and_link_program([]u32{vertex_shader_id, fragment_shader_id});
    if (!ok) {
        return 0, false;
    }

    return program_id, true;
}

Uniform_Info :: struct {
    location, size: i32;
    kind: u32;
    name: string;
}

import (
    "strings.odin";
)

get_uniforms_from_program :: proc(program: u32) -> map[string]Uniform_Info {
    uniforms: map[string]Uniform_Info;

    uniform_count: i32;
    GetProgramiv(program, ACTIVE_UNIFORMS, &uniform_count);

    counter : i32 = 0;
    for i in 0..uniform_count {
        using uniform_info: Uniform_Info;

        length: i32;
        cname: [256]u8;
        GetActiveUniform(program, u32(i), 256, &length, &size, &kind, &cname[0]);

        location = counter;
        name = strings.new_string(cast(string)cname[..length]); // @NOTE: These need to be freed
        uniforms[name] = uniform_info;

        counter += size;
    }

    return uniforms;
}

