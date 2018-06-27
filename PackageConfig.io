packageName := "iotest"
packageVersion := "1.0.0"

basePath := LibPath getSearchPathByDirName(packageName)
LibPath addPathWithBase(basePath, "libs/ModuleConfig")

PackageConfig := ModuleConfig clone

PackageConfig init := method(
    setName(packageName)
    setVersion(packageVersion)

    initializeModuleLoader()

    prodConfig(block(
        moduleLoader \
            addSearchPath("core") \
            addSearchPath("core/runnerCore") \
            addSearchPath("core/testCore") \
            configure()
    ))

    devConfig(block())
)