project "yaml-cpp"
	kind "StaticLib"
	language "C++"
	staticruntime "on"
	--warnings "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-intermediate/" .. outputdir .. "/%{prj.name}")

	files
	{
    	"src/**.h",
    	"src/**.cpp",

    	"include/**.h"
	}

	includedirs
	{
		"include"
	}

	defines
	{
		"YAML_CPP_STATIC_DEFINE"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++20"
    	staticruntime "on"


	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++20"
    	staticruntime "on"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"