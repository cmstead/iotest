IoTestRunner := Object clone

IoTestRunner cwd ::= nil
IoTestRunner ioTest := nil
IoTestRunner testExtension := nil
IoTestRunner testPaths ::= nil

IoTestRunner init := method(
    testExtension = ".io"

    setCwd(Directory currentWorkingDirectory)
    setTestPaths(list())

    return self
)

IoTestRunner setTestExtension := method(
    extension,

    testExtension = "#{extension}.io" interpolate
    return self
)

IoTestRunner addTestPath := method(
    testPath,

    testPaths append(testPath)
    return self
)

IoTestRunner buildFileCheck := method(
    expectedExtension := testExtension
    extensionLength := testExtension size

    return block(
        fileName exSlice(extensionLength * -1) == expectedExtension
    )
)

IoTestRunner writeBanner := method(
    """
    ==============
    *** IoTest ***
    ==============

    """ println
)

IoTestRunner writeFooter := method(
    """

    ==============
    ==============
    """ println
)

IoTestRunner run := method(
    isTestFile := buildFileCheck()
    ioTest = (IoTest clone) initialize()

    RunnerUtils getFileNames(testPaths, isTestFile) \
        foreach(i, fileName, (
            proto := doFile(fileName)
        )
    )

    writeBanner()

    ioTest runTests()

    writeFooter()
)