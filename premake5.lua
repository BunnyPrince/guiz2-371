
-- IMPORTANT: do NOT delete any GEN: comments. They are used by the CLI to generate the project.

workspace "assignment1"
    architecture "x64"
    startproject "assignment1"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

    group "Dependancies"
        -- GEN: Dependencies go here
        include "vendor/GLFW"
        include "vendor/GLEW"
    group ""

    include "assignment1"
