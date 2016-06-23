<cfset form.a_1601 = form.a_1601_val>
<!--- <cfdump var="#form#"><cfabort> --->
<cfset fields_to_check1="I_SETTLEMENTDATE,A_101,A_401,A_102,A_402,A_103,A_403_A,A_403_B,A_104_A,A_104_B,A_404_A,A_404_B,A_105_A,A_105_B,A_405_A,A_405_B,A_106,A_406,A_107,A_407,A_108,A_408,A_109_A,A_109_B,A_409_A,A_409_B,A_110_A,A_110_B,A_410_A,A_410_B,A_111_A,A_111_B,A_411_A,A_411_B,A_112_A,A_112_B,A_412_A,A_412_B,A_120,A_420,A_201,A_501,A_202,A_502,A_203,A_503,A_204_A,A_204_B,A_504,A_205_A,A_205_B,A_505,A_206_A,A_206_B,A_506_A,A_506_B,A_207_A,A_207_B,A_507_A,A_507_B,A_208_A,A_208_B,A_508_A,A_508_B,A_209_A,A_209_B,A_509_A,A_509_B,A_210,A_510,A_211,A_511,A_212,A_512,A_213_A,A_213_B,A_513_A,A_513_B,A_214_A,A_214_B,A_514_A,A_514_B,A_215_A,A_215_B,A_515_A,A_515_B,A_216_A,A_216_B,A_516_A,A_516_B,A_217_A,A_217_B,A_517_A,A_517_B,A_218_A,A_218_B,A_518_A,A_518_B,A_219_A,A_219_B,A_519_A,A_519_B,A_220,A_520,A_301,A_601,A_302,A_602,A_303,A_603,A_1601">

<cfset fields_to_check2="A_700_A,A_700_B,A_700_C,A_701_A,A_701_B,A_702_A,A_702_B,A_703_A,A_703_B,A_801_A,A_801_D,A_801_G,A_801_B,A_801_C,A_802_A,A_802_D,A_802_G,A_802_B,A_802_C,A_803_A,A_803_B,A_803_C,A_804_A,A_804_B,A_804_C,A_805_A,A_805_C,A_805_B,A_805_D,A_806_A,A_806_C,A_806_B,A_806_D,A_807_A,A_807_C,A_807_B,A_807_D,A_808_A,A_808_C,A_808_B,A_808_D,A_809_A,A_809_C,A_809_B,A_809_D,A_810_A,A_810_C,A_810_B,A_810_D,A_811_A,A_811_C,A_811_B,A_811_D,A_901_A,A_901_B,A_901,A_901_D,A_901_C,A_902_A,A_902_B,A_902_C,A_902_D,A_903_A,A_903_B,A_903_C,A_903_D,A_904_A,A_904_C,A_904_B,A_904_D,A_905_A,A_905_B,A_1001_A,A_1001_B,A_1001_C,A_1001_D,A_1002_A,A_1002_B,A_1002_C,A_1002_D,A_1003_A,A_1003_B,A_1003_C,A_1003_D,A_1004_A,A_1004_B,A_1004_C,A_1004_D,A_1005_A,A_1005_B,A_1005_C,A_1005_D,A_1006_A,A_1006_B,A_1101_C,A_1101_A,A_1101_B,A_1102_A,A_1102_B,A_1103_C,A_1103_A,A_1103_B,A_1104_C,A_1104_A,A_1104_B,A_1105_C,A_1105_A,A_1105_B,A_1106_C,A_1106_A,A_1106_B,A_1107_D,A_1107_A,A_1107_B,A_1107_C,A_1108_A,A_1108_B,A_1108_C,A_1109_A,A_1110_A,A_1111_TEXT,A_1111_C,A_1111_A,A_1111_B,A_1112_TEXT,A_1112_C,A_1112_A,A_1112_B,A_1113_TEXT,A_1113_C,A_1113_A,A_1113_B,A_1114_TEXT,A_1114_C,A_1114_A,A_1114_B,A_1201_A,A_1201_B,A_1201_C,A_1201_D,A_1201_E,A_1202_A,A_1202_B,A_1202_C,A_1202_D,A_1202_E,A_1203_A,A_1203_B,A_1203_C,A_1203_D,A_1203_E,A_1204_A,A_1204_B,A_1204_C,A_1205_TEXT,A_1205_C,A_1205_A,A_1205_B,A_1301_A,A_1301_B,A_1302_A,A_1302_B,A_1303_TEXT,A_1303_C,A_1303_A,A_1303_B,A_1304_TEXT,A_1304_C,A_1304_A,A_1304_B,A_1305_TEXT,A_1305_C,A_1305_A,A_1305_B,A_1306_A,A_1306_D,A_1306_B,A_1306_C,A_1307_A,A_1307_D,A_1307_B,A_1307_C,A_1308_B,A_1308_C,A_1400_A,A_1400_B,A_1501_A,A_1501_B,A_1501_C,A_1502_A,A_1502_B,A_1502_C,A_1503_A,A_1503_B,A_1503_C,A_1504_A,A_1504_B,A_1504_C,A_1505_A,A_1505_B,A_1505_C,A_1506_A,A_1506_B,A_1506_C,A_1507_A,A_1507_B,A_1507_C,A_1508_A,A_1508_B,A_1508_C,A_1509_A,A_1509_B,A_1509_C,A_1510_A,A_1510_B,A_1510_C,A_1511_A,A_1511_B,A_1511_C,A_1512_A,A_1512_B,A_1512_C,A_1513_A,A_1513_B,A_1513_C,A_1514_A,A_1514_B,A_1514_C,A_1515_A,A_1515_B,A_1515_C,A_1516_A,A_1516_B,A_1516_C,A_1517_A,A_1517_B,A_1517_C,A_1518_A,A_1518_B,A_1518_C,A_1519_A,A_1519_B,A_1519_C,A_1520,A_1520_B">



<cfparam name="a_trigger" default="0">
<cfparam name="uid" default="">
<cfparam name="al" default="">
<!--- <cfparam name="a_103" default="">
<cfparam name="a_104_a" default="">
<cfparam name="a_104_b" default="">
<cfparam name="a_105_a" default="">
<cfparam name="a_1601" default="">
<cfparam name="a_105_b" default="">
<cfparam name="a_120" default="">
<cfparam name="a_504" default="">
<cfparam name="a_505" default="">
<cfparam name="a_301" default="">
<cfparam name="a_302" default="">
<cfparam name="a_303" default="">
<cfparam name="a_801_a" default="">
<cfparam name="a_801_b" default="">
<cfparam name="a_801_d" default="">
<cfparam name="a_802_a" default="">
<cfparam name="a_802_b" default="">
<cfparam name="a_802_d" default="">
<cfparam name="a_803_a" default="">
<cfparam name="a_803_b" default="">
<cfparam name="a_804_a" default="">
<cfparam name="a_804_b" default="">
<cfparam name="a_805_a" default="">
<cfparam name="a_805_b" default="">
<cfparam name="a_806_a" default="">
<cfparam name="a_806_b" default="">
<cfparam name="a_807_a" default="">
<cfparam name="a_807_b" default="">
<cfparam name="a_808_a" default="">
<cfparam name="a_808_b" default="">
<cfparam name="a_809_a" default="">
<cfparam name="a_809_b" default="">
<cfparam name="a_810_a" default="">
<cfparam name="a_810_b" default="">
<cfparam name="a_811_a" default="">
<cfparam name="a_811_b" default="">
<cfparam name="a_901_a" default="">
<cfparam name="a_901_b" default="">
<cfparam name="a_901_c" default="">
<cfparam name="a_901_d" default="">
<cfparam name="a_902_a" default="">
<cfparam name="a_902_b" default="">
<cfparam name="a_902_c" default="">
<cfparam name="a_903_a" default="">
<cfparam name="a_903_b" default="">
<cfparam name="a_903_c" default="">
<cfparam name="a_904_a" default="">
<cfparam name="a_904_b" default="">
<cfparam name="a_905_a" default="">
<cfparam name="a_1006_a" default="">
<cfparam name="a_1001_a" default="">
<cfparam name="a_1001_b" default="">
<cfparam name="a_1001_c" default="">
<cfparam name="a_1002_a" default="">
<cfparam name="a_1002_b" default="">
<cfparam name="a_1002_c" default="">
<cfparam name="a_1003_a" default="">
<cfparam name="a_1003_b" default="">
<cfparam name="a_1003_c" default="">
<cfparam name="a_1004_a" default="">
<cfparam name="a_1004_b" default="">
<cfparam name="a_1004_c" default="">
<cfparam name="a_1005_a" default="">
<cfparam name="a_1005_b" default="">
<cfparam name="a_1005_c" default="">
<cfparam name="a_1400_a" default="">
<cfparam name="a_1501_a" default="">
<cfparam name="a_1501_b" default="">
<cfparam name="a_1501_c" default="">
<cfparam name="a_1502_a" default="">
<cfparam name="a_1502_b" default="">
<cfparam name="a_1502_c" default="">
<cfparam name="a_1503_a" default="">
<cfparam name="a_1503_b" default="">
<cfparam name="a_1503_c" default="">
<cfparam name="a_1504_a" default="">
<cfparam name="a_1504_b" default="">
<cfparam name="a_1504_c" default="">
<cfparam name="a_1505_a" default="">
<cfparam name="a_1505_b" default="">
<cfparam name="a_1505_c" default="">
<cfparam name="a_1506_a" default="">
<cfparam name="a_1506_b" default="">
<cfparam name="a_1506_c" default="">
<cfparam name="a_1507_a" default="">
<cfparam name="a_1507_b" default="">
<cfparam name="a_1507_c" default="">
<cfparam name="a_1508_a" default="">
<cfparam name="a_1508_b" default="">
<cfparam name="a_1508_c" default="">
<cfparam name="a_1509_a" default="">
<cfparam name="a_1509_b" default="">
<cfparam name="a_1509_c" default="">
<cfparam name="a_1510_a" default="">
<cfparam name="a_1510_b" default="">
<cfparam name="a_1510_c" default="">
<cfparam name="a_1511_a" default="">
<cfparam name="a_1511_b" default="">
<cfparam name="a_1511_c" default="">
<cfparam name="a_1512_a" default="">
<cfparam name="a_1512_b" default="">
<cfparam name="a_1512_c" default="">
<cfparam name="a_1513_a" default="">
<cfparam name="a_1513_b" default="">
<cfparam name="a_1513_c" default="">
<cfparam name="a_1514_a" default="">
<cfparam name="a_1514_b" default="">
<cfparam name="a_1514_c" default="">
<cfparam name="a_1515_a" default="">
<cfparam name="a_1515_b" default="">
<cfparam name="a_1515_c" default="">
<cfparam name="a_1516_a" default="">
<cfparam name="a_1516_b" default="">
<cfparam name="a_1516_c" default="">
<cfparam name="a_1517_a" default="">
<cfparam name="a_1517_b" default="">
<cfparam name="a_1517_c" default="">
<cfparam name="a_1518_a" default="">
<cfparam name="a_1518_b" default="">
<cfparam name="a_1518_c" default="">
<cfparam name="a_1519_a" default="">
<cfparam name="a_1519_b" default="">
<cfparam name="a_1519_c" default="">
<cfparam name="a_1520" default="">
<cfparam name="a_1520_a" default=""> --->

<cfparam name="A_1001_A" default="">
<cfparam name="A_1001_B" default="">
<cfparam name="A_1001_C" default="">
<cfparam name="A_1001_D" default="">
<cfparam name="A_1002_A" default="">
<cfparam name="A_1002_B" default="">
<cfparam name="A_1002_C" default="">
<cfparam name="A_1002_D" default="">
<cfparam name="A_1003_A" default="">
<cfparam name="A_1003_B" default="">
<cfparam name="A_1003_C" default="">
<cfparam name="A_1003_D" default="">
<cfparam name="A_1004_A" default="">
<cfparam name="A_1004_B" default="">
<cfparam name="A_1004_C" default="">
<cfparam name="A_1004_D" default="">
<cfparam name="A_1005_A" default="">
<cfparam name="A_1005_B" default="">
<cfparam name="A_1005_C" default="">
<cfparam name="A_1005_D" default="">
<cfparam name="A_1006_A" default="">
<cfparam name="A_1006_B" default="">
<cfparam name="A_1006_VAL" default="">
<cfparam name="A_101" default="">
<cfparam name="A_102" default="">
<cfparam name="A_103" default="">
<cfparam name="A_104_A" default="">
<cfparam name="A_104_B" default="">
<cfparam name="A_104_VAL" default="">
<cfparam name="A_105_A" default="">
<cfparam name="A_105_B" default="">
<cfparam name="A_105_VAL" default="">
<cfparam name="A_106" default="">
<cfparam name="A_107" default="">
<cfparam name="A_108" default="">
<cfparam name="A_109_A" default="">
<cfparam name="A_109_B" default="">
<cfparam name="A_110_A" default="">
<cfparam name="A_110_B" default="">
<cfparam name="A_1101_A" default="">
<cfparam name="A_1101_B" default="">
<cfparam name="A_1101_C" default="">
<cfparam name="A_1102_A" default="">
<cfparam name="A_1102_B" default="">
<cfparam name="A_1103_A" default="">
<cfparam name="A_1103_B" default="">
<cfparam name="A_1103_C" default="">
<cfparam name="A_1104_A" default="">
<cfparam name="A_1104_B" default="">
<cfparam name="A_1104_C" default="">
<cfparam name="A_1105_A" default="">
<cfparam name="A_1105_B" default="">
<cfparam name="A_1105_C" default="">
<cfparam name="A_1106_A" default="">
<cfparam name="A_1106_B" default="">
<cfparam name="A_1106_C" default="">
<cfparam name="A_1107_A" default="">
<cfparam name="A_1107_B" default="">
<cfparam name="A_1107_C" default="">
<cfparam name="A_1107_D" default="">
<cfparam name="A_1108_A" default="">
<cfparam name="A_1108_B" default="">
<cfparam name="A_1108_C" default="">
<cfparam name="A_1109_A" default="">
<cfparam name="A_111_A" default="">
<cfparam name="A_111_B" default="">
<cfparam name="A_1110_A" default="">
<cfparam name="A_1111_A" default="">
<cfparam name="A_1111_B" default="">
<cfparam name="A_1111_C" default="">
<cfparam name="A_1111_TEXT" default="">
<cfparam name="A_1112_A" default="">
<cfparam name="A_1112_B" default="">
<cfparam name="A_1112_C" default="">
<cfparam name="A_1112_TEXT" default="">
<cfparam name="A_1113_A" default="">
<cfparam name="A_1113_B" default="">
<cfparam name="A_1113_C" default="">
<cfparam name="A_1113_TEXT" default="">
<cfparam name="A_1114_A" default="">
<cfparam name="A_1114_B" default="">
<cfparam name="A_1114_C" default="">
<cfparam name="A_1114_TEXT" default="">
<cfparam name="A_112_A" default="">
<cfparam name="A_112_B" default="">
<cfparam name="A_120" default="">
<cfparam name="A_1201_A" default="">
<cfparam name="A_1201_B" default="">
<cfparam name="A_1201_C" default="">
<cfparam name="A_1201_D" default="">
<cfparam name="A_1201_E" default="">
<cfparam name="A_1202_A" default="">
<cfparam name="A_1202_B" default="">
<cfparam name="A_1202_C" default="">
<cfparam name="A_1202_D" default="">
<cfparam name="A_1202_E" default="">
<cfparam name="A_1203_A" default="">
<cfparam name="A_1203_B" default="">
<cfparam name="A_1203_C" default="">
<cfparam name="A_1203_D" default="">
<cfparam name="A_1203_E" default="">
<cfparam name="A_1204_A" default="">
<cfparam name="A_1204_B" default="">
<cfparam name="A_1204_C" default="">
<cfparam name="A_1205_A" default="">
<cfparam name="A_1205_B" default="">
<cfparam name="A_1205_C" default="">
<cfparam name="A_1205_TEXT" default="">
<cfparam name="form.A_1205_TEXT" default="">
<cfparam name="A_1301_A" default="">
<cfparam name="A_1301_B" default="">
<cfparam name="A_1302_A" default="">
<cfparam name="A_1302_B" default="">
<cfparam name="A_1303_A" default="">
<cfparam name="A_1303_B" default="">
<cfparam name="A_1303_C" default="">
<cfparam name="A_1303_TEXT" default="">
<cfparam name="A_1304_A" default="">
<cfparam name="A_1304_B" default="">
<cfparam name="A_1304_C" default="">
<cfparam name="A_1304_TEXT" default="">
<cfparam name="A_1305_A" default="">
<cfparam name="A_1305_B" default="">
<cfparam name="A_1305_C" default="">
<cfparam name="A_1305_TEXT" default="">
<cfparam name="A_1306_A" default="">
<cfparam name="A_1306_B" default="">
<cfparam name="A_1306_C" default="">
<cfparam name="A_1306_D" default="">
<cfparam name="A_1307_A" default="">
<cfparam name="A_1307_B" default="">
<cfparam name="A_1307_C" default="">
<cfparam name="A_1307_D" default="">
<cfparam name="A_1308_B" default="">
<cfparam name="A_1308_C" default="">
<cfparam name="A_1400_A" default="">
<cfparam name="A_1400_B" default="">
<cfparam name="A_1501_A" default="">
<cfparam name="A_1501_B" default="">
<cfparam name="A_1501_C" default="">
<cfparam name="A_1501_VAL" default="">
<cfparam name="A_1502_A" default="">
<cfparam name="A_1502_B" default="">
<cfparam name="A_1502_C" default="">
<cfparam name="A_1502_VAL" default="">
<cfparam name="A_1503_A" default="">
<cfparam name="A_1503_B" default="">
<cfparam name="A_1503_C" default="">
<cfparam name="A_1503_VAL" default="">
<cfparam name="A_1504_A" default="">
<cfparam name="A_1504_B" default="">
<cfparam name="A_1504_C" default="">
<cfparam name="A_1504_VAL" default="">
<cfparam name="A_1505_A" default="">
<cfparam name="A_1505_B" default="">
<cfparam name="A_1505_C" default="">
<cfparam name="A_1505_VAL" default="">
<cfparam name="A_1506_A" default="">
<cfparam name="A_1506_B" default="">
<cfparam name="A_1506_C" default="">
<cfparam name="A_1506_VAL" default="">
<cfparam name="A_1507_A" default="">
<cfparam name="A_1507_B" default="">
<cfparam name="A_1507_C" default="">
<cfparam name="A_1507_VAL" default="">
<cfparam name="A_1508_A" default="">
<cfparam name="A_1508_B" default="">
<cfparam name="A_1508_C" default="">
<cfparam name="A_1508_VAL" default="">
<cfparam name="A_1509_A" default="">
<cfparam name="A_1509_B" default="">
<cfparam name="A_1509_C" default="">
<cfparam name="A_1509_VAL" default="">
<cfparam name="A_1510_A" default="">
<cfparam name="A_1510_B" default="">
<cfparam name="A_1510_C" default="">
<cfparam name="A_1510_VAL" default="">
<cfparam name="A_1511_A" default="">
<cfparam name="A_1511_B" default="">
<cfparam name="A_1511_C" default="">
<cfparam name="A_1511_VAL" default="">
<cfparam name="A_1512_A" default="">
<cfparam name="A_1512_B" default="">
<cfparam name="A_1512_C" default="">
<cfparam name="A_1512_VAL" default="">
<cfparam name="A_1513_A" default="">
<cfparam name="A_1513_B" default="">
<cfparam name="A_1513_C" default="">
<cfparam name="A_1513_VAL" default="">
<cfparam name="A_1514_A" default="">
<cfparam name="A_1514_B" default="">
<cfparam name="A_1514_C" default="">
<cfparam name="A_1514_VAL" default="">
<cfparam name="A_1515_A" default="">
<cfparam name="A_1515_B" default="">
<cfparam name="A_1515_C" default="">
<cfparam name="A_1515_VAL" default="">
<cfparam name="A_1516_A" default="">
<cfparam name="A_1516_B" default="">
<cfparam name="A_1516_C" default="">
<cfparam name="A_1516_VAL" default="">
<cfparam name="A_1517_A" default="">
<cfparam name="A_1517_B" default="">
<cfparam name="A_1517_C" default="">
<cfparam name="A_1517_VAL" default="">
<cfparam name="A_1518_A" default="">
<cfparam name="A_1518_B" default="">
<cfparam name="A_1518_C" default="">
<cfparam name="A_1518_VAL" default="">
<cfparam name="A_1519_A" default="">
<cfparam name="A_1519_B" default="">
<cfparam name="A_1519_C" default="">
<cfparam name="A_1519_VAL" default="">
<cfparam name="A_1520" default="">
<cfparam name="A_1520_B" default="">

<cfparam name="A_1601_VAL" default=0>
<cfparam name="form.A_1601" default="#form.A_1601_val#">
<cfparam name="A_201" default="">
<cfparam name="A_202" default="">
<cfparam name="A_203" default="">
<cfparam name="A_204_A" default="">
<cfparam name="A_204_B" default="">
<cfparam name="A_205_A" default="">
<cfparam name="A_205_B" default="">
<cfparam name="A_206_A" default="">
<cfparam name="A_206_B" default="">
<cfparam name="A_207_A" default="">
<cfparam name="A_207_B" default="">
<cfparam name="A_208_A" default="">
<cfparam name="A_208_B" default="">
<cfparam name="A_209_A" default="">
<cfparam name="A_209_B" default="">
<cfparam name="A_210" default="">
<cfparam name="A_211" default="">
<cfparam name="A_212" default="">
<cfparam name="A_213_A" default="">
<cfparam name="A_213_B" default="">
<cfparam name="A_214_A" default="">
<cfparam name="A_214_B" default="">
<cfparam name="A_215_A" default="">
<cfparam name="A_215_B" default="">
<cfparam name="A_216_A" default="">
<cfparam name="A_216_B" default="">
<cfparam name="A_217_A" default="">
<cfparam name="A_217_B" default="">
<cfparam name="A_218_A" default="">
<cfparam name="A_218_B" default="">
<cfparam name="A_219_A" default="">
<cfparam name="A_219_B" default="">
<cfparam name="A_220" default="">
<cfparam name="A_301" default="">
<cfparam name="A_302" default="">
<cfparam name="A_303" default="">
<cfparam name="A_401" default="">
<cfparam name="A_402" default="">
<cfparam name="A_403_A" default="">
<cfparam name="A_403_B" default="">
<cfparam name="A_404_A" default="">
<cfparam name="A_404_B" default="">
<cfparam name="A_405_A" default="">
<cfparam name="A_405_B" default="">
<cfparam name="A_406" default="">
<cfparam name="A_407" default="">
<cfparam name="A_408" default="">
<cfparam name="A_409_A" default="">
<cfparam name="A_409_B" default="">
<cfparam name="A_410_A" default="">
<cfparam name="A_410_B" default="">
<cfparam name="A_411_A" default="">
<cfparam name="A_411_B" default="">
<cfparam name="A_412_A" default="">
<cfparam name="A_412_B" default="">
<cfparam name="A_420" default="">
<cfparam name="A_501" default="">
<cfparam name="A_502" default="">
<cfparam name="A_503" default="">
<cfparam name="A_504" default="">
<cfparam name="A_505" default="">
<cfparam name="A_506_A" default="">
<cfparam name="A_506_B" default="">
<cfparam name="A_507_A" default="">
<cfparam name="A_507_B" default="">
<cfparam name="A_508_A" default="">
<cfparam name="A_508_B" default="">
<cfparam name="A_509_A" default="">
<cfparam name="A_509_B" default="">
<cfparam name="A_510" default="">
<cfparam name="A_511" default="">
<cfparam name="A_512" default="">
<cfparam name="A_513_A" default="">
<cfparam name="A_513_B" default="">
<cfparam name="A_514_A" default="">
<cfparam name="A_514_B" default="">
<cfparam name="A_515_A" default="">
<cfparam name="A_515_B" default="">
<cfparam name="A_516_A" default="">
<cfparam name="A_516_B" default="">
<cfparam name="A_517_A" default="">
<cfparam name="A_517_B" default="">
<cfparam name="A_518_A" default="">
<cfparam name="A_518_B" default="">
<cfparam name="A_519_A" default="">
<cfparam name="A_519_B" default="">
<cfparam name="A_520" default="">
<cfparam name="A_601" default="">
<cfparam name="A_602" default="">
<cfparam name="A_603" default="">
<cfparam name="A_700_A" default="">
<cfparam name="A_700_B" default="">
<cfparam name="A_700_C" default="">
<cfparam name="A_701_A" default="">
<cfparam name="A_701_B" default="">
<cfparam name="A_702_A" default="">
<cfparam name="A_702_B" default="">
<cfparam name="A_703_A" default="">
<cfparam name="A_703_B" default="">
<cfparam name="A_801_A" default="">
<cfparam name="A_801_B" default="">
<cfparam name="A_801_C" default="">
<cfparam name="A_801_D" default="">
<cfparam name="A_801_G" default="">
<cfparam name="A_802_A" default="">
<cfparam name="A_802_B" default="">
<cfparam name="A_802_C" default="">
<cfparam name="A_802_D" default="">
<cfparam name="A_802_G" default="">
<cfparam name="A_803_A" default="">
<cfparam name="A_803_B" default="">
<cfparam name="A_803_C" default="">
<cfparam name="A_803_VAL" default="">
<cfparam name="A_804_A" default="">
<cfparam name="A_804_B" default="">
<cfparam name="A_804_C" default="">
<cfparam name="A_804_VAL" default="">
<cfparam name="A_805_A" default="">
<cfparam name="A_805_B" default="">
<cfparam name="A_805_C" default="">
<cfparam name="A_805_D" default="">
<cfparam name="A_805_VAL" default="">
<cfparam name="A_806_A" default="">
<cfparam name="A_806_B" default="">
<cfparam name="A_806_C" default="">
<cfparam name="A_806_D" default="">
<cfparam name="A_806_VAL" default="">
<cfparam name="A_807_A" default="">
<cfparam name="A_807_B" default="">
<cfparam name="A_807_C" default="">
<cfparam name="A_807_D" default="">
<cfparam name="A_807_VAL" default="">
<cfparam name="A_808_A" default="">
<cfparam name="A_808_B" default="">
<cfparam name="A_808_C" default="">
<cfparam name="A_808_D" default="">
<cfparam name="A_808_VAL" default="">
<cfparam name="A_809_A" default="">
<cfparam name="A_809_B" default="">
<cfparam name="A_809_C" default="">
<cfparam name="A_809_D" default="">
<cfparam name="A_809_VAL" default="">
<cfparam name="A_810_A" default="">
<cfparam name="A_810_B" default="">
<cfparam name="A_810_C" default="">
<cfparam name="A_810_D" default="">
<cfparam name="A_810_VAL" default="">
<cfparam name="A_811_A" default="">
<cfparam name="A_811_B" default="">
<cfparam name="A_811_C" default="">
<cfparam name="A_811_D" default="">
<cfparam name="A_811_VAL" default="">
<cfparam name="A_901" default="">
<cfparam name="A_901_A" default="">
<cfparam name="A_901_B" default="">
<cfparam name="A_901_C" default="">
<cfparam name="A_901_D" default="">
<cfparam name="A_902_A" default="">
<cfparam name="A_902_B" default="">
<cfparam name="A_902_C" default="">
<cfparam name="A_902_D" default="">
<cfparam name="A_902_VAL" default="">
<cfparam name="A_903_A" default="">
<cfparam name="A_903_B" default="">
<cfparam name="A_903_C" default="">
<cfparam name="A_903_D" default="">
<cfparam name="A_903_VAL" default="">
<cfparam name="A_904_A" default="">
<cfparam name="A_904_B" default="">
<cfparam name="A_904_C" default="">
<cfparam name="A_904_D" default="">
<cfparam name="A_904_VAL" default="">
<cfparam name="A_905_A" default="">
<cfparam name="A_905_B" default="">
<cfparam name="A_905_VAL" default="">
<cfparam name="FIRST_INS_PREMIUM" default="">
<cfparam name="GET_INS_COMPANY" default="">
<cfparam name="A_1205_TEXT" default="">
<cfparam name="I_SETTLEMENTDATE" default="">
<cfparam name="LOAN_NUMBER" default="">
<cfparam name="SECOND_INS_PREMIUM" default="">
<cfparam name="TEMP" default="">
<cfparam name="TEMP1" default="">
<cfparam name="TEMP10" default="">
<cfparam name="TEMP1006" default="">
<cfparam name="TEMP104" default="">
<cfparam name="TEMP105" default="">
<cfparam name="TEMP11" default="">
<cfparam name="TEMP12" default="">
<cfparam name="TEMP13" default="">
<cfparam name="TEMP14" default="">
<cfparam name="TEMP15" default="">
<cfparam name="TEMP16" default="">
<cfparam name="TEMP1601" default="">
<cfparam name="TEMP17" default="">
<cfparam name="TEMP18" default="">
<cfparam name="TEMP19" default="">
<cfparam name="TEMP2" default="">
<cfparam name="TEMP20" default="">
<cfparam name="TEMP21" default="">
<cfparam name="TEMP22" default="">
<cfparam name="TEMP23" default="">
<cfparam name="TEMP24" default="">
<cfparam name="TEMP25" default="">
<cfparam name="TEMP26" default="">
<cfparam name="TEMP27" default="">
<cfparam name="TEMP28" default="">
<cfparam name="TEMP29" default="">
<cfparam name="TEMP3" default="">
<cfparam name="TEMP30" default="">
<cfparam name="TEMP31" default="">
<cfparam name="TEMP4" default="">
<cfparam name="TEMP5" default="">
<cfparam name="TEMP6" default="">
<cfparam name="TEMP7" default="">
<cfparam name="TEMP8" default="">
<cfparam name="TEMP9" default="">
<cfparam name="TITLE_FT_AGENCY_NAME" default="">


<CFQUERY datasource="#request.dsn#" NAME="RU">
	SELECT *
	FROM first_admin
	WHERE ID = #uid#
</CFQUERY>



	<CFQUERY datasource="#request.dsn#" NAME="read_hud1_before">
			Select * from hud_form_title_pg1
			WHERE title_id = #rec_id#
	</cfquery>
	<CFQUERY datasource="#request.dsn#" NAME="read_hud2_before">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id#
	</cfquery>

	<cfif #a_101# eq "0">
	<cfset a_101 = "">
	</cfif>
	<cfif #a_104_b# eq "0">
	<cfset a_104_b = "">
	</cfif>
	<cfif #a_105_b# eq "0">
	<cfset a_105_b = "">
	</cfif>
	<cfif #a_109_b# eq "0">
	<cfset a_109_b = "">
	</cfif>
	<cfif #a_504# eq "0">
	<cfset a_504 = "">
	</cfif>
	<cfif #a_505# eq "0">
	<cfset a_505 = "">
	</cfif>
	<cfif #a_1308_b# eq "0">
	<cfset a_1308_b = "">
	</cfif>
	<cfif #a_1520# eq "0">
	<cfset a_1520 = "">
	</cfif>







<CFQUERY datasource="#request.dsn#">
			UPDATE hud_form_title_pg1
			SET
A_101 = '#A_101#',
A_102 = '#A_102#',
A_103 = '#A_103#',
A_104_A = '#A_104_A#',
A_104_B = '#A_104_B#',
A_104_VAL = '#A_104_VAL#',
A_105_A = '#A_105_A#',
A_105_B = '#A_105_B#',
A_105_VAL = '#A_105_VAL#',
A_106 = '#A_106#',
A_107 = '#A_107#',
A_108 = '#A_108#',
A_109_A = '#A_109_A#',
A_109_B = '#A_109_B#',
A_110_A = '#A_110_A#',
A_110_B = '#A_110_B#',
A_111_A = '#A_111_A#',
A_111_B = '#A_111_B#',
A_112_A = '#A_112_A#',
A_112_B = '#A_112_B#',
A_120 = '#A_120#',
A_201 = '#A_201#',
A_202 = '#A_202#',
A_203 = '#A_203#',
A_204_A = '#A_204_A#',
A_204_B = '#A_204_B#',
A_205_A = '#A_205_A#',
A_205_B = '#A_205_B#',
A_206_A = '#A_206_A#',
A_206_B = '#A_206_B#',
A_207_A = '#A_207_A#',
A_207_B = '#A_207_B#',
A_208_A = '#A_208_A#',
A_208_B = '#A_208_B#',
A_209_A = '#A_209_A#',
A_209_B = '#A_209_B#',
A_210 = '#A_210#',
A_211 = '#A_211#',
A_212 = '#A_212#',
A_213_A = '#A_213_A#',
A_213_B = '#A_213_B#',
A_214_A = '#A_214_A#',
A_214_B = '#A_214_B#',
A_215_A = '#A_215_A#',
A_215_B = '#A_215_B#',
A_216_A = '#A_216_A#',
A_216_B = '#A_216_B#',
A_217_A = '#A_217_A#',
A_217_B = '#A_217_B#',
A_218_A = '#A_218_A#',
A_218_B = '#A_218_B#',
A_219_A = '#A_219_A#',
A_219_B = '#A_219_B#',
A_220 = '#A_220#',
A_301 = '#A_301#',
A_302 = '#A_302#',
A_303 = '#A_303#',
A_401 = '#A_401#',
A_402 = '#A_402#',
A_403_A = '#A_403_A#',
A_403_B = '#A_403_B#',
A_404_A = '#A_404_A#',
A_404_B = '#A_404_B#',
A_405_A = '#A_405_A#',
A_405_B = '#A_405_B#',
A_406 = '#A_406#',
A_407 = '#A_407#',
A_408 = '#A_408#',
A_409_A = '#A_409_A#',
A_409_B = '#A_409_B#',
A_410_A = '#A_410_A#',
A_410_B = '#A_410_B#',
A_411_A = '#A_411_A#',
A_411_B = '#A_411_B#',
A_412_A = '#A_412_A#',
A_412_B = '#A_412_B#',
A_420 = '#A_420#',
A_501 = '#A_501#',
A_502 = '#A_502#',
A_503 = '#A_503#',
A_504 = '#A_504#',
A_505 = '#A_505#',
A_506_A = '#A_506_A#',
A_506_B = '#A_506_B#',
A_507_A = '#A_507_A#',
A_507_B = '#A_507_B#',
A_508_A = '#A_508_A#',
A_508_B = '#A_508_B#',
A_509_A = '#A_509_A#',
A_509_B = '#A_509_B#',
A_510 = '#A_510#',
A_511 = '#A_511#',
A_512 = '#A_512#',
A_513_A = '#A_513_A#',
A_513_B = '#A_513_B#',
A_514_A = '#A_514_A#',
A_514_B = '#A_514_B#',
A_515_A = '#A_515_A#',
A_515_B = '#A_515_B#',
A_516_A = '#A_516_A#',
A_516_B = '#A_516_B#',
A_517_A = '#A_517_A#',
A_517_B = '#A_517_B#',
A_518_A = '#A_518_A#',
A_518_B = '#A_518_B#',
A_519_A = '#A_519_A#',
A_519_B = '#A_519_B#',
A_520 = '#A_520#',
A_601 = '#A_601#',
A_602 = '#A_602#',
A_603 = '#A_603#',
			a_1601 = '#a_1601#',
			I_SettlementDate = '#i_settlementDate#'
			WHERE title_id = #rec_id#
			</cfquery>
<CFQUERY datasource="#request.dsn#">
			UPDATE title
			SET
			loan_number = '#loan_number#'

			WHERE title_id = #rec_id#
			</cfquery>
<CFQUERY datasource="#request.dsn#">
			UPDATE hud_form_title_pg2
			SET A_700_A = '#A_700_A#',
A_700_B = '#A_700_B#',
A_700_C = '#A_700_C#',
A_701_A = '#A_701_A#',
A_701_B = '#A_701_B#',
A_702_A = '#A_702_A#',
A_702_B = '#A_702_B#',
A_703_A = '#A_703_A#',
A_703_B = '#A_703_B#',
A_801_A = '#A_801_A#',
A_801_B = '#A_801_B#',
A_801_C = '#A_801_C#',
A_801_D = '#A_801_D#',
A_801_G = '#A_801_G#',
A_802_A = '#A_802_A#',
A_802_B = '#A_802_B#',
A_802_C = '#A_802_C#',
A_802_D = '#A_802_D#',
A_802_G = '#A_802_G#',
A_803_A = '#A_803_A#',
A_803_B = '#A_803_B#',
A_803_C = '#A_803_C#',
A_803_VAL = '#A_803_VAL#',
A_804_A = '#A_804_A#',
A_804_B = '#A_804_B#',
A_804_C = '#A_804_C#',
A_804_VAL = '#A_804_VAL#',
A_805_A = '#A_805_A#',
A_805_B = '#A_805_B#',
A_805_C = '#A_805_C#',
A_805_D = '#A_805_D#',
A_805_VAL = '#A_805_VAL#',
A_806_A = '#A_806_A#',
A_806_B = '#A_806_B#',
A_806_C = '#A_806_C#',
A_806_D = '#A_806_D#',
A_806_VAL = '#A_806_VAL#',
A_807_A = '#A_807_A#',
A_807_B = '#A_807_B#',
A_807_C = '#A_807_C#',
A_807_D = '#A_807_D#',
A_807_VAL = '#A_807_VAL#',
A_808_A = '#A_808_A#',
A_808_B = '#A_808_B#',
A_808_C = '#A_808_C#',
A_808_D = '#A_808_D#',
A_808_VAL = '#A_808_VAL#',
A_809_A = '#A_809_A#',
A_809_B = '#A_809_B#',
A_809_C = '#A_809_C#',
A_809_D = '#A_809_D#',
A_809_VAL = '#A_809_VAL#',
A_810_A = '#A_810_A#',
A_810_B = '#A_810_B#',
A_810_C = '#A_810_C#',
A_810_D = '#A_810_D#',
A_810_VAL = '#A_810_VAL#',
A_811_A = '#A_811_A#',
A_811_B = '#A_811_B#',
A_811_C = '#A_811_C#',
A_811_D = '#A_811_D#',
A_811_VAL = '#A_811_VAL#',
A_901 = '#A_901#',
A_901_A = '#A_901_A#',
A_901_B = '#A_901_B#',
A_901_C = '#A_901_C#',
A_901_D = '#A_901_D#',
A_902_A = '#A_902_A#',
A_902_B = '#A_902_B#',
A_902_C = '#A_902_C#',
A_902_D = '#A_902_D#',
A_902_VAL = '#A_902_VAL#',
A_903_A = '#A_903_A#',
A_903_B = '#A_903_B#',
A_903_C = '#A_903_C#',
A_903_D = '#A_903_D#',
A_903_VAL = '#A_903_VAL#',
A_904_A = '#A_904_A#',
A_904_B = '#A_904_B#',
A_904_C = '#A_904_C#',
A_904_D = '#A_904_D#',
A_904_VAL = '#A_904_VAL#',
A_905_A = '#A_905_A#',
A_905_B = '#A_905_B#',
A_905_VAL = '#A_905_VAL#',
A_1001_A = '#A_1001_A#',
A_1001_B = '#A_1001_B#',
A_1001_C = '#A_1001_C#',
A_1001_D = '#A_1001_D#',
A_1002_A = '#A_1002_A#',
A_1002_B = '#A_1002_B#',
A_1002_C = '#A_1002_C#',
A_1002_D = '#A_1002_D#',
A_1003_A = '#A_1003_A#',
A_1003_B = '#A_1003_B#',
A_1003_C = '#A_1003_C#',
A_1003_D = '#A_1003_D#',
A_1004_A = '#A_1004_A#',
A_1004_B = '#A_1004_B#',
A_1004_C = '#A_1004_C#',
A_1004_D = '#A_1004_D#',
A_1005_A = '#A_1005_A#',
A_1005_B = '#A_1005_B#',
A_1005_C = '#A_1005_C#',
A_1005_D = '#A_1005_D#',
A_1006_A = '#A_1006_A#',
A_1006_B = '#A_1006_B#',
A_1006_VAL = '#A_1006_VAL#',
A_1101_A = '#A_1101_A#',
A_1101_B = '#A_1101_B#',
A_1101_C = '#A_1101_C#',
A_1102_A = '#A_1102_A#',
A_1102_B = '#A_1102_B#',
A_1103_A = '#A_1103_A#',
A_1103_B = '#A_1103_B#',
A_1103_C = '#A_1103_C#',
A_1104_A = '#A_1104_A#',
A_1104_B = '#A_1104_B#',
A_1104_C = '#A_1104_C#',
A_1105_A = '#A_1105_A#',
A_1105_B = '#A_1105_B#',
A_1105_C = '#A_1105_C#',
A_1106_A = '#A_1106_A#',
A_1106_B = '#A_1106_B#',
A_1106_C = '#A_1106_C#',
A_1107_A = '#A_1107_A#',
A_1107_B = '#A_1107_B#',
A_1107_C = '#A_1107_C#',
A_1107_D = '#A_1107_D#',
A_1108_A = '#A_1108_A#',
A_1108_B = '#A_1108_B#',
A_1108_C = '#A_1108_C#',
A_1109_A = '#A_1109_A#',
A_1110_A = '#A_1110_A#',
A_1111_A = '#A_1111_A#',
A_1111_B = '#A_1111_B#',
A_1111_C = '#A_1111_C#',
A_1111_TEXT = '#A_1111_TEXT#',
A_1112_A = '#A_1112_A#',
A_1112_B = '#A_1112_B#',
A_1112_C = '#A_1112_C#',
A_1112_TEXT = '#A_1112_TEXT#',
A_1113_A = '#A_1113_A#',
A_1113_B = '#A_1113_B#',
A_1113_C = '#A_1113_C#',
A_1113_TEXT = '#A_1113_TEXT#',
A_1114_A = '#A_1114_A#',
A_1114_B = '#A_1114_B#',
A_1114_C = '#A_1114_C#',
A_1114_TEXT = '#A_1114_TEXT#',
A_1201_A = '#A_1201_A#',
A_1201_B = '#A_1201_B#',
A_1201_C = '#A_1201_C#',
A_1201_D = '#A_1201_D#',
A_1201_E = '#A_1201_E#',
A_1202_A = '#A_1202_A#',
A_1202_B = '#A_1202_B#',
A_1202_C = '#A_1202_C#',
A_1202_D = '#A_1202_D#',
A_1202_E = '#A_1202_E#',
A_1203_A = '#A_1203_A#',
A_1203_B = '#A_1203_B#',
A_1203_C = '#A_1203_C#',
A_1203_D = '#A_1203_D#',
A_1203_E = '#A_1203_E#',
A_1204_A = '#A_1204_A#',
A_1204_B = '#A_1204_B#',
A_1204_C = '#A_1204_C#',
A_1205_A = '#A_1205_A#',
A_1205_B = '#A_1205_B#',
A_1205_C = '#A_1205_C#',
A_1301_A = '#A_1301_A#',
A_1301_B = '#A_1301_B#',
A_1302_A = '#A_1302_A#',
A_1302_B = '#A_1302_B#',
A_1303_A = '#A_1303_A#',
A_1303_B = '#A_1303_B#',
A_1303_C = '#A_1303_C#',
A_1303_TEXT = '#A_1303_TEXT#',
A_1304_A = '#A_1304_A#',
A_1304_B = '#A_1304_B#',
A_1304_C = '#A_1304_C#',
A_1304_TEXT = '#A_1304_TEXT#',
A_1305_A = '#A_1305_A#',
A_1305_B = '#A_1305_B#',
A_1305_C = '#A_1305_C#',
A_1305_TEXT = '#A_1305_TEXT#',
A_1306_A = '#A_1306_A#',
A_1306_B = '#A_1306_B#',
A_1306_C = '#A_1306_C#',
A_1306_D = '#A_1306_D#',
A_1307_A = '#A_1307_A#',
A_1307_B = '#A_1307_B#',
A_1307_C = '#A_1307_C#',
A_1307_D = '#A_1307_D#',
A_1308_B = '#A_1308_B#',
A_1308_C = '#A_1308_C#',
A_1400_A = '#A_1400_A#',
A_1400_B = '#A_1400_B#',
A_1501_A = '#A_1501_A#',
A_1501_B = '#A_1501_B#',
A_1501_C = '#A_1501_C#',
A_1501_VAL = '#A_1501_VAL#',
A_1502_A = '#A_1502_A#',
A_1502_B = '#A_1502_B#',
A_1502_C = '#A_1502_C#',
A_1502_VAL = '#A_1502_VAL#',
A_1503_A = '#A_1503_A#',
A_1503_B = '#A_1503_B#',
A_1503_C = '#A_1503_C#',
A_1503_VAL = '#A_1503_VAL#',
A_1504_A = '#A_1504_A#',
A_1504_B = '#A_1504_B#',
A_1504_C = '#A_1504_C#',
A_1504_VAL = '#A_1504_VAL#',
A_1505_A = '#A_1505_A#',
A_1505_B = '#A_1505_B#',
A_1505_C = '#A_1505_C#',
A_1505_VAL = '#A_1505_VAL#',
A_1506_A = '#A_1506_A#',
A_1506_B = '#A_1506_B#',
A_1506_C = '#A_1506_C#',
A_1506_VAL = '#A_1506_VAL#',
A_1507_A = '#A_1507_A#',
A_1507_B = '#A_1507_B#',
A_1507_C = '#A_1507_C#',
A_1507_VAL = '#A_1507_VAL#',
A_1508_A = '#A_1508_A#',
A_1508_B = '#A_1508_B#',
A_1508_C = '#A_1508_C#',
A_1508_VAL = '#A_1508_VAL#',
A_1509_A = '#A_1509_A#',
A_1509_B = '#A_1509_B#',
A_1509_C = '#A_1509_C#',
A_1509_VAL = '#A_1509_VAL#',
A_1510_A = '#A_1510_A#',
A_1510_B = '#A_1510_B#',
A_1510_C = '#A_1510_C#',
A_1510_VAL = '#A_1510_VAL#',
A_1511_A = '#A_1511_A#',
A_1511_B = '#A_1511_B#',
A_1511_C = '#A_1511_C#',
A_1511_VAL = '#A_1511_VAL#',
A_1512_A = '#A_1512_A#',
A_1512_B = '#A_1512_B#',
A_1512_C = '#A_1512_C#',
A_1512_VAL = '#A_1512_VAL#',
A_1513_A = '#A_1513_A#',
A_1513_B = '#A_1513_B#',
A_1513_C = '#A_1513_C#',
A_1513_VAL = '#A_1513_VAL#',
A_1514_A = '#A_1514_A#',
A_1514_B = '#A_1514_B#',
A_1514_C = '#A_1514_C#',
A_1514_VAL = '#A_1514_VAL#',
A_1515_A = '#A_1515_A#',
A_1515_B = '#A_1515_B#',
A_1515_C = '#A_1515_C#',
A_1515_VAL = '#A_1515_VAL#',
A_1516_A = '#A_1516_A#',
A_1516_B = '#A_1516_B#',
A_1516_C = '#A_1516_C#',
A_1516_VAL = '#A_1516_VAL#',
A_1517_A = '#A_1517_A#',
A_1517_B = '#A_1517_B#',
A_1517_C = '#A_1517_C#',
A_1517_VAL = '#A_1517_VAL#',
A_1518_A = '#A_1518_A#',
A_1518_B = '#A_1518_B#',
A_1518_C = '#A_1518_C#',
A_1518_VAL = '#A_1518_VAL#',
A_1519_A = '#A_1519_A#',
A_1519_B = '#A_1519_B#',
A_1519_C = '#A_1519_C#',
A_1519_VAL = '#A_1519_VAL#',
A_1520 = '#A_1520#',
A_1520_B = '#A_1520_B#',
A_1601_VAL = '#A_1601_VAL#',
FIRST_INS_PREMIUM = '#FIRST_INS_PREMIUM#',
<!--- GET_INS_COMPANY = '#GET_INS_COMPANY#', --->
<!--- A_1205_TEXT = '#A_1205_TEXT#', --->
<!--- I_SETTLEMENTDATE = '#I_SETTLEMENTDATE#',
LOAN_NUMBER = '#LOAN_NUMBER#',
 --->
SECOND_INS_PREMIUM = '#SECOND_INS_PREMIUM#'
<!--- TEMP = '#TEMP#',
TEMP1 = '#TEMP1#',
TEMP10 = '#TEMP10#',
TEMP1006 = '#TEMP1006#',
TEMP104 = '#TEMP104#',
TEMP105 = '#TEMP105#',
TEMP11 = '#TEMP11#',
TEMP12 = '#TEMP12#',
TEMP13 = '#TEMP13#',
TEMP14 = '#TEMP14#',
TEMP15 = '#TEMP15#',
TEMP16 = '#TEMP16#',
TEMP1601 = '#TEMP1601#',
TEMP17 = '#TEMP17#',
TEMP18 = '#TEMP18#',
TEMP19 = '#TEMP19#',
TEMP2 = '#TEMP2#',
TEMP20 = '#TEMP20#',
TEMP21 = '#TEMP21#',
TEMP22 = '#TEMP22#',
TEMP23 = '#TEMP23#',
TEMP24 = '#TEMP24#',
TEMP25 = '#TEMP25#',
TEMP26 = '#TEMP26#',
TEMP27 = '#TEMP27#',
TEMP28 = '#TEMP28#',
TEMP29 = '#TEMP29#',
TEMP3 = '#TEMP3#',
TEMP30 = '#TEMP30#',
TEMP31 = '#TEMP31#',
TEMP4 = '#TEMP4#',
TEMP5 = '#TEMP5#',
TEMP6 = '#TEMP6#',
TEMP7 = '#TEMP7#',
TEMP8 = '#TEMP8#',
TEMP9 = '#TEMP9#',
TITLE_FT_AGENCY_NAME = '#TITLE_FT_AGENCY_NAME#'				 --->
WHERE title_id = #rec_id#
			</cfquery>
<!--- DONE!<cfabort> --->



<CFQUERY datasource="#request.dsn#" NAME="readhud2_after">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="readhud1_after">
			Select * from hud_form_title_pg1
			WHERE title_id = #rec_id#
</cfquery>


<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>


<cfset mods = 0>
<cfloop index="this_field" list="#fields_to_check1#" delimiters=",">
<cfset insert_field_name1 = ReplaceNoCase(this_field,"_", "", "1")>
<cfif Evaluate("form.#this_field#") neq Evaluate("read_hud1_before.#this_field#")>
	<cfquery  datasource="#request.dsn#">
	INSERT INTO
	hud_modify (title_id, modification_text, c_date, c_time,
	fname, lname)
	VALUES (#rec_id#, 'Line #this_field# was changed from #Evaluate("read_hud1_before.#this_field#")# to #Evaluate("form.#this_field#")#', '#c_date#',
	'#c_time#', '#RU.fname#', '#RU.lname#')
	</cfquery>
	<cfset mods = 1>
</cfif>
</cfloop>



<cfloop index="this_field" list="#fields_to_check2#" delimiters=",">
<cfset insert_field_name1 = ReplaceNoCase(this_field,"_", "", "1")>
<cfif Evaluate("form.#this_field#") neq Evaluate("read_hud2_before.#this_field#")>
	<cfquery  datasource="#request.dsn#">
	INSERT INTO
	hud_modify (title_id, modification_text, c_date, c_time,
	fname, lname)
	VALUES (#rec_id#, 'Line #this_field# was changed from #Evaluate("read_hud2_before.#this_field#")# to #Evaluate("form.#this_field#")#', '#c_date#',
	'#c_time#', '#RU.fname#', '#RU.lname#')
	</cfquery>
	<cfset mods = 1>
</cfif>
</cfloop>

<cfif mods eq 1>
<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#RU.fname#', '#RU.lname#', #rec_id#, 'Modifications were made to the HUD-1, see HUD for details', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
</cfif>






































<!--- 		<CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_103">
			Select * from hud_form_title_pg1
			WHERE title_id = #rec_id# and a_103 != '#read_hud1_before.a_103#'
	</cfquery>
   <cfif #read_hud1_a_103.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_103, a103, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_103#', '#readhud1_after.a_103#', '#c_date#', '#c_time#', '#RU.fname#', '#RU.lname#')
</cfquery>

</cfif>
  <CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_104_a">
			Select * from hud_form_title_pg1
			WHERE title_id = #rec_id# and a_104_a != '#read_hud1_before.a_104_a#'
	</cfquery>
   <cfif #read_hud1_a_104_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_104_a, a104_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_104_a#', '#readhud1_after.a_104_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>
  <CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_104_b">
			Select * from hud_form_title_pg1
			WHERE title_id = #rec_id# and a_104_b != '#read_hud1_before.a_104_b#'
	</cfquery>
   <cfif #read_hud1_a_104_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_104_b, a104_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_104_b#', '#readhud1_after.a_104_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_105_a">
			Select * from hud_form_title_pg1
			WHERE title_id = #rec_id# and a_105_a != '#read_hud1_before.a_105_a#'
	</cfquery>
   <cfif #read_hud1_a_105_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_105_a, a105_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_105_a#', '#readhud1_after.a_105_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_105_b">
			Select * from hud_form_title_pg1
			WHERE title_id = #rec_id# and a_105_b != '#read_hud1_before.a_105_b#'
	</cfquery>
   <cfif #read_hud1_a_105_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_105_b, a105_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_105_b#', '#readhud1_after.a_105_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_301">
			Select * from hud_form_title_pg1
			WHERE title_id = #rec_id# and a_301 != '#read_hud1_before.a_301#'
	</cfquery>
   <cfif #read_hud1_a_301.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_301, a301, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_301#', '#readhud1_after.a_301#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_302">
			Select * from hud_form_title_pg1
			WHERE title_id = #rec_id# and a_302 != '#read_hud1_before.a_302#'
	</cfquery>
   <cfif #read_hud1_a_302.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_302, a302, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_302#', '#readhud1_after.a_302#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_303">
			Select * from hud_form_title_pg1
			WHERE title_id = #rec_id# and a_303 != '#read_hud1_before.a_303#'
	</cfquery>
   <cfif #read_hud1_a_303.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_303, a303, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_303#', '#readhud1_after.a_303#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_504">
			Select * from hud_form_title_pg1
			WHERE title_id = #rec_id# and a_504 != '#read_hud1_before.a_504#'
	</cfquery>
   <cfif #read_hud1_a_504.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_504, a504, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_504#', '#readhud1_after.a_504#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_hud1_a_505">
			Select * from hud_form_title_pg1
			WHERE title_id = #rec_id# and a_505 != '#read_hud1_before.a_505#'
	</cfquery>
   <cfif #read_hud1_a_505.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_505, a505, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud1_before.a_505#', '#readhud1_after.a_505#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>




   <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_801_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_801_a != '#read_hud2_before.a_801_a#'
	</cfquery>
   <cfif #read_hud2_a_801_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_801_a, a801_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_801_a#', '#readhud2_after.a_801_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

   <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_801_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_801_b != '#read_hud2_before.a_801_b#'
	</cfquery>
   <cfif #read_hud2_a_801_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_801_b, a801_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_801_b#', '#readhud2_after.a_801_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

   <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_801_d">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_801_d != '#read_hud2_before.a_801_d#'
	</cfquery>
   <cfif #read_hud2_a_801_d.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_801_d, a801_d, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_801_d#', '#readhud2_after.a_801_d#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>
   <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_802_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_802_a != '#read_hud2_before.a_802_a#'
	</cfquery>
   <cfif #read_hud2_a_802_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_802_a, a802_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_802_a#', '#readhud2_after.a_802_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

   <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_802_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_802_b != '#read_hud2_before.a_802_b#'
	</cfquery>
   <cfif #read_hud2_a_802_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_802_b, a802_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_802_b#', '#readhud2_after.a_802_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

   <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_802_d">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_802_d != '#read_hud2_before.a_802_d#'
	</cfquery>
   <cfif #read_hud2_a_802_d.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_802_d, a802_d, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_802_d#', '#readhud2_after.a_802_d#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

   <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_803_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_803_a != '#read_hud2_before.a_803_a#'
	</cfquery>
   <cfif #read_hud2_a_803_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_803_a, a803_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_803_a#', '#readhud2_after.a_803_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

  <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_803_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_803_b != '#read_hud2_before.a_803_b#'
	</cfquery>
   <cfif #read_hud2_a_803_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_803_b, a803_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_803_b#', '#readhud2_after.a_803_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

  <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_804_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_804_a != '#read_hud2_before.a_804_a#'
	</cfquery>
   <cfif #read_hud2_a_804_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_804_a, a804_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_804_a#', '#readhud2_after.a_804_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

  <CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_804_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_804_b != '#read_hud2_before.a_804_b#'
	</cfquery>
   <cfif #read_hud2_a_804_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_804_b, a804_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_804_b#', '#readhud2_after.a_804_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_805_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_805_a != '#read_hud2_before.a_805_a#'
	</cfquery>
   <cfif #read_hud2_a_805_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_805_a, a805_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_805_a#', '#readhud2_after.a_805_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_805_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_805_b != '#read_hud2_before.a_805_b#'
	</cfquery>
   <cfif #read_hud2_a_805_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_805_b, a805_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_805_b#', '#readhud2_after.a_805_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_806_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_806_a != '#read_hud2_before.a_806_a#'
	</cfquery>
   <cfif #read_hud2_a_806_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_806_a, a806_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_806_a#', '#readhud2_after.a_806_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_806_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_806_b != '#read_hud2_before.a_806_b#'
	</cfquery>
   <cfif #read_hud2_a_806_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_806_b, a806_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_806_b#', '#readhud2_after.a_806_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_807_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_807_a != '#read_hud2_before.a_807_a#'
	</cfquery>
   <cfif #read_hud2_a_807_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_807_a, a807_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_807_a#', '#readhud2_after.a_807_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_807_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_807_b != '#read_hud2_before.a_807_b#'
	</cfquery>
   <cfif #read_hud2_a_807_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_807_b, a807_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_807_b#', '#readhud2_after.a_807_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_808_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_808_a != '#read_hud2_before.a_808_a#'
	</cfquery>
   <cfif #read_hud2_a_808_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_808_a, a808_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_808_a#', '#readhud2_after.a_808_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_808_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_808_b != '#read_hud2_before.a_808_b#'
	</cfquery>
   <cfif #read_hud2_a_808_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_808_b, a808_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_808_b#', '#readhud2_after.a_808_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_809_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_809_a != '#read_hud2_before.a_809_a#'
	</cfquery>
   <cfif #read_hud2_a_809_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_809_a, a809_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_809_a#', '#readhud2_after.a_809_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_809_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_809_b != '#read_hud2_before.a_809_b#'
	</cfquery>
   <cfif #read_hud2_a_809_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_809_b, a809_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_809_b#', '#readhud2_after.a_809_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_810_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_810_a != '#read_hud2_before.a_810_a#'
	</cfquery>
   <cfif #read_hud2_a_810_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_810_a, a810_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_810_a#', '#readhud2_after.a_810_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_810_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_810_b != '#read_hud2_before.a_810_b#'
	</cfquery>
   <cfif #read_hud2_a_810_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_810_b, a810_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_810_b#', '#readhud2_after.a_810_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_811_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_811_a != '#read_hud2_before.a_811_a#'
	</cfquery>
   <cfif #read_hud2_a_811_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_811_a, a811_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_811_a#', '#readhud2_after.a_811_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_811_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_811_b != '#read_hud2_before.a_811_b#'
	</cfquery>
   <cfif #read_hud2_a_811_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_811_b, a811_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_811_b#', '#readhud2_after.a_811_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_901_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_901_a != '#read_hud2_before.a_901_a#'
	</cfquery>
   <cfif #read_hud2_a_901_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_901_a, a901_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_901_a#', '#readhud2_after.a_901_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_901_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_901_b != '#read_hud2_before.a_901_b#'
	</cfquery>
   <cfif #read_hud2_a_901_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_901_b, a901_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_901_b#', '#readhud2_after.a_901_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_901_c">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_901_c != '#read_hud2_before.a_901_c#'
	</cfquery>
   <cfif #read_hud2_a_901_c.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_901_c, a901_c, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_901_c#', '#readhud2_after.a_901_c#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_901_d">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_901_d != '#read_hud2_before.a_901_d#'
	</cfquery>
   <cfif #read_hud2_a_901_d.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_901_d, a901_d, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_901_d#', '#readhud2_after.a_901_d#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_902_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_902_a != '#read_hud2_before.a_902_a#'
	</cfquery>
   <cfif #read_hud2_a_902_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_902_a, a902_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_902_a#', '#readhud2_after.a_902_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_902_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_902_b != '#read_hud2_before.a_902_b#'
	</cfquery>
   <cfif #read_hud2_a_902_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_902_b, a902_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_902_b#', '#readhud2_after.a_902_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_902_c">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_902_c != '#read_hud2_before.a_902_c#'
	</cfquery>
   <cfif #read_hud2_a_902_c.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_902_c, a902_c, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_902_c#', '#readhud2_after.a_902_c#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_903_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_903_a != '#read_hud2_before.a_903_a#'
	</cfquery>
   <cfif #read_hud2_a_903_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_903_a, a903_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_903_a#', '#readhud2_after.a_903_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_903_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_903_b != '#read_hud2_before.a_903_b#'
	</cfquery>
   <cfif #read_hud2_a_903_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_903_b, a903_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_903_b#', '#readhud2_after.a_903_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_903_c">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_903_c != '#read_hud2_before.a_903_c#'
	</cfquery>
   <cfif #read_hud2_a_903_c.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_903_c, a903_c, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_903_c#', '#readhud2_after.a_903_c#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_904_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_904_a != '#read_hud2_before.a_904_a#'
	</cfquery>
   <cfif #read_hud2_a_904_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_904_a, a904_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_904_a#', '#readhud2_after.a_904_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_904_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_904_b != '#read_hud2_before.a_904_b#'
	</cfquery>
   <cfif #read_hud2_a_904_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_904_b, a904_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_904_b#', '#readhud2_after.a_904_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_905_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_905_a != '#read_hud2_before.a_905_a#'
	</cfquery>
   <cfif #read_hud2_a_905_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_905_a, a905_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_905_a#', '#readhud2_after.a_905_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1001_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_1001_a != '#read_hud2_before.a_1001_a#'
	</cfquery>
   <cfif #read_hud2_a_1001_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_1001_a, a1001_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1001_a#', '#readhud2_after.a_1001_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1001_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_1001_b != '#read_hud2_before.a_1001_b#'
	</cfquery>
   <cfif #read_hud2_a_1001_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_1001_b, a1001_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1001_b#', '#readhud2_after.a_1001_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1001_c">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_1001_c != '#read_hud2_before.a_1001_c#'
	</cfquery>
   <cfif #read_hud2_a_1001_c.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_1001_c, a1001_c, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1001_c#', '#readhud2_after.a_1001_c#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1002_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_1002_a != '#read_hud2_before.a_1002_a#'
	</cfquery>
   <cfif #read_hud2_a_1002_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_1002_a, a1002_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1002_a#', '#readhud2_after.a_1002_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1002_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_1002_b != '#read_hud2_before.a_1002_b#'
	</cfquery>
   <cfif #read_hud2_a_1002_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_1002_b, a1002_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1002_b#', '#readhud2_after.a_1002_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1002_c">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_1002_c != '#read_hud2_before.a_1002_c#'
	</cfquery>
   <cfif #read_hud2_a_1002_c.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_1002_c, a1002_c, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1002_c#', '#readhud2_after.a_1002_c#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1003_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_1003_a != '#read_hud2_before.a_1003_a#'
	</cfquery>
   <cfif #read_hud2_a_1003_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_1003_a, a1003_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1003_a#', '#readhud2_after.a_1003_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1003_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_1003_b != '#read_hud2_before.a_1003_b#'
	</cfquery>
   <cfif #read_hud2_a_1003_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_1003_b, a1003_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1003_b#', '#readhud2_after.a_1003_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1003_c">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_1003_c != '#read_hud2_before.a_1003_c#'
	</cfquery>
   <cfif #read_hud2_a_1003_c.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_1003_c, a1003_c, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1003_c#', '#readhud2_after.a_1003_c#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1004_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_1004_a != '#read_hud2_before.a_1004_a#'
	</cfquery>
   <cfif #read_hud2_a_1004_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_1004_a, a1004_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1004_a#', '#readhud2_after.a_1004_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1004_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_1004_b != '#read_hud2_before.a_1004_b#'
	</cfquery>
   <cfif #read_hud2_a_1004_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_1004_b, a1004_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1004_b#', '#readhud2_after.a_1004_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1004_c">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_1004_c != '#read_hud2_before.a_1004_c#'
	</cfquery>
   <cfif #read_hud2_a_1004_c.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_1004_c, a1004_c, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1004_c#', '#readhud2_after.a_1004_c#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1005_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_1005_a != '#read_hud2_before.a_1005_a#'
	</cfquery>
   <cfif #read_hud2_a_1005_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_1005_a, a1005_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1005_a#', '#readhud2_after.a_1005_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1005_b">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_1005_b != '#read_hud2_before.a_1005_b#'
	</cfquery>
   <cfif #read_hud2_a_1005_b.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_1005_b, a1005_b, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1005_b#', '#readhud2_after.a_1005_b#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1005_c">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_1005_c != '#read_hud2_before.a_1005_c#'
	</cfquery>
   <cfif #read_hud2_a_1005_c.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_1005_c, a1005_c, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1005_c#', '#readhud2_after.a_1005_c#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_hud2_a_1400_a">
			Select * from hud_form_title_pg2
			WHERE title_id = #rec_id# and a_1400_a != '#read_hud2_before.a_1400_a#'
	</cfquery>
   <cfif #read_hud2_a_1400_a.recordcount# gt 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				hud_modify (title_id, a_1400_a, a1400_a, c_date, c_time, fname, lname)
				VALUES (#rec_id#, '#read_hud2_before.a_1400_a#', '#readhud2_after.a_1400_a#', '#c_date#', '#c_time#', '#ru.fname#', '#ru.lname#')

</cfquery>

</cfif> --->

<cfset update_this_title_id = rec_id>
<!--- <cfinclude template="../rick_tests/update_hud_fee_calc.cfm"> --->

		<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_view_hud_pg1.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#">

