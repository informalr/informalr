app <- ShinyDriver$new("../../", loadTimeout = 2e+05, seed = 1234)
app$snapshotInit("mytest")

app$snapshot()
