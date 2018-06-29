IoAssertion := Object clone do(
    buildMessage := method(
        expected, actual, failureMessage,

        return if(
            failureMessage != nil,
            failureMessage,
            "Expected #{expected} but got #{actual}" interpolate
        )
    )

    verifyWithMessage := method(
        expected, actual, failureMessage,

        if(
            expected != actual,
            (
                errorMessage := buildMessage(expected, actual, failureMessage)
                Exception raise(errorMessage)
            )
        )
    )
)

IoAssertion assert := method(
    result, failureMessage,

    verifyWithMessage(true, result, failureMessage)
)

IoAssertion assertEqual := method(
    expected, actual, failureMessage,

    verifyWithMessage(expected, actual, failureMessage)
)