SELECT repairOrder.CAR_REG_NO,repairOrder.VIN_NO,repairOrder.RO_DOC_NO,repairOrder.CAR_OWNER_ID,repairOrder.CAR_OWNER_NM,specialRequest.DRIVER_NM,
 repairOrder.HP_NO as DRIVER_HP_NO,specialRequest.REQ_REASON_TP,specialRequest.REQ_REASON_DESC,specialRequest.APPROVE_DESC, 
 specialRequest.REQ_USR_ID AS REQ_USR_NM, specialRequest.APPROVE_USR_NM, specialRequest.CAR_OWNER_NM, repairOrder.DRIVER_NM, 
 specialRequest.RO_DT, specialRequest.REQ_DT,specialRequest.FILE_DOC_NO,specialRequest.REQ_STAT_CD,specialRequest.CAR_REG_NO,ROWNUM FROM (
 select repair.*,HP_NO from (select  se0300t.DLR_CD,se0300t.CAR_REG_NO,se0300t.VIN_NO,se0300t.RO_DOC_NO,se0300t.CAR_OWNER_ID,se0300t.CAR_OWNER_NM,se0300t.DRIVER_ID,se0300t.DRIVER_NM
 from SE_0300T se0300t 
 where se0300t.DL_STAT_CD =  '02' 
 AND se0300t.RO_STAT_CD = '03'   
 AND se0300t.CUST_CONFIRM_YN ='Y'                                     
 AND se0300t.CUST_CONFIRM_CD IS NULL) repair left join CR_0101T t on t.DLR_CD  = repair.DLR_CD AND t.CUST_NO = repair.DRIVER_ID
 )repairOrder 
left join SE_1162T as specialRequest on specialRequest.RO_DOC_NO = repairOrder.RO_DOC_NO
where 1 = 1
				   
				   
 select repair.*,HP_NO as DRIVER_HP_NO from (select  se0300t.DLR_CD,se0300t.CAR_REG_NO,se0300t.VIN_NO,se0300t.RO_DOC_NO,se0300t.CAR_OWNER_ID,se0300t.CAR_OWNER_NM,se0300t.DRIVER_ID,se0300t.DRIVER_NM
 from SE_0300T se0300t 
 where se0300t.DL_STAT_CD =  '02' 
 AND se0300t.RO_STAT_CD = '03'   
 AND se0300t.CUST_CONFIRM_YN ='Y'                                     
 AND se0300t.CUST_CONFIRM_CD IS NULL) repair left join CR_0101T t on t.DLR_CD  = repair.DLR_CD AND t.CUST_NO = repair.DRIVER_ID		   
				   
	RO_DOC_NO