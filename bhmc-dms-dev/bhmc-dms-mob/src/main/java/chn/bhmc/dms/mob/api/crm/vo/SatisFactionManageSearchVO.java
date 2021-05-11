package chn.bhmc.dms.mob.api.crm.vo;

import java.util.Date;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionManageSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 03. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 11.     Kim Hyun Ho     최초 생성
 * </pre>
 */
public class SatisFactionManageSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8196038021303713795L;

    /**
    * 일련번호
    **/
    private  int              sSeq;

    /**
     * 딜러코드
     **/
    private  String                sDlrCd;

    /**
     * 사업장코드
     **/
    private  String                sPltCd;

    /**
    * 만족도조사명
    **/
    private  String           sStsfIvstNm;

    /**
    * 만족도조사방법코드
    **/
    private  String           sStsfIvstMthCd;

    /**
    * 만족도조사수단코드
    **/
    private  String           sStsfIvstExpdCd;

    /**
     * 만족도조사타입코드
     **/
    private  String           sStsfIvstTpCd;

    /**
    * 설문템플릿일련번호
    **/
    private  int              sSubyTmplSeq;

    /**
    * 대상자추출일련번호
    **/
    private  String              sRcpeExtrSeq;


    /**
    * 사용여부
    **/
    private  String           sUseYn;

    //조건추가
    private  String sCustTargYn;
    private  int sStsfIvstSeq;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              sStartDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              sEndDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              sStartRegDt;//검색조건 등록일 from
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              sEndRegDt;//검색조건 등록일 to

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              sStsfStartDt;//만족도조사 시행일 from
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              sStsfEndDt;//만족도조사 시행일 to


    private  Date              sCurruntDt;

    private  String          sLangCd;        // 언어코드
    private  String          sCmmCd;        // 공통코드


    /**
     * @return the sSeq
     */
    public int getsSeq() {
        return sSeq;
    }
    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(int sSeq) {
        this.sSeq = sSeq;
    }
    /**
     * @return the sStsfIvstNm
     */
    public String getsStsfIvstNm() {
        return sStsfIvstNm;
    }
    /**
     * @param sStsfIvstNm the sStsfIvstNm to set
     */
    public void setsStsfIvstNm(String sStsfIvstNm) {
        this.sStsfIvstNm = sStsfIvstNm;
    }
    /**
     * @return the sStsfIvstMthCd
     */
    public String getsStsfIvstMthCd() {
        return sStsfIvstMthCd;
    }
    /**
     * @param sStsfIvstMthCd the sStsfIvstMthCd to set
     */
    public void setsStsfIvstMthCd(String sStsfIvstMthCd) {
        this.sStsfIvstMthCd = sStsfIvstMthCd;
    }
    /**
     * @return the sStsfIvstExpdCd
     */
    public String getsStsfIvstExpdCd() {
        return sStsfIvstExpdCd;
    }
    /**
     * @param sStsfIvstExpdCd the sStsfIvstExpdCd to set
     */
    public void setsStsfIvstExpdCd(String sStsfIvstExpdCd) {
        this.sStsfIvstExpdCd = sStsfIvstExpdCd;
    }
    /**
     * @return the sSubyTmplSeq
     */
    public int getsSubyTmplSeq() {
        return sSubyTmplSeq;
    }
    /**
     * @param sSubyTmplSeq the sSubyTmplSeq to set
     */
    public void setsSubyTmplSeq(int sSubyTmplSeq) {
        this.sSubyTmplSeq = sSubyTmplSeq;
    }

    /**
     * @return the sRcpeExtrSeq
     */
    public String getsRcpeExtrSeq() {
        return sRcpeExtrSeq;
    }
    /**
     * @param sRcpeExtrSeq the sRcpeExtrSeq to set
     */
    public void setsRcpeExtrSeq(String sRcpeExtrSeq) {
        this.sRcpeExtrSeq = sRcpeExtrSeq;
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
     * @return the sCustTargYn
     */
    public String getsCustTargYn() {
        return sCustTargYn;
    }
    /**
     * @param sCustTargYn the sCustTargYn to set
     */
    public void setsCustTargYn(String sCustTargYn) {
        this.sCustTargYn = sCustTargYn;
    }


    /**
     * @return the sStsfIvstTpCd
     */
    public String getsStsfIvstTpCd() {
        return sStsfIvstTpCd;
    }
    /**
     * @param sStsfIvstTpCd the sStsfIvstTpCd to set
     */
    public void setsStsfIvstTpCd(String sStsfIvstTpCd) {
        this.sStsfIvstTpCd = sStsfIvstTpCd;
    }


    /**
     * @return the sStsfIvstSeq
     */
    public int getsStsfIvstSeq() {
        return sStsfIvstSeq;
    }
    /**
     * @param sStsfIvstSeq the sStsfIvstSeq to set
     */
    public void setsStsfIvstSeq(int sStsfIvstSeq) {
        this.sStsfIvstSeq = sStsfIvstSeq;
    }

    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }
    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
    }
    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }
    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }
    /**
     * @return the sCurruntDt
     */
    public Date getsCurruntDt() {
        return sCurruntDt;
    }

    /**
     * @return the sStartRegDt
     */
    public Date getsStartRegDt() {
        return sStartRegDt;
    }
    /**
     * @param sStartRegDt the sStartRegDt to set
     */
    public void setsStartRegDt(Date sStartRegDt) {
        this.sStartRegDt = sStartRegDt;
    }
    /**
     * @return the sEndRegDt
     */
    public Date getsEndRegDt() {
        return sEndRegDt;
    }
    /**
     * @param sEndRegDt the sEndRegDt to set
     */
    public void setsEndRegDt(Date sEndRegDt) {
        this.sEndRegDt = sEndRegDt;
    }
    /**
     * @param sCurruntDt the sCurruntDt to set
     */
    public void setsCurruntDt(Date sCurruntDt) {
        this.sCurruntDt = sCurruntDt;
    }
    /**
     * @return the sStsfStartDt
     */
    public Date getsStsfStartDt() {
        return sStsfStartDt;
    }
    /**
     * @param sStsfStartDt the sStsfStartDt to set
     */
    public void setsStsfStartDt(Date sStsfStartDt) {
        this.sStsfStartDt = sStsfStartDt;
    }
    /**
     * @return the sStsfEndDt
     */
    public Date getsStsfEndDt() {
        return sStsfEndDt;
    }
    /**
     * @param sStsfEndDt the sStsfEndDt to set
     */
    public void setsStsfEndDt(Date sStsfEndDt) {
        this.sStsfEndDt = sStsfEndDt;
    }
    /**
     * @return the sLangCd
     */
    public String getsLangCd() {
        return sLangCd;
    }
    /**
     * @param sLangCd the sLangCd to set
     */
    public void setsLangCd(String sLangCd) {
        this.sLangCd = sLangCd;
    }
    /**
     * @return the sCmmCd
     */
    public String getsCmmCd() {
        return sCmmCd;
    }
    /**
     * @param sCmmCd the sCmmCd to set
     */
    public void setsCmmCd(String sCmmCd) {
        this.sCmmCd = sCmmCd;
    }







}
