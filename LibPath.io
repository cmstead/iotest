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
    return self
)

LibPath setLaunchPath := method(
    newLaunchPath,

    launchPath = newLaunchPath
    setBasePath()

    return self
)

LibPath getSearchPathByDirName := method(
    dirName,

    searchPaths := Importer paths

    return Importer paths \
        select(path, path findSeq(dirName) != nil) \
        at(0)
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

LibPath addPathWithBase := method(
    basePath, pathName,

    LibPath addPath("#{basePath}/#{pathName}" interpolate)
)

LibPath addPath := method(
    pathName,

    Importer addSearchPath(pathName)

    return self
)