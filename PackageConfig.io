LibPath addPathWithBaseByDirName("iotest", "libs/ModuleConfig")

PackageConfig := ModuleConfig clone \
    do(
        setName("iotest")
        setVersion("1.0.0")

        initializeModuleLoader()
    )

PackageConfig init := method(
    prodConfig(block(
        moduleLoader \
            addSearchPath("core") \
            addSearchPath("core/runnerCore") \
            addSearchPath("core/assertionCore") \
            addSearchPath("core/testCore") \
            configure()
    ))

    devConfig(block(

    ))
)