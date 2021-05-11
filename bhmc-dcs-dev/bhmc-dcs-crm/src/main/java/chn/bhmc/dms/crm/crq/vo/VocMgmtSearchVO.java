package chn.bhmc.dms.crm.crq.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 마케팅 캠패인 조회 SearchVO
 *
 * @ClassName   : VocMgmtSearchVO.java
 * @Description : VocMgmtSearchVO Class
 * @author hyoung jun an
 * @since 2016.03.04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.04     hyoung jun an    최초 생성
 * </pre>
 */

public class VocMgmtSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6891084794312677186L;

    private  String          sDlrCd;        // 딜러코드
    private  String          sPltCd;        // 사업장코드
    private  String          langCd;        // 언어코드
    private  String          cmmCd;         // 유형코드

    /**
    * VOC번호
    **/
    private  String                 sVocNo;

    /**
    * 등록시작일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   sRegStartDt;

    /**
    * 등록종료일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   sRegEndDt;

    /**
     * VOC유형
     **/
     private  String                 sVocTpCd;

     /**
     * VOC상태
     **/
     private  String                 sVocStatCd;

     /**
     * 불만원인
     **/
     private  String                 sCmplCauCd;

     /**
      * 처리담당부서
      **/
     private  String                 sPprocDeptNm;

     /**
      * 처리담당부서
      **/
     private  String                 sAssignYn;




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
     * @return the langCd
     */
    public String getLangCd() {
        return langCd;
    }

    /**
     * @param langCd the langCd to set
     */
    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }

    /**
     * @return the cmmCd
     */
    public String getCmmCd() {
        return cmmCd;
    }

    /**
     * @param cmmCd the cmmCd to set
     */
    public void setCmmCd(String cmmCd) {
        this.cmmCd = cmmCd;
    }

    /**
     * @return the sVocNo
     */
    public String getsVocNo() {
        return sVocNo;
    }

    /**
     * @param sVocNo the sVocNo to set
     */
    public void setsVocNo(String sVocNo) {
        this.sVocNo = sVocNo;
    }

    /**
     * @return the sRegStartDt
     */
    public Date getsRegStartDt() {
        return sRegStartDt;
    }

    /**
     * @param sRegStartDt the sRegStartDt to set
     */
    public void setsRegStartDt(Date sRegStartDt) {
        this.sRegStartDt = sRegStartDt;
    }

    /**
     * @return the sRegEndDt
     */
    public Date getsRegEndDt() {
        return sRegEndDt;
    }

    /**
     * @param sRegEndDt the sRegEndDt to set
     */
    public void setsRegEndDt(Date sRegEndDt) {
        this.sRegEndDt = sRegEndDt;
    }

    /**
     * @return the sVocTpCd
     */
    public String getsVocTpCd() {
        return sVocTpCd;
    }

    /**
     * @param sVocTpCd the sVocTpCd to set
     */
    public void setsVocTpCd(String sVocTpCd) {
        this.sVocTpCd = sVocTpCd;
    }

    /**
     * @return the sVocStatCd
     */
    public String getsVocStatCd() {
        return sVocStatCd;
    }

    /**
     * @param sVocStatCd the sVocStatCd to set
     */
    public void setsVocStatCd(String sVocStatCd) {
        this.sVocStatCd = sVocStatCd;
    }

    /**
     * @return the sCmplCauCd
     */
    public String getsCmplCauCd() {
        return sCmplCauCd;
    }

    /**
     * @param sCmplCauCd the sCmplCauCd to set
     */
    public void setsCmplCauCd(String sCmplCauCd) {
        this.sCmplCauCd = sCmplCauCd;
    }

    /**
     * @return the sPprocDeptNm
     */
    public String getsPprocDeptNm() {
        return sPprocDeptNm;
    }

    /**
     * @param sPprocDeptNm the sPprocDeptNm to set
     */
    public void setsPprocDeptNm(String sPprocDeptNm) {
        this.sPprocDeptNm = sPprocDeptNm;
    }

    /**
     * @return the sAssignYn
     */
    public String getsAssignYn() {
        return sAssignYn;
    }

    /**
     * @param sAssignYn the sAssignYn to set
     */
    public void setsAssignYn(String sAssignYn) {
        this.sAssignYn = sAssignYn;
    }


}