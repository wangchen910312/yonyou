package chn.bhmc.dms.sal.btc.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SecondDealerVO
 * @Description : 2급딜러 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 4. 14.    Kim Jin Suk        최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="lv2DlrCd"        , mesgKey="global.lbl.lv2DlrCd")
   ,@ValidField(field="lv2DlrNm"        , mesgKey="global.lbl.lv2DlrNm")
   ,@ValidField(field="lv2DlrEngNm"     , mesgKey="global.lbl.lv2DlrEngNm")
   ,@ValidField(field="crnNo"           , mesgKey="global.lbl.crnNo")
   ,@ValidField(field="ownRgstNm"       , mesgKey="global.lbl.ownRgstNm")
   ,@ValidField(field="telNo"           , mesgKey="global.lbl.telNo")
   ,@ValidField(field="faxNo"           , mesgKey="global.lbl.faxNo")
   ,@ValidField(field="callCenTelNo"    , mesgKey="global.lbl.callCenTelNo")
   ,@ValidField(field="emgcCenTelNo"    , mesgKey="global.lbl.emgcCenTelNo")
   ,@ValidField(field="salCenTelNo"     , mesgKey="global.lbl.salCenTelNo")
   ,@ValidField(field="serCenTelNo"     , mesgKey="global.lbl.serCenTelNo")
   ,@ValidField(field="distCd"          , mesgKey="global.lbl.distCd")
   ,@ValidField(field="dlrGrpCd"        , mesgKey="global.lbl.dlrGrpCd")
   ,@ValidField(field="zipCd"           , mesgKey="global.lbl.zipCd")
   ,@ValidField(field="baseAddr"        , mesgKey="global.lbl.baseAddr")
   ,@ValidField(field="detlAddr"        , mesgKey="global.lbl.detlAddr")
   ,@ValidField(field="engAddr"         , mesgKey="global.lbl.engAddr")
   ,@ValidField(field="fdationDt"       , mesgKey="global.lbl.fdationDt")
   ,@ValidField(field="sessYr"          , mesgKey="global.lbl.sessYr")
   ,@ValidField(field="termStartDt"     , mesgKey="global.lbl.termStartDt")
   ,@ValidField(field="termEndDt"       , mesgKey="global.lbl.termEndDt")
   ,@ValidField(field="cntryCd"         , mesgKey="global.lbl.cntryCd")
   ,@ValidField(field="homepageUrl"     , mesgKey="global.lbl.homepageUrl")
   ,@ValidField(field="regUsrId"        , mesgKey="global.lbl.regUsrId")
   ,@ValidField(field="regDt"           , mesgKey="global.lbl.regDt")
   ,@ValidField(field="updtUsrId"       , mesgKey="global.lbl.updtUsrId")
   ,@ValidField(field="updtDt"          , mesgKey="global.lbl.updtDt")
   ,@ValidField(field="lttuVal"         , mesgKey="global.lbl.lttuVal")
   ,@ValidField(field="lotuVal"         , mesgKey="global.lbl.lotuVal")
   ,@ValidField(field="dmsIpNm"         , mesgKey="global.lbl.dmsIpNm")
   ,@ValidField(field="dmsPortNm"       , mesgKey="global.lbl.dmsPortNm")
   ,@ValidField(field="dmsTestUrlNm"    , mesgKey="global.lbl.dmsTestUrlNm")
   ,@ValidField(field="dmsOperEmailNm"  , mesgKey="global.lbl.dmsOperEmailNm")
   ,@ValidField(field="dmsOperTelNo"    , mesgKey="global.lbl.dmsOperTelNo")
   ,@ValidField(field="dmsUseYn"        , mesgKey="global.lbl.dmsUseYn")
   })
public class SecondDealerVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1247714202992521448L;

    /**
     * 2급딜러코드
     **/
    private  String           lv2DlrCd;

    /**
     * 2급딜러명
     **/
    private  String           lv2DlrNm;

    /**
     * 2급딜러영문명
     **/
    private  String           lv2DlrEngNm;

    /**
     * 사업자등록번호
     **/
    private  String           crnNo;

    /**
     * 대표자명
     **/
    private  String           ownRgstNm;

    /**
     * 전화번호
     **/
    private  String           telNo;

    /**
     * 팩스번호
     **/
    private  String           faxNo;

    /**
     * 콜센터전화번호
     **/
    private  String           callCenTelNo;

    /**
     * 구급센터전화번호
     **/
    private  String           emgcCenTelNo;

    /**
     * 영업센터전화번호
     **/
    private  String           salCenTelNo;

    /**
     * 서비스센터전화번호
     **/
    private  String           serCenTelNo;

    /**
     * 지역코드
     **/
    private  String           distCd;

    /**
     * 딜러그룹코드
     **/
    private  String           dlrGrpCd;

    /**
     * 우편번호
     **/
    private  String           zipCd;

    /**
     * 기본주소
     **/
    private  String           baseAddr;

    /**
     * 상세주소
     **/
    private  String           detlAddr;

    /**
     * 영문주소
     **/
    private  String           engAddr;

    /**
     * 설립일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           fdationDt;

    /**
     * 회기
     **/
    private  int              sessYr;

    /**
     * 기간시작일자
     **/
    private  String           termStartDt;

    /**
     * 기간종료일자
     **/
    private  String           termEndDt;

    /**
     * 국가코드
     **/
    private  String           cntryCd;

    /**
     * 홈페이지URL
     **/
    //HOMEPAGE_URL
    private  String           homepageUrl;

    /**
     * 등록자ID
     **/
    private  String           regUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             regDt;

    /**
     * 수정자ID
     **/
    //UPDT_USR_ID
    private  String           updtUsrId;

    /**
     * 수정일자
     **/
    //UPDT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             updtDt;

    /**
     * 위도값
     **/
    private  Double           lttuVal;

    /**
     * 경도값
     **/
    private  Double           lotuVal;

    /**
     * DMSIP명
     **/
    private  String           dmsIpNm;

    /**
     * DMSPORT명
     **/
    private  String           dmsPortNm;

    /**
     * DMS테스트URL명
     **/
    private  String           dmsTestUrlNm;

    /**
     * DMS운영자이메일명
     **/
    private  String           dmsOperEmailNm;

    /**
     * DMS운영자전화번호
     **/
    private  String           dmsOperTelNo;

    /**
     * DMS사용여부
     **/
    private  String           dmsUseYn;

    /**
     * @return the lv2DlrCd
     */
    public String getLv2DlrCd() {
        return lv2DlrCd;
    }

    /**
     * @param lv2DlrCd the lv2DlrCd to set
     */
    public void setLv2DlrCd(String lv2DlrCd) {
        this.lv2DlrCd = lv2DlrCd;
    }

    /**
     * @return the lv2DlrNm
     */
    public String getLv2DlrNm() {
        return lv2DlrNm;
    }

    /**
     * @param lv2DlrNm the lv2DlrNm to set
     */
    public void setLv2DlrNm(String lv2DlrNm) {
        this.lv2DlrNm = lv2DlrNm;
    }

    /**
     * @return the lv2DlrEngNm
     */
    public String getLv2DlrEngNm() {
        return lv2DlrEngNm;
    }

    /**
     * @param lv2DlrEngNm the lv2DlrEngNm to set
     */
    public void setLv2DlrEngNm(String lv2DlrEngNm) {
        this.lv2DlrEngNm = lv2DlrEngNm;
    }

    /**
     * @return the crnNo
     */
    public String getCrnNo() {
        return crnNo;
    }

    /**
     * @param crnNo the crnNo to set
     */
    public void setCrnNo(String crnNo) {
        this.crnNo = crnNo;
    }

    /**
     * @return the ownRgstNm
     */
    public String getOwnRgstNm() {
        return ownRgstNm;
    }

    /**
     * @param ownRgstNm the ownRgstNm to set
     */
    public void setOwnRgstNm(String ownRgstNm) {
        this.ownRgstNm = ownRgstNm;
    }

    /**
     * @return the telNo
     */
    public String getTelNo() {
        return telNo;
    }

    /**
     * @param telNo the telNo to set
     */
    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    /**
     * @return the faxNo
     */
    public String getFaxNo() {
        return faxNo;
    }

    /**
     * @param faxNo the faxNo to set
     */
    public void setFaxNo(String faxNo) {
        this.faxNo = faxNo;
    }

    /**
     * @return the callCenTelNo
     */
    public String getCallCenTelNo() {
        return callCenTelNo;
    }

    /**
     * @param callCenTelNo the callCenTelNo to set
     */
    public void setCallCenTelNo(String callCenTelNo) {
        this.callCenTelNo = callCenTelNo;
    }

    /**
     * @return the emgcCenTelNo
     */
    public String getEmgcCenTelNo() {
        return emgcCenTelNo;
    }

    /**
     * @param emgcCenTelNo the emgcCenTelNo to set
     */
    public void setEmgcCenTelNo(String emgcCenTelNo) {
        this.emgcCenTelNo = emgcCenTelNo;
    }

    /**
     * @return the salCenTelNo
     */
    public String getSalCenTelNo() {
        return salCenTelNo;
    }

    /**
     * @param salCenTelNo the salCenTelNo to set
     */
    public void setSalCenTelNo(String salCenTelNo) {
        this.salCenTelNo = salCenTelNo;
    }

    /**
     * @return the serCenTelNo
     */
    public String getSerCenTelNo() {
        return serCenTelNo;
    }

    /**
     * @param serCenTelNo the serCenTelNo to set
     */
    public void setSerCenTelNo(String serCenTelNo) {
        this.serCenTelNo = serCenTelNo;
    }

    /**
     * @return the distCd
     */
    public String getDistCd() {
        return distCd;
    }

    /**
     * @param distCd the distCd to set
     */
    public void setDistCd(String distCd) {
        this.distCd = distCd;
    }

    /**
     * @return the dlrGrpCd
     */
    public String getDlrGrpCd() {
        return dlrGrpCd;
    }

    /**
     * @param dlrGrpCd the dlrGrpCd to set
     */
    public void setDlrGrpCd(String dlrGrpCd) {
        this.dlrGrpCd = dlrGrpCd;
    }

    /**
     * @return the zipCd
     */
    public String getZipCd() {
        return zipCd;
    }

    /**
     * @param zipCd the zipCd to set
     */
    public void setZipCd(String zipCd) {
        this.zipCd = zipCd;
    }

    /**
     * @return the baseAddr
     */
    public String getBaseAddr() {
        return baseAddr;
    }

    /**
     * @param baseAddr the baseAddr to set
     */
    public void setBaseAddr(String baseAddr) {
        this.baseAddr = baseAddr;
    }

    /**
     * @return the detlAddr
     */
    public String getDetlAddr() {
        return detlAddr;
    }

    /**
     * @param detlAddr the detlAddr to set
     */
    public void setDetlAddr(String detlAddr) {
        this.detlAddr = detlAddr;
    }

    /**
     * @return the engAddr
     */
    public String getEngAddr() {
        return engAddr;
    }

    /**
     * @param engAddr the engAddr to set
     */
    public void setEngAddr(String engAddr) {
        this.engAddr = engAddr;
    }

    /**
     * @return the fdationDt
     */
    public Date getFdationDt() {
        return fdationDt;
    }

    /**
     * @param fdationDt the fdationDt to set
     */
    public void setFdationDt(Date fdationDt) {
        this.fdationDt = fdationDt;
    }

    /**
     * @return the sessYr
     */
    public int getSessYr() {
        return sessYr;
    }

    /**
     * @param sessYr the sessYr to set
     */
    public void setSessYr(int sessYr) {
        this.sessYr = sessYr;
    }

    /**
     * @return the termStartDt
     */
    public String getTermStartDt() {
        return termStartDt;
    }

    /**
     * @param termStartDt the termStartDt to set
     */
    public void setTermStartDt(String termStartDt) {
        this.termStartDt = termStartDt;
    }

    /**
     * @return the termEndDt
     */
    public String getTermEndDt() {
        return termEndDt;
    }

    /**
     * @param termEndDt the termEndDt to set
     */
    public void setTermEndDt(String termEndDt) {
        this.termEndDt = termEndDt;
    }

    /**
     * @return the cntryCd
     */
    public String getCntryCd() {
        return cntryCd;
    }

    /**
     * @param cntryCd the cntryCd to set
     */
    public void setCntryCd(String cntryCd) {
        this.cntryCd = cntryCd;
    }

    /**
     * @return the homepageUrl
     */
    public String getHomepageUrl() {
        return homepageUrl;
    }

    /**
     * @param homepageUrl the homepageUrl to set
     */
    public void setHomepageUrl(String homepageUrl) {
        this.homepageUrl = homepageUrl;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * @return the lttuVal
     */
    public Double getLttuVal() {
        return lttuVal;
    }

    /**
     * @param lttuVal the lttuVal to set
     */
    public void setLttuVal(Double lttuVal) {
        this.lttuVal = lttuVal;
    }

    /**
     * @return the lotuVal
     */
    public Double getLotuVal() {
        return lotuVal;
    }

    /**
     * @param lotuVal the lotuVal to set
     */
    public void setLotuVal(Double lotuVal) {
        this.lotuVal = lotuVal;
    }

    /**
     * @return the dmsIpNm
     */
    public String getDmsIpNm() {
        return dmsIpNm;
    }

    /**
     * @param dmsIpNm the dmsIpNm to set
     */
    public void setDmsIpNm(String dmsIpNm) {
        this.dmsIpNm = dmsIpNm;
    }

    /**
     * @return the dmsPortNm
     */
    public String getDmsPortNm() {
        return dmsPortNm;
    }

    /**
     * @param dmsPortNm the dmsPortNm to set
     */
    public void setDmsPortNm(String dmsPortNm) {
        this.dmsPortNm = dmsPortNm;
    }

    /**
     * @return the dmsTestUrlNm
     */
    public String getDmsTestUrlNm() {
        return dmsTestUrlNm;
    }

    /**
     * @param dmsTestUrlNm the dmsTestUrlNm to set
     */
    public void setDmsTestUrlNm(String dmsTestUrlNm) {
        this.dmsTestUrlNm = dmsTestUrlNm;
    }

    /**
     * @return the dmsOperEmailNm
     */
    public String getDmsOperEmailNm() {
        return dmsOperEmailNm;
    }

    /**
     * @param dmsOperEmailNm the dmsOperEmailNm to set
     */
    public void setDmsOperEmailNm(String dmsOperEmailNm) {
        this.dmsOperEmailNm = dmsOperEmailNm;
    }

    /**
     * @return the dmsOperTelNo
     */
    public String getDmsOperTelNo() {
        return dmsOperTelNo;
    }

    /**
     * @param dmsOperTelNo the dmsOperTelNo to set
     */
    public void setDmsOperTelNo(String dmsOperTelNo) {
        this.dmsOperTelNo = dmsOperTelNo;
    }

    /**
     * @return the dmsUseYn
     */
    public String getDmsUseYn() {
        return dmsUseYn;
    }

    /**
     * @param dmsUseYn the dmsUseYn to set
     */
    public void setDmsUseYn(String dmsUseYn) {
        this.dmsUseYn = dmsUseYn;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
