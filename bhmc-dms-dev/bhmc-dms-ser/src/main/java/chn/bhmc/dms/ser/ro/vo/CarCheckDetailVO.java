package chn.bhmc.dms.ser.ro.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName  : CarCheckDetailVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author KyungMok Kim
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * since author description
 * =========== ============= ===========================
 * 2016. 5. 25. KyungMok Kim 최초 생성
 * </pre>
 */

public class CarCheckDetailVO extends BaseVO{



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8064807351034877935L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 차량점검문서번호
     **/
    private String carChkDocNo;

    /**
     * 점검유형
     **/
    private String chkTp;

    /**
     * 점검코드
     **/
    private String chkCd;

    /**
     * 결과등급코드
     **/
    private String rsltGradeCd;

    /**
     * 파일데이터내용
     **/
    private String fileDataCont;

    /**
     * 파일유형
     **/
    private String fileTp;

    /**
     * 파일명
     **/
    private String fileNm;

    /**
     * 파일사이즈값
     **/
    private int fileSizeVal;

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
     * @return the carChkDocNo
     */
    public String getCarChkDocNo() {
        return carChkDocNo;
    }

    /**
     * @param carChkDocNo the carChkDocNo to set
     */
    public void setCarChkDocNo(String carChkDocNo) {
        this.carChkDocNo = carChkDocNo;
    }

    /**
     * @return the chkTp
     */
    public String getChkTp() {
        return chkTp;
    }

    /**
     * @param chkTp the chkTp to set
     */
    public void setChkTp(String chkTp) {
        this.chkTp = chkTp;
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
     * @return the fileDataCont
     */
    public String getFileDataCont() {
        return fileDataCont;
    }

    /**
     * @param fileDataCont the fileDataCont to set
     */
    public void setFileDataCont(String fileDataCont) {
        this.fileDataCont = fileDataCont;
    }

    /**
     * @return the fileTp
     */
    public String getFileTp() {
        return fileTp;
    }

    /**
     * @param fileTp the fileTp to set
     */
    public void setFileTp(String fileTp) {
        this.fileTp = fileTp;
    }

    /**
     * @return the fileNm
     */
    public String getFileNm() {
        return fileNm;
    }

    /**
     * @param fileNm the fileNm to set
     */
    public void setFileNm(String fileNm) {
        this.fileNm = fileNm;
    }

    /**
     * @return the fileSizeVal
     */
    public int getFileSizeVal() {
        return fileSizeVal;
    }

    /**
     * @param fileSizeVal the fileSizeVal to set
     */
    public void setFileSizeVal(int fileSizeVal) {
        this.fileSizeVal = fileSizeVal;
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

}
