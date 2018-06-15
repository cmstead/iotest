AppImport := Object clone

AppImport importPaths := list()

AppImport configure := method(
    self importPaths foreach(
        index,
        value,
        Importer addSearchPath(value)
    )
)