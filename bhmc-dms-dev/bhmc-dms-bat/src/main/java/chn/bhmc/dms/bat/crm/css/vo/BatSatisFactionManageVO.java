package chn.bhmc.dms.bat.crm.css.vo;

import java.util.Date;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatSatisFactionManageVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 7. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 20.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class BatSatisFactionManageVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8959976806590249012L;


    /**
     * 일련번호
     **/
     private  int seq;

     /**
      * 딜러코드
      **/
     private  String dlrCd;

     /*
      * 대상자 추출용
      */
     private String custExtrTermNo; //대상자추출일련번호

     /*
      * 추출한 대상자를 대상자테이블(CR_0905T)에 등록하기 위함
      */
     //private  int StsfIvstSeq;   //만족도 조사 일련번호
     private  int stsfIvstSeq;   //만족도 조사 일련번호
     private  String subyTmplSeq; //설문템플릿일련번호
     private  String rcpeExtrSeq; //고객추출조건번호

     /*
      * 콜센터 이관용
      */
     private String refKeyNm;//만족도 조사 일련번호(캠페인번호, 고개케어 일련번호, 만족도조사 일련번호)
     //private int ExtrDgreCnt;//추출차수(캠페인/고객케어는 추출차수, 만족도조사는 무조건 1 을 넘김)
     private int extrDgreCnt;//추출차수(캠페인/고객케어는 추출차수, 만족도조사는 무조건 1 을 넘김)
     private String bizCd; //업무코드(캠페인->06, 고객케어->09, 만족도조사->05)

     private String result;//프로시저 결과

     /**
     * 만족도조사명
     **/
     private  String stsfIvstNm;

     /**
     * 만족도조사유형코드
     **/
     private  String stsfIvstMthCd;

     /**
     * 만족도조사수단코드
     **/
     private  String stsfIvstExpdCd;

     /**
      * 만족도조사타입코드
      **/
     private  String stsfIvstTpCd;

     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date currentDt;



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
     * @return the stsfIvstNm
     */
    public String getStsfIvstNm() {
        return stsfIvstNm;
    }

    /**
     * @param stsfIvstNm the stsfIvstNm to set
     */
    public void setStsfIvstNm(String stsfIvstNm) {
        this.stsfIvstNm = stsfIvstNm;
    }

    /**
     * @return the stsfIvstMthCd
     */
    public String getStsfIvstMthCd() {
        return stsfIvstMthCd;
    }

    /**
     * @param stsfIvstMthCd the stsfIvstMthCd to set
     */
    public void setStsfIvstMthCd(String stsfIvstMthCd) {
        this.stsfIvstMthCd = stsfIvstMthCd;
    }

    /**
     * @return the stsfIvstExpdCd
     */
    public String getStsfIvstExpdCd() {
        return stsfIvstExpdCd;
    }

    /**
     * @param stsfIvstExpdCd the stsfIvstExpdCd to set
     */
    public void setStsfIvstExpdCd(String stsfIvstExpdCd) {
        this.stsfIvstExpdCd = stsfIvstExpdCd;
    }

    /**
     * @return the stsfIvstTpCd
     */
    public String getStsfIvstTpCd() {
        return stsfIvstTpCd;
    }

    /**
     * @param stsfIvstTpCd the stsfIvstTpCd to set
     */
    public void setStsfIvstTpCd(String stsfIvstTpCd) {
        this.stsfIvstTpCd = stsfIvstTpCd;
    }

    /**
     * @return the subyTmplSeq
     */
    public String getSubyTmplSeq() {
        return subyTmplSeq;
    }

    /**
     * @param subyTmplSeq the subyTmplSeq to set
     */
    public void setSubyTmplSeq(String subyTmplSeq) {
        this.subyTmplSeq = subyTmplSeq;
    }

    /**
     * @return the rcpeExtrSeq
     */
    public String getRcpeExtrSeq() {
        return rcpeExtrSeq;
    }

    /**
     * @param rcpeExtrSeq the rcpeExtrSeq to set
     */
    public void setRcpeExtrSeq(String rcpeExtrSeq) {
        this.rcpeExtrSeq = rcpeExtrSeq;
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
     * @return the currentDt
     */
    public Date getCurrentDt() {
        return currentDt;
    }

    /**
     * @param currentDt the currentDt to set
     */
    public void setCurrentDt(Date currentDt) {
        this.currentDt = currentDt;
    }

    /**
     * @return the refKeyNm
     */
    public String getRefKeyNm() {
        return refKeyNm;
    }

    /**
     * @param refKeyNm the refKeyNm to set
     */
    public void setRefKeyNm(String refKeyNm) {
        this.refKeyNm = refKeyNm;
    }

    /**
     * @return the bizCd
     */
    public String getBizCd() {
        return bizCd;
    }

    /**
     * @param bizCd the bizCd to set
     */
    public void setBizCd(String bizCd) {
        this.bizCd = bizCd;
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



    /**
     * @return the stsfIvstSeq
     */
    public int getStsfIvstSeq() {
        return stsfIvstSeq;
    }

    /**
     * @param stsfIvstSeq the stsfIvstSeq to set
     */
    public void setStsfIvstSeq(int stsfIvstSeq) {
        this.stsfIvstSeq = stsfIvstSeq;
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

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }


}
