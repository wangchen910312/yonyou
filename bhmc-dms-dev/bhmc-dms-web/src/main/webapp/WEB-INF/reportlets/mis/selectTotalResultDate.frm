<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20151125" releaseVersion="8.0.0">
<TableDataMap>
<TableData name="selectTotalResultDate" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[BHDMS]]></DatabaseName>
</Connection>
<Query>
<![CDATA[
WITH TOT_SALE AS (
	SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '15' AS SALE_DD, 'I' AS SALE_TP, 'F9' AS CARLINE_CD, 'D0104' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '15' AS SALE_DD, 'I' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0105' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '15' AS SALE_DD, 'I' AS SALE_TP, '2C' AS CARLINE_CD, 'D0106' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '15' AS SALE_DD, 'I' AS SALE_TP, 'C7' AS CARLINE_CD, 'D0107' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '15' AS SALE_DD, 'I' AS SALE_TP, 'BX' AS CARLINE_CD, 'D0108' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '16' AS SALE_DD, 'I' AS SALE_TP, 'C7' AS CARLINE_CD, 'D0108' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '16' AS SALE_DD, 'I' AS SALE_TP, 'B3' AS CARLINE_CD, 'D0109' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '16' AS SALE_DD, 'I' AS SALE_TP, 'CE' AS CARLINE_CD, 'D0110' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '16' AS SALE_DD, 'I' AS SALE_TP, 'CH' AS CARLINE_CD, 'D0111' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '16' AS SALE_DD, 'I' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0112' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '17' AS SALE_DD, 'I' AS SALE_TP, 'C7' AS CARLINE_CD, 'D0114' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '17' AS SALE_DD, 'M' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0401' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '17' AS SALE_DD, 'M' AS SALE_TP, 'CH' AS CARLINE_CD, 'D0403' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '16' AS SALE_DD, 'I' AS SALE_TP, 'CH' AS CARLINE_CD, 'D0111' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '16' AS SALE_DD, 'I' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0112' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '17' AS SALE_DD, 'I' AS SALE_TP, 'C7' AS CARLINE_CD, 'D0114' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '17' AS SALE_DD, 'M' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0401' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '17' AS SALE_DD, 'M' AS SALE_TP, 'CH' AS CARLINE_CD, 'D0403' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '17' AS SALE_DD, 'M' AS SALE_TP, 'CP' AS CARLINE_CD, 'D0404' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '17' AS SALE_DD, 'I' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0106' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '18' AS SALE_DD, 'I' AS SALE_TP, 'C7' AS CARLINE_CD, 'D0104' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '18' AS SALE_DD, 'I' AS SALE_TP, 'CH' AS CARLINE_CD, 'D0109' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '18' AS SALE_DD, 'I' AS SALE_TP, 'BX' AS CARLINE_CD, 'D0106' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '18' AS SALE_DD, 'I' AS SALE_TP, 'CE' AS CARLINE_CD, 'D0108' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '18' AS SALE_DD, 'I' AS SALE_TP, 'BX' AS CARLINE_CD, 'D0110' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '19' AS SALE_DD, 'M' AS SALE_TP, 'CE' AS CARLINE_CD, 'D0401' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '19' AS SALE_DD, 'I' AS SALE_TP, 'BX' AS CARLINE_CD, 'D0104' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '19' AS SALE_DD, 'M' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0404' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '19' AS SALE_DD, 'M' AS SALE_TP, '2C' AS CARLINE_CD, 'D0401' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '19' AS SALE_DD, 'I' AS SALE_TP, 'CP' AS CARLINE_CD, 'D0106' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '20' AS SALE_DD, 'I' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0105' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '20' AS SALE_DD, 'I' AS SALE_TP, 'BX' AS CARLINE_CD, 'D0112' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '20' AS SALE_DD, 'M' AS SALE_TP, '2C' AS CARLINE_CD, 'D0404' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '20' AS SALE_DD, 'M' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0403' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '20' AS SALE_DD, 'I' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0109' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '21' AS SALE_DD, 'I' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0104' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '21' AS SALE_DD, 'I' AS SALE_TP, 'BX' AS CARLINE_CD, 'D0105' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '21' AS SALE_DD, 'I' AS SALE_TP, '2C' AS CARLINE_CD, 'D0106' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '21' AS SALE_DD, 'I' AS SALE_TP, 'CH' AS CARLINE_CD, 'D0107' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '21' AS SALE_DD, 'I' AS SALE_TP, 'CP' AS CARLINE_CD, 'D0109' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '22' AS SALE_DD, 'I' AS SALE_TP, '2C' AS CARLINE_CD, 'D0108' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '22' AS SALE_DD, 'I' AS SALE_TP, 'BX' AS CARLINE_CD, 'D0111' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '22' AS SALE_DD, 'I' AS SALE_TP, 'CH' AS CARLINE_CD, 'D0114' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '22' AS SALE_DD, 'I' AS SALE_TP, 'CH' AS CARLINE_CD, 'D0109' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '22' AS SALE_DD, 'I' AS SALE_TP, 'CH' AS CARLINE_CD, 'D0107' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '23' AS SALE_DD, 'I' AS SALE_TP, 'BX' AS CARLINE_CD, 'D0106' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '23' AS SALE_DD, 'I' AS SALE_TP, 'CH' AS CARLINE_CD, 'D0107' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '23' AS SALE_DD, 'I' AS SALE_TP, 'CP' AS CARLINE_CD, 'D0108' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '23' AS SALE_DD, 'I' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0109' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '23' AS SALE_DD, 'I' AS SALE_TP, 'BX' AS CARLINE_CD, 'D0110' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '24' AS SALE_DD, 'I' AS SALE_TP, '2C' AS CARLINE_CD, 'D0111' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '24' AS SALE_DD, 'I' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0112' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '24' AS SALE_DD, 'I' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0114' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '24' AS SALE_DD, 'M' AS SALE_TP, 'BX' AS CARLINE_CD, 'D0403' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '24' AS SALE_DD, 'M' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0404' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '25' AS SALE_DD, 'I' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0104' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '25' AS SALE_DD, 'I' AS SALE_TP, 'CP' AS CARLINE_CD, 'D0106' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '25' AS SALE_DD, 'I' AS SALE_TP, '2C' AS CARLINE_CD, 'D0108' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '25' AS SALE_DD, 'I' AS SALE_TP, 'BX' AS CARLINE_CD, 'D0110' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '25' AS SALE_DD, 'I' AS SALE_TP, 'CP' AS CARLINE_CD, 'D0112' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
 	SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '26' AS SALE_DD, 'I' AS SALE_TP, 'CP' AS CARLINE_CD, 'D0112' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '26' AS SALE_DD, 'I' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0114' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '26' AS SALE_DD, 'M' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0401' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '26' AS SALE_DD, 'M' AS SALE_TP, 'BX' AS CARLINE_CD, 'D0403' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '26' AS SALE_DD, 'M' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0404' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL   
	SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '27' AS SALE_DD, 'I' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0105' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '27' AS SALE_DD, 'I' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0104' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '27' AS SALE_DD, 'I' AS SALE_TP, 'BX' AS CARLINE_CD, 'D0106' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '27' AS SALE_DD, 'I' AS SALE_TP, '2C' AS CARLINE_CD, 'D0109' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '27' AS SALE_DD, 'I' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0110' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL    
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '28' AS SALE_DD, 'I' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0109' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '28' AS SALE_DD, 'I' AS SALE_TP, 'BX' AS CARLINE_CD, 'D0110' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '28' AS SALE_DD, 'I' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0111' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '28' AS SALE_DD, 'I' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0112' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '28' AS SALE_DD, 'M' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0404' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '29' AS SALE_DD, 'I' AS SALE_TP, 'BX' AS CARLINE_CD, 'D0108' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '29' AS SALE_DD, 'M' AS SALE_TP, 'F0' AS CARLINE_CD, 'D0109' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '29' AS SALE_DD, 'I' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0111' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '29' AS SALE_DD, 'I' AS SALE_TP, '2C' AS CARLINE_CD, 'D0112' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '29' AS SALE_DD, 'I' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0114' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '30' AS SALE_DD, 'M' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0401' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '30' AS SALE_DD, 'M' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0404' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '30' AS SALE_DD, 'I' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0108' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '30' AS SALE_DD, 'I' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0109' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2016' AS SALE_YY, '08' AS SALE_MM, '30' AS SALE_DD, 'I' AS SALE_TP, '2C' AS CARLINE_CD, 'D0110' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2015' AS SALE_YY, '08' AS SALE_MM, '31' AS SALE_DD, 'I' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0111' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2015' AS SALE_YY, '08' AS SALE_MM, '31' AS SALE_DD, 'I' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0112' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2015' AS SALE_YY, '08' AS SALE_MM, '31' AS SALE_DD, 'M' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0402' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2015' AS SALE_YY, '08' AS SALE_MM, '31' AS SALE_DD, 'M' AS SALE_TP, 'BX' AS CARLINE_CD, 'D0403' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2014' AS SALE_YY, '08' AS SALE_MM, '31' AS SALE_DD, 'I' AS SALE_TP, '2C' AS CARLINE_CD, 'D0104' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2014' AS SALE_YY, '08' AS SALE_MM, '31' AS SALE_DD, 'I' AS SALE_TP, '2C' AS CARLINE_CD, 'D0105' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL UNION ALL
    SELECT '2014' AS SALE_YY, '08' AS SALE_MM, '31' AS SALE_DD, 'I' AS SALE_TP, 'C3' AS CARLINE_CD, 'D0106' AS SALE_DLR_CD, '1' AS SALE_RESULT_CNT FROM DUAL 
    ) SELECT TOT_SALE.SALE_YY
    		,TOT_SALE.SALE_MM
            ,TOT_SALE.SALE_DD
            ,DECODE(TOT_SALE.SALE_TP, 'I','IDCC','M','SHOP') AS saleTp
    		,'500' AS saleTargetCnt
      		,SUM(SALE_RESULT_CNT) AS saleResultCnt
            ,ROUND((SUM(SALE_RESULT_CNT)/500 * 100), 2) AS saleResultRate
            FROM TOT_SALE
      WHERE 1=1 
      AND TOT_SALE.SALE_YY = '2016'
      AND TOT_SALE.SALE_MM = '08'
      --AND TOT_SALE.SALE_DD = '15'
      GROUP BY TOT_SALE.SALE_YY, TOT_SALE.SALE_MM, TOT_SALE.SALE_DD, TOT_SALE.SALE_TP
      ORDER BY TOT_SALE.SALE_YY, TOT_SALE.SALE_MM, TOT_SALE.SALE_DD, TOT_SALE.SALE_TP
      ]]></Query>
</TableData>
</TableDataMap>
<Layout class="com.fr.form.ui.container.WBorderLayout">
<WidgetName name="form"/>
<WidgetAttr>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[새파일제목]]></O>
<FRFont name="Dialog" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Center class="com.fr.form.ui.container.WFitLayout">
<WidgetName name="body"/>
<WidgetAttr>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="1" left="1" bottom="1" right="1"/>
<Border>
<border style="0" color="-723724" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[새파일제목]]></O>
<FRFont name="Dialog" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart0"/>
<WidgetAttr>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[새파일제목]]></O>
<FRFont name="Dialog" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0"/>
<WidgetAttr>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[새파일제목]]></O>
<FRFont name="Dialog" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<Chart name="기본" chartClass="com.fr.chart.chartattr.Chart">
<Chart class="com.fr.chart.chartattr.Chart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[■ 종합 판매현황]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Modern H Medium" style="0" size="80" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="2"/>
</Title>
<Plot class="com.fr.chart.chartattr.Bar2DPlot">
<CategoryPlot>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="-1" seriesDragEnable="false" plotStyle="1" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrContents">
<AttrContents>
<Attr showLine="false" position="0" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Microsoft YaHei UI" style="1" size="80" foreground="-13421773"/>
</Attr>
</TextAttr>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</PercentFormat>
</AttrContents>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="1" visible="true"/>
<FRFont name="Microsoft YaHei UI" style="0" size="80" foreground="-8355712"/>
</Legend>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="0"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="false"/>
</AttrFillStyle>
</newPlotFillStyle>
<RectanglePlotAttr interactiveAxisTooltip="false"/>
<xAxis>
<CategoryAxis class="com.fr.chart.chartattr.CategoryAxis">
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="0"/>
<newLineColor mainGridColor="-4144960" lineColor="-13027015"/>
<AxisPosition value="3"/>
<TickLine201106 type="0" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Microsoft YaHei" style="0" size="80" foreground="-13027015"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</CategoryAxis>
</xAxis>
<yAxis>
<ValueAxis class="com.fr.chart.chartattr.ValueAxis">
<ValueAxisAttr201108 alignZeroValue="false"/>
<newAxisAttr isShowAxisLabel="false"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="0"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="0" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Century Gothic" style="0" size="72"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</ValueAxis>
</yAxis>
<secondAxis>
<ValueAxis class="com.fr.chart.chartattr.ValueAxis">
<ValueAxisAttr201108 alignZeroValue="false"/>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Century Gothic" style="0" size="72"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</ValueAxis>
</secondAxis>
<CateAttr isStacked="true"/>
<BarAttr isHorizontal="false" overlap="1.0" interval="0.5"/>
<Bar2DAttr isSimulation3D="false"/>
</CategoryPlot>
</Plot>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<ChartDefinition>
<OneValueCDDefinition seriesName="SALETP" valueName="SALERESULTCNT" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="true"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[selectTotalResultDate]]></Name>
</TableData>
<CategoryName value="SALE_DD"/>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
</Chart>
</InnerWidget>
<BoundsAttr x="0" y="0" width="1023" height="284"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0"/>
<WidgetAttr>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[새파일제목]]></O>
<FRFont name="Dialog" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<Chart name="기본" chartClass="com.fr.chart.chartattr.Chart">
<Chart class="com.fr.chart.chartattr.Chart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[■ 종합 판매현황]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Modern H Medium" style="0" size="80" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="2"/>
</Title>
<Plot class="com.fr.chart.chartattr.Bar2DPlot">
<CategoryPlot>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="-1" seriesDragEnable="false" plotStyle="1" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrContents">
<AttrContents>
<Attr showLine="false" position="0" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Microsoft YaHei UI" style="1" size="80" foreground="-13421773"/>
</Attr>
</TextAttr>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</PercentFormat>
</AttrContents>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="1" visible="true"/>
<FRFont name="Microsoft YaHei UI" style="0" size="80" foreground="-8355712"/>
</Legend>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="0"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="false"/>
</AttrFillStyle>
</newPlotFillStyle>
<RectanglePlotAttr interactiveAxisTooltip="false"/>
<xAxis>
<CategoryAxis class="com.fr.chart.chartattr.CategoryAxis">
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="0"/>
<newLineColor mainGridColor="-4144960" lineColor="-13027015"/>
<AxisPosition value="3"/>
<TickLine201106 type="0" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Microsoft YaHei" style="0" size="80" foreground="-13027015"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</CategoryAxis>
</xAxis>
<yAxis>
<ValueAxis class="com.fr.chart.chartattr.ValueAxis">
<ValueAxisAttr201108 alignZeroValue="false"/>
<newAxisAttr isShowAxisLabel="false"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="0"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="0" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Century Gothic" style="0" size="72"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</ValueAxis>
</yAxis>
<secondAxis>
<ValueAxis class="com.fr.chart.chartattr.ValueAxis">
<ValueAxisAttr201108 alignZeroValue="false"/>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Century Gothic" style="0" size="72"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</ValueAxis>
</secondAxis>
<CateAttr isStacked="true"/>
<BarAttr isHorizontal="false" overlap="1.0" interval="0.5"/>
<Bar2DAttr isSimulation3D="false"/>
</CategoryPlot>
</Plot>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<ChartDefinition>
<OneValueCDDefinition seriesName="SALETP" valueName="SALERESULTCNT" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="true"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[selectTotalResultDate]]></Name>
</TableData>
<CategoryName value="SALE_DD"/>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
</Chart>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="1023" height="284"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart1"/>
<WidgetAttr>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[새파일제목]]></O>
<FRFont name="Dialog" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart1"/>
<WidgetAttr>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[새파일제목]]></O>
<FRFont name="Dialog" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<Chart name="기본" chartClass="com.fr.chart.chartattr.Chart">
<Chart class="com.fr.chart.chartattr.Chart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[■ 차종별 현황]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Modern H Medium" style="0" size="80"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="2"/>
</Title>
<Plot class="com.fr.chart.chartattr.Bar2DPlot">
<CategoryPlot>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="0" seriesDragEnable="false" plotStyle="0" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="1" visible="true"/>
<FRFont name="Microsoft YaHei" style="0" size="72"/>
</Legend>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="0"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="false"/>
</AttrFillStyle>
</newPlotFillStyle>
<RectanglePlotAttr interactiveAxisTooltip="false"/>
<xAxis>
<CategoryAxis class="com.fr.chart.chartattr.CategoryAxis">
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="0"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Microsoft YaHei" style="0" size="72"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</CategoryAxis>
</xAxis>
<yAxis>
<ValueAxis class="com.fr.chart.chartattr.ValueAxis">
<ValueAxisAttr201108 alignZeroValue="false"/>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="0"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Century Gothic" style="0" size="72"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</ValueAxis>
</yAxis>
<secondAxis>
<ValueAxis class="com.fr.chart.chartattr.ValueAxis">
<ValueAxisAttr201108 alignZeroValue="false"/>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Century Gothic" style="0" size="72"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</ValueAxis>
</secondAxis>
<CateAttr isStacked="false"/>
<BarAttr isHorizontal="false" overlap="-0.25" interval="1.0"/>
<Bar2DAttr isSimulation3D="false"/>
</CategoryPlot>
</Plot>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
</Chart>
</Chart>
</InnerWidget>
<BoundsAttr x="0" y="0" width="1023" height="240"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart1"/>
<WidgetAttr>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[새파일제목]]></O>
<FRFont name="Dialog" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<Chart name="기본" chartClass="com.fr.chart.chartattr.Chart">
<Chart class="com.fr.chart.chartattr.Chart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[■ 차종별 현황]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Modern H Medium" style="0" size="80"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="2"/>
</Title>
<Plot class="com.fr.chart.chartattr.Bar2DPlot">
<CategoryPlot>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="0" seriesDragEnable="false" plotStyle="0" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="1" visible="true"/>
<FRFont name="Microsoft YaHei" style="0" size="72"/>
</Legend>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="0"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="false"/>
</AttrFillStyle>
</newPlotFillStyle>
<RectanglePlotAttr interactiveAxisTooltip="false"/>
<xAxis>
<CategoryAxis class="com.fr.chart.chartattr.CategoryAxis">
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="0"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Microsoft YaHei" style="0" size="72"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</CategoryAxis>
</xAxis>
<yAxis>
<ValueAxis class="com.fr.chart.chartattr.ValueAxis">
<ValueAxisAttr201108 alignZeroValue="false"/>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="0"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Century Gothic" style="0" size="72"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</ValueAxis>
</yAxis>
<secondAxis>
<ValueAxis class="com.fr.chart.chartattr.ValueAxis">
<ValueAxisAttr201108 alignZeroValue="false"/>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Century Gothic" style="0" size="72"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</ValueAxis>
</secondAxis>
<CateAttr isStacked="false"/>
<BarAttr isHorizontal="false" overlap="-0.25" interval="1.0"/>
<Bar2DAttr isSimulation3D="false"/>
</CategoryPlot>
</Plot>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
</Chart>
</Chart>
</body>
</InnerWidget>
<BoundsAttr x="0" y="284" width="1023" height="240"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart2"/>
<WidgetAttr>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[새파일제목]]></O>
<FRFont name="Dialog" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart2"/>
<WidgetAttr>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[새파일제목]]></O>
<FRFont name="Dialog" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<Chart name="기본" chartClass="com.fr.chart.chartattr.Chart">
<Chart class="com.fr.chart.chartattr.Chart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[■ 판매고문별 현황]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Modern H Medium" style="0" size="80"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="2"/>
</Title>
<Plot class="com.fr.chart.chartattr.Bar2DPlot">
<CategoryPlot>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="0" seriesDragEnable="false" plotStyle="0" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="1" visible="true"/>
<FRFont name="Microsoft YaHei" style="0" size="72"/>
</Legend>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="0"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="false"/>
</AttrFillStyle>
</newPlotFillStyle>
<RectanglePlotAttr interactiveAxisTooltip="false"/>
<xAxis>
<CategoryAxis class="com.fr.chart.chartattr.CategoryAxis">
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="0"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Microsoft YaHei" style="0" size="72"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</CategoryAxis>
</xAxis>
<yAxis>
<ValueAxis class="com.fr.chart.chartattr.ValueAxis">
<ValueAxisAttr201108 alignZeroValue="false"/>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="0"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Century Gothic" style="0" size="72"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</ValueAxis>
</yAxis>
<secondAxis>
<ValueAxis class="com.fr.chart.chartattr.ValueAxis">
<ValueAxisAttr201108 alignZeroValue="false"/>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Century Gothic" style="0" size="72"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</ValueAxis>
</secondAxis>
<CateAttr isStacked="false"/>
<BarAttr isHorizontal="false" overlap="-0.25" interval="1.0"/>
<Bar2DAttr isSimulation3D="false"/>
</CategoryPlot>
</Plot>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
</Chart>
</Chart>
</InnerWidget>
<BoundsAttr x="0" y="0" width="1023" height="238"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart2"/>
<WidgetAttr>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[새파일제목]]></O>
<FRFont name="Dialog" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<Chart name="기본" chartClass="com.fr.chart.chartattr.Chart">
<Chart class="com.fr.chart.chartattr.Chart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[■ 판매고문별 현황]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Modern H Medium" style="0" size="80"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="2"/>
</Title>
<Plot class="com.fr.chart.chartattr.Bar2DPlot">
<CategoryPlot>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="0" seriesDragEnable="false" plotStyle="0" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="1" visible="true"/>
<FRFont name="Microsoft YaHei" style="0" size="72"/>
</Legend>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="0"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="false"/>
</AttrFillStyle>
</newPlotFillStyle>
<RectanglePlotAttr interactiveAxisTooltip="false"/>
<xAxis>
<CategoryAxis class="com.fr.chart.chartattr.CategoryAxis">
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="0"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Microsoft YaHei" style="0" size="72"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</CategoryAxis>
</xAxis>
<yAxis>
<ValueAxis class="com.fr.chart.chartattr.ValueAxis">
<ValueAxisAttr201108 alignZeroValue="false"/>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="0"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Century Gothic" style="0" size="72"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</ValueAxis>
</yAxis>
<secondAxis>
<ValueAxis class="com.fr.chart.chartattr.ValueAxis">
<ValueAxisAttr201108 alignZeroValue="false"/>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor mainGridColor="-4144960" lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Century Gothic" style="0" size="72"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=0"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
</ValueAxis>
</secondAxis>
<CateAttr isStacked="false"/>
<BarAttr isHorizontal="false" overlap="-0.25" interval="1.0"/>
<Bar2DAttr isSimulation3D="false"/>
</CategoryPlot>
</Plot>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
</Chart>
</Chart>
</body>
</InnerWidget>
<BoundsAttr x="0" y="524" width="1023" height="238"/>
</Widget>
<Sorted sorted="false"/>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="1023" height="762"/>
<MobileWidgetList/>
</Center>
</Layout>
<DesignerVersion DesignerVersion="IAA"/>
<PreviewType PreviewType="0"/>
</Form>
