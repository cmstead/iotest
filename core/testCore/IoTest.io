IoTest := Object clone

IoTest testSuites := nil

IoTest initialize := method(
    testSuites = list()
    return self
)

IoTest testSuite := method(
    description,

    newTestSuite := IoTestSuite clone
    newTestSuite setDescription(description)

    testSuites append(newTestSuite)

    return newTestSuite
)

IoTest runTests := method(
    testSuites \
        foreach(
            testSuite,
            testSuite run()
        )
)