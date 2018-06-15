RunnerUtils := Object clone

RunnerUtils getFilePaths := method(
    fullPath,

    Directory \
        with(fullPath) \
        fileNames \
        map(fileName, (
            "#{fullPath}/#{fileName}" interpolate
        ))
)

RunnerUtils getFileNames := method(
    testPaths, isTestFile,

    testPaths \
        map(path, (
            fullPath := "#{self cwd}/#{path}" interpolate
            getFilePaths(fullPath)
        )) \
        flatten \
        select(fileName, isTestFile(fileName)) 
)

RunnerUtils runTestMethods := method(
    proto,

    proto \
        slotNames \
        select(slotName, (
            slotName exSlice(0, 4) == "test"
        )) \
        foreach(i, testSlot, (
            proto getSlot(testSlot)()
        ))
)