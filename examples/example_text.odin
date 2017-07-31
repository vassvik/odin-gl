import (
    "fmt.odin";
    "strings.odin";
    "math.odin";
    "glfw.odin";
    "gl.odin";
    "font.odin";
)

main :: proc() {
    resx, resy := 1600.0, 900.0;
    window, success := init_glfw(i32(resx), i32(resy), "Odin Font Rendering");
    if !success {
        glfw.Terminate();
        return;
    }
    defer glfw.Terminate();

    set_proc_address :: proc(p: rawptr, name: string) { 
        (cast(^rawptr)p)^ = rawptr(glfw.GetProcAddress(&name[0]));
    }
    gl.load_up_to(4, 5, set_proc_address);

    gl.ClearColor(1.0, 1.0, 1.0, 1.0);

    if !font.init("extra/font_3x1.bin", "shaders/shader_font.vs", "shaders/shader_font.fs") do return;
    defer font.cleanup();

    for glfw.WindowShouldClose(window) == glfw.FALSE {
        calculate_frame_timings(window);
        
        glfw.PollEvents();

        gl.Clear(gl.COLOR_BUFFER_BIT);
                
        seed = 123;
        for i in 0..int(3.0*glfw.GetTime()) do rng();

        colors_font := font.get_colors();
        for i in 0..4 do colors_font[i] = font.Vec4{f32(rng()), f32(rng()), f32(rng()), 1.0};
        
        font.update_colors(4);

        str :: "The quick brown fox jumps over the lazy dog";
        str_colors: [len(str)]u16;
        for i in 0..len(str) do str_colors[i] = u16(i)&3;

        y_pos : f32 = 0.0;
        font.draw_string(0.0, y_pos, 20.0, str);                               y_pos += 20.0; // unformatted string with implicit palette index passing (implicit 0)
        font.draw_string(0.0, y_pos, 28.0, 3, str);                            y_pos += 28.0; // unformatted string with explicit palette index passing
        font.draw_string(0.0, y_pos, 24.0, str_colors[..], str);               y_pos += 24.0; // unformatted string with explicit palette index passing for the whole string
        font.draw_string(0.0, y_pos, 32.0, 2, str);                            y_pos += 32.0; // unformatted string with explicit palette index passing
        font.draw_format(0.0, y_pos, 16.0, "blehh %d %f: %s", 2, 3.14, str);   y_pos += 16.0; //   formatted string with implicit palette index passing (implicit 0)
        font.draw_format(0.0, y_pos, 20.0, 1, "blah %d %f: %s", 4, 6.28, str); y_pos += 20.0; //   formatted string with explicit palette index passing
        
        glfw.SwapBuffers(window);
    }
}


error_callback :: proc(error: i32, desc: ^u8) #cc_c {
    fmt.printf("Error code %d:\n    %s\n", error, strings.to_odin_string(desc));
}

init_glfw :: proc(resx, resy: i32, title: string) -> (^glfw.window, bool) {
    glfw.SetErrorCallback(error_callback);

    if glfw.Init() == 0 {
        return nil, false;
    }

    glfw.WindowHint(glfw.SAMPLES, 0);
    glfw.WindowHint(glfw.CONTEXT_VERSION_MAJOR, 4);
    glfw.WindowHint(glfw.CONTEXT_VERSION_MINOR, 5);
    glfw.WindowHint(glfw.OPENGL_PROFILE, glfw.OPENGL_CORE_PROFILE);

    window := glfw.CreateWindow(resx, resy, title, nil, nil);
    if window == nil {
        return nil, false;
    }

    glfw.MakeContextCurrent(window);
    glfw.SwapInterval(0);

    return window, true;
}

// wrapper to use GetUniformLocation with an Odin string
// @NOTE: str has to be zero-terminated, so add a \x00 at the end
GetUniformLocation_ :: proc(program: u32, str: string) -> i32 {
    return gl.GetUniformLocation(program, &str[0]);;
}


// Minimal Standard LCG
seed : u32 = 12345;
rng :: proc() -> f64 {
    seed *= 16807;
    return f64(seed) / f64(0x100000000);
}

// globals for persistent timing data, placeholder for "static" variables
_TimingStruct :: struct {
    t1, avg_dt, avg_dt2, last_frame_time : f64;
    num_samples, counter: int;
}
persistent_timing_data := _TimingStruct{0.0, 0.0, 0.0, 1.0/60, 60, 0};

calculate_frame_timings :: proc(window: ^glfw.window) {
    using persistent_timing_data;
    t2 := glfw.GetTime();
    dt := t2-t1;
    t1 = t2;

    avg_dt += dt;
    avg_dt2 += dt*dt;
    counter += 1;

    last_frame_time = dt;

    if counter == num_samples {
        avg_dt  /= f64(num_samples);
        avg_dt2 /= f64(num_samples);
        std_dt := math.sqrt(avg_dt2 - avg_dt*avg_dt);
        ste_dt := std_dt/math.sqrt(f64(num_samples));
        
        title := fmt.aprintf("dt: avg = %.3fms, std = %.3fms, ste = %.4fms. fps = %.1f\x00", 1000.0*avg_dt, 1000.0*std_dt, 1000.0*ste_dt, 1.0/avg_dt);
        defer free(title);

        glfw.SetWindowTitle(window, &title[0]);
        
        num_samples = int(1.0/avg_dt);
        avg_dt = 0.0;
        avg_dt2 = 0.0;
        counter = 0;
    }
}
