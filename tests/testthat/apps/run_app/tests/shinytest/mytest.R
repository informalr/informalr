app <- ShinyDriver$new("../../", loadTimeout = 10000)
app$snapshotInit("mytest")

app$snapshot()
