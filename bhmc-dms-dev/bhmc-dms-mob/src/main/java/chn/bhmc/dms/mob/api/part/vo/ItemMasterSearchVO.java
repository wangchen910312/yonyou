package chn.bhmc.dms.mob.api.part.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 품목마스터 조회 SearchVO
 *
 * @ClassName   : ItemMasterSearchVO.java
 * @Description : ItemMasterSearchVO Class
 * @author Ju Won Lee
 * @since 2016. 1. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 7.     Ju Won Lee     최초 생성
 * </pre>
 */

public class ItemMasterSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6427743506405762614L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 센터코드
     **/
    private String sPltCd;

    /**
     * 품목코드(Like)
     **/
    private String sItemCd;

    /**
     * 품목코드(Only)
     **/
    private String sItemCdOnly;

    /**
     * 창고코드
     **/
    private String sStrgeCd;

    /**
     * 품목명
     **/
    private String sItemNm;

    /**
     * 품목영문명
     **/
    private String sItemEnNm;

    /**
     * 공급상
     **/
    private String sSpyrCd;

    /**
     * 품목구분코드
     **/
    private String sItemDstinCd;

    /**
     * 서비스(패키지)
     **/
    private String sPackage;

    /**
     * 품목그룹코드
     **/
    private String sItemGrpCd;

    /**
     * 차종
     **/
    private String sCarlineCd;

    /**
     * 차형
     **/
    private String sCarlineCd2;

    /**
     * 종료여부
     **/
    private String sEndYn;

    /**
     * 업체코드
     **/
    private String sBpCd;

    /**
     * 업체명칭
     **/
    private String sBpNm;

    /**
     * 업체유형
     */
    private String sBpTp;

    /**
     * ABC CLASS
     **/
    private String sAbcInd;

    /**
     * 브랜드
     **/
    private String sBrandCd;

    /**
     * 가용재고
     **/
    private Double sAvlbStockQty;

    /**
     * NONMOVINGSTOCK여부
     **/
    private String sNonMovingFlg;

    /**
     * 가용수량 제로 유무.
     **/
    private String sAvlbStockQtyZeroYn;


    /**
     * 페이지구분.
     **/
    private String sPageTp;

    /**
     * 기타 참조 코드1
     */
    private String sEtcCd1;

    /**
     * 기타 참조 코드2
     */
    private String sEtcCd2;

    /**
     * 가격유형
     */
    private String sPrcTp;

    /**
     * 지불유형
     */
    private String sPayTp;

    /**
     * 입고창고
     */
    private String sGrStrgeCd;

    /**
     * 구매유형
     */
    private List<String> sPurcTpList;

    /**
     * 부품유효일자종료체크여부
     **/
    private String sEndChk = "Y";//기본설정 : Y

    /**
     * 세금공제보증가격 0 이상 여부
     **/
    private String sTaxDdctGrtePrcOverZeroUseYn = "Y";//기본설정 : Y

    /**
     * 소매가
     */
    private double sRetlPrc;

    /**
     * 도매가
     */
    private double sWhslPrc;

    /**
     * 보험가
     */
    private double sIncPrc;

    /**
     * 보증가
     */
    private double sGrtePrc;

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
     * @return the sItemCdOnly
     */
    public String getsItemCdOnly() {
        return sItemCdOnly;
    }

    /**
     * @param sItemCdOnly the sItemCdOnly to set
     */
    public void setsItemCdOnly(String sItemCdOnly) {
        this.sItemCdOnly = sItemCdOnly;
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
     * @return the sItemEnNm
     */
    public String getsItemEnNm() {
        return sItemEnNm;
    }

    /**
     * @param sItemEnNm the sItemEnNm to set
     */
    public void setsItemEnNm(String sItemEnNm) {
        this.sItemEnNm = sItemEnNm;
    }

    /**
     * @return the sSpyrCd
     */
    public String getsSpyrCd() {
        return sSpyrCd;
    }

    /**
     * @param sSpyrCd the sSpyrCd to set
     */
    public void setsSpyrCd(String sSpyrCd) {
        this.sSpyrCd = sSpyrCd;
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
     * @return the sPackage
     */
    public String getsPackage() {
        return sPackage;
    }

    /**
     * @param sPackage the sPackage to set
     */
    public void setsPackage(String sPackage) {
        this.sPackage = sPackage;
    }

    /**
     * @return the sItemGrpCd
     */
    public String getsItemGrpCd() {
        return sItemGrpCd;
    }

    /**
     * @param sItemGrpCd the sItemGrpCd to set
     */
    public void setsItemGrpCd(String sItemGrpCd) {
        this.sItemGrpCd = sItemGrpCd;
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
     * @return the sCarlineCd2
     */
    public String getsCarlineCd2() {
        return sCarlineCd2;
    }

    /**
     * @param sCarlineCd2 the sCarlineCd2 to set
     */
    public void setsCarlineCd2(String sCarlineCd2) {
        this.sCarlineCd2 = sCarlineCd2;
    }

    /**
     * @return the sEndYn
     */
    public String getsEndYn() {
        return sEndYn;
    }

    /**
     * @param sEndYn the sEndYn to set
     */
    public void setsEndYn(String sEndYn) {
        this.sEndYn = sEndYn;
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
     * @return the sAbcInd
     */
    public String getsAbcInd() {
        return sAbcInd;
    }

    /**
     * @param sAbcInd the sAbcInd to set
     */
    public void setsAbcInd(String sAbcInd) {
        this.sAbcInd = sAbcInd;
    }

    /**
     * @return the sBrandCd
     */
    public String getsBrandCd() {
        return sBrandCd;
    }

    /**
     * @param sBrandCd the sBrandCd to set
     */
    public void setsBrandCd(String sBrandCd) {
        this.sBrandCd = sBrandCd;
    }

    /**
     * @return the sAvlbStockQty
     */
    public Double getsAvlbStockQty() {
        return sAvlbStockQty;
    }

    /**
     * @param sAvlbStockQty the sAvlbStockQty to set
     */
    public void setsAvlbStockQty(Double sAvlbStockQty) {
        this.sAvlbStockQty = sAvlbStockQty;
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
     * @return the sAvlbStockQtyZeroYn
     */
    public String getsAvlbStockQtyZeroYn() {
        return sAvlbStockQtyZeroYn;
    }

    /**
     * @param sAvlbStockQtyZeroYn the sAvlbStockQtyZeroYn to set
     */
    public void setsAvlbStockQtyZeroYn(String sAvlbStockQtyZeroYn) {
        this.sAvlbStockQtyZeroYn = sAvlbStockQtyZeroYn;
    }

    /**
     * @return the sEtcCd1
     */
    public String getsEtcCd1() {
        return sEtcCd1;
    }

    /**
     * @param sEtcCd1 the sEtcCd1 to set
     */
    public void setsEtcCd1(String sEtcCd1) {
        this.sEtcCd1 = sEtcCd1;
    }

    /**
     * @return the sEtcCd2
     */
    public String getsEtcCd2() {
        return sEtcCd2;
    }

    /**
     * @param sEtcCd2 the sEtcCd2 to set
     */
    public void setsEtcCd2(String sEtcCd2) {
        this.sEtcCd2 = sEtcCd2;
    }

    /**
     * @return the sPrcTp
     */
    public String getsPrcTp() {
        return sPrcTp;
    }

    /**
     * @param sPrcTp the sPrcTp to set
     */
    public void setsPrcTp(String sPrcTp) {
        this.sPrcTp = sPrcTp;
    }

    /**
     * @return the sGrStrgeCd
     */
    public String getsGrStrgeCd() {
        return sGrStrgeCd;
    }

    /**
     * @param sGrStrgeCd the sGrStrgeCd to set
     */
    public void setsGrStrgeCd(String sGrStrgeCd) {
        this.sGrStrgeCd = sGrStrgeCd;
    }

    /**
     * @return the sPageTp
     */
    public String getsPageTp() {
        return sPageTp;
    }

    /**
     * @param sPageTp the sPageTp to set
     */
    public void setsPageTp(String sPageTp) {
        this.sPageTp = sPageTp;
    }

    /**
     * @return the sPayTp
     */
    public String getsPayTp() {
        return sPayTp;
    }

    /**
     * @param sPayTp the sPayTp to set
     */
    public void setsPayTp(String sPayTp) {
        this.sPayTp = sPayTp;
    }

    /**
     * @return the sPurcTpList
     */
    public List<String> getsPurcTpList() {
        return sPurcTpList;
    }

    /**
     * @param sPurcTpList the sPurcTpList to set
     */
    public void setsPurcTpList(List<String> sPurcTpList) {
        this.sPurcTpList = sPurcTpList;
    }

    /**
     * @return the sEndChk
     */
    public String getsEndChk() {
        return sEndChk;
    }

    /**
     * @param sEndChk the sEndChk to set
     */
    public void setsEndChk(String sEndChk) {
        this.sEndChk = sEndChk;
    }

    /**
     * @return the sTaxDdctGrtePrcOverZeroUseYn
     */
    public String getsTaxDdctGrtePrcOverZeroUseYn() {
        return sTaxDdctGrtePrcOverZeroUseYn;
    }

    /**
     * @param sTaxDdctGrtePrcOverZeroUseYn the sTaxDdctGrtePrcOverZeroUseYn to set
     */
    public void setsTaxDdctGrtePrcOverZeroUseYn(String sTaxDdctGrtePrcOverZeroUseYn) {
        this.sTaxDdctGrtePrcOverZeroUseYn = sTaxDdctGrtePrcOverZeroUseYn;
    }

    /**
     * @return the sRetlPrc
     */
    public double getsRetlPrc() {
        return sRetlPrc;
    }

    /**
     * @param sRetlPrc the sRetlPrc to set
     */
    public void setsRetlPrc(double sRetlPrc) {
        this.sRetlPrc = sRetlPrc;
    }

    /**
     * @return the sWhslPrc
     */
    public double getsWhslPrc() {
        return sWhslPrc;
    }

    /**
     * @param sWhslPrc the sWhslPrc to set
     */
    public void setsWhslPrc(double sWhslPrc) {
        this.sWhslPrc = sWhslPrc;
    }

    /**
     * @return the sIncPrc
     */
    public double getsIncPrc() {
        return sIncPrc;
    }

    /**
     * @param sIncPrc the sIncPrc to set
     */
    public void setsIncPrc(double sIncPrc) {
        this.sIncPrc = sIncPrc;
    }

    /**
     * @return the sGrtePrc
     */
    public double getsGrtePrc() {
        return sGrtePrc;
    }

    /**
     * @param sGrtePrc the sGrtePrc to set
     */
    public void setsGrtePrc(double sGrtePrc) {
        this.sGrtePrc = sGrtePrc;
    }

}
