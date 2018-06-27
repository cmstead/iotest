IoTestSuite := Object clone

IoTestSuite tests := nil
IoTestSuite description ::= nil

IoTestSuite init := method(
    tests = list()
)

IoTestSuite test := method(
    testDescription, testBlock,

    newTest := IoTestCase clone
    newTest setDescription(testDescription)
    newTest setTestBlock(testBlock)

    tests append(newTest)

    return self
)

IoTestSuite skip := method(
    testDescription, testBlock,

    newTest := IoTestCase clone
    newTest setDescription(testDescription)
    newTest setTestBlock(testBlock)
    newTest setStatus("skipped")

    tests append(newTest)

    return self
)

IoTestSuite run := method(
    "    #{description}" interpolate println

    tests foreach(
        test,
        test run()
    )
)