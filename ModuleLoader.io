ModuleLoader := Object clone

ModuleLoader libPathInstance := nil
ModuleLoader searchPaths := nil
ModuleLoader libPathName ::= nil

ModuleLoader init := method(
    libPathInstance = LibPath clone
    searchPaths = list()
)

ModuleLoader addSearchPath := method(
    searchPath,

    searchPaths append(searchPath)

    return self
)

ModuleLoader configure := method(
    basePath,

    if(basePath != nil) \
        then(libPathInstance setLaunchPath(basePath))

    if(libPathName != nil) \
        then(libPathInstance setLibPathName(libPathName))

    libPathInstance addLibPaths()

    searchPaths foreach(
        searchPath,
        libPathInstance addPath(searchPath)
    )
)

LibPath := Object clone

LibPath launchPath ::= nil
LibPath libPathName ::= nil
LibPath basePath := nil

LibPath init := method(
    setLaunchPath(System launchPath)
    libPathName = "libs"

    setBasePath()
)

LibPath setBasePath := method(
    basePath = "#{launchPath}/#{libPathName}" interpolate
)

LibPath setLibPathName := method(
    pathName,

    libPathName = pathName

    setBasePath()

    return self
)

LibPath getDirectoryPaths := method(
    libsPath,

    baseDirectory := Directory with(libsPath)

    return \
        Directory \
            with(libsPath) \
            items \
            select(item, (item name != ".") and (item name != "..")) \
            map(item, item name)
)

LibPath addLibPaths := method(
    getDirectoryPaths(basePath) \
        foreach(pathName, (
            libPath := "#{basePath}/#{pathName}" interpolate
            addPath(libPath)
        ))
    
    return self
)

LibPath addPath := method(
    pathName,

    Importer addSearchPath(pathName)

    return self
)