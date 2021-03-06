context("API calling")

test_that("Deprecated endpoints tell user to upgrade", {
    fake410 <- fakeResponse("http://crunch.io/410", status_code=410)
    expect_error(handleAPIresponse(fake410),
        paste("The API resource at http://crunch.io/410 has moved permanently.",
              "Please upgrade crunch to the latest version."))
})

with_mock_crunch({
    test_that("crunch.debug does not print if disabled", {
        expect_POST(
            expect_output(crPOST("https://app.crunch.io/api/", body='{"value":1}'),
                NA),
            "https://app.crunch.io/api/",
            '{"value":1}')
    })
    test_that("crunch.debug logging if enabled", {
        with(temp.option(crunch.debug=TRUE), {
            expect_POST(
                expect_output(crPOST("https://app.crunch.io/api/", body='{"value":1}'),
                    '\n {"value":1} \n',
                    fixed=TRUE),
                "https://app.crunch.io/api/",
                '{"value":1}')
            ## Use testthat:: so that it doesn't print ds. Check for log printing
            testthat::expect_output(ds <- loadDataset("test ds"),
                NA)
        })
    })
    test_that("503 on GET with Retry-After is handled", {
        expect_message(resp <- crGET("https://app.crunch.io/503/"),
            "This request is taking longer than expected. Please stand by...")
        expect_identical(resp, crGET("https://app.crunch.io/api/"))
    })
})

test_that("retry", {
    counter <- 0
    f <- function () {
        counter <<- counter + 1
        stopifnot(counter == 3)
        return(counter)
    }
    expect_identical(retry(f(), wait=.001), 3)
    counter <- 0
    expect_error(retry(f(), wait=.001, max.tries=2),
        "counter == 3 is not TRUE")
})

if (run.integration.tests) {
    test_that("Request headers", {
        skip_if_disconnected()
        r <- crGET("http://httpbin.org/gzip")
        expect_true(r$gzipped)
        expect_true(grepl("gzip", r$headers[["Accept-Encoding"]]))
        expect_true(grepl("rcrunch", r$headers[["User-Agent"]]))
    })

    test_that("crunchUserAgent", {
        expect_true(grepl("rcrunch", crunchUserAgent()))
        expect_true(grepl("libcurl", crunchUserAgent()))
        expect_error(crunchUserAgent("anotherpackage/3.1.4"),
            NA)
        expect_true(grepl("anotherpackage", crunchUserAgent("anotherpackage")))
    })

    with_test_authentication({
        test_that("API root can be fetched", {
            expect_true(is.shojiObject(getAPIRoot()))
        })
    })

    test_that("API calls throw an error if user is not authenticated", {
        logout()
        expect_error(getAPIRoot(),
            "You are not authenticated. Please `login\\(\\)` and try again.")
    })
}
