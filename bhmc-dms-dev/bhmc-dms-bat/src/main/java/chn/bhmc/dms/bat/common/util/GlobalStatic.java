package chn.bhmc.dms.bat.common.util;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>Title: 全局静态变量、常量</p>
 * @author Gongrs 2021年4月2日 下午5:14:21
 */
@SuppressWarnings("serial")
public class GlobalStatic {
    
    /*****************************发票状态*****************************************/
    // 正常
    public static final String RECEIPT_STATUS_1 = "01";
    // 作废
    public static final String RECEIPT_STATUS_2 = "02";
    // 红冲
    public static final String RECEIPT_STATUS_3 = "03";
    
    public static final Map<String, String> RECEIPT_STATUS_TRANS = new HashMap<String, String>() {{
        // 数衍：正常
        put("0", "01");
        // 数衍：作废
        put("1", "02");
        // 数衍：红冲
        put("2", "03");
    }};

    /*****************************调用接口结果*****************************************/
    // 调用成功-验证通过
    public static final String RESULT_CODE_OK = "0";
    // 调用成功-验证不存在
    public static final String RESULT_CODE_NOT_EXIST = "2";
    
    /*****************************发票验证状态*****************************************/
    // 通过
    public static final String CERT_FST_0 = "1";
    // 未通过
    public static final String CERT_FST_1 = "0";
    // 作废
    public static final String CERT_FST_2 = "2";
    // 待验证
    public static final String CERT_FST_3 = "3";
    // 不存在
    public static final String CERT_FST_4 = "4";
    
    /*****************************发票来源*****************************************/
    // 本店开票
    public static final String RECEIPT_RESOURCE_1 = "01";
    // 他店开票
    public static final String RECEIPT_RESOURCE_2 = "02";
    // 二网开票
    public static final String RECEIPT_RESOURCE_3 = "03";
    // 无需处理：无需将APP扫码发票表SA_0510T的发票数据同步到机动车统一发票表SA_0501T
    public static final String RECEIPT_RESOURCE_4 = "04";
    
    /*****************************发票录入方式*****************************************/
    // 数衍发票机
    public static final String RECEIPT_IN_RESOURCE_1 = "01";
    // DMS上传发票图片
    public static final String RECEIPT_IN_RESOURCE_2 = "02";
    // DMS手动填写
    public static final String RECEIPT_IN_RESOURCE_3 = "03";
    // APP扫码
    public static final String RECEIPT_IN_RESOURCE_4 = "04";
    
    /*****************************绑定发票标识*****************************************/
    // 未绑定
    public static final String BINDING_RECEIPT_FLAG_1 = "01";
    // 机动车发票
    public static final String BINDING_RECEIPT_FLAG_2 = "02";
    // 增值税发票
    public static final String BINDING_RECEIPT_FLAG_3 = "03";
    
    /*****************************数衍发票类型*****************************************/
    // 专用发票
    public static final String RECEIPT_TYPE_1 = "000001";
    // 机动车发票
    public static final String RECEIPT_TYPE_3 = "000003";
    // 普通发票
    public static final String RECEIPT_TYPE_4 = "000004";
    // 二手车发票
    public static final String RECEIPT_TYPE_5 = "000005";
    
    /**
     * <p>Title: 获取发票来源</p>
     * @author Gongrs 2021年4月13日 下午4:04:57
     * @param reqDlrCd:操作人所属经销商code
     * @param receiptDlrCd:开票经销商code
     * @param carDlrCd:车辆所属经销商code
     * @return 发票来源code码
     */
    public static String getReceiptResources(String reqDlrCd, String receiptDlrCd, String carDlrCd) {
        String resCode = RECEIPT_RESOURCE_1;
        if (receiptDlrCd.equals("BF000")) {
            // 二网店
            if (reqDlrCd.equals(carDlrCd)) {
                // 验D=车D：他店开票
                resCode = RECEIPT_RESOURCE_2;
            } else {
                // 验D!=票D、验D!=车D：无需处理
                resCode = RECEIPT_RESOURCE_4;
            }
        } else {
            // 非二网店
            if (reqDlrCd.equals(receiptDlrCd)) {
                // 验D=票D：本店开票
                resCode = RECEIPT_RESOURCE_1;
            } else {
                if (reqDlrCd.equals(carDlrCd)) {
                    // 验D!=票D、验D=车D：他店开票
                    resCode = RECEIPT_RESOURCE_2;
                } else {
                    // 验D!=票D、验D!=车D：无需处理
                    resCode = RECEIPT_RESOURCE_4;
                }
            }
        }
        return resCode;
    }
    
}