package chn.bhmc.dms.par.ism.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 부품예약  VO
 *
 * @ClassName   : IssuePartsResvVO.java
 * @Description : IssuePartsResvVO Class
 * @author In Bo Shim
 * @since 2016. 2. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 18.     In Bo Shim     최초 생성
 * </pre>
 */

public class IssuePartsResvVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1157307321855118443L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * 센터코드
     **/
    @NotEmpty
    private String pltCd;

    /**
     * 창고코드
     **/
    @NotEmpty
    private String strgeCd;

    /**
     * 품목코드
     **/
    @NotEmpty
    private String itemCd;

    /**
     * 부품요청문서번호
     **/
    @NotEmpty
    private String parReqDocNo = "";

    /**
     * 예약문서번호
     **/
    @NotEmpty
    private String resvDocNo;

    /**
     * 예약문서라인번호
     **/
    private int resvDocLineNo;

    /**
     * 예약수량
     **/
    private double reqQty;

    /**
     * 구매요청수량(예약수량)
     **/
    private double resvQty;

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }

    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }

    /**
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }

    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
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
     * @return the parReqDocNo
     */
    public String getParReqDocNo() {
        return parReqDocNo;
    }

    /**
     * @param parReqDocNo the parReqDocNo to set
     */
    public void setParReqDocNo(String parReqDocNo) {
        this.parReqDocNo = parReqDocNo;
    }

    /**
     * @return the resvDocNo
     */
    public String getResvDocNo() {
        return resvDocNo;
    }

    /**
     * @param resvDocNo the resvDocNo to set
     */
    public void setResvDocNo(String resvDocNo) {
        this.resvDocNo = resvDocNo;
    }

    /**
     * @return the resvDocLineNo
     */
    public int getResvDocLineNo() {
        return resvDocLineNo;
    }

    /**
     * @param resvDocLineNo the resvDocLineNo to set
     */
    public void setResvDocLineNo(int resvDocLineNo) {
        this.resvDocLineNo = resvDocLineNo;
    }

    /**
     * @return the reqQty
     */
    public double getReqQty() {
        return reqQty;
    }

    /**
     * @param reqQty the reqQty to set
     */
    public void setReqQty(double reqQty) {
        this.reqQty = reqQty;
    }

    /**
     * @return the resvQty
     */
    public double getResvQty() {
        return resvQty;
    }

    /**
     * @param resvQty the resvQty to set
     */
    public void setResvQty(double resvQty) {
        this.resvQty = resvQty;
    }
}
