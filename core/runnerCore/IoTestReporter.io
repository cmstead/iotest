IoTestReporter := Object clone

IoTestReporter banner := \
"""
    ==============
    *** IoTest ***
    ==============

"""

IoTestReporter footer := \
"""

    ==============
    
    ==============
"""

IoTestReporter reportTestResult := method(
    testResult,

    writeln("        #{testResult status} -- #{testResult description}" interpolate)

    if(
        testResult error != nil,
        writeln("        Error: #{testResult error}\n" interpolate)
    )
)

IoTestReporter reportSuiteResults := method(
    testSuiteResult,

    writeln("    #{testSuiteResult description}" interpolate)

    testSuiteResult testResults \
        foreach(
            testResult,

            reportTestResult(testResult)
        )
)

IoTestReporter report := method(
    testSuiteResults,

    testSuiteResults \
        foreach(
            testSuiteResult,

            reportSuiteResults(testSuiteResult)
        )
)

IoTestReporter writeBannerAndReport := method(
    testSuiteResults,

    writeln(banner)

    report(testSuiteResults)

    writeln(footer)
)