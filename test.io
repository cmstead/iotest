packageConfig := PackageConfig clone
packageConfig development call()

cwd := LibPath getSearchPathByDirName(packageConfig name)

IoTestRunnerFactory \
    buildRunner() \
        setCwd(cwd) \
        setTestExtension(".test") \
        addTestPath("tests") \
        run()