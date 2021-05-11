package chn.bhmc.dms.sal.svi.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GroupSalesSaveVO.java
 * @Description : 집단판매심사
 * @author Kim yewon
 * @since 2016. 9. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 27.     Kim yewon              최초 생성
 * </pre>
 */

public class GroupSalesReviewSaveVO extends BaseSaveVO<GroupSalesReviewVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;


    private String approveCd;                       //심사결과
    private String remark;                          //심사내용
    /**
     * @return the approveCd
     */
    public String getApproveCd() {
        return approveCd;
    }
    /**
     * @param approveCd the approveCd to set
     */
    public void setApproveCd(String approveCd) {
        this.approveCd = approveCd;
    }
    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }
    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}