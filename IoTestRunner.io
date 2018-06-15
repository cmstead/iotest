IoTestRunner := Object clone

IoTestRunner cwd ::= nil
IoTestRunner testExtension := nil
IoTestRunner testPaths ::= nil

IoTestRunner init := method(
    setCwd(Directory currentWorkingDirectory)
    testExtension = ".io"
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

IoTestRunner isTestFile := method(
    fileName,

    fileName exSlice(testExtension size * -1) == self testExtension
)

IoTestRunner getFileNames := method(
    testPaths \
        map(path, (
            fullPath := "#{self cwd}/#{path}" interpolate
            Directory with(fullPath)
        )) \
        map(dir, (
            dir fileNames
        )) \
        flatten \
        select(fileName, isTestFile(fileName)) 
)

IoTestRunner run := method(
    getFileNames() \
        foreach(i, fileName, (
            protoName := fileName split(".") at(0)
        )) \
        println
)