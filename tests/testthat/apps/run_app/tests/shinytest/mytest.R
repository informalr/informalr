app <- ShinyDriver$new("../../", timeoutSecs = 20000)
app$snapshotInit("mytest")

app$snapshot()
