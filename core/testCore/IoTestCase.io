IoTestCase := Object clone

IoTestCase description ::= nil
IoTestCase testBlock ::= nil
IoTestCase status ::= nil
IoTestCase testError := nil

IoTestCase runTestCase := method(
    status = "pass"

    testException := try(
        testBlock call()
    )

    testException catch(
        status = "fail"
        testError = testException error
    )

)

IoTestCase report := method(
    writeln("        #{status} -- #{description}" interpolate)

    if(
        testError != nil,
        writeln("        Error: #{testError}\n" interpolate)
    )
)

IoTestCase run := method(
    if(
        status == nil,
        runTestCase()
    )

    report()
)