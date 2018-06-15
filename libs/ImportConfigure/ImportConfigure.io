ImportConfigure := Object clone

ImportConfigure init := method(importPaths = list())

ImportConfigure importPaths := nil

ImportConfigure addPath := method(
    importPath,

    importPaths append(importPath)
    return self
)

ImportConfigure addSearchPath := method(path, Importer addSearchPath(path))

ImportConfigure configure := method(
    importPaths foreach(index, value, addSearchPath(value))
)