Importer addSearchPath("libs/ImportConfigure")

AppImport := ImportConfigure clone

AppImport init := method(
    addPath("./core")
    addPath("./core/runnerCore")
    addPath("./core/testCore")
)