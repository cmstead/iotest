testRunner := IoTestRunner clone

cwd := Directory currentWorkingDirectory

testRunner \
    setCwd(cwd) \
    setTestExtension(".test") \
    addTestPath("tests") \
    run()