package chn.bhmc.dms.par.cpm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 방치품 검색 VO
 *
 * @ClassName   : LeaveItemSearchVO.java
 * @Description : LeaveItemSearchVO Class
 * @author In Bo Shim
 * @since 2016. 5. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 24.     In Bo Shim     최초 생성
 * </pre>
 */
public class LeaveItemSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1835708660431279084L;

    /**
     * 딜러번호
     **/
    private String sDlrCd = "";

    /**
     * 플랜트코드
     **/
    private String sPltCd = "";

    /**
     * 부품번호
     **/
    private String sItemCd = "";

    /**
     * 부품명
     **/
    private String sItemNm = "";

    /**
     * 품목구분코드
     **/
    private String sItemDstinCd = "";

    /**
     * 방치품여부
     **/
    private String sNonMovingFlg = "Y";

    /**
     * 차종
     **/
    private String sCarlineCd = "";

    /**
     * 업체코드
     **/
    private String sBpCd;

    /**
     * 업체명
     **/
    private String sBpNm;

    /**
     * 구매단가시작금액
     */
    private double sPurcPrcStart = 0.0;

    /**
     * 구매단가종료금액
     */
    private double sPurcPrcEnd = 0.0;

    /**
     * 대기시간시작
     */
    private double sStayDayStart = 0.0;

    /**
     * 대기시간종료
     */
    private double sStayDayEnd = 0.0;

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
     * @return the sItemNm
     */
    public String getsItemNm() {
        return sItemNm;
    }
    /**
     * @param sItemNm the sItemNm to set
     */
    public void setsItemNm(String sItemNm) {
        this.sItemNm = sItemNm;
    }
    /**
     * @return the sItemDstinCd
     */
    public String getsItemDstinCd() {
        return sItemDstinCd;
    }
    /**
     * @param sItemDstinCd the sItemDstinCd to set
     */
    public void setsItemDstinCd(String sItemDstinCd) {
        this.sItemDstinCd = sItemDstinCd;
    }
    /**
     * @return the sNonMovingFlg
     */
    public String getsNonMovingFlg() {
        return sNonMovingFlg;
    }
    /**
     * @param sNonMovingFlg the sNonMovingFlg to set
     */
    public void setsNonMovingFlg(String sNonMovingFlg) {
        this.sNonMovingFlg = sNonMovingFlg;
    }
    /**
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }
    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }
    /**
     * @return the sBpCd
     */
    public String getsBpCd() {
        return sBpCd;
    }
    /**
     * @param sBpCd the sBpCd to set
     */
    public void setsBpCd(String sBpCd) {
        this.sBpCd = sBpCd;
    }
    /**
     * @return the sBpNm
     */
    public String getsBpNm() {
        return sBpNm;
    }
    /**
     * @param sBpNm the sBpNm to set
     */
    public void setsBpNm(String sBpNm) {
        this.sBpNm = sBpNm;
    }
    /**
     * @return the sPurcPrcStart
     */
    public double getsPurcPrcStart() {
        return sPurcPrcStart;
    }
    /**
     * @param sPurcPrcStart the sPurcPrcStart to set
     */
    public void setsPurcPrcStart(double sPurcPrcStart) {
        this.sPurcPrcStart = sPurcPrcStart;
    }
    /**
     * @return the sPurcPrcEnd
     */
    public double getsPurcPrcEnd() {
        return sPurcPrcEnd;
    }
    /**
     * @param sPurcPrcEnd the sPurcPrcEnd to set
     */
    public void setsPurcPrcEnd(double sPurcPrcEnd) {
        this.sPurcPrcEnd = sPurcPrcEnd;
    }
    /**
     * @return the sStayDayStart
     */
    public double getsStayDayStart() {
        return sStayDayStart;
    }
    /**
     * @param sStayDayStart the sStayDayStart to set
     */
    public void setsStayDayStart(double sStayDayStart) {
        this.sStayDayStart = sStayDayStart;
    }
    /**
     * @return the sStayDayEnd
     */
    public double getsStayDayEnd() {
        return sStayDayEnd;
    }
    /**
     * @param sStayDayEnd the sStayDayEnd to set
     */
    public void setsStayDayEnd(double sStayDayEnd) {
        this.sStayDayEnd = sStayDayEnd;
    }



}
