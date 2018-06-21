ModuleLoader clone \
    addSearchPath("importConfig") \
    configure()

AppImport clone configure()
TestImport clone configure()

cwd := Directory currentWorkingDirectory

IoTestRunnerFactory \
    buildRunner() \
        setCwd(cwd) \
        setTestExtension(".test") \
        addTestPath("tests") \
        run()