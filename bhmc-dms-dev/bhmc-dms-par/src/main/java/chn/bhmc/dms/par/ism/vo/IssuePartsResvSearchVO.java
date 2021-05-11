package chn.bhmc.dms.par.ism.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 부품예약 검색 VO
 *
 * @ClassName   : IssuePartsResvSearchVO.java
 * @Description : IssuePartsResvSearchVO Class
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

public class IssuePartsResvSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2975677404524646240L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String sDlrCd;

    /**
     * 센터코드
     **/
    @NotEmpty
    private String sPltCd;

    /**
     * 창고코드
     **/
    @NotEmpty
    private String sStrgeCd;

    /**
     * 품목코드
     **/
    @NotEmpty
    private String sItemCd;

    /**
     * 예약문서번호
     **/
    @NotEmpty
    private String sResvDocNo;

    /**
     * 예약문서라인번호
     **/
    private int sResvDocLineNo;

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sPltCd
     */
    public String getsPltCd() {
        return sPltCd;
    }

    /**
     * @param sPltCd the sPltCd to set
     */
    public void setsPltCd(String sPltCd) {
        this.sPltCd = sPltCd;
    }

    /**
     * @return the sStrgeCd
     */
    public String getsStrgeCd() {
        return sStrgeCd;
    }

    /**
     * @param sStrgeCd the sStrgeCd to set
     */
    public void setsStrgeCd(String sStrgeCd) {
        this.sStrgeCd = sStrgeCd;
    }

    /**
     * @return the sItemCd
     */
    public String getsItemCd() {
        return sItemCd;
    }

    /**
     * @param sItemCd the sItemCd to set
     */
    public void setsItemCd(String sItemCd) {
        this.sItemCd = sItemCd;
    }

    /**
     * @return the sResvDocNo
     */
    public String getsResvDocNo() {
        return sResvDocNo;
    }

    /**
     * @param sResvDocNo the sResvDocNo to set
     */
    public void setsResvDocNo(String sResvDocNo) {
        this.sResvDocNo = sResvDocNo;
    }

    /**
     * @return the sResvDocLineNo
     */
    public int getsResvDocLineNo() {
        return sResvDocLineNo;
    }

    /**
     * @param sResvDocLineNo the sResvDocLineNo to set
     */
    public void setsResvDocLineNo(int sResvDocLineNo) {
        this.sResvDocLineNo = sResvDocLineNo;
    }
}
