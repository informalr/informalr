app <- ShinyDriver$new("../../", loadTimeout = 20000)
app$snapshotInit("mytest")

app$snapshot()
