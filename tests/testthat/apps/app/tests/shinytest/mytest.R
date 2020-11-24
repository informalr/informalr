app <- ShinyDriver$new("../../", loadTimeout = 2e+05, seed = 1234)
app$snapshotInit("mytest")

Sys.sleep(0.5)

app$snapshot()
