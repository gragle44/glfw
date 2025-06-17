project "GLFW"
    kind "StaticLib"
    language "C"
    staticruntime "on"
    
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/glfw_config.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c",
        "src/platform.h",
        "src/platform.c",
        "src/null_init.c",
        "src/null_platform.h",
        "src/null_joystick.h",
        "src/null_init.c",
        "src/null_monitor.c",
        "src/null_window.c",
        "src/null_joystick.c"
    }
    
	filter "system:windows"
        systemversion "latest"
        
        files
        {
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_window.c",
            "src/win32_module.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }

		defines 
		{ 
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
		}

    filter "system:linux"
        systemversion "latest"

        files
        {
            "src/x11_window.c",
            "src/x11_monitor.c",
            "src/x11_init.c",
            "src/wl_window.c",
            "src/wl_monitor.c",
            "src/wl_init.c",
            "src/posix_poll.c",
            "src/posix_time.c",
            "src/posix_thread.c",
            "src/posix_module.c",
            "src/xkb_unicode.c",
            "src/linux_joystick.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/glx_context.c",
            "src/osmesa_context.c"
        }

        defines
        {
            "_GLFW_X11",
        }

    filter "configurations:Debug"
		defines "TRI_DEBUG"
		symbols "on"
		runtime "Debug"

	filter "configurations:Release"
		defines "TRI_RELEASE"
		optimize "on"
		runtime "Release"

    filter "configurations:Dist"
		defines "TRI_DIST"
		optimize "speed"
		symbols "off"
		runtime "Release"

		flags 
		{
			"linktimeoptimization"
		}
