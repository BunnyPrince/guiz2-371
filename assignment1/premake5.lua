
-- IMPORTANT: do NOT delete any GEN: comments. They are used by the CLI to generate the project.
project "assignment1"
    kind "ConsoleApp"
    language "C++"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "src/**.h",
        "src/**.cpp",
        "src/**.hpp",
        "src/**.c",
    }

    includedirs
    {
        "src",
        -- GEN: Includes go here
        "%{wks.location}/vendor/GLFW/include",
        "%{wks.location}/vendor/GLEW/include",
        "%{wks.location}/vendor/glm"
    }

    links
    {
        -- GEN: Links go here
        "GLEW",
        "GLFW",
        "gdi32.lib",
        "opengl32.lib",
        "FreeImage.lib"
    }

    libdirs{
        "%{wks.location}/vendor/FreeImage/lib/win32"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "Off"
        systemversion "latest"

        defines
        {
            "SHADO_PLATFORM_WINDOWS",
            "GLEW_STATIC"
        }

        postbuildcommands
        {
            -- GEN: postbuildcommands go here
        }

    filter "configurations:Debug"
        defines "SHADO_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "SHADO_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "SHADO_DIST"
        optimize "Full"
