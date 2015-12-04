
var accessSniff  = require('access-sniff');
var files = ["test-usi.ace.gbuild.net                                  /node/13", "test-usi.ace.gbuild.net                                  /node/15", "test-usi.ace.gbuild.net                                  /node/17", "test-usi.ace.gbuild.net                                  /node/21", "test-usi.ace.gbuild.net                                  /node/27", "test-usi.ace.gbuild.net                                  /node/31", "test-usi.ace.gbuild.net                                  /node/51", "test-usi.ace.gbuild.net                                  /node/85", "test-usi.ace.gbuild.net                                  /node/87", "test-usi.ace.gbuild.net                                  /node/89", "test-usi.ace.gbuild.net                                  /node/91", "test-usi.ace.gbuild.net                                  /node/99", "test-usi.ace.gbuild.net                                  /node/101", "test-usi.ace.gbuild.net                                  /node/179", "test-usi.ace.gbuild.net                                  /node/446", "test-usi.ace.gbuild.net                                  /node/456", "test-usi.ace.gbuild.net                                  /node/461", "test-usi.ace.gbuild.net                                  /node/466", "test-usi.ace.gbuild.net                                  /node/471", "test-usi.ace.gbuild.net                                  /node/476", "test-usi.ace.gbuild.net                                  /node/1366", "test-usi.ace.gbuild.net                                  /node/1371", "test-usi.ace.gbuild.net                                  /node/1376", "test-usi.ace.gbuild.net                                  /node/1381", "test-usi.ace.gbuild.net                                  /node/1386", "test-usi.ace.gbuild.net                                  /node/1391", "test-usi.ace.gbuild.net                                  /node/1396", "test-usi.ace.gbuild.net                                  /node/1401", "test-usi.ace.gbuild.net                                  /node/1431", "test-usi.ace.gbuild.net                                  /node/1436", "test-usi.ace.gbuild.net                                  /node/1441", "test-usi.ace.gbuild.net                                  /node/1446", "test-usi.ace.gbuild.net                                  /node/1451", "test-usi.ace.gbuild.net                                  /node/1456", "test-usi.ace.gbuild.net                                  /node/1461", "test-usi.ace.gbuild.net                                  /node/1466", "test-usi.ace.gbuild.net                                  /node/1471", "test-usi.ace.gbuild.net                                  /node/1476", "test-usi.ace.gbuild.net                                  /node/1481", "test-usi.ace.gbuild.net                                  /node/1486", "test-usi.ace.gbuild.net                                  /node/1491", "test-usi.ace.gbuild.net                                  /node/1496", "test-usi.ace.gbuild.net                                  /node/1506", "test-usi.ace.gbuild.net                                  /node/1511", "test-usi.ace.gbuild.net                                  /node/1531", "test-usi.ace.gbuild.net                                  /node/1536", "test-usi.ace.gbuild.net                                  /node/1541", "test-usi.ace.gbuild.net                                  /node/1546", "test-usi.ace.gbuild.net                                  /node/1551", "test-usi.ace.gbuild.net                                  /node/1556", "test-usi.ace.gbuild.net                                  /node/1561", "test-usi.ace.gbuild.net                                  /node/1571", "test-usi.ace.gbuild.net                                  /node/1576", "test-usi.ace.gbuild.net                                  /node/1581", "test-usi.ace.gbuild.net                                  /node/1586", "test-usi.ace.gbuild.net                                  /node/1591", "test-usi.ace.gbuild.net                                  /node/1596", "test-usi.ace.gbuild.net                                  /node/1601", "test-usi.ace.gbuild.net                                  /node/1606", "test-usi.ace.gbuild.net                                  /node/1611", "test-usi.ace.gbuild.net                                  /node/1616", "test-usi.ace.gbuild.net                                  /node/1621", "test-usi.ace.gbuild.net                                  /node/1626", "test-usi.ace.gbuild.net                                  /node/1631", "test-usi.ace.gbuild.net                                  /node/1636", "test-usi.ace.gbuild.net                                  /node/1641", "test-usi.ace.gbuild.net                                  /node/1646", "test-usi.ace.gbuild.net                                  /node/1651", "test-usi.ace.gbuild.net                                  /node/1656", "test-usi.ace.gbuild.net                                  /node/1661", "test-usi.ace.gbuild.net                                  /node/1666", "test-usi.ace.gbuild.net                                  /node/1671", "test-usi.ace.gbuild.net                                  /node/1676", "test-usi.ace.gbuild.net                                  /node/1681", "test-usi.ace.gbuild.net                                  /node/1686", "test-usi.ace.gbuild.net                                  /node/1691", "test-usi.ace.gbuild.net                                  /node/1696", "test-usi.ace.gbuild.net                                  /node/1701", "test-usi.ace.gbuild.net                                  /node/1706", "test-usi.ace.gbuild.net                                  /node/1711", "test-usi.ace.gbuild.net                                  /node/1906", "test-usi.ace.gbuild.net                                  /node/1911", "test-usi.ace.gbuild.net                                  /node/1916", "test-usi.ace.gbuild.net                                  /node/1921", "test-usi.ace.gbuild.net                                  /node/1926", "test-usi.ace.gbuild.net                                  /node/1931", "test-usi.ace.gbuild.net                                  /node/1936", "test-usi.ace.gbuild.net                                  /node/1941", "test-usi.ace.gbuild.net                                  /node/1946", "test-usi.ace.gbuild.net                                  /node/1951", "test-usi.ace.gbuild.net                                  /node/1956", "test-usi.ace.gbuild.net                                  /node/1961", "test-usi.ace.gbuild.net                                  /node/1966", "test-usi.ace.gbuild.net                                  /node/1971", "test-usi.ace.gbuild.net                                  /node/1976", "test-usi.ace.gbuild.net                                  /node/1981", "test-usi.ace.gbuild.net                                  /node/1986", "test-usi.ace.gbuild.net                                  /node/1991", "test-usi.ace.gbuild.net                                  /node/1996", "test-usi.ace.gbuild.net                                  /node/2001", "test-usi.ace.gbuild.net                                  /node/2006", "test-usi.ace.gbuild.net                                  /node/2011", "test-usi.ace.gbuild.net                                  /node/2016", "test-usi.ace.gbuild.net                                  /node/2166", "test-usi.ace.gbuild.net                                  /node/2321", "test-usi.ace.gbuild.net                                  /node/2326", "test-usi.ace.gbuild.net                                  /node/2466", "test-usi.ace.gbuild.net                                  /node/161", "test-usi.ace.gbuild.net                                  /node/1836", "test-usi.ace.gbuild.net                                  /node/1846", "test-usi.ace.gbuild.net                                  /node/1856", "test-usi.ace.gbuild.net                                  /node/1876", "test-usi.ace.gbuild.net                                  /node/2036", "test-usi.ace.gbuild.net                                  /node/2041", "test-usi.ace.gbuild.net                                  /node/2046", "test-usi.ace.gbuild.net                                  /node/2051", "test-usi.ace.gbuild.net                                  /node/2056", "test-usi.ace.gbuild.net                                  /node/2076", "test-usi.ace.gbuild.net                                  /node/2081", "test-usi.ace.gbuild.net                                  /node/2086", "test-usi.ace.gbuild.net                                  /node/2096", "test-usi.ace.gbuild.net                                  /node/2101", "test-usi.ace.gbuild.net                                  /node/2106", "test-usi.ace.gbuild.net                                  /node/2111", "test-usi.ace.gbuild.net                                  /node/2116", "test-usi.ace.gbuild.net                                  /node/2131", "test-usi.ace.gbuild.net                                  /node/2136", "test-usi.ace.gbuild.net                                  /node/2141", "test-usi.ace.gbuild.net                                  /node/2151", "test-usi.ace.gbuild.net                                  /node/2156", "test-usi.ace.gbuild.net                                  /node/2161", "test-usi.ace.gbuild.net                                  /node/2171", "test-usi.ace.gbuild.net                                  /node/2176", "test-usi.ace.gbuild.net                                  /node/2181", "test-usi.ace.gbuild.net                                  /node/2186", "test-usi.ace.gbuild.net                                  /node/2191", "test-usi.ace.gbuild.net                                  /node/2196", "test-usi.ace.gbuild.net                                  /node/181", "test-usi.ace.gbuild.net                                  /node/183", "test-usi.ace.gbuild.net                                  /node/185", "test-usi.ace.gbuild.net                                  /node/189", "test-usi.ace.gbuild.net                                  /node/191", "test-usi.ace.gbuild.net                                  /node/193", "test-usi.ace.gbuild.net                                  /node/195", "test-usi.ace.gbuild.net                                  /node/197", "test-usi.ace.gbuild.net                                  /node/199", "test-usi.ace.gbuild.net                                  /node/201", "test-usi.ace.gbuild.net                                  /node/203", "test-usi.ace.gbuild.net                                  /node/205", "test-usi.ace.gbuild.net                                  /node/207", "test-usi.ace.gbuild.net                                  /node/209", "test-usi.ace.gbuild.net                                  /node/211", "test-usi.ace.gbuild.net                                  /node/213", "test-usi.ace.gbuild.net                                  /node/215", "test-usi.ace.gbuild.net                                  /node/217", "test-usi.ace.gbuild.net                                  /node/219", "test-usi.ace.gbuild.net                                  /node/221", "test-usi.ace.gbuild.net                                  /node/225", "test-usi.ace.gbuild.net                                  /node/227", "test-usi.ace.gbuild.net                                  /node/229", "test-usi.ace.gbuild.net                                  /node/231", "test-usi.ace.gbuild.net                                  /node/233", "test-usi.ace.gbuild.net                                  /node/235", "test-usi.ace.gbuild.net                                  /node/237", "test-usi.ace.gbuild.net                                  /node/239", "test-usi.ace.gbuild.net                                  /node/241", "test-usi.ace.gbuild.net                                  /node/243", "test-usi.ace.gbuild.net                                  /node/245", "test-usi.ace.gbuild.net                                  /node/247", "test-usi.ace.gbuild.net                                  /node/249", "test-usi.ace.gbuild.net                                  /node/251", "test-usi.ace.gbuild.net                                  /node/253", "test-usi.ace.gbuild.net                                  /node/255", "test-usi.ace.gbuild.net                                  /node/257", "test-usi.ace.gbuild.net                                  /node/259", "test-usi.ace.gbuild.net                                  /node/263", "test-usi.ace.gbuild.net                                  /node/265", "test-usi.ace.gbuild.net                                  /node/267", "test-usi.ace.gbuild.net                                  /node/269", "test-usi.ace.gbuild.net                                  /node/271", "test-usi.ace.gbuild.net                                  /node/273", "test-usi.ace.gbuild.net                                  /node/275", "test-usi.ace.gbuild.net                                  /node/277", "test-usi.ace.gbuild.net                                  /node/279", "test-usi.ace.gbuild.net                                  /node/281", "test-usi.ace.gbuild.net                                  /node/283", "test-usi.ace.gbuild.net                                  /node/285", "test-usi.ace.gbuild.net                                  /node/287", "test-usi.ace.gbuild.net                                  /node/289", "test-usi.ace.gbuild.net                                  /node/291", "test-usi.ace.gbuild.net                                  /node/293", "test-usi.ace.gbuild.net                                  /node/295", "test-usi.ace.gbuild.net                                  /node/299", "test-usi.ace.gbuild.net                                  /node/301", "test-usi.ace.gbuild.net                                  /node/303", "test-usi.ace.gbuild.net                                  /node/305", "test-usi.ace.gbuild.net                                  /node/307", "test-usi.ace.gbuild.net                                  /node/309", "test-usi.ace.gbuild.net                                  /node/311", "test-usi.ace.gbuild.net                                  /node/313", "test-usi.ace.gbuild.net                                  /node/317", "test-usi.ace.gbuild.net                                  /node/319", "test-usi.ace.gbuild.net                                  /node/321", "test-usi.ace.gbuild.net                                  /node/323", "test-usi.ace.gbuild.net                                  /node/325", "test-usi.ace.gbuild.net                                  /node/327", "test-usi.ace.gbuild.net                                  /node/331", "test-usi.ace.gbuild.net                                  /node/336", "test-usi.ace.gbuild.net                                  /node/341", "test-usi.ace.gbuild.net                                  /node/346", "test-usi.ace.gbuild.net                                  /node/351", "test-usi.ace.gbuild.net                                  /node/356", "test-usi.ace.gbuild.net                                  /node/361", "test-usi.ace.gbuild.net                                  /node/366", "test-usi.ace.gbuild.net                                  /node/371", "test-usi.ace.gbuild.net                                  /node/376", "test-usi.ace.gbuild.net                                  /node/381", "test-usi.ace.gbuild.net                                  /node/386", "test-usi.ace.gbuild.net                                  /node/391", "test-usi.ace.gbuild.net                                  /node/396", "test-usi.ace.gbuild.net                                  /node/401", "test-usi.ace.gbuild.net                                  /node/406", "test-usi.ace.gbuild.net                                  /node/411", "test-usi.ace.gbuild.net                                  /node/416", "test-usi.ace.gbuild.net                                  /node/421", "test-usi.ace.gbuild.net                                  /node/426", "test-usi.ace.gbuild.net                                  /node/431", "test-usi.ace.gbuild.net                                  /node/436", "test-usi.ace.gbuild.net                                  /node/441", "test-usi.ace.gbuild.net                                  /node/481", "test-usi.ace.gbuild.net                                  /node/486", "test-usi.ace.gbuild.net                                  /node/501", "test-usi.ace.gbuild.net                                  /node/506", "test-usi.ace.gbuild.net                                  /node/511", "test-usi.ace.gbuild.net                                  /node/516", "test-usi.ace.gbuild.net                                  /node/521", "test-usi.ace.gbuild.net                                  /node/526", "test-usi.ace.gbuild.net                                  /node/531", "test-usi.ace.gbuild.net                                  /node/536", "test-usi.ace.gbuild.net                                  /node/541", "test-usi.ace.gbuild.net                                  /node/546", "test-usi.ace.gbuild.net                                  /node/551", "test-usi.ace.gbuild.net                                  /node/556", "test-usi.ace.gbuild.net                                  /node/561", "test-usi.ace.gbuild.net                                  /node/566", "test-usi.ace.gbuild.net                                  /node/571", "test-usi.ace.gbuild.net                                  /node/576", "test-usi.ace.gbuild.net                                  /node/586", "test-usi.ace.gbuild.net                                  /node/591", "test-usi.ace.gbuild.net                                  /node/596", "test-usi.ace.gbuild.net                                  /node/601", "test-usi.ace.gbuild.net                                  /node/606", "test-usi.ace.gbuild.net                                  /node/611", "test-usi.ace.gbuild.net                                  /node/616", "test-usi.ace.gbuild.net                                  /node/621", "test-usi.ace.gbuild.net                                  /node/626", "test-usi.ace.gbuild.net                                  /node/631", "test-usi.ace.gbuild.net                                  /node/636", "test-usi.ace.gbuild.net                                  /node/641", "test-usi.ace.gbuild.net                                  /node/646", "test-usi.ace.gbuild.net                                  /node/651", "test-usi.ace.gbuild.net                                  /node/661", "test-usi.ace.gbuild.net                                  /node/666", "test-usi.ace.gbuild.net                                  /node/671", "test-usi.ace.gbuild.net                                  /node/676", "test-usi.ace.gbuild.net                                  /node/681", "test-usi.ace.gbuild.net                                  /node/686", "test-usi.ace.gbuild.net                                  /node/691", "test-usi.ace.gbuild.net                                  /node/696", "test-usi.ace.gbuild.net                                  /node/701", "test-usi.ace.gbuild.net                                  /node/716", "test-usi.ace.gbuild.net                                  /node/721", "test-usi.ace.gbuild.net                                  /node/726", "test-usi.ace.gbuild.net                                  /node/731", "test-usi.ace.gbuild.net                                  /node/736", "test-usi.ace.gbuild.net                                  /node/741", "test-usi.ace.gbuild.net                                  /node/746", "test-usi.ace.gbuild.net                                  /node/751", "test-usi.ace.gbuild.net                                  /node/756", "test-usi.ace.gbuild.net                                  /node/761", "test-usi.ace.gbuild.net                                  /node/766", "test-usi.ace.gbuild.net                                  /node/771", "test-usi.ace.gbuild.net                                  /node/776", "test-usi.ace.gbuild.net                                  /node/781", "test-usi.ace.gbuild.net                                  /node/786", "test-usi.ace.gbuild.net                                  /node/791", "test-usi.ace.gbuild.net                                  /node/796", "test-usi.ace.gbuild.net                                  /node/801", "test-usi.ace.gbuild.net                                  /node/806", "test-usi.ace.gbuild.net                                  /node/811", "test-usi.ace.gbuild.net                                  /node/816", "test-usi.ace.gbuild.net                                  /node/821", "test-usi.ace.gbuild.net                                  /node/826", "test-usi.ace.gbuild.net                                  /node/831", "test-usi.ace.gbuild.net                                  /node/836", "test-usi.ace.gbuild.net                                  /node/841", "test-usi.ace.gbuild.net                                  /node/846", "test-usi.ace.gbuild.net                                  /node/851", "test-usi.ace.gbuild.net                                  /node/856", "test-usi.ace.gbuild.net                                  /node/861", "test-usi.ace.gbuild.net                                  /node/866", "test-usi.ace.gbuild.net                                  /node/876", "test-usi.ace.gbuild.net                                  /node/881", "test-usi.ace.gbuild.net                                  /node/886", "test-usi.ace.gbuild.net                                  /node/891", "test-usi.ace.gbuild.net                                  /node/896", "test-usi.ace.gbuild.net                                  /node/901", "test-usi.ace.gbuild.net                                  /node/906", "test-usi.ace.gbuild.net                                  /node/911", "test-usi.ace.gbuild.net                                  /node/916", "test-usi.ace.gbuild.net                                  /node/926", "test-usi.ace.gbuild.net                                  /node/931", "test-usi.ace.gbuild.net                                  /node/936", "test-usi.ace.gbuild.net                                  /node/941", "test-usi.ace.gbuild.net                                  /node/946", "test-usi.ace.gbuild.net                                  /node/951", "test-usi.ace.gbuild.net                                  /node/956", "test-usi.ace.gbuild.net                                  /node/971", "test-usi.ace.gbuild.net                                  /node/976", "test-usi.ace.gbuild.net                                  /node/981", "test-usi.ace.gbuild.net                                  /node/996", "test-usi.ace.gbuild.net                                  /node/1001", "test-usi.ace.gbuild.net                                  /node/1006", "test-usi.ace.gbuild.net                                  /node/1011", "test-usi.ace.gbuild.net                                  /node/1016", "test-usi.ace.gbuild.net                                  /node/1021", "test-usi.ace.gbuild.net                                  /node/1026", "test-usi.ace.gbuild.net                                  /node/1031", "test-usi.ace.gbuild.net                                  /node/1036", "test-usi.ace.gbuild.net                                  /node/1041", "test-usi.ace.gbuild.net                                  /node/1046", "test-usi.ace.gbuild.net                                  /node/1051", "test-usi.ace.gbuild.net                                  /node/1056", "test-usi.ace.gbuild.net                                  /node/1061", "test-usi.ace.gbuild.net                                  /node/1066", "test-usi.ace.gbuild.net                                  /node/1071", "test-usi.ace.gbuild.net                                  /node/1076", "test-usi.ace.gbuild.net                                  /node/1081", "test-usi.ace.gbuild.net                                  /node/1086", "test-usi.ace.gbuild.net                                  /node/1091", "test-usi.ace.gbuild.net                                  /node/1096", "test-usi.ace.gbuild.net                                  /node/1101", "test-usi.ace.gbuild.net                                  /node/1106", "test-usi.ace.gbuild.net                                  /node/1111", "test-usi.ace.gbuild.net                                  /node/1116", "test-usi.ace.gbuild.net                                  /node/1121", "test-usi.ace.gbuild.net                                  /node/1126", "test-usi.ace.gbuild.net                                  /node/1131", "test-usi.ace.gbuild.net                                  /node/1136", "test-usi.ace.gbuild.net                                  /node/1141", "test-usi.ace.gbuild.net                                  /node/1146", "test-usi.ace.gbuild.net                                  /node/1151", "test-usi.ace.gbuild.net                                  /node/1156", "test-usi.ace.gbuild.net                                  /node/1161", "test-usi.ace.gbuild.net                                  /node/1166", "test-usi.ace.gbuild.net                                  /node/1171", "test-usi.ace.gbuild.net                                  /node/1176", "test-usi.ace.gbuild.net                                  /node/1181", "test-usi.ace.gbuild.net                                  /node/1186", "test-usi.ace.gbuild.net                                  /node/1191", "test-usi.ace.gbuild.net                                  /node/1196", "test-usi.ace.gbuild.net                                  /node/1201", "test-usi.ace.gbuild.net                                  /node/1206", "test-usi.ace.gbuild.net                                  /node/1211", "test-usi.ace.gbuild.net                                  /node/1216", "test-usi.ace.gbuild.net                                  /node/1221", "test-usi.ace.gbuild.net                                  /node/1226", "test-usi.ace.gbuild.net                                  /node/1231", "test-usi.ace.gbuild.net                                  /node/1236", "test-usi.ace.gbuild.net                                  /node/1241", "test-usi.ace.gbuild.net                                  /node/1246", "test-usi.ace.gbuild.net                                  /node/1251", "test-usi.ace.gbuild.net                                  /node/1256", "test-usi.ace.gbuild.net                                  /node/1261", "test-usi.ace.gbuild.net                                  /node/1266", "test-usi.ace.gbuild.net                                  /node/1271", "test-usi.ace.gbuild.net                                  /node/1276", "test-usi.ace.gbuild.net                                  /node/1281", "test-usi.ace.gbuild.net                                  /node/1286", "test-usi.ace.gbuild.net                                  /node/1291", "test-usi.ace.gbuild.net                                  /node/1301", "test-usi.ace.gbuild.net                                  /node/1306", "test-usi.ace.gbuild.net                                  /node/1311", "test-usi.ace.gbuild.net                                  /node/1316", "test-usi.ace.gbuild.net                                  /node/1321", "test-usi.ace.gbuild.net                                  /node/1326", "test-usi.ace.gbuild.net                                  /node/1331", "test-usi.ace.gbuild.net                                  /node/1336", "test-usi.ace.gbuild.net                                  /node/1341", "test-usi.ace.gbuild.net                                  /node/1346", "test-usi.ace.gbuild.net                                  /node/1351", "test-usi.ace.gbuild.net                                  /node/2061", "test-usi.ace.gbuild.net                                  /node/2066", "test-usi.ace.gbuild.net                                  /node/2071", "test-usi.ace.gbuild.net                                  /node/2206", "test-usi.ace.gbuild.net                                  /node/2211", "test-usi.ace.gbuild.net                                  /node/2216", "test-usi.ace.gbuild.net                                  /node/2221", "test-usi.ace.gbuild.net                                  /node/2226", "test-usi.ace.gbuild.net                                  /node/2236", "test-usi.ace.gbuild.net                                  /node/2256", "test-usi.ace.gbuild.net                                  /node/2311", "test-usi.ace.gbuild.net                                  /node/2316", "test-usi.ace.gbuild.net                                  /node/2331", "test-usi.ace.gbuild.net                                  /node/2336", "test-usi.ace.gbuild.net                                  /node/2341", "test-usi.ace.gbuild.net                                  /node/2346", "test-usi.ace.gbuild.net                                  /node/2351", "test-usi.ace.gbuild.net                                  /node/2356", "test-usi.ace.gbuild.net                                  /node/2361", "test-usi.ace.gbuild.net                                  /node/2366", "test-usi.ace.gbuild.net                                  /node/2371", "test-usi.ace.gbuild.net                                  /node/2376", "test-usi.ace.gbuild.net                                  /node/2381", "test-usi.ace.gbuild.net                                  /node/2386", "test-usi.ace.gbuild.net                                  /node/2396", "test-usi.ace.gbuild.net                                  /node/2401", "test-usi.ace.gbuild.net                                  /node/2406", "test-usi.ace.gbuild.net                                  /node/2411", "test-usi.ace.gbuild.net                                  /node/2416", "test-usi.ace.gbuild.net                                  /node/2431", "test-usi.ace.gbuild.net                                  /node/2436", "test-usi.ace.gbuild.net                                  /node/2441", "test-usi.ace.gbuild.net                                  /node/2446", "test-usi.ace.gbuild.net                                  /node/2476", "test-usi.ace.gbuild.net                                  /node/2481", "test-usi.ace.gbuild.net                                  /node/2486", "test-usi.ace.gbuild.net                                  /node/1721", "test-usi.ace.gbuild.net                                  /node/1726", "test-usi.ace.gbuild.net                                  /node/1731", "test-usi.ace.gbuild.net                                  /node/1736", "test-usi.ace.gbuild.net                                  /node/1746", "test-usi.ace.gbuild.net                                  /node/1751", "test-usi.ace.gbuild.net                                  /node/1821", "test-usi.ace.gbuild.net                                  /node/1826", "test-usi.ace.gbuild.net                                  /node/1831", "test-usi.ace.gbuild.net                                  /node/1841", "test-usi.ace.gbuild.net                                  /node/1851", "test-usi.ace.gbuild.net                                  /node/1871", "test-usi.ace.gbuild.net                                  /node/1881", "test-usi.ace.gbuild.net                                  /node/1886", "test-usi.ace.gbuild.net                                  /node/1891", "test-usi.ace.gbuild.net                                  /node/1901", "test-usi.ace.gbuild.net                                  /node/2246", "test-usi.ace.gbuild.net                                  /node/2271", "test-usi.ace.gbuild.net                                  /node/2276", "test-usi.ace.gbuild.net                                  /node/2281", "test-usi.ace.gbuild.net                                  /node/2286", "test-usi.ace.gbuild.net                                  /node/2291", "test-usi.ace.gbuild.net                                  /node/2296", "test-usi.ace.gbuild.net                                  /node/2301", "test-usi.ace.gbuild.net                                  /node/2306", "test-usi.ace.gbuild.net                                  /node/2491", "test-usi.ace.gbuild.net                                  /node/2241", "test-usi.ace.gbuild.net                                  /node/2251", "test-usi.ace.gbuild.net                                  /node/2421", "test-usi.ace.gbuild.net                                  /node/2456", "test-usi.ace.gbuild.net                                  /node/2461", "test-usi.ace.gbuild.net                                  /node/2471",];
 
accessSniff.start(files, {
    accessibilityLevel: 'WCAG2A',
    reportType: 'json',
    reportLocation : 'reports',
    domElement: false,
    verbose:false,
    reportLevels: {
      notice: false,
      warning: false,
      error: true
    }
  });

  console.log('Your report can be found in the reports folder')




 

  
