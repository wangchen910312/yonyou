package chn.bhmc.dms.crm.cmm.vo;

//import java.util.Date;

//import org.hibernate.validator.constraints.NotEmpty;

//import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.SearchVO;
//import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
//import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
//import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CrmTargExtractSearchVO.java.java
 * @Description : 클래스 설명을 기술합니다.
 * @author hyoung jun an
 * @since 2016. 4. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 27.     hyoung jun an     최초 생성
 * </pre>
 */


public class CrmTargExtractSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2429630987553004169L;

    /**
    * 딜러코드
    **/

    private  String           sDlrCd;

    /**
    * 고객추출조건번호
    **/

    private  String           sCustExtrTermNo;
    private  String           sCustExtrTermNoDeny;

    /**
    * 고객추출조건명
    **/

    private  String           sCustExtrTermNm;
    private  String           sCustExtrTermNmDup; // 추출조건 제목 Dup 체크를 위해 사용

    /**
     * 상세추출조건코드
     **/

    private  String           sDetlExtrTermCd;

    private  String           langCd;        // 언어코드

    /**
     * 딜러코드
     **/

     private  int           sSeq;

     private  String           cmmCd;        // 콤보박스(도시코드)

     private  int           conditionCnt;  //  조건 검색 갯수

     /**
      * 등록일자(FROM)
      **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private  Date            sRegFromDt;

     /**
      * 등록일자(TO)
      **/
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private  Date            sRegEndDt;


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
     * @return the sCustExtrTermNo
     */
    public String getsCustExtrTermNo() {
        return sCustExtrTermNo;
    }

    /**
     * @param sCustExtrTermNo the sCustExtrTermNo to set
     */
    public void setsCustExtrTermNo(String sCustExtrTermNo) {
        this.sCustExtrTermNo = sCustExtrTermNo;
    }

    /**
     * @return the sCustExtrTermNm
     */
    public String getsCustExtrTermNm() {
        return sCustExtrTermNm;
    }

    /**
     * @param sCustExtrTermNm the sCustExtrTermNm to set
     */
    public void setsCustExtrTermNm(String sCustExtrTermNm) {
        this.sCustExtrTermNm = sCustExtrTermNm;
    }

    /**
     * @return the sDetlExtrTermCd
     */
    public String getsDetlExtrTermCd() {
        return sDetlExtrTermCd;
    }

    /**
     * @param sDetlExtrTermCd the sDetlExtrTermCd to set
     */
    public void setsDetlExtrTermCd(String sDetlExtrTermCd) {
        this.sDetlExtrTermCd = sDetlExtrTermCd;
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
     * @return the sRegFromDt
     */
    public Date getsRegFromDt() {
        return sRegFromDt;
    }

    /**
     * @param sRegFromDt the sRegFromDt to set
     */
    public void setsRegFromDt(Date sRegFromDt) {
        this.sRegFromDt = sRegFromDt;
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
     * @return the conditionCnt
     */
    public int getConditionCnt() {
        return conditionCnt;
    }

    /**
     * @param conditionCnt the conditionCnt to set
     */
    public void setConditionCnt(int conditionCnt) {
        this.conditionCnt = conditionCnt;
    }

    /**
     * @return the sCustExtrTermNmDup
     */
    public String getsCustExtrTermNmDup() {
        return sCustExtrTermNmDup;
    }

    /**
     * @param sCustExtrTermNmDup the sCustExtrTermNmDup to set
     */
    public void setsCustExtrTermNmDup(String sCustExtrTermNmDup) {
        this.sCustExtrTermNmDup = sCustExtrTermNmDup;
    }

    /**
     * @return the sCustExtrTermNoDeny
     */
    public String getsCustExtrTermNoDeny() {
        return sCustExtrTermNoDeny;
    }

    /**
     * @param sCustExtrTermNoDeny the sCustExtrTermNoDeny to set
     */
    public void setsCustExtrTermNoDeny(String sCustExtrTermNoDeny) {
        this.sCustExtrTermNoDeny = sCustExtrTermNoDeny;
    }
}
