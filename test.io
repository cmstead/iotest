launchPath := System launchPath

Importer addSearchPath("#{launchPath}/importerConfig" interpolate)

(AppImport clone) configure()
(TestImport clone) configure()

cwd := Directory currentWorkingDirectory

IoTestRunnerFactory \
    buildRunner() \
        setCwd(cwd) \
        setTestExtension(".test") \
        addTestPath("tests") \
        run()