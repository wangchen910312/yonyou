package chn.bhmc.dms.par.stm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockDdlnSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ju Won Lee
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     Ju Won Lee     최초 생성
 * </pre>
 */

public class StockDdlnSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1805680604606866327L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 센터코드
     **/
    private String sPltCd;

    /**
     * 회계년월
     **/
    private String sAccYyMm;

    /**
     * 회계년도
     **/
    private String sAccYy;

    /**
     * 회계월
     **/
    private String sAccMm;

    /**
     * 회계시작월
     **/
    private String sAccYyMmFr;
    /**
     * 회계종료월
     **/
    private String sAccYyMmTo;

    /**
     * 회계상태
     **/
    private String sAccStat;

    /**
     * 1급분류
     **/
    private String sFirstTp;

    /**
     * 2급분류
     **/
    private String sSecondTp;

    /**
     * 3급분류
     **/
    private String sThirdTp;

    /**
     * 품목코드
     **/
    private  String        sItemCd;


    /**
     * 품목명
     **/
    private  String        sItemNm;

    /**
     * 품목유형
     **/
    private  String        sItemDstinCd;

    /**
     * 창고코드
     **/
    private  String        sStrgeCd;

    /**
     * 로케이션코드
     **/
    private  String        sLocCd;

    /***
     * 차종코드
     */
    private  String        sCarlineCd;

    /***
     * 차형코드
     */
    private  String        sModelCd;

    /***
     * 업체유형
     */
    private  String        sBpTp;


    /***
     * 사용자
     */
    private  String        sRegUsrId;


    /***
     * 기초재고
     */
    private  Double        sStartStocQty;

    /***
     * 기말재고
     */
    private  Double        sEndStocQty;

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
     * @return the sAccYy
     */
    public String getsAccYy() {
        return sAccYy;
    }

    /**
     * @param sAccYy the sAccYy to set
     */
    public void setsAccYy(String sAccYy) {
        this.sAccYy = sAccYy;
    }

    /**
     * @return the sAccMm
     */
    public String getsAccMm() {
        return sAccMm;
    }

    /**
     * @param sAccMm the sAccMm to set
     */
    public void setsAccMm(String sAccMm) {
        this.sAccMm = sAccMm;
    }

    /**
     * @return the sAccStat
     */
    public String getsAccStat() {
        return sAccStat;
    }

    /**
     * @param sAccStat the sAccStat to set
     */
    public void setsAccStat(String sAccStat) {
        this.sAccStat = sAccStat;
    }

    /**
     * @return the sFirstTp
     */
    public String getsFirstTp() {
        return sFirstTp;
    }

    /**
     * @param sFirstTp the sFirstTp to set
     */
    public void setsFirstTp(String sFirstTp) {
        this.sFirstTp = sFirstTp;
    }

    /**
     * @return the sSecondTp
     */
    public String getsSecondTp() {
        return sSecondTp;
    }

    /**
     * @param sSecondTp the sSecondTp to set
     */
    public void setsSecondTp(String sSecondTp) {
        this.sSecondTp = sSecondTp;
    }

    /**
     * @return the sThirdTp
     */
    public String getsThirdTp() {
        return sThirdTp;
    }

    /**
     * @param sThirdTp the sThirdTp to set
     */
    public void setsThirdTp(String sThirdTp) {
        this.sThirdTp = sThirdTp;
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
     * @return the sLocCd
     */
    public String getsLocCd() {
        return sLocCd;
    }

    /**
     * @param sLocCd the sLocCd to set
     */
    public void setsLocCd(String sLocCd) {
        this.sLocCd = sLocCd;
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
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
    }

    /**
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
    }

    /**
     * @return the sAccYyMm
     */
    public String getsAccYyMm() {
        return sAccYyMm;
    }

    /**
     * @param sAccYyMm the sAccYyMm to set
     */
    public void setsAccYyMm(String sAccYyMm) {
        this.sAccYyMm = sAccYyMm;
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
     * @return the sBpTp
     */
    public String getsBpTp() {
        return sBpTp;
    }

    /**
     * @param sBpTp the sBpTp to set
     */
    public void setsBpTp(String sBpTp) {
        this.sBpTp = sBpTp;
    }

    /**
     * @return the sStartStocQty
     */
    public Double getsStartStocQty() {
        return sStartStocQty;
    }

    /**
     * @param sStartStocQty the sStartStocQty to set
     */
    public void setsStartStocQty(Double sStartStocQty) {
        this.sStartStocQty = sStartStocQty;
    }

    /**
     * @return the sEndStocQty
     */
    public Double getsEndStocQty() {
        return sEndStocQty;
    }

    /**
     * @param sEndStocQty the sEndStocQty to set
     */
    public void setsEndStocQty(Double sEndStocQty) {
        this.sEndStocQty = sEndStocQty;
    }

    /**
     * @return the sAccYyMmFr
     */
    public String getsAccYyMmFr() {
        return sAccYyMmFr;
    }

    /**
     * @param sAccYyMmFr the sAccYyMmFr to set
     */
    public void setsAccYyMmFr(String sAccYyMmFr) {
        this.sAccYyMmFr = sAccYyMmFr;
    }

    /**
     * @return the sAccYyMmTo
     */
    public String getsAccYyMmTo() {
        return sAccYyMmTo;
    }

    /**
     * @param sAccYyMmTo the sAccYyMmTo to set
     */
    public void setsAccYyMmTo(String sAccYyMmTo) {
        this.sAccYyMmTo = sAccYyMmTo;
    }

    /**
     * @return the sRegUsrId
     */
    public String getsRegUsrId() {
        return sRegUsrId;
    }

    /**
     * @param sRegUsrId the sRegUsrId to set
     */
    public void setsRegUsrId(String sRegUsrId) {
        this.sRegUsrId = sRegUsrId;
    }

}
