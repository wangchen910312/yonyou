package chn.bhmc.dms.bat.crm.crq.vo;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CrmTargExtractVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author hyoung jun an
 * @since 2016.04.05.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.05.     hyoung jun an     최초 생성
 * </pre>
 */

public class BatCrmTargExtractVO extends BaseVO {

   /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7315456847266341425L;

    /**
    * 딜러코드
    **/
    private String dlrCd;
    private int custCareSeq;
    private String custExtrTermCd;
    private String custExtrTermPrid;
    private int extrDgreCnt;
    private String updtExtrDgreCnt;
    private String result;
    private int seq;
    private String dateFormat;
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
     * @return the custCareSeq
     */
    public int getCustCareSeq() {
        return custCareSeq;
    }
    /**
     * @param custCareSeq the custCareSeq to set
     */
    public void setCustCareSeq(int custCareSeq) {
        this.custCareSeq = custCareSeq;
    }
    /**
     * @return the custExtrTermCd
     */
    public String getCustExtrTermCd() {
        return custExtrTermCd;
    }
    /**
     * @param custExtrTermCd the custExtrTermCd to set
     */
    public void setCustExtrTermCd(String custExtrTermCd) {
        this.custExtrTermCd = custExtrTermCd;
    }
    /**
     * @return the custExtrTermPrid
     */
    public String getCustExtrTermPrid() {
        return custExtrTermPrid;
    }
    /**
     * @param custExtrTermPrid the custExtrTermPrid to set
     */
    public void setCustExtrTermPrid(String custExtrTermPrid) {
        this.custExtrTermPrid = custExtrTermPrid;
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
     * @return the updtExtrDgreCnt
     */
    public String getUpdtExtrDgreCnt() {
        return updtExtrDgreCnt;
    }
    /**
     * @param updtExtrDgreCnt the updtExtrDgreCnt to set
     */
    public void setUpdtExtrDgreCnt(String updtExtrDgreCnt) {
        this.updtExtrDgreCnt = updtExtrDgreCnt;
    }
    /**
     * @return the dateFormat
     */
    public String getDateFormat() {
        return dateFormat;
    }
    /**
     * @param dateFormat the dateFormat to set
     */
    public void setDateFormat(String dateFormat) {
        this.dateFormat = dateFormat;
    }



}