package chn.bhmc.dms.par.pmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ComItemMasterSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Eun Jung Jang
 * @since 2016. 5. 13.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 13.     Eun Jung Jang      최초 생성
 * </pre>
 */

public class ComItemMasterSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6939173275415859706L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 품목코드
     **/
    private String sItemCd;

    /**
     * 공용품목코드
     **/
    private String sComItemCd;

    /**
     * 공용품목명
     **/
    private String sComItemNm;

    /**
     * 비고
     **/
    private String sRemark;

    /**
     * 등록자ID
     **/
    private String sRegUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDt;

    /**
     * 수정자ID
     **/
    private String sUpdtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUpdtDt;

    /**
     * 품목명
     **/
    private String sItemNm;

    /**
     * 업체유형
     **/
    private String sSpyrCd;

    /**
     * 품목구분코드
     **/
    private String sItemDstinCd;

    /**
     * 브랜드
     **/
    private String sBrandCd;

    /**
     * 가격유형
     **/
    private String sPrcTp;

    /**
     * 차종
     **/
    private String sCarlineCd;

    /**
     * 차형
     **/
    private String sCarlineCd2;

    /**
     * ABC CLASS
     **/
    private String sAbcInd;

    /**
     * 거래처코드
     **/
    private String sBpCd;

    /**
     * 거래처명
     **/
    private String sBpNm;

    /**
     * 거래처유형
     **/
    private String sBpTp;

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
     * @return the sComItemCd
     */
    public String getsComItemCd() {
        return sComItemCd;
    }

    /**
     * @param sComItemCd the sComItemCd to set
     */
    public void setsComItemCd(String sComItemCd) {
        this.sComItemCd = sComItemCd;
    }

    /**
     * @return the sComItemNm
     */
    public String getsComItemNm() {
        return sComItemNm;
    }

    /**
     * @param sComItemNm the sComItemNm to set
     */
    public void setsComItemNm(String sComItemNm) {
        this.sComItemNm = sComItemNm;
    }

    /**
     * @return the sRemark
     */
    public String getsRemark() {
        return sRemark;
    }

    /**
     * @param sRemark the sRemark to set
     */
    public void setsRemark(String sRemark) {
        this.sRemark = sRemark;
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

    /**
     * @return the sRegDt
     */
    public Date getsRegDt() {
        return sRegDt;
    }

    /**
     * @param sRegDt the sRegDt to set
     */
    public void setsRegDt(Date sRegDt) {
        this.sRegDt = sRegDt;
    }

    /**
     * @return the sUpdtUsrId
     */
    public String getsUpdtUsrId() {
        return sUpdtUsrId;
    }

    /**
     * @param sUpdtUsrId the sUpdtUsrId to set
     */
    public void setsUpdtUsrId(String sUpdtUsrId) {
        this.sUpdtUsrId = sUpdtUsrId;
    }

    /**
     * @return the sUpdtDt
     */
    public Date getsUpdtDt() {
        return sUpdtDt;
    }

    /**
     * @param sUpdtDt the sUpdtDt to set
     */
    public void setsUpdtDt(Date sUpdtDt) {
        this.sUpdtDt = sUpdtDt;
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
}
