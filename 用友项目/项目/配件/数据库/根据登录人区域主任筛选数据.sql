select t.DLR_CD from CM_0101T t where t.CS_AREA_CCBZ_ID='admin';

select t.CS_AREA_CCBZ_ID,t.DLR_CD from CM_0101T t group by t.CS_AREA_CCBZ_ID,t.DLR_CD;
