IoAssertion := Object clone

IoAssertion buildMessage := method(
    expected, actual, failureMessage,

    return if(
        failureMessage != nil,
        failureMessage,
        "Expected #{expected} but got #{actual}" interpolate
    )
)

IoAssertion assert := method(
    result, failureMessage,

    if(
        result != true,
        (
            errorMessage := buildMessage(true, result, failureMessage)
            Exception raise(errorMessage)
        )
    )
)