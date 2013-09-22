[Debug]
-- Directories only used when building with Debug configuration

*.inc = obj\debug
*.clw = obj\debug
*.exp = obj\debug
*.shp = obj\debug

[Release]
-- Directories only used when building with Release configuration

*.inc = obj\release
*.clw = obj\release
*.exp = obj\release
*.shp = obj\release

{include %bin%\Clarion90.RED}

[Common]
*.clw = ..\_Classes; _classes
*.inc = ..\_Classes; _classes
*.ico = _resources
*.gif = _resources
*.cur = _resources
*.jpg = _resources