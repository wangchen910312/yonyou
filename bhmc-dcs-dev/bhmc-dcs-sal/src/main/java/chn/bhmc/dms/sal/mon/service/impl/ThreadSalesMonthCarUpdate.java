package chn.bhmc.dms.sal.mon.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Semaphore;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import chn.bhmc.dms.cmm.cmp.vo.TmpDmsCarCheckVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDmsErpCarDetailVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDmsOrderCheckVO;
import chn.bhmc.dms.sal.mon.service.dao.SalesMonthDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ThreadSalesMonthOrdUpdate.java
 * @Description : 批量执行经销商差异修复
 * @author Bruce
 * @since 2019. 08. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 07. 10.    Choi KyungYong         최초 생성
 * </pre>
 */

public class ThreadSalesMonthCarUpdate implements Runnable {

    public static final Logger logger = LoggerFactory.getLogger("chn.bhmc.dms.app.log.error");
    
    SalesMonthDAO salesMonthDAO = null;
    
    //最大线程数
  	final static int MAX_QPS = 30;
  	
    //获得线程执行坑位
  	final static Semaphore semaphore = new Semaphore(MAX_QPS);
    
    private String devOrPrd = "BHDCSOP";
    private TmpDmsErpCarDetailVO tmpDmsCarDetailVO = null;
    private String threadName = "任务_";
    public ThreadSalesMonthCarUpdate(TmpDmsErpCarDetailVO tmpDmsCarDetailVOIn, int i,SalesMonthDAO salesMonthDAOIn) {
    	tmpDmsCarDetailVO = tmpDmsCarDetailVOIn;
    	threadName = threadName+i;
    	salesMonthDAO = salesMonthDAOIn;
    }
    public String getName(){
    	return threadName;
    }

    /*
     * @see java.lang.Runnable#run()
     */
    @Override
    public void run() {
    	//semaphore.acquireUninterruptibly(1);
    	System.out.println("线程开始 "+threadName);

    	String dlrCd = "";
    	String dmsIpNm = "";
    	StringBuffer sql = new StringBuffer();
    	StringBuffer sql301 = new StringBuffer("");
    	StringBuffer sql256 = new StringBuffer("");
    	StringBuffer sql301Pro = new StringBuffer("");
    	//连接空对象创建放到循环外面
		Connection conn = null;
		if(null!=tmpDmsCarDetailVO){
			if(null!=tmpDmsCarDetailVO.getDlrCd()&&null!=tmpDmsCarDetailVO.getDmsIpNm()){
    			
				dlrCd = tmpDmsCarDetailVO.getDlrCd();
				dmsIpNm = tmpDmsCarDetailVO.getDmsIpNm();
				
				try{
	                conn = dbConnection(dmsIpNm);
	            }catch(Exception e){
	            	try {
	            		System.out.println("#"+e.getMessage());
		                System.out.println(dlrCd+" 网络不通");
		                tmpDmsCarDetailVO.setUpdateResult("E");
		                tmpDmsCarDetailVO.setUpdateReason("网络不通");
		                salesMonthDAO.updateTmpDmsCarUpdateResult(tmpDmsCarDetailVO);
		                salesMonthDAO.callIfMergeCommit();
	    			} catch (Exception e1) {
	    				// TODO Auto-generated catch block
	    				e1.printStackTrace();
	    			}
	            }
				sql = new StringBuffer();
				sql.append("MERGE INTO SA_0121T A \n");
				sql.append("USING( \n");
				sql.append("SELECT VIN_NO1,VIN_NO2,VIN_NO1||VIN_NO2 VIN_NO, \n");
				sql.append("CASE WHEN CAR_STAT_CD = 'Q170' THEN '50' \n");
				sql.append("     WHEN CAR_STAT_CD = 'Q190' AND STR_YN IS NULL THEN '70' \n");
				sql.append("     WHEN CAR_STAT_CD = 'Q190' AND STR_YN = 'X' THEN '60' \n");
				sql.append("     WHEN CAR_STAT_CD = 'Q180' THEN '60' END CAR_STAT_CD, \n");
				sql.append("CAR_VIN_ALLOC_DT,ORD_DLR_CD,ORD_DLR_YY_MM_DT,ORD_TP,PLT_GI_DT,ERP_ORD_NO,CUST_SALE_DT,CUST_SALE_CANC_DT,DLR_GR_DT,GR_RETURN_DT,VINM_BKTX,CAR_ORD_ALLOC_DT,CAR_ORD_EMONTH \n");
				sql.append("FROM SA_0121IR_MONTH@").append(devOrPrd).append(" \n");
				sql.append("WHERE VIN_NO1||VIN_NO2='").append(tmpDmsCarDetailVO.getVinNo()).append("' \n");
				sql.append(") B \n");
				sql.append("ON (A.VIN_NO = B.VIN_NO1||B.VIN_NO2) \n");
				sql.append("WHEN MATCHED THEN \n");
				sql.append("  UPDATE SET \n");
				sql.append("     A.CAR_STAT_CD = B.CAR_STAT_CD, \n");
				sql.append("     A.CAR_VIN_ALLOC_DT = CASE WHEN B.CAR_VIN_ALLOC_DT IS NULL OR NVL(B.CAR_VIN_ALLOC_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.CAR_VIN_ALLOC_DT,'YYYYMMDD') END, \n");
				sql.append("     A.ORD_DLR_CD = B.ORD_DLR_CD, \n");
				sql.append("     A.ORD_DLR_YY_MM_DT = SUBSTR(B.ORD_DLR_YY_MM_DT,0,6), \n");
				sql.append("     A.PLT_GI_DT = CASE WHEN B.PLT_GI_DT IS NULL OR NVL(B.PLT_GI_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.PLT_GI_DT,'YYYYMMDD') END, \n");
				sql.append("     A.ERP_ORD_NO = B.ERP_ORD_NO, \n");
				sql.append("     A.CUST_SALE_DT = CASE WHEN B.CUST_SALE_DT IS NULL OR NVL(B.CUST_SALE_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.CUST_SALE_DT,'YYYYMMDD') END, \n");
				sql.append("     A.CUST_SALE_CANC_DT = CASE WHEN B.CUST_SALE_CANC_DT IS NULL OR NVL(B.CUST_SALE_CANC_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.CUST_SALE_CANC_DT,'YYYYMMDD') END, \n");
				sql.append("     A.DLR_GR_DT = CASE WHEN B.DLR_GR_DT IS NULL OR NVL(B.DLR_GR_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.DLR_GR_DT,'YYYYMMDD') END, \n");
				sql.append("     A.GR_RETURN_DT = CASE WHEN B.GR_RETURN_DT IS NULL OR NVL(B.GR_RETURN_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.GR_RETURN_DT,'YYYYMMDD') END \n");

				if(null!=tmpDmsCarDetailVO.getCheckReason()){
					if("SAP存在DMS不存在".endsWith(tmpDmsCarDetailVO.getCheckReason())){
						//主表不存在补录主表
						sql = new StringBuffer();
						sql.append("MERGE INTO SA_0121T A\n" );
						sql.append("    USING (\n" );
						sql.append("          SELECT car_id,\n" );
						sql.append("                vin_no,\n" );
						sql.append("                vin_no1,\n" );
						sql.append("                vin_no2,\n" );
						sql.append("                carline_cd,\n" );
						sql.append("                model_cd,\n" );
						sql.append("                ocn_cd,\n" );
						sql.append("                ext_color_cd,\n" );
						sql.append("                int_color_cd,\n" );
						sql.append("                car_stat_cd,\n" );
						sql.append("                own_stat_cd,\n" );
						sql.append("                stock_tp,\n" );
						sql.append("                car_dstin_cd,\n" );
						sql.append("                strge_cd,\n" );
						sql.append("                loc_cd,\n" );
						sql.append("                dlr_cd,\n" );
						sql.append("                sale_tp,\n" );
						sql.append("                contract_no,\n" );
						sql.append("                ncar_dstin_cd,\n" );
						sql.append("                grey_yn,\n" );
						sql.append("                gr_dt,\n" );
						sql.append("                car_reg_no,\n" );
						sql.append("                manufact_yy_mm_dt,\n" );
						sql.append("                grte_start_dt,\n" );
						sql.append("                grte_end_dt,\n" );
						sql.append("                disuse_dt,\n" );
						sql.append("                grte_std_cd,\n" );
						sql.append("                del_yn,\n" );
						sql.append("                car_reg_dt,\n" );
						sql.append("                corp_car_dstin_cd,\n" );
						sql.append("                mcar_cd,\n" );
						sql.append("                maker_cd,\n" );
						sql.append("                engin_model_cd,\n" );
						sql.append("                engin_serial_no,\n" );
						sql.append("                key_no,\n" );
						sql.append("                trim_dt,\n" );
						sql.append("                signoff_dt,\n" );
						sql.append("                dlr_ord_req_dt,\n" );
						sql.append("                car_vin_alloc_dt,\n" );
						sql.append("                car_dump_cd,\n" );
						sql.append("                ord_no,\n" );
						sql.append("                ord_dlr_cd,\n" );
						sql.append("                ord_dlr_yy_mm_dt,\n" );
						sql.append("                ord_mm_dt,\n" );
						sql.append("                ord_seq,\n" );
						sql.append("                cert_no,\n" );
						sql.append("                trsf_dlr_cd,\n" );
						sql.append("                trsf_cmp_cd,\n" );
						sql.append("                trsf_cmp_truck_no,\n" );
						sql.append("                ord_tp,\n" );
						sql.append("                plt_gi_dt,\n" );
						sql.append("                cert_secu_cd,\n" );
						sql.append("                erp_ord_no,\n" );
						sql.append("                cmp_cd,\n" );
						sql.append("                dist_cd,\n" );
						sql.append("                grade_cd,\n" );
						sql.append("                div_cd,\n" );
						sql.append("                engin_no,\n" );
						sql.append("                car_alloc_canc_dt,\n" );
						sql.append("                invc_publ_dt,\n" );
						sql.append("                cust_sale_dt,\n" );
						sql.append("                cust_sale_canc_dt,\n" );
						sql.append("                dlr_gr_dt,\n" );
						sql.append("                vinm_etc2,\n" );
						sql.append("                gr_return_reason_cd,\n" );
						sql.append("                vinm_etc5,\n" );
						sql.append("                vinm_etc6,\n" );
						sql.append("                alloc_dlr_cd,\n" );
						sql.append("                gr_return_dt,\n" );
						sql.append("                vinm_cmiv,\n" );
						sql.append("                vinm_bkcd,\n" );
						sql.append("                vinm_bktx,\n" );
						sql.append("                vinm_warc,\n" );
						sql.append("                stat_cd,\n" );
						sql.append("                vinm_cpgm,\n" );
						sql.append("                vinm_upgm,\n" );
						sql.append("                rfid_no,\n" );
						sql.append("                vinm_f20007,\n" );
						sql.append("                vinm_f20008,\n" );
						sql.append("                vinm_f20009,\n" );
						sql.append("                vinm_f20010,\n" );
						sql.append("                retl_tp_cd,\n" );
						sql.append("                retl_canc_reason_cd,\n" );
						sql.append("                car_nm,\n" );
						sql.append("                car_disp_qty,\n" );
						sql.append("                open_yn,\n" );
						sql.append("                remark,\n" );
						sql.append("                lv2_dlr_org_cd,\n" );
						sql.append("                lv2_dlr_stock_yn,\n" );
						sql.append("                lv2_dlr_stock_gr_dt,\n" );
						sql.append("                cmp_car_yn,\n" );
						sql.append("                cmp_car_dstin_cd,\n" );
						sql.append("                car_run_dist_val,\n" );
						sql.append("                tec_id,\n" );
						sql.append("                car_brand_cd,\n" );
						sql.append("                temp1,\n" );
						sql.append("                temp2,\n" );
						sql.append("                temp3,\n" );
						sql.append("                temp4,\n" );
						sql.append("                temp5,\n" );
						sql.append("                temp6,\n" );
						sql.append("                temp7,\n" );
						sql.append("                temp8,\n" );
						sql.append("                temp9,\n" );
						sql.append("                temp10,\n" );
						sql.append("                reg_usr_id,\n" );
						sql.append("                reg_dt,\n" );
						sql.append("                updt_usr_id,\n" );
						sql.append("                updt_dt,\n" );
						sql.append("                pre_gi_yn,\n" );
						sql.append("                mm_cnt,\n" );
						sql.append("                dd_cnt,\n" );
						sql.append("                retl_prc,\n" );
						sql.append("                whsl_prc,\n" );
						sql.append("                ddct_rate,\n" );
						sql.append("                block_sale_adv_no,\n" );
						sql.append("                tm_no1,\n" );
						sql.append("                tm_no2,\n" );
						sql.append("                cert_secu2_cd,\n" );
						sql.append("                jeongpan_no,\n" );
						sql.append("                sale_emp_no,\n" );
						sql.append("                expc_chk_dt,\n" );
						sql.append("                expc_chk_run_dist_val,\n" );
						sql.append("                damage_cd,\n" );
						sql.append("                block_yn,\n" );
						sql.append("                str_no,\n" );
						sql.append("                str_yn,\n" );
						sql.append("                vinm_bkwb,\n" );
						sql.append("                vinm_bkcm,\n" );
						sql.append("                vinm_wdate,\n" );
						sql.append("                vinm_zfbdt,\n" );
						sql.append("                zfnewen,\n" );
						sql.append("                zfnewsub,\n" );
						sql.append("                rel_dt,\n" );
						sql.append("                rel_status\n" );
						sql.append("           FROM sa_0121t@BHDCSOP\n" );
						sql.append("          WHERE vin_no ='").append(tmpDmsCarDetailVO.getVinNo()).append("'\n" );
						sql.append("    ) B\n" );
						sql.append("    ON (A.ORD_DLR_CD = B.ORD_DLR_CD AND A.VIN_NO = B.VIN_NO)\n" );
						sql.append("	WHEN MATCHED THEN \n");
						sql.append("      UPDATE SET \n");
						sql.append("     A.CAR_STAT_CD = B.CAR_STAT_CD, \n");
						sql.append("     A.CAR_VIN_ALLOC_DT = A.CAR_VIN_ALLOC_DT, \n");
						sql.append("     A.ORD_DLR_YY_MM_DT = A.ORD_DLR_YY_MM_DT, \n");
						sql.append("     A.PLT_GI_DT = A.PLT_GI_DT, \n");
						sql.append("     A.ERP_ORD_NO = B.ERP_ORD_NO, \n");
						sql.append("     A.CUST_SALE_DT = A.CUST_SALE_DT, \n");
						sql.append("     A.CUST_SALE_CANC_DT = A.CUST_SALE_CANC_DT, \n");
						sql.append("     A.DLR_GR_DT = A.DLR_GR_DT, \n");
						sql.append("     A.GR_RETURN_DT = A.GR_RETURN_DT \n");
						sql.append("    WHEN NOT MATCHED THEN\n" );
						sql.append("      INSERT\n" );
						sql.append("        ( car_id,\n" );
						sql.append("          vin_no,\n" );
						sql.append("          vin_no1,\n" );
						sql.append("          vin_no2,\n" );
						sql.append("          carline_cd,\n" );
						sql.append("          model_cd,\n" );
						sql.append("          ocn_cd,\n" );
						sql.append("          ext_color_cd,\n" );
						sql.append("          int_color_cd,\n" );
						sql.append("          car_stat_cd,\n" );
						sql.append("          own_stat_cd,\n" );
						sql.append("          stock_tp,\n" );
						sql.append("          car_dstin_cd,\n" );
						sql.append("          strge_cd,\n" );
						sql.append("          loc_cd,\n" );
						sql.append("          dlr_cd,\n" );
						sql.append("          sale_tp,\n" );
						sql.append("          contract_no,\n" );
						sql.append("          ncar_dstin_cd,\n" );
						sql.append("          grey_yn,\n" );
						sql.append("          gr_dt,\n" );
						sql.append("          car_reg_no,\n" );
						sql.append("          manufact_yy_mm_dt,\n" );
						sql.append("          grte_start_dt,\n" );
						sql.append("          grte_end_dt,\n" );
						sql.append("          disuse_dt,\n" );
						sql.append("          grte_std_cd,\n" );
						sql.append("          del_yn,\n" );
						sql.append("          car_reg_dt,\n" );
						sql.append("          corp_car_dstin_cd,\n" );
						sql.append("          mcar_cd,\n" );
						sql.append("          maker_cd,\n" );
						sql.append("          engin_model_cd,\n" );
						sql.append("          engin_serial_no,\n" );
						sql.append("          key_no,\n" );
						sql.append("          trim_dt,\n" );
						sql.append("          signoff_dt,\n" );
						sql.append("          dlr_ord_req_dt,\n" );
						sql.append("          car_vin_alloc_dt,\n" );
						sql.append("          car_dump_cd,\n" );
						sql.append("          ord_no,\n" );
						sql.append("          ord_dlr_cd,\n" );
						sql.append("          ord_dlr_yy_mm_dt,\n" );
						sql.append("          ord_mm_dt,\n" );
						sql.append("          ord_seq,\n" );
						sql.append("          cert_no,\n" );
						sql.append("          trsf_dlr_cd,\n" );
						sql.append("          trsf_cmp_cd,\n" );
						sql.append("          trsf_cmp_truck_no,\n" );
						sql.append("          ord_tp,\n" );
						sql.append("          plt_gi_dt,\n" );
						sql.append("          cert_secu_cd,\n" );
						sql.append("          erp_ord_no,\n" );
						sql.append("          cmp_cd,\n" );
						sql.append("          dist_cd,\n" );
						sql.append("          grade_cd,\n" );
						sql.append("          div_cd,\n" );
						sql.append("          engin_no,\n" );
						sql.append("          car_alloc_canc_dt,\n" );
						sql.append("          invc_publ_dt,\n" );
						sql.append("          cust_sale_dt,\n" );
						sql.append("          cust_sale_canc_dt,\n" );
						sql.append("          dlr_gr_dt,\n" );
						sql.append("          vinm_etc2,\n" );
						sql.append("          gr_return_reason_cd,\n" );
						sql.append("          vinm_etc5,\n" );
						sql.append("          vinm_etc6,\n" );
						sql.append("          alloc_dlr_cd,\n" );
						sql.append("          gr_return_dt,\n" );
						sql.append("          vinm_cmiv,\n" );
						sql.append("          vinm_bkcd,\n" );
						sql.append("          vinm_bktx,\n" );
						sql.append("          vinm_warc,\n" );
						sql.append("          stat_cd,\n" );
						sql.append("          vinm_cpgm,\n" );
						sql.append("          vinm_upgm,\n" );
						sql.append("          rfid_no,\n" );
						sql.append("          vinm_f20007,\n" );
						sql.append("          vinm_f20008,\n" );
						sql.append("          vinm_f20009,\n" );
						sql.append("          vinm_f20010,\n" );
						sql.append("          retl_tp_cd,\n" );
						sql.append("          retl_canc_reason_cd,\n" );
						sql.append("          car_nm,\n" );
						sql.append("          car_disp_qty,\n" );
						sql.append("          open_yn,\n" );
						sql.append("          remark,\n" );
						sql.append("          lv2_dlr_org_cd,\n" );
						sql.append("          lv2_dlr_stock_yn,\n" );
						sql.append("          lv2_dlr_stock_gr_dt,\n" );
						sql.append("          cmp_car_yn,\n" );
						sql.append("          cmp_car_dstin_cd,\n" );
						sql.append("          car_run_dist_val,\n" );
						sql.append("          tec_id,\n" );
						sql.append("          car_brand_cd,\n" );
						sql.append("          temp1,\n" );
						sql.append("          temp2,\n" );
						sql.append("          temp3,\n" );
						sql.append("          temp4,\n" );
						sql.append("          temp5,\n" );
						sql.append("          temp6,\n" );
						sql.append("          temp7,\n" );
						sql.append("          temp8,\n" );
						sql.append("          temp9,\n" );
						sql.append("          temp10,\n" );
						sql.append("          reg_usr_id,\n" );
						sql.append("          reg_dt,\n" );
						sql.append("          updt_usr_id,\n" );
						sql.append("          updt_dt,\n" );
						sql.append("          pre_gi_yn,\n" );
						sql.append("          mm_cnt,\n" );
						sql.append("          dd_cnt,\n" );
						sql.append("          retl_prc,\n" );
						sql.append("          whsl_prc,\n" );
						sql.append("          ddct_rate,\n" );
						sql.append("          block_sale_adv_no,\n" );
						sql.append("          tm_no1,\n" );
						sql.append("          tm_no2,\n" );
						sql.append("          cert_secu2_cd,\n" );
						sql.append("          jeongpan_no,\n" );
						sql.append("          sale_emp_no,\n" );
						sql.append("          expc_chk_dt,\n" );
						sql.append("          expc_chk_run_dist_val,\n" );
						sql.append("          damage_cd,\n" );
						sql.append("          block_yn,\n" );
						sql.append("          str_no,\n" );
						sql.append("          str_yn,\n" );
						sql.append("          vinm_bkwb,\n" );
						sql.append("          vinm_bkcm,\n" );
						sql.append("          vinm_wdate,\n" );
						sql.append("          vinm_zfbdt,\n" );
						sql.append("          zfnewen,\n" );
						sql.append("          zfnewsub,\n" );
						sql.append("          rel_dt,\n" );
						sql.append("          rel_status\n" );
						sql.append("        )\n" );
						sql.append("      VALUES\n" );
						sql.append("        (\n" );
						sql.append("          b.car_id,\n" );
						sql.append("          b.vin_no,\n" );
						sql.append("          b.vin_no1,\n" );
						sql.append("          b.vin_no2,\n" );
						sql.append("          b.carline_cd,\n" );
						sql.append("          b.model_cd,\n" );
						sql.append("          b.ocn_cd,\n" );
						sql.append("          b.ext_color_cd,\n" );
						sql.append("          b.int_color_cd,\n" );
						sql.append("          b.car_stat_cd,\n" );
						sql.append("          b.own_stat_cd,\n" );
						sql.append("          b.stock_tp,\n" );
						sql.append("          b.car_dstin_cd,\n" );
						sql.append("          b.strge_cd,\n" );
						sql.append("          b.loc_cd,\n" );
						sql.append("          b.dlr_cd,\n" );
						sql.append("          b.sale_tp,\n" );
						sql.append("          b.contract_no,\n" );
						sql.append("          b.ncar_dstin_cd,\n" );
						sql.append("          b.grey_yn,\n" );
						sql.append("          b.gr_dt,\n" );
						sql.append("          b.car_reg_no,\n" );
						sql.append("          b.manufact_yy_mm_dt,\n" );
						sql.append("          b.grte_start_dt,\n" );
						sql.append("          b.grte_end_dt,\n" );
						sql.append("          b.disuse_dt,\n" );
						sql.append("          b.grte_std_cd,\n" );
						sql.append("          b.del_yn,\n" );
						sql.append("          b.car_reg_dt,\n" );
						sql.append("          b.corp_car_dstin_cd,\n" );
						sql.append("          b.mcar_cd,\n" );
						sql.append("          b.maker_cd,\n" );
						sql.append("          b.engin_model_cd,\n" );
						sql.append("          b.engin_serial_no,\n" );
						sql.append("          b.key_no,\n" );
						sql.append("          b.trim_dt,\n" );
						sql.append("          b.signoff_dt,\n" );
						sql.append("          b.dlr_ord_req_dt,\n" );
						sql.append("          b.car_vin_alloc_dt,\n" );
						sql.append("          b.car_dump_cd,\n" );
						sql.append("          b.ord_no,\n" );
						sql.append("          b.ord_dlr_cd,\n" );
						sql.append("          b.ord_dlr_yy_mm_dt,\n" );
						sql.append("          b.ord_mm_dt,\n" );
						sql.append("          b.ord_seq,\n" );
						sql.append("          b.cert_no,\n" );
						sql.append("          b.trsf_dlr_cd,\n" );
						sql.append("          b.trsf_cmp_cd,\n" );
						sql.append("          b.trsf_cmp_truck_no,\n" );
						sql.append("          b.ord_tp,\n" );
						sql.append("          b.plt_gi_dt,\n" );
						sql.append("          b.cert_secu_cd,\n" );
						sql.append("          b.erp_ord_no,\n" );
						sql.append("          b.cmp_cd,\n" );
						sql.append("          b.dist_cd,\n" );
						sql.append("          b.grade_cd,\n" );
						sql.append("          b.div_cd,\n" );
						sql.append("          b.engin_no,\n" );
						sql.append("          b.car_alloc_canc_dt,\n" );
						sql.append("          b.invc_publ_dt,\n" );
						sql.append("          b.cust_sale_dt,\n" );
						sql.append("          b.cust_sale_canc_dt,\n" );
						sql.append("          b.dlr_gr_dt,\n" );
						sql.append("          b.vinm_etc2,\n" );
						sql.append("          b.gr_return_reason_cd,\n" );
						sql.append("          b.vinm_etc5,\n" );
						sql.append("          b.vinm_etc6,\n" );
						sql.append("          b.alloc_dlr_cd,\n" );
						sql.append("          b.gr_return_dt,\n" );
						sql.append("          b.vinm_cmiv,\n" );
						sql.append("          b.vinm_bkcd,\n" );
						sql.append("          b.vinm_bktx,\n" );
						sql.append("          b.vinm_warc,\n" );
						sql.append("          b.stat_cd,\n" );
						sql.append("          b.vinm_cpgm,\n" );
						sql.append("          b.vinm_upgm,\n" );
						sql.append("          b.rfid_no,\n" );
						sql.append("          b.vinm_f20007,\n" );
						sql.append("          b.vinm_f20008,\n" );
						sql.append("          b.vinm_f20009,\n" );
						sql.append("          b.vinm_f20010,\n" );
						sql.append("          b.retl_tp_cd,\n" );
						sql.append("          b.retl_canc_reason_cd,\n" );
						sql.append("          b.car_nm,\n" );
						sql.append("          b.car_disp_qty,\n" );
						sql.append("          b.open_yn,\n" );
						sql.append("          b.remark,\n" );
						sql.append("          b.lv2_dlr_org_cd,\n" );
						sql.append("          b.lv2_dlr_stock_yn,\n" );
						sql.append("          b.lv2_dlr_stock_gr_dt,\n" );
						sql.append("          b.cmp_car_yn,\n" );
						sql.append("          b.cmp_car_dstin_cd,\n" );
						sql.append("          b.car_run_dist_val,\n" );
						sql.append("          b.tec_id,\n" );
						sql.append("          b.car_brand_cd,\n" );
						sql.append("          b.temp1,\n" );
						sql.append("          b.temp2,\n" );
						sql.append("          b.temp3,\n" );
						sql.append("          b.temp4,\n" );
						sql.append("          b.temp5,\n" );
						sql.append("          b.temp6,\n" );
						sql.append("          b.temp7,\n" );
						sql.append("          b.temp8,\n" );
						sql.append("          b.temp9,\n" );
						sql.append("          b.temp10,\n" );
						sql.append("          b.reg_usr_id,\n" );
						sql.append("          b.reg_dt,\n" );
						sql.append("          b.updt_usr_id,\n" );
						sql.append("          b.updt_dt,\n" );
						sql.append("          b.pre_gi_yn,\n" );
						sql.append("          b.mm_cnt,\n" );
						sql.append("          b.dd_cnt,\n" );
						sql.append("          b.retl_prc,\n" );
						sql.append("          b.whsl_prc,\n" );
						sql.append("          b.ddct_rate,\n" );
						sql.append("          b.block_sale_adv_no,\n" );
						sql.append("          b.tm_no1,\n" );
						sql.append("          b.tm_no2,\n" );
						sql.append("          b.cert_secu2_cd,\n" );
						sql.append("          b.jeongpan_no,\n" );
						sql.append("          b.sale_emp_no,\n" );
						sql.append("          b.expc_chk_dt,\n" );
						sql.append("          b.expc_chk_run_dist_val,\n" );
						sql.append("          b.damage_cd,\n" );
						sql.append("          b.block_yn,\n" );
						sql.append("          b.str_no,\n" );
						sql.append("          b.str_yn,\n" );
						sql.append("          b.vinm_bkwb,\n" );
						sql.append("          b.vinm_bkcm,\n" );
						sql.append("          b.vinm_wdate,\n" );
						sql.append("          b.vinm_zfbdt,\n" );
						sql.append("          b.zfnewen,\n" );
						sql.append("          b.zfnewsub,\n" );
						sql.append("          b.rel_dt,\n" );
						sql.append("          b.rel_status\n" );
						sql.append("      )\n" );

					}else if("店代码不一致".endsWith(tmpDmsCarDetailVO.getCheckReason())||"SAP在途DMS分配".endsWith(tmpDmsCarDetailVO.getCheckReason())){
						//修改主表的店代码  						
					}else if("SAP在途DMS库存".endsWith(tmpDmsCarDetailVO.getCheckReason())){
						//修改主表的车辆状态，并删除入库记录
						sql301 = new StringBuffer();
						sql301.append("DELETE FROM SA_0301T T WHERE T.KMVIN = '").append(tmpDmsCarDetailVO.getVinNo()).append("' \n");
					}else if("SAP在途DMS零售".endsWith(tmpDmsCarDetailVO.getCheckReason())){
						//修改主表的车辆状态，并删除入库记录
						sql301 = new StringBuffer();
						sql301.append("DELETE FROM SA_0301T T WHERE T.KMVIN = '").append(tmpDmsCarDetailVO.getVinNo()).append("' \n");
					}else if("SAP库存DMS分配".endsWith(tmpDmsCarDetailVO.getCheckReason())){
						//修改主表，增加入库记录
						sql301 = new StringBuffer();
						sql301.append("INSERT INTO SA_0301T \n");
						sql301.append("        (KMTRDY, \n");
						sql301.append("         KMTRTM, \n");
						sql301.append("         KMSEQ, \n");
						sql301.append("         KMOPT, \n");
						sql301.append("         KMDATE, \n");
						sql301.append("         KMVIN, \n");
						sql301.append("         KMDELR, \n");
						sql301.append("         KMRGNO, \n");
						sql301.append("         KMOTIT, \n");
						sql301.append("         KMUSER) \n");
						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getDlrCd()).append("','YYYYMM')), 'YYYYMMDD'), \n");
						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'HH24MISS'), \n");
						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
						sql301.append("              FROM SA_0301T \n");
						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD') \n");
						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
						sql301.append("               'I1', \n");
						sql301.append("               GR_RETURN_DT, \n");
						sql301.append("               VIN_NO, \n");
						sql301.append("               ORD_DLR_CD, \n");
						sql301.append("               LV2_DLR_ORG_CD, \n");
						sql301.append("               CAR_DSTIN_CD, \n");
						sql301.append("               ORD_DLR_CD \n");
						sql301.append("          FROM SA_0121T \n");
						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
					}else if("SAP库存DMS在途".endsWith(tmpDmsCarDetailVO.getCheckReason())){
						//修改主表，增加入库记录
						sql301 = new StringBuffer();
						sql301.append("INSERT INTO SA_0301T \n");
						sql301.append("        (KMTRDY, \n");
						sql301.append("         KMTRTM, \n");
						sql301.append("         KMSEQ, \n");
						sql301.append("         KMOPT, \n");
						sql301.append("         KMDATE, \n");
						sql301.append("         KMVIN, \n");
						sql301.append("         KMDELR, \n");
						sql301.append("         KMRGNO, \n");
						sql301.append("         KMOTIT, \n");
						sql301.append("         KMUSER) \n");
						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD'), \n");
						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'HH24MISS'), \n");
						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
						sql301.append("              FROM SA_0301T \n");
						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD') \n");
						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
						sql301.append("               'I1', \n");
						sql301.append("               GR_RETURN_DT, \n");
						sql301.append("               VIN_NO, \n");
						sql301.append("               ORD_DLR_CD, \n");
						sql301.append("               LV2_DLR_ORG_CD, \n");
						sql301.append("               CAR_DSTIN_CD, \n");
						sql301.append("               ORD_DLR_CD \n");
						sql301.append("          FROM SA_0121T \n");
						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
					}else if("SAP库存DMS零售".endsWith(tmpDmsCarDetailVO.getCheckReason())){
						sql = new StringBuffer();
						sql.append("MERGE INTO SA_0121T A \n");
						sql.append("USING( \n");
						sql.append("SELECT VIN_NO1,VIN_NO2,VIN_NO1||VIN_NO2 VIN_NO, \n");
						sql.append("CASE WHEN CAR_STAT_CD = 'Q170' THEN '50' \n");
						sql.append("     WHEN CAR_STAT_CD = 'Q190' AND STR_YN IS NULL THEN '70' \n");
						sql.append("     WHEN CAR_STAT_CD = 'Q190' AND STR_YN = 'X' THEN '60' \n");
						sql.append("     WHEN CAR_STAT_CD = 'Q180' THEN '60' END CAR_STAT_CD, \n");
						sql.append("CAR_VIN_ALLOC_DT,ORD_DLR_CD,ORD_DLR_YY_MM_DT,ORD_TP,PLT_GI_DT,ERP_ORD_NO,CUST_SALE_DT,CUST_SALE_CANC_DT,DLR_GR_DT,GR_RETURN_DT,VINM_BKTX,CAR_ORD_ALLOC_DT,CAR_ORD_EMONTH \n");
						sql.append("FROM SA_0121IR_MONTH@").append(devOrPrd).append(" \n");
						sql.append("WHERE VIN_NO1||VIN_NO2='").append(tmpDmsCarDetailVO.getVinNo()).append("' \n");
						sql.append(") B \n");
						sql.append("ON (A.VIN_NO = B.VIN_NO1||B.VIN_NO2) \n");
						sql.append("WHEN MATCHED THEN \n");
						sql.append("  UPDATE SET \n");
						sql.append("     A.CAR_STAT_CD = B.CAR_STAT_CD, \n");
						sql.append("     A.CAR_VIN_ALLOC_DT = CASE WHEN B.CAR_VIN_ALLOC_DT IS NULL OR NVL(B.CAR_VIN_ALLOC_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.CAR_VIN_ALLOC_DT,'YYYYMMDD') END, \n");
						sql.append("     A.ORD_DLR_CD = B.ORD_DLR_CD, \n");
						sql.append("     A.ORD_DLR_YY_MM_DT = SUBSTR(B.ORD_DLR_YY_MM_DT,0,6), \n");
						sql.append("     A.PLT_GI_DT = CASE WHEN B.PLT_GI_DT IS NULL OR NVL(B.PLT_GI_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.PLT_GI_DT,'YYYYMMDD') END, \n");
						sql.append("     A.ERP_ORD_NO = B.ERP_ORD_NO, \n");
						sql.append("     A.CUST_SALE_DT = CASE WHEN B.CUST_SALE_DT IS NULL OR NVL(B.CUST_SALE_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.CUST_SALE_DT,'YYYYMMDD') END, \n");
						sql.append("     A.CUST_SALE_CANC_DT = CASE WHEN B.CUST_SALE_CANC_DT IS NULL OR NVL(B.CUST_SALE_CANC_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.CUST_SALE_CANC_DT,'YYYYMMDD') END, \n");
						sql.append("     A.DLR_GR_DT = CASE WHEN B.DLR_GR_DT IS NULL OR NVL(B.DLR_GR_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.DLR_GR_DT,'YYYYMMDD') END, \n");
						sql.append("     A.GR_RETURN_DT = CASE WHEN B.GR_RETURN_DT IS NULL OR NVL(B.GR_RETURN_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.GR_RETURN_DT,'YYYYMMDD') END, \n");
						sql.append("     A.SALE_TP = '', \n");
						sql.append("     A.STAT_CD = 'F', \n");
						sql.append("     A.CONTRACT_NO = NULL, \n");
						sql.append("     A.INVC_PUBL_DT = '', \n");
						sql.append("     A.PRE_GI_YN = 'N', \n");
						sql.append("     A.SALE_EMP_NO = '', \n");
						sql.append("     A.BLOCK_SALE_ADV_NO = '', \n");
						sql.append("     A.UPDT_USR_ID = 'admin', \n");
						sql.append("     A.UPDT_DT = SYSDATE \n");

						
						//修改主表，增加退库记录（此处需要核对逻辑）
						sql301 = new StringBuffer();
						sql301.append("INSERT INTO SA_0301T \n");
						sql301.append("        (KMTRDY, \n");
						sql301.append("         KMTRTM, \n");
						sql301.append("         KMSEQ, \n");
						sql301.append("         KMOPT, \n");
						sql301.append("         KMDATE, \n");
						sql301.append("         KMVIN, \n");
						sql301.append("         KMDELR, \n");
						sql301.append("         KMRGNO, \n");
						sql301.append("         KMOTIT, \n");
						sql301.append("         KMUSER) \n");
						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD'), \n");
						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'HH24MISS'), \n");
						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
						sql301.append("              FROM SA_0301T \n");
						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD') \n");
						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
						sql301.append("               'J2', \n");
						sql301.append("               GR_RETURN_DT, \n");
						sql301.append("               VIN_NO, \n");
						sql301.append("               ORD_DLR_CD, \n");
						sql301.append("               LV2_DLR_ORG_CD, \n");
						sql301.append("               CAR_DSTIN_CD, \n");
						sql301.append("               ORD_DLR_CD \n");
						sql301.append("          FROM SA_0121T \n");
						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
					}else if("SAP库存DMS战略出库".endsWith(tmpDmsCarDetailVO.getCheckReason())){
						//修改主表，增加入库记录
						sql301 = new StringBuffer();
						sql301.append("INSERT INTO SA_0301T \n");
						sql301.append("        (KMTRDY, \n");
						sql301.append("         KMTRTM, \n");
						sql301.append("         KMSEQ, \n");
						sql301.append("         KMOPT, \n");
						sql301.append("         KMDATE, \n");
						sql301.append("         KMVIN, \n");
						sql301.append("         KMDELR, \n");
						sql301.append("         KMRGNO, \n");
						sql301.append("         KMOTIT, \n");
						sql301.append("         KMUSER) \n");
						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD'), \n");
						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'HH24MISS'), \n");
						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
						sql301.append("              FROM SA_0301T \n");
						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD') \n");
						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
						sql301.append("               'J4', \n");
						sql301.append("               GR_RETURN_DT, \n");
						sql301.append("               VIN_NO, \n");
						sql301.append("               ORD_DLR_CD, \n");
						sql301.append("               LV2_DLR_ORG_CD, \n");
						sql301.append("               CAR_DSTIN_CD, \n");
						sql301.append("               ORD_DLR_CD \n");
						sql301.append("          FROM SA_0121T \n");
						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
					}else if("SAP零售DMS非零售".endsWith(tmpDmsCarDetailVO.getCheckReason())){
						//修改主表，增加零售出库记录
						sql301 = new StringBuffer();
						sql301.append("INSERT INTO SA_0301T \n");
						sql301.append("        (KMTRDY, \n");
						sql301.append("         KMTRTM, \n");
						sql301.append("         KMSEQ, \n");
						sql301.append("         KMOPT, \n");
						sql301.append("         KMDATE, \n");
						sql301.append("         KMVIN, \n");
						sql301.append("         KMDELR, \n");
						sql301.append("         KMRGNO, \n");
						sql301.append("         KMOTIT, \n");
						sql301.append("         KMUSER) \n");
						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD'), \n");
						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'HH24MISS'), \n");
						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
						sql301.append("              FROM SA_0301T \n");
						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD') \n");
						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
						sql301.append("               'J1', \n");
						sql301.append("               GR_RETURN_DT, \n");
						sql301.append("               VIN_NO, \n");
						sql301.append("               ORD_DLR_CD, \n");
						sql301.append("               LV2_DLR_ORG_CD, \n");
						sql301.append("               CAR_DSTIN_CD, \n");
						sql301.append("               ORD_DLR_CD \n");
						sql301.append("          FROM SA_0121T \n");
						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
					}else if("SAP战略出库DMS真实出库".endsWith(tmpDmsCarDetailVO.getCheckReason())){
						//增加零售前一天的退库记录
						sql301Pro = new StringBuffer();
						sql301Pro.append("INSERT INTO SA_0301T \n");
						sql301Pro.append("        (KMTRDY, \n");
						sql301Pro.append("         KMTRTM, \n");
						sql301Pro.append("         KMSEQ, \n");
						sql301Pro.append("         KMOPT, \n");
						sql301Pro.append("         KMDATE, \n");
						sql301Pro.append("         KMVIN, \n");
						sql301Pro.append("         KMDELR, \n");
						sql301Pro.append("         KMRGNO, \n");
						sql301Pro.append("         KMOTIT, \n");
						sql301Pro.append("         KMUSER) \n");
						sql301Pro.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM'))-1, 'YYYYMMDD'), \n");
						sql301Pro.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'HH24MISS'), \n");
						sql301Pro.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
						sql301Pro.append("              FROM SA_0301T \n");
						sql301Pro.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD') \n");
						sql301Pro.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
						sql301Pro.append("               'J2', \n");
						sql301Pro.append("               GR_RETURN_DT, \n");
						sql301Pro.append("               VIN_NO, \n");
						sql301Pro.append("               ORD_DLR_CD, \n");
						sql301Pro.append("               LV2_DLR_ORG_CD, \n");
						sql301Pro.append("               CAR_DSTIN_CD, \n");
						sql301Pro.append("               ORD_DLR_CD \n");
						sql301Pro.append("          FROM SA_0121T \n");
						sql301Pro.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
						
						//修改主表，增加零售出库记录
						sql301 = new StringBuffer();
						sql301.append("INSERT INTO SA_0301T \n");
						sql301.append("        (KMTRDY, \n");
						sql301.append("         KMTRTM, \n");
						sql301.append("         KMSEQ, \n");
						sql301.append("         KMOPT, \n");
						sql301.append("         KMDATE, \n");
						sql301.append("         KMVIN, \n");
						sql301.append("         KMDELR, \n");
						sql301.append("         KMRGNO, \n");
						sql301.append("         KMOTIT, \n");
						sql301.append("         KMUSER) \n");
						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD'), \n");
						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'HH24MISS'), \n");
						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
						sql301.append("              FROM SA_0301T \n");
						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD') \n");
						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
						sql301.append("               'J3', \n");
						sql301.append("               GR_RETURN_DT, \n");
						sql301.append("               VIN_NO, \n");
						sql301.append("               ORD_DLR_CD, \n");
						sql301.append("               LV2_DLR_ORG_CD, \n");
						sql301.append("               CAR_DSTIN_CD, \n");
						sql301.append("               ORD_DLR_CD \n");
						sql301.append("          FROM SA_0121T \n");
						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
						
						//补战略出库记录
						sql256 = new StringBuffer();
						sql256.append("INSERT INTO SA_0256T ( \n");
						sql256.append("              DLR_CD, \n");
						sql256.append("              STR_NO, \n");
						sql256.append("              CAR_ID, \n");
						sql256.append("              VIN_NO, \n");
						sql256.append("              STR_STAT, \n");
						sql256.append("              STR_ASK_DT, \n");
						sql256.append("              STR_CONFIRM_DT, \n");
						sql256.append("              CONFIRM_USR_ID, \n");
						sql256.append("              CONFIRM_REMARK, \n");
						sql256.append("              CARLINE_CD, \n");
						sql256.append("              MODEL_CD, \n");
						sql256.append("              OCN_CD, \n");
						sql256.append("              EXT_COLOR_CD, \n");
						sql256.append("              INT_COLOR_CD, \n");
						sql256.append("              ORD_TP, \n");
						sql256.append("              CUST_CD, \n");
						sql256.append("              CUST_NM, \n");
						sql256.append("              REMARK, \n");
						sql256.append("              CONTRACT_NO, \n");
						sql256.append("              CANC_DT, \n");
						sql256.append("              CAANC_RESON, \n");
						sql256.append("              REG_USR_ID, \n");
						sql256.append("              REG_DT, \n");
						sql256.append("              UPDT_USR_ID, \n");
						sql256.append("              UPDT_DT \n");
						sql256.append("              ) \n");
						sql256.append("SELECT C.ORD_DLR_CD DLR_CD, \n");
						sql256.append("           NVL(C.STR_NO, '1') STR_NO, \n");
						sql256.append("           D.CAR_ID, \n");
						sql256.append("           D.VIN_NO, \n");
						sql256.append("           'B' STR_STAT, \n");
						sql256.append("           CASE \n");
						sql256.append("             WHEN NVL(C.CUST_SALE_DT, '00000000') = '00000000' THEN \n");
						sql256.append("              SYSDATE - 1 \n");
						sql256.append("             ELSE \n");
						sql256.append("              TO_DATE(C.CUST_SALE_DT, 'YYYYMMDD') \n");
						sql256.append("           END STR_ASK_DT, \n");
						sql256.append("           CASE \n");
						sql256.append("             WHEN NVL(C.CUST_SALE_DT, '00000000') = '00000000' THEN \n");
						sql256.append("              SYSDATE - 1 \n");
						sql256.append("             ELSE \n");
						sql256.append("              TO_DATE(C.CUST_SALE_DT, 'YYYYMMDD') \n");
						sql256.append("           END STR_CONFIRM_DT, \n");
						sql256.append("           'admin2' CONFIRM_USR_ID, \n");
						sql256.append("           '' CONFIRM_REMARK, \n");
						sql256.append("           C.CARLINE_CD, \n");
						sql256.append("           C.MODEL_CD, \n");
						sql256.append("           C.OCN_CD, \n");
						sql256.append("           C.EXT_COLOR_CD, \n");
						sql256.append("           C.INT_COLOR_CD, \n");
						sql256.append("           C.ORD_TP, \n");
						sql256.append("           NULL CUST_CD, \n");
						sql256.append("           C.ORD_DLR_CD || E.DLR_NM CUST_NM, \n");
						sql256.append("           NULL REMARK, \n");
						sql256.append("           NULL CONTRACT_NO, \n");
						sql256.append("           NULL CANC_DT, \n");
						sql256.append("           NULL CAANC_RESON, \n");
						sql256.append("           'admin2' REG_USR_ID, \n");
						sql256.append("           CASE \n");
						sql256.append("             WHEN NVL(C.CUST_SALE_DT, '00000000') = '00000000' THEN \n");
						sql256.append("              SYSDATE - 1 \n");
						sql256.append("             ELSE \n");
						sql256.append("              TO_DATE(C.CUST_SALE_DT, 'YYYYMMDD') \n");
						sql256.append("           END REG_DT, \n");
						sql256.append("           'admin2' UPDT_USR_ID, \n");
						sql256.append("           CASE \n");
						sql256.append("             WHEN NVL(C.CUST_SALE_DT, '00000000') = '00000000' THEN \n");
						sql256.append("              SYSDATE - 1 \n");
						sql256.append("             ELSE \n");
						sql256.append("              TO_DATE(C.CUST_SALE_DT, 'YYYYMMDD') \n");
						sql256.append("           END UPDT_DT \n");
						sql256.append("      FROM SA_0121IR_MONTH@BHDCSOP C, SA_0121T D, CM_0101T E \n");
						sql256.append("     WHERE C.VIN_NO1 || C.VIN_NO2 = D.VIN_NO \n");
						sql256.append("       AND C.ORD_DLR_CD = E.DLR_CD \n");
						sql256.append("       AND C.VIN_NO1||C.VIN_NO2 = '").append(tmpDmsCarDetailVO.getVinNo()).append("' \n");

						
					}else if("SAP战略出库DMS战略转真实".endsWith(tmpDmsCarDetailVO.getCheckReason())){
						
						//修改主表，增加零售出库记录
						sql301 = new StringBuffer();
						sql301.append("INSERT INTO SA_0301T \n");
						sql301.append("        (KMTRDY, \n");
						sql301.append("         KMTRTM, \n");
						sql301.append("         KMSEQ, \n");
						sql301.append("         KMOPT, \n");
						sql301.append("         KMDATE, \n");
						sql301.append("         KMVIN, \n");
						sql301.append("         KMDELR, \n");
						sql301.append("         KMRGNO, \n");
						sql301.append("         KMOTIT, \n");
						sql301.append("         KMUSER) \n");
						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD'), \n");
						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'HH24MISS'), \n");
						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
						sql301.append("              FROM SA_0301T \n");
						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD') \n");
						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
						sql301.append("               'J3', \n");
						sql301.append("               GR_RETURN_DT, \n");
						sql301.append("               VIN_NO, \n");
						sql301.append("               ORD_DLR_CD, \n");
						sql301.append("               LV2_DLR_ORG_CD, \n");
						sql301.append("               CAR_DSTIN_CD, \n");
						sql301.append("               ORD_DLR_CD \n");
						sql301.append("          FROM SA_0121T \n");
						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
						
						//补战略出库记录
						sql256 = new StringBuffer();
						sql256.append("INSERT INTO SA_0256T ( \n");
						sql256.append("              DLR_CD, \n");
						sql256.append("              STR_NO, \n");
						sql256.append("              CAR_ID, \n");
						sql256.append("              VIN_NO, \n");
						sql256.append("              STR_STAT, \n");
						sql256.append("              STR_ASK_DT, \n");
						sql256.append("              STR_CONFIRM_DT, \n");
						sql256.append("              CONFIRM_USR_ID, \n");
						sql256.append("              CONFIRM_REMARK, \n");
						sql256.append("              CARLINE_CD, \n");
						sql256.append("              MODEL_CD, \n");
						sql256.append("              OCN_CD, \n");
						sql256.append("              EXT_COLOR_CD, \n");
						sql256.append("              INT_COLOR_CD, \n");
						sql256.append("              ORD_TP, \n");
						sql256.append("              CUST_CD, \n");
						sql256.append("              CUST_NM, \n");
						sql256.append("              REMARK, \n");
						sql256.append("              CONTRACT_NO, \n");
						sql256.append("              CANC_DT, \n");
						sql256.append("              CAANC_RESON, \n");
						sql256.append("              REG_USR_ID, \n");
						sql256.append("              REG_DT, \n");
						sql256.append("              UPDT_USR_ID, \n");
						sql256.append("              UPDT_DT \n");
						sql256.append("              ) \n");
						sql256.append("SELECT C.ORD_DLR_CD DLR_CD, \n");
						sql256.append("           NVL(C.STR_NO, '1') STR_NO, \n");
						sql256.append("           D.CAR_ID, \n");
						sql256.append("           D.VIN_NO, \n");
						sql256.append("           'B' STR_STAT, \n");
						sql256.append("           CASE \n");
						sql256.append("             WHEN NVL(C.CUST_SALE_DT, '00000000') = '00000000' THEN \n");
						sql256.append("              SYSDATE - 1 \n");
						sql256.append("             ELSE \n");
						sql256.append("              TO_DATE(C.CUST_SALE_DT, 'YYYYMMDD') \n");
						sql256.append("           END STR_ASK_DT, \n");
						sql256.append("           CASE \n");
						sql256.append("             WHEN NVL(C.CUST_SALE_DT, '00000000') = '00000000' THEN \n");
						sql256.append("              SYSDATE - 1 \n");
						sql256.append("             ELSE \n");
						sql256.append("              TO_DATE(C.CUST_SALE_DT, 'YYYYMMDD') \n");
						sql256.append("           END STR_CONFIRM_DT, \n");
						sql256.append("           'admin2' CONFIRM_USR_ID, \n");
						sql256.append("           '' CONFIRM_REMARK, \n");
						sql256.append("           C.CARLINE_CD, \n");
						sql256.append("           C.MODEL_CD, \n");
						sql256.append("           C.OCN_CD, \n");
						sql256.append("           C.EXT_COLOR_CD, \n");
						sql256.append("           C.INT_COLOR_CD, \n");
						sql256.append("           C.ORD_TP, \n");
						sql256.append("           NULL CUST_CD, \n");
						sql256.append("           C.ORD_DLR_CD || E.DLR_NM CUST_NM, \n");
						sql256.append("           NULL REMARK, \n");
						sql256.append("           NULL CONTRACT_NO, \n");
						sql256.append("           NULL CANC_DT, \n");
						sql256.append("           NULL CAANC_RESON, \n");
						sql256.append("           'admin2' REG_USR_ID, \n");
						sql256.append("           CASE \n");
						sql256.append("             WHEN NVL(C.CUST_SALE_DT, '00000000') = '00000000' THEN \n");
						sql256.append("              SYSDATE - 1 \n");
						sql256.append("             ELSE \n");
						sql256.append("              TO_DATE(C.CUST_SALE_DT, 'YYYYMMDD') \n");
						sql256.append("           END REG_DT, \n");
						sql256.append("           'admin2' UPDT_USR_ID, \n");
						sql256.append("           CASE \n");
						sql256.append("             WHEN NVL(C.CUST_SALE_DT, '00000000') = '00000000' THEN \n");
						sql256.append("              SYSDATE - 1 \n");
						sql256.append("             ELSE \n");
						sql256.append("              TO_DATE(C.CUST_SALE_DT, 'YYYYMMDD') \n");
						sql256.append("           END UPDT_DT \n");
						sql256.append("      FROM SA_0121IR_MONTH@BHDCSOP C, SA_0121T D, CM_0101T E \n");
						sql256.append("     WHERE C.VIN_NO1 || C.VIN_NO2 = D.VIN_NO \n");
						sql256.append("       AND C.ORD_DLR_CD = E.DLR_CD \n");
						sql256.append("       AND C.VIN_NO1||C.VIN_NO2 = '").append(tmpDmsCarDetailVO.getVinNo()).append("' \n");
						
					}else if("SAP战略出库DMS库存".endsWith(tmpDmsCarDetailVO.getCheckReason())){
						//修改主表，增加零售出库记录
						sql301 = new StringBuffer();
						sql301.append("INSERT INTO SA_0301T \n");
						sql301.append("        (KMTRDY, \n");
						sql301.append("         KMTRTM, \n");
						sql301.append("         KMSEQ, \n");
						sql301.append("         KMOPT, \n");
						sql301.append("         KMDATE, \n");
						sql301.append("         KMVIN, \n");
						sql301.append("         KMDELR, \n");
						sql301.append("         KMRGNO, \n");
						sql301.append("         KMOTIT, \n");
						sql301.append("         KMUSER) \n");
						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD'), \n");
						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'HH24MISS'), \n");
						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
						sql301.append("              FROM SA_0301T \n");
						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD') \n");
						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
						sql301.append("               'J3', \n");
						sql301.append("               GR_RETURN_DT, \n");
						sql301.append("               VIN_NO, \n");
						sql301.append("               ORD_DLR_CD, \n");
						sql301.append("               LV2_DLR_ORG_CD, \n");
						sql301.append("               CAR_DSTIN_CD, \n");
						sql301.append("               ORD_DLR_CD \n");
						sql301.append("          FROM SA_0121T \n");
						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
						
						//补战略出库记录
						sql256 = new StringBuffer();
						sql256.append("INSERT INTO SA_0256T ( \n");
						sql256.append("              DLR_CD, \n");
						sql256.append("              STR_NO, \n");
						sql256.append("              CAR_ID, \n");
						sql256.append("              VIN_NO, \n");
						sql256.append("              STR_STAT, \n");
						sql256.append("              STR_ASK_DT, \n");
						sql256.append("              STR_CONFIRM_DT, \n");
						sql256.append("              CONFIRM_USR_ID, \n");
						sql256.append("              CONFIRM_REMARK, \n");
						sql256.append("              CARLINE_CD, \n");
						sql256.append("              MODEL_CD, \n");
						sql256.append("              OCN_CD, \n");
						sql256.append("              EXT_COLOR_CD, \n");
						sql256.append("              INT_COLOR_CD, \n");
						sql256.append("              ORD_TP, \n");
						sql256.append("              CUST_CD, \n");
						sql256.append("              CUST_NM, \n");
						sql256.append("              REMARK, \n");
						sql256.append("              CONTRACT_NO, \n");
						sql256.append("              CANC_DT, \n");
						sql256.append("              CAANC_RESON, \n");
						sql256.append("              REG_USR_ID, \n");
						sql256.append("              REG_DT, \n");
						sql256.append("              UPDT_USR_ID, \n");
						sql256.append("              UPDT_DT \n");
						sql256.append("              ) \n");
						sql256.append("SELECT C.ORD_DLR_CD DLR_CD, \n");
						sql256.append("           NVL(C.STR_NO, '1') STR_NO, \n");
						sql256.append("           D.CAR_ID, \n");
						sql256.append("           D.VIN_NO, \n");
						sql256.append("           'B' STR_STAT, \n");
						sql256.append("           CASE \n");
						sql256.append("             WHEN NVL(C.CUST_SALE_DT, '00000000') = '00000000' THEN \n");
						sql256.append("              SYSDATE - 1 \n");
						sql256.append("             ELSE \n");
						sql256.append("              TO_DATE(C.CUST_SALE_DT, 'YYYYMMDD') \n");
						sql256.append("           END STR_ASK_DT, \n");
						sql256.append("           CASE \n");
						sql256.append("             WHEN NVL(C.CUST_SALE_DT, '00000000') = '00000000' THEN \n");
						sql256.append("              SYSDATE - 1 \n");
						sql256.append("             ELSE \n");
						sql256.append("              TO_DATE(C.CUST_SALE_DT, 'YYYYMMDD') \n");
						sql256.append("           END STR_CONFIRM_DT, \n");
						sql256.append("           'admin2' CONFIRM_USR_ID, \n");
						sql256.append("           '' CONFIRM_REMARK, \n");
						sql256.append("           C.CARLINE_CD, \n");
						sql256.append("           C.MODEL_CD, \n");
						sql256.append("           C.OCN_CD, \n");
						sql256.append("           C.EXT_COLOR_CD, \n");
						sql256.append("           C.INT_COLOR_CD, \n");
						sql256.append("           C.ORD_TP, \n");
						sql256.append("           NULL CUST_CD, \n");
						sql256.append("           C.ORD_DLR_CD || E.DLR_NM CUST_NM, \n");
						sql256.append("           NULL REMARK, \n");
						sql256.append("           NULL CONTRACT_NO, \n");
						sql256.append("           NULL CANC_DT, \n");
						sql256.append("           NULL CAANC_RESON, \n");
						sql256.append("           'admin2' REG_USR_ID, \n");
						sql256.append("           CASE \n");
						sql256.append("             WHEN NVL(C.CUST_SALE_DT, '00000000') = '00000000' THEN \n");
						sql256.append("              SYSDATE - 1 \n");
						sql256.append("             ELSE \n");
						sql256.append("              TO_DATE(C.CUST_SALE_DT, 'YYYYMMDD') \n");
						sql256.append("           END REG_DT, \n");
						sql256.append("           'admin2' UPDT_USR_ID, \n");
						sql256.append("           CASE \n");
						sql256.append("             WHEN NVL(C.CUST_SALE_DT, '00000000') = '00000000' THEN \n");
						sql256.append("              SYSDATE - 1 \n");
						sql256.append("             ELSE \n");
						sql256.append("              TO_DATE(C.CUST_SALE_DT, 'YYYYMMDD') \n");
						sql256.append("           END UPDT_DT \n");
						sql256.append("      FROM SA_0121IR_MONTH@BHDCSOP C, SA_0121T D, CM_0101T E \n");
						sql256.append("     WHERE C.VIN_NO1 || C.VIN_NO2 = D.VIN_NO \n");
						sql256.append("       AND C.ORD_DLR_CD = E.DLR_CD \n");
						sql256.append("       AND C.VIN_NO1||C.VIN_NO2 = '").append(tmpDmsCarDetailVO.getVinNo()).append("' \n");
					}else if("SAP战略出库DMS缺少战略出库表记录".endsWith(tmpDmsCarDetailVO.getCheckReason())){
						//补录战略出库记录
						sql301 = new StringBuffer();
						sql301.append("INSERT INTO SA_0301T \n");
						sql301.append("        (KMTRDY, \n");
						sql301.append("         KMTRTM, \n");
						sql301.append("         KMSEQ, \n");
						sql301.append("         KMOPT, \n");
						sql301.append("         KMDATE, \n");
						sql301.append("         KMVIN, \n");
						sql301.append("         KMDELR, \n");
						sql301.append("         KMRGNO, \n");
						sql301.append("         KMOTIT, \n");
						sql301.append("         KMUSER) \n");
						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD'), \n");
						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'HH24MISS'), \n");
						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
						sql301.append("              FROM SA_0301T \n");
						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD') \n");
						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
						sql301.append("               'J3', \n");
						sql301.append("               GR_RETURN_DT, \n");
						sql301.append("               VIN_NO, \n");
						sql301.append("               ORD_DLR_CD, \n");
						sql301.append("               LV2_DLR_ORG_CD, \n");
						sql301.append("               CAR_DSTIN_CD, \n");
						sql301.append("               ORD_DLR_CD \n");
						sql301.append("          FROM SA_0121T \n");
						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
						
						//补战略出库记录
						sql256 = new StringBuffer();
						sql256.append("INSERT INTO SA_0256T ( \n");
						sql256.append("              DLR_CD, \n");
						sql256.append("              STR_NO, \n");
						sql256.append("              CAR_ID, \n");
						sql256.append("              VIN_NO, \n");
						sql256.append("              STR_STAT, \n");
						sql256.append("              STR_ASK_DT, \n");
						sql256.append("              STR_CONFIRM_DT, \n");
						sql256.append("              CONFIRM_USR_ID, \n");
						sql256.append("              CONFIRM_REMARK, \n");
						sql256.append("              CARLINE_CD, \n");
						sql256.append("              MODEL_CD, \n");
						sql256.append("              OCN_CD, \n");
						sql256.append("              EXT_COLOR_CD, \n");
						sql256.append("              INT_COLOR_CD, \n");
						sql256.append("              ORD_TP, \n");
						sql256.append("              CUST_CD, \n");
						sql256.append("              CUST_NM, \n");
						sql256.append("              REMARK, \n");
						sql256.append("              CONTRACT_NO, \n");
						sql256.append("              CANC_DT, \n");
						sql256.append("              CAANC_RESON, \n");
						sql256.append("              REG_USR_ID, \n");
						sql256.append("              REG_DT, \n");
						sql256.append("              UPDT_USR_ID, \n");
						sql256.append("              UPDT_DT \n");
						sql256.append("              ) \n");
						sql256.append("SELECT C.ORD_DLR_CD DLR_CD, \n");
						sql256.append("           NVL(C.STR_NO, '1') STR_NO, \n");
						sql256.append("           D.CAR_ID, \n");
						sql256.append("           D.VIN_NO, \n");
						sql256.append("           'B' STR_STAT, \n");
						sql256.append("           CASE \n");
						sql256.append("             WHEN NVL(C.CUST_SALE_DT, '00000000') = '00000000' THEN \n");
						sql256.append("              SYSDATE - 1 \n");
						sql256.append("             ELSE \n");
						sql256.append("              TO_DATE(C.CUST_SALE_DT, 'YYYYMMDD') \n");
						sql256.append("           END STR_ASK_DT, \n");
						sql256.append("           CASE \n");
						sql256.append("             WHEN NVL(C.CUST_SALE_DT, '00000000') = '00000000' THEN \n");
						sql256.append("              SYSDATE - 1 \n");
						sql256.append("             ELSE \n");
						sql256.append("              TO_DATE(C.CUST_SALE_DT, 'YYYYMMDD') \n");
						sql256.append("           END STR_CONFIRM_DT, \n");
						sql256.append("           'admin2' CONFIRM_USR_ID, \n");
						sql256.append("           '' CONFIRM_REMARK, \n");
						sql256.append("           C.CARLINE_CD, \n");
						sql256.append("           C.MODEL_CD, \n");
						sql256.append("           C.OCN_CD, \n");
						sql256.append("           C.EXT_COLOR_CD, \n");
						sql256.append("           C.INT_COLOR_CD, \n");
						sql256.append("           C.ORD_TP, \n");
						sql256.append("           NULL CUST_CD, \n");
						sql256.append("           C.ORD_DLR_CD || E.DLR_NM CUST_NM, \n");
						sql256.append("           NULL REMARK, \n");
						sql256.append("           NULL CONTRACT_NO, \n");
						sql256.append("           NULL CANC_DT, \n");
						sql256.append("           NULL CAANC_RESON, \n");
						sql256.append("           'admin2' REG_USR_ID, \n");
						sql256.append("           CASE \n");
						sql256.append("             WHEN NVL(C.CUST_SALE_DT, '00000000') = '00000000' THEN \n");
						sql256.append("              SYSDATE - 1 \n");
						sql256.append("             ELSE \n");
						sql256.append("              TO_DATE(C.CUST_SALE_DT, 'YYYYMMDD') \n");
						sql256.append("           END REG_DT, \n");
						sql256.append("           'admin2' UPDT_USR_ID, \n");
						sql256.append("           CASE \n");
						sql256.append("             WHEN NVL(C.CUST_SALE_DT, '00000000') = '00000000' THEN \n");
						sql256.append("              SYSDATE - 1 \n");
						sql256.append("             ELSE \n");
						sql256.append("              TO_DATE(C.CUST_SALE_DT, 'YYYYMMDD') \n");
						sql256.append("           END UPDT_DT \n");
						sql256.append("      FROM SA_0121IR_MONTH@BHDCSOP C, SA_0121T D, CM_0101T E \n");
						sql256.append("     WHERE C.VIN_NO1 || C.VIN_NO2 = D.VIN_NO \n");
						sql256.append("       AND C.ORD_DLR_CD = E.DLR_CD \n");
						sql256.append("       AND C.VIN_NO1||C.VIN_NO2 = '").append(tmpDmsCarDetailVO.getVinNo()).append("' \n");
					}else if("SAP库存DMS战略出库".endsWith(tmpDmsCarDetailVO.getCheckReason())){
						//增加战略出库取消（此处需要核对逻辑）
						sql301 = new StringBuffer();
						sql301.append("INSERT INTO SA_0301T \n");
						sql301.append("        (KMTRDY, \n");
						sql301.append("         KMTRTM, \n");
						sql301.append("         KMSEQ, \n");
						sql301.append("         KMOPT, \n");
						sql301.append("         KMDATE, \n");
						sql301.append("         KMVIN, \n");
						sql301.append("         KMDELR, \n");
						sql301.append("         KMRGNO, \n");
						sql301.append("         KMOTIT, \n");
						sql301.append("         KMUSER) \n");
						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD'), \n");
						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'HH24MISS'), \n");
						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
						sql301.append("              FROM SA_0301T \n");
						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD') \n");
						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
						sql301.append("               'J4', \n");
						sql301.append("               GR_RETURN_DT, \n");
						sql301.append("               VIN_NO, \n");
						sql301.append("               ORD_DLR_CD, \n");
						sql301.append("               LV2_DLR_ORG_CD, \n");
						sql301.append("               CAR_DSTIN_CD, \n");
						sql301.append("               ORD_DLR_CD \n");
						sql301.append("          FROM SA_0121T \n");
						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
					}else if("SAP零售DMS缺少SA_0301T零售记录".endsWith(tmpDmsCarDetailVO.getCheckReason())){
						//补录零售记录
						sql301 = new StringBuffer();
						sql301.append("INSERT INTO SA_0301T \n");
						sql301.append("        (KMTRDY, \n");
						sql301.append("         KMTRTM, \n");
						sql301.append("         KMSEQ, \n");
						sql301.append("         KMOPT, \n");
						sql301.append("         KMDATE, \n");
						sql301.append("         KMVIN, \n");
						sql301.append("         KMDELR, \n");
						sql301.append("         KMRGNO, \n");
						sql301.append("         KMOTIT, \n");
						sql301.append("         KMUSER) \n");
						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD'), \n");
						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'HH24MISS'), \n");
						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
						sql301.append("              FROM SA_0301T \n");
						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(tmpDmsCarDetailVO.getCheckMonth()).append("','YYYYMM')), 'YYYYMMDD') \n");
						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
						sql301.append("               'J1', \n");
						sql301.append("               GR_RETURN_DT, \n");
						sql301.append("               VIN_NO, \n");
						sql301.append("               ORD_DLR_CD, \n");
						sql301.append("               LV2_DLR_ORG_CD, \n");
						sql301.append("               CAR_DSTIN_CD, \n");
						sql301.append("               ORD_DLR_CD \n");
						sql301.append("          FROM SA_0121T \n");
						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
					}else if("零售日期不一致".endsWith(tmpDmsCarDetailVO.getCheckReason())){
						//修改主表零售日期
						
					}else if("销售记录表零售日期不一致".endsWith(tmpDmsCarDetailVO.getCheckReason())){
						//修改子表零售日期
						sql301 = new StringBuffer();
						sql301.append("UPDATE SA_0301T T SET T.KMTRDY = TO_CHAR(SYSDATE-1,'YYYYMMDD') WHERE T.KMTRDY||T.KMTRTM||T.KMVIN = ( \n");
						sql301.append("SELECT KMTRDY||KMTRTM||KMVIN FROM ( \n");
						sql301.append("SELECT \n");
						sql301.append("       KMTRDY,KMTRTM,KMVIN ,KMOPT ,KMDELR , \n");
						sql301.append("       ROW_NUMBER() OVER (PARTITION BY KMVIN ORDER BY TO_DATE(KMTRDY||KMTRTM, 'YYYYMMDD HH24MISS') DESC) AS RN \n");
						sql301.append("       FROM SA_0301T \n");
						sql301.append("       WHERE KMVIN = '").append(tmpDmsCarDetailVO.getVinNo()).append("' \n");
						sql301.append(") \n");
						sql301.append("WHERE RN = 1 \n");
						sql301.append(") \n");
					}
    				
    			}
    		}
    		
            if(null!=conn){
	            int rs = -1;
	            int rs301 = -1;
	            int rs301Pro = -1;
	            int rs256 = -1;
	            int rsUpdateDetail = -1;
	            Statement stmt = null;
	            Statement stmt301 = null;
	            Statement stmt256 = null;
	            Statement stmt301Pro = null;
	            Statement stmtUpdateDetail = null;
	
	            try {
	                stmt = conn.createStatement();
	                stmt301 = conn.createStatement();
	                stmt256 = conn.createStatement();
	                stmt301Pro = conn.createStatement();
	                stmtUpdateDetail = conn.createStatement();
	
	                rs = stmt.executeUpdate(sql.toString());
	                if(null!=sql301&&!"".endsWith(sql301.toString())){
	                	rs301 = stmt301.executeUpdate(sql301.toString());
	                }
	                if(null!=sql301Pro&&!"".endsWith(sql301Pro.toString())){
	                	rs301Pro = stmt301Pro.executeUpdate(sql301Pro.toString());
	                }
	                if(null!=sql256&&!"".endsWith(sql256.toString())){
	                	rs256 = stmt256.executeUpdate(sql256.toString());
	                }
	                
	                StringBuffer sqlUpdateDetail = new StringBuffer();
	                sqlUpdateDetail.append("UPDATE TMP_DMS_ERP_CAR_DETAIL@").append(devOrPrd).append(" SET \n");
	                sqlUpdateDetail.append("			UPDATE_RESULT = 'Z', \n");
	                sqlUpdateDetail.append("	 		UPDATE_REASON = 'SUCCESS' \n");
	                sqlUpdateDetail.append(" 		WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("' \n");
	                sqlUpdateDetail.append(" 		  AND CHECK_REASON = '").append(tmpDmsCarDetailVO.getCheckReason()).append("' \n");
	                sqlUpdateDetail.append(" 		  AND (UPDATE_RESULT IS NULL OR UPDATE_RESULT = 'N') \n");

	                rsUpdateDetail = stmtUpdateDetail.executeUpdate(sqlUpdateDetail.toString());
	
	                /*tmpDmsCarDetailVO = new TmpDmsErpCarDetailVO();
	                tmpDmsCarDetailVO.setUpdateResult("Z");
	                tmpDmsCarDetailVO.setUpdateReason("SUCCESS");
	                salesMonthDAO.updateTmpDmsCarUpdateResult(tmpDmsCarDetailVO);*/
	            } catch (SQLException e) {
	                e.printStackTrace();
	                try {
	            		System.out.println("#"+e.getMessage());
		                System.out.println(dlrCd+"SQL执行报错");
		                tmpDmsCarDetailVO.setUpdateResult("E");
		                tmpDmsCarDetailVO.setUpdateReason("SQL执行报错");
		                salesMonthDAO.updateTmpDmsCarUpdateResult(tmpDmsCarDetailVO);
		                salesMonthDAO.callIfMergeCommit();
	    			} catch (Exception e1) {
	    				// TODO Auto-generated catch block
	    				e1.printStackTrace();
	    			}
	            } catch (Exception e) {
	                e.printStackTrace();
	                try {
	            		System.out.println("#"+e.getMessage());
		                System.out.println(dlrCd+" SQL报错");
		                tmpDmsCarDetailVO.setUpdateResult("E");
		                tmpDmsCarDetailVO.setUpdateReason("SQL执行报错");
		                salesMonthDAO.updateTmpDmsCarUpdateResult(tmpDmsCarDetailVO);
		                salesMonthDAO.callIfMergeCommit();
	    			} catch (Exception e1) {
	    				// TODO Auto-generated catch block
	    				e1.printStackTrace();
	    			}
	                try {
	                    // Statement 종료
	                    stmt.close();
	                    stmt301.close();
	                    stmt256.close();
	                    stmt301Pro.close();
	                    stmtUpdateDetail.close();
	                    // Connection 종료
	                    conn.close();
	                } catch (SQLException e1) {
	                    e1.printStackTrace();
	                }
	            }
            }
    	}
        System.out.println("线程结束 "+threadName);
    }

    //如果是是继承Thread，开放下面方法，如果是继承Runnable，关掉下面方法
//    public void cancel() {
//        interrupt();
//    }
    
    public Connection dbConnection(String dlrIP) throws Exception{
        Connection conn = null;

        String url = "jdbc:tibero:thin:@"+dlrIP+":8629:BHDMS";
        String user = "DMSDB";
        String password = "DMSDB_#01";

        // 1. Driver
        try {
            //Class.forName("oracle.jdbc.driver.OracleDriver");
            Class.forName("com.tmax.tibero.jdbc.TbDriver");

        // 2. Connection DB (URL, ID, P/W)
            conn = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            throw e;
        } catch (SQLException e) {
            throw e;
        }catch (Exception e) {
            throw e;
        }

        return conn;
    }
}