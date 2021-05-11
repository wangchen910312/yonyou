package chn.bhmc.dms.sal.acc.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AccessoryItemMasterSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 2. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 1.     Kang Seok Han     최초 생성
 * </pre>
 */

public class AccessoryItemMasterSearchVO extends BaseSearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1907560711160835858L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 센터코드
     **/
    private String sPltCd;

    /**
     * 창고코드
     **/
    private List<String> sStrgeCd;

    /**
     * 입고창고
     */
    private String sGrStrgeCd;

    /**
     * 창고유형
     */
    private String sStrgeTp;

    /**
     * 용품코드
     */
    private String sItemCd;

    /**
     * 용품명
     */
    private String sItemNm;

    /**
     * 품목구분코드
     */
    private String sItemDstinCd;

    /**
     * BMP YN 여부
     */
    private String sBmpYn;

    /**
     * 패키지
     */
    private String sPackage;

    /**
     * 용품유형
     */
    private String sEtcCd1;

    /**
     * 브랜드
     */
    private String sBrandCd;

    /**
     * 공급상구분
     * '01':BMP
     * '02':기타
     */
    private String sSpyrCd;

    /**
     * 거래처유형
     * '01':BMP
     * '03':기타
     */
    private String sBpTp;

    /**
     * 거래처코드
     */
    private String sBpCd;

    /**
     * 거래처명
     */
    private String sBpNm;

    /***
     * 단종여부
     */
    private String sEndYn;

    /**
     * 포인트여부
     */
    private String sEtcCd2;

    private String sStrgeDupYn;


    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPointChangeFrom;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPointChangeTo;

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
    public List<String> getsStrgeCd() {
        return sStrgeCd;
    }

    /**
     * @param sStrgeCd the sStrgeCd to set
     */
    public void setsStrgeCd(List<String> sStrgeCd) {
        this.sStrgeCd = sStrgeCd;
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
     * @return the sStrgeTp
     */
    public String getsStrgeTp() {
        return sStrgeTp;
    }

    /**
     * @param sStrgeTp the sStrgeTp to set
     */
    public void setsStrgeTp(String sStrgeTp) {
        this.sStrgeTp = sStrgeTp;
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
     * @return the sBmpYn
     */
    public String getsBmpYn() {
        return sBmpYn;
    }

    /**
     * @param sBmpYn the sBmpYn to set
     */
    public void setsBmpYn(String sBmpYn) {
        this.sBmpYn = sBmpYn;
    }

    /**
     * @return the sPointChangeFrom
     */
    public Date getsPointChangeFrom() {
        return sPointChangeFrom;
    }

    /**
     * @param sPointChangeFrom the sPointChangeFrom to set
     */
    public void setsPointChangeFrom(Date sPointChangeFrom) {
        this.sPointChangeFrom = sPointChangeFrom;
    }

    /**
     * @return the sPointChangeTo
     */
    public Date getsPointChangeTo() {
        return sPointChangeTo;
    }

    /**
     * @param sPointChangeTo the sPointChangeTo to set
     */
    public void setsPointChangeTo(Date sPointChangeTo) {
        this.sPointChangeTo = sPointChangeTo;
    }

    /**
     * @return the sStrgeDupYn
     */
    public String getsStrgeDupYn() {
        return sStrgeDupYn;
    }

    /**
     * @param sStrgeDupYn the sStrgeDupYn to set
     */
    public void setsStrgeDupYn(String sStrgeDupYn) {
        this.sStrgeDupYn = sStrgeDupYn;
    }



}
