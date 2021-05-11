package chn.bhmc.dms.bat.crm.mcm.vo;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatMarkingCampaignVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Hyoung Jun An
 * @since 2016. 7. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 20.   Hyoung Jun An     최초 생성
 * </pre>
 */

public class BatMarkingCampaignVO extends BaseVO {

     /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5974166133031615857L;


    /**
      * 일련번호
      **/
     private  int                 seq;


     /**
     * 딜러코드
     **/
     private  String              dlrCd;

     /**
     * 마케팅코드
     **/
     private  String              makCd;

     /**
     * 추출차수
     **/
     private  int                 extrDgreCnt;

     /**
     * 고객추출조건번호
     **/
     //CUST_EXTR_TERM_NO

     private  String              custExtrTermNo;
     /**
     * 고객추출제목명
     **/
     //CUST_EXTR_TITLE_NM

     private  String              custExtrTitleNm;

     /**
     * 고객추출주기내용
     **/
     //CUST_EXTR_CYCLE_CONT

     private  String              custExtrCycleCont;

     /**
     * 중복여부
     **/

     private  String              dupYn;

     /**
     * 배치작업ID
     **/
     //BAT_OPER_ID

     private  String              batOperId;

     /**
     * 고객추출주기유형
     **/
     //CUST_EXTR_CYCLE_TP

     private  String              custExtrCycleTp;

     private String result;//프로시저 결과





    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }
    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }
    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }
    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }
    /**
     * @return the makCd
     */
    public String getMakCd() {
        return makCd;
    }
    /**
     * @param makCd the makCd to set
     */
    public void setMakCd(String makCd) {
        this.makCd = makCd;
    }
    /**
     * @return the extrDgreCnt
     */
    public int getExtrDgreCnt() {
        return extrDgreCnt;
    }
    /**
     * @param extrDgreCnt the extrDgreCnt to set
     */
    public void setExtrDgreCnt(int extrDgreCnt) {
        this.extrDgreCnt = extrDgreCnt;
    }
    /**
     * @return the custExtrTermNo
     */
    public String getCustExtrTermNo() {
        return custExtrTermNo;
    }
    /**
     * @param custExtrTermNo the custExtrTermNo to set
     */
    public void setCustExtrTermNo(String custExtrTermNo) {
        this.custExtrTermNo = custExtrTermNo;
    }
    /**
     * @return the custExtrTitleNm
     */
    public String getCustExtrTitleNm() {
        return custExtrTitleNm;
    }
    /**
     * @param custExtrTitleNm the custExtrTitleNm to set
     */
    public void setCustExtrTitleNm(String custExtrTitleNm) {
        this.custExtrTitleNm = custExtrTitleNm;
    }
    /**
     * @return the custExtrCycleCont
     */
    public String getCustExtrCycleCont() {
        return custExtrCycleCont;
    }
    /**
     * @param custExtrCycleCont the custExtrCycleCont to set
     */
    public void setCustExtrCycleCont(String custExtrCycleCont) {
        this.custExtrCycleCont = custExtrCycleCont;
    }
    /**
     * @return the dupYn
     */
    public String getDupYn() {
        return dupYn;
    }
    /**
     * @param dupYn the dupYn to set
     */
    public void setDupYn(String dupYn) {
        this.dupYn = dupYn;
    }
    /**
     * @return the batOperId
     */
    public String getBatOperId() {
        return batOperId;
    }
    /**
     * @param batOperId the batOperId to set
     */
    public void setBatOperId(String batOperId) {
        this.batOperId = batOperId;
    }
    /**
     * @return the custExtrCycleTp
     */
    public String getCustExtrCycleTp() {
        return custExtrCycleTp;
    }
    /**
     * @param custExtrCycleTp the custExtrCycleTp to set
     */
    public void setCustExtrCycleTp(String custExtrCycleTp) {
        this.custExtrCycleTp = custExtrCycleTp;
    }
    /**
     * @return the result
     */
    public String getResult() {
        return result;
    }
    /**
     * @param result the result to set
     */
    public void setResult(String result) {
        this.result = result;
    }





    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }
}