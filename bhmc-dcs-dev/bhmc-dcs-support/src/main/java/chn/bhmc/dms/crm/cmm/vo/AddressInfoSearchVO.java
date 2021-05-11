package chn.bhmc.dms.crm.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AddressInfoSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */


public class AddressInfoSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7251945615913891444L;

    private  String        sSeq;

    /**
     * 딜러코드
     **/

    private  String        sDlrCd;

    /**
     * 사업장코드
     **/

    private  String        sPltCd;

    /**
     * 참조테이블명
     **/

    private  String        sRefTableNm;

    /**
     * 참조키명
     **/

    private  String        sRefKeyNm;

    /**
     * 주소유형
     **/

    private  String        sAddrTp;

    /**
     * 우편번호
     **/

    private  String        sZipCd;

    /**
     * 성코드
     **/

    private  String        sSungCd;

    /**
     * 도시코드
     **/

    private  String        sCityCd;

    /**
     * 지역코드
     **/

    private  String        sDistCd;

    /**
     * 주소명
     **/

    private  String        sAddrNm;

    /**
     * 주소상세내용
     **/

    private  String        sAddrDetlCont;

    /**
     * 비고
     **/

    private  String        sRemark;

    /**
     * 주요주소
     **/

    private  String        sFlagYn;

    /**
     * 사용여부
     **/

    private  String        sUseYn;

    /**
     * 등록자ID
     **/

    private  String        sRegUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          sRegDt;

    /**
     * 수정자ID
     **/

    private  String        sUpdtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          sUpdtDt;

    private  String        sSungNm;
    private  String        sCityNm;
    private  String        sDistNm;
    private  String        sExtZipCd;

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
     * @return the sRefTableNm
     */
    public String getsRefTableNm() {
        return sRefTableNm;
    }

    /**
     * @param sRefTableNm the sRefTableNm to set
     */
    public void setsRefTableNm(String sRefTableNm) {
        this.sRefTableNm = sRefTableNm;
    }

    /**
     * @return the sRefKeyNm
     */
    public String getsRefKeyNm() {
        return sRefKeyNm;
    }

    /**
     * @param sRefKeyNm the sRefKeyNm to set
     */
    public void setsRefKeyNm(String sRefKeyNm) {
        this.sRefKeyNm = sRefKeyNm;
    }

    /**
     * @return the sAddrTp
     */
    public String getsAddrTp() {
        return sAddrTp;
    }

    /**
     * @param sAddrTp the sAddrTp to set
     */
    public void setsAddrTp(String sAddrTp) {
        this.sAddrTp = sAddrTp;
    }

    /**
     * @return the sZipCd
     */
    public String getsZipCd() {
        return sZipCd;
    }

    /**
     * @param sZipCd the sZipCd to set
     */
    public void setsZipCd(String sZipCd) {
        this.sZipCd = sZipCd;
    }

    /**
     * @return the sSungCd
     */
    public String getsSungCd() {
        return sSungCd;
    }

    /**
     * @param sSungCd the sSungCd to set
     */
    public void setsSungCd(String sSungCd) {
        this.sSungCd = sSungCd;
    }

    /**
     * @return the sCityCd
     */
    public String getsCityCd() {
        return sCityCd;
    }

    /**
     * @param sCityCd the sCityCd to set
     */
    public void setsCityCd(String sCityCd) {
        this.sCityCd = sCityCd;
    }

    /**
     * @return the sDistCd
     */
    public String getsDistCd() {
        return sDistCd;
    }

    /**
     * @param sDistCd the sDistCd to set
     */
    public void setsDistCd(String sDistCd) {
        this.sDistCd = sDistCd;
    }

    /**
     * @return the sAddrNm
     */
    public String getsAddrNm() {
        return sAddrNm;
    }

    /**
     * @param sAddrNm the sAddrNm to set
     */
    public void setsAddrNm(String sAddrNm) {
        this.sAddrNm = sAddrNm;
    }

    /**
     * @return the sAddrDetlCont
     */
    public String getsAddrDetlCont() {
        return sAddrDetlCont;
    }

    /**
     * @param sAddrDetlCont the sAddrDetlCont to set
     */
    public void setsAddrDetlCont(String sAddrDetlCont) {
        this.sAddrDetlCont = sAddrDetlCont;
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
     * @return the sFlagYn
     */
    public String getsFlagYn() {
        return sFlagYn;
    }

    /**
     * @param sFlagYn the sFlagYn to set
     */
    public void setsFlagYn(String sFlagYn) {
        this.sFlagYn = sFlagYn;
    }

    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }

    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
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
     * @return the sSeq
     */
    public String getsSeq() {
        return sSeq;
    }

    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(String sSeq) {
        this.sSeq = sSeq;
    }

    /**
     * @return the sSungNm
     */
    public String getsSungNm() {
        return sSungNm;
    }

    /**
     * @param sSungNm the sSungNm to set
     */
    public void setsSungNm(String sSungNm) {
        this.sSungNm = sSungNm;
    }

    /**
     * @return the sCityNm
     */
    public String getsCityNm() {
        return sCityNm;
    }

    /**
     * @param sCityNm the sCityNm to set
     */
    public void setsCityNm(String sCityNm) {
        this.sCityNm = sCityNm;
    }

    /**
     * @return the sDistNm
     */
    public String getsDistNm() {
        return sDistNm;
    }

    /**
     * @param sDistNm the sDistNm to set
     */
    public void setsDistNm(String sDistNm) {
        this.sDistNm = sDistNm;
    }

    /**
     * @return the sExtZipCd
     */
    public String getsExtZipCd() {
        return sExtZipCd;
    }

    /**
     * @param sExtZipCd the sExtZipCd to set
     */
    public void setsExtZipCd(String sExtZipCd) {
        this.sExtZipCd = sExtZipCd;
    }


}
