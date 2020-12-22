test_that("use", {
  expect_true(nrow(get_bridge_openings()) > 0)
})

bridges <- get_bridge_openings()
if (nrow(bridges) > 0) {
  test_that("longitude", {
    expect_true(as.double(bridges$lon)[1] <= 180)
    expect_true(as.double(bridges$lon)[1] >= -180)
  })

  test_that("latitude", {
    expect_true(as.double(bridges$lat)[1] <= 90)
    expect_true(as.double(bridges$lat)[1] >= 0)
  })

  test_that("latitude and longitude are numerical", {
    expect_true(all(is.numeric(bridges$lat)))
    expect_true(all(is.numeric(bridges$lon)))
  })

}

test_that("NA data", {
  skip("Issue #141")
  fake_xml <- xml2::read_xml("<?xml version=\"1.0\" encoding=\"UTF-8\"?><SOAP:Envelope xmlns:SOAP=\"http://schemas.xmlsoap.org/soap/envelope/\"><SOAP:Body><d2LogicalModel xmlns=\"http://datex2.eu/schema/2/2_0\" modelBaseVersion=\"2\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><exchange><supplierIdentification><country>nl</country><nationalIdentifier>NLNDW</nationalIdentifier></supplierIdentification><subscription><operatingMode>operatingMode3</operatingMode><subscriptionStartTime>2020-11-09T06:11:11.374Z</subscriptionStartTime><subscriptionState>active</subscriptionState><updateMethod>snapshot</updateMethod><target><address/><protocol>HTTP</protocol></target></subscription></exchange><payloadPublication xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:type=\"SituationPublication\" lang=\"nl\"><publicationTime>2020-12-22T18:07:00.307Z</publicationTime><publicationCreator><country>nl</country><nationalIdentifier>NLNDW</nationalIdentifier></publicationCreator><situation id=\"NDW04_NLHLM0121A0403000033_32274835\" version=\"1\"><overallSeverity>unknown</overallSeverity><situationVersionTime>2020-12-22T14:17:32.000Z</situationVersionTime><headerInformation><confidentiality>noRestriction</confidentiality><informationStatus>real</informationStatus></headerInformation><situationRecord xsi:type=\"GeneralNetworkManagement\" id=\"NDW04_NLHLM0121A0403000033_32274835_01\" version=\"1\"><situationRecordCreationTime>2020-12-22T14:17:32.000Z</situationRecordCreationTime><situationRecordVersionTime>2020-12-22T14:17:32.000Z</situationRecordVersionTime><probabilityOfOccurrence>certain</probabilityOfOccurrence><source><sourceName><values><value lang=\"nl\">NDW04</value></values></sourceName></source><validity><validityStatus>definedByValidityTimeSpec</validityStatus><validityTimeSpecification><overallStartTime>2020-12-22T14:17:32.000Z</overallStartTime></validityTimeSpecification></validity><groupOfLocations xsi:type=\"Point\"><locationForDisplay><latitude>51.4660372401831</latitude><longitude>5.66254019737244</longitude></locationForDisplay><pointByCoordinates><pointCoordinates><latitude>51.4660372401831</latitude><longitude>5.66254019737244</longitude></pointCoordinates></pointByCoordinates></groupOfLocations><operatorActionStatus>implemented</operatorActionStatus><complianceOption>mandatory</complianceOption><generalNetworkManagementType>bridgeSwingInOperation</generalNetworkManagementType></situationRecord></situation><situation id=\"NDW04_NLHLM0121A0403000033_32274835\" version=\"1\"><overallSeverity>unknown</overallSeverity><situationVersionTime>2020-12-22T14:17:32.000Z</situationVersionTime><headerInformation><confidentiality>noRestriction</confidentiality><informationStatus>real</informationStatus></headerInformation><situationRecord xsi:type=\"GeneralNetworkManagement\" id=\"NDW04_NLHLM0121A0403000033_32274835_01\" version=\"1\"><situationRecordCreationTime>2020-12-22T14:17:32.000Z</situationRecordCreationTime><situationRecordVersionTime>2020-12-22T14:17:32.000Z</situationRecordVersionTime><probabilityOfOccurrence>certain</probabilityOfOccurrence><source><sourceName><values><value lang=\"nl\">NDW04</value></values></sourceName></source><validity><validityStatus>definedByValidityTimeSpec</validityStatus><validityTimeSpecification><overallStartTime>2020-12-22T14:17:32.000Z</overallStartTime></validityTimeSpecification></validity><groupOfLocations xsi:type=\"Point\"><locationForDisplay><latitude></latitude><longitude></longitude></locationForDisplay><pointByCoordinates><pointCoordinates><latitude></latitude><longitude></longitude></pointCoordinates></pointByCoordinates></groupOfLocations><operatorActionStatus>implemented</operatorActionStatus><complianceOption>mandatory</complianceOption><generalNetworkManagementType>bridgeSwingInOperation</generalNetworkManagementType></situationRecord></situation></payloadPublication></d2LogicalModel></SOAP:Body></SOAP:Envelope>")
  mockery::stub(informalr::get_bridge_openings,
                "informalr::get_xml_from_url",
                fake_xml)
  result <- informalr::get_bridge_openings()
  expect_false(is.na(result$lat))
  expect_false(is.na(result$lon))
})

test_that("no duplicate data", {
  df <- get_bridge_openings()
  expect_true(anyDuplicated(df) == 0)
})
