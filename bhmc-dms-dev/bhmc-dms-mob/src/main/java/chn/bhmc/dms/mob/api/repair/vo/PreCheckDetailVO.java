package chn.bhmc.dms.mob.api.repair.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName  : PreCheckDetailVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * since author description
 * =========== ============= ===========================
 * 2016. 3. 28. Kwon Ki Hyun 최초 생성
 * </pre>
 */

public class PreCheckDetailVO extends BaseVO{
    
    
     
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 8064807390524877935L;

    /**
     * 딜러코드 
     **/
    private String dlrCd; 
     
    /**
     * 진단문서번호 
     **/
    private String diagDocNo;  
     
    /**
     * 진단문서라인번호
     **/
    private int diagDocLineNo; 
     
    /**
     * 구분코드 
     **/
    private String dstinCd; 
     
    /**
     * 구분명 
     **/
    private String dstinNm; 
     
    /**
     * 점검코드 
     **/
    private String chkCd; 
     
    /**
     * 점검코드현지명 
     **/
    private String chkCdNatNm; 
     
    /**
     * 결과등급코드 
     **/
    private String rsltGradeCd; 
     
    /**
     * 결과등급명  
     **/
    private String rsltGradeNm; 
     
    /**
     * 결과값 
     **/
    private String rsltVal; 
    
    /**
     * 기타내용 
     **/
    private String etcCont; 
     
    /**
     * 점검의견내용 
     **/
    private String chkOpnCont;

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
     * @return the diagDocNo
     */
    public String getDiagDocNo() {
        return diagDocNo;
    }

    /**
     * @param diagDocNo the diagDocNo to set
     */
    public void setDiagDocNo(String diagDocNo) {
        this.diagDocNo = diagDocNo;
    }

    /**
     * @return the diagDocLineNo
     */
    public int getDiagDocLineNo() {
        return diagDocLineNo;
    }

    /**
     * @param diagDocLineNo the diagDocLineNo to set
     */
    public void setDiagDocLineNo(int diagDocLineNo) {
        this.diagDocLineNo = diagDocLineNo;
    }

    /**
     * @return the dstinCd
     */
    public String getDstinCd() {
        return dstinCd;
    }

    /**
     * @param dstinCd the dstinCd to set
     */
    public void setDstinCd(String dstinCd) {
        this.dstinCd = dstinCd;
    }

    /**
     * @return the dstinNm
     */
    public String getDstinNm() {
        return dstinNm;
    }

    /**
     * @param dstinNm the dstinNm to set
     */
    public void setDstinNm(String dstinNm) {
        this.dstinNm = dstinNm;
    }

    /**
     * @return the chkCd
     */
    public String getChkCd() {
        return chkCd;
    }

    /**
     * @param chkCd the chkCd to set
     */
    public void setChkCd(String chkCd) {
        this.chkCd = chkCd;
    }

    /**
     * @return the chkCdNatNm
     */
    public String getChkCdNatNm() {
        return chkCdNatNm;
    }

    /**
     * @param chkCdNatNm the chkCdNatNm to set
     */
    public void setChkCdNatNm(String chkCdNatNm) {
        this.chkCdNatNm = chkCdNatNm;
    }

    /**
     * @return the rsltGradeCd
     */
    public String getRsltGradeCd() {
        return rsltGradeCd;
    }

    /**
     * @param rsltGradeCd the rsltGradeCd to set
     */
    public void setRsltGradeCd(String rsltGradeCd) {
        this.rsltGradeCd = rsltGradeCd;
    }

    /**
     * @return the rsltGradeNm
     */
    public String getRsltGradeNm() {
        return rsltGradeNm;
    }

    /**
     * @param rsltGradeNm the rsltGradeNm to set
     */
    public void setRsltGradeNm(String rsltGradeNm) {
        this.rsltGradeNm = rsltGradeNm;
    }

    /**
     * @return the rsltVal
     */
    public String getRsltVal() {
        return rsltVal;
    }

    /**
     * @param rsltVal the rsltVal to set
     */
    public void setRsltVal(String rsltVal) {
        this.rsltVal = rsltVal;
    }

    /**
     * @return the chkOpnCont
     */
    public String getChkOpnCont() {
        return chkOpnCont;
    }

    /**
     * @param chkOpnCont the chkOpnCont to set
     */
    public void setChkOpnCont(String chkOpnCont) {
        this.chkOpnCont = chkOpnCont;
    }

    /**
     * @return the etcCont
     */
    public String getEtcCont() {
        return etcCont;
    }

    /**
     * @param etcCont the etcCont to set
     */
    public void setEtcCont(String etcCont) {
        this.etcCont = etcCont;
    } 
     
    
    
 

}
