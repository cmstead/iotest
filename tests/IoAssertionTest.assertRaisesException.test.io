ioTest testSuite("IoAssertion assertRaisesException") \
    skip(
        "raises an exception when provided block does not raise an exception",

        block(
            expectedException := "Expected exception"

            exception := try(
                IoAssertion assertRaisesException(
                    block("No exception here."),
                    nil,
                    expectedException
                )
            )

            exception catch()

            IoAssertion assertEqual(exception error, expectedException, "The correct exception was not raised")
        )
    ) //\
    // test(
    //     "does not raise an exception on true",

    //     block(
    //         exception := try(
    //             IoAssertion assertTrue(true, "Expecting no exception")
    //         )

    //         exception catch()

    //         IoAssertion assert(exception == nil, "An exception was raised")
    //     )
    // )