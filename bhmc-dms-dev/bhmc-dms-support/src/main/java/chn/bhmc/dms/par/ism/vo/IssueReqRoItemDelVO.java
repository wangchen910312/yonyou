package chn.bhmc.dms.par.ism.vo;


/**
 * 부품출고 헤더 VO
 *
 * @ClassName   : IssuePartsOutVO.java
 * @Description : IssuePartsOutVO Class
 * @author In Bo Shim
 * @since 2016. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 23.     In Bo Shim     최초 생성
 * </pre>
 */

public class IssueReqRoItemDelVO {

    /**
     * RO번호
     **/
    private String roDocNo = "";

    /**
     * 부품코드
     **/
    private String itemCd = "";

    /**
     * 완료수량(완료/반품)
     **/
    private double endQty = 0.0;

    /**
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }

    /**
     * @param roDocNo the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }

    /**
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }

    /**
     * @param itemCd the itemCd to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    /**
     * @return the endQty
     */
    public double getEndQty() {
        return endQty;
    }

    /**
     * @param endQty the endQty to set
     */
    public void setEndQty(double endQty) {
        this.endQty = endQty;
    }
}
