package chn.bhmc.dms.par.cpm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 기술자문부품 VO.
 *
 * @ClassName   : SkilAndQnaDetailVO.java
 * @Description : SkilAndQnaDetailVO Class
 * @author In Bo Shim
 * @since 2016. 8. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 24.     In Bo Shim     최초 생성
 * </pre>
 */

public class SkillAndQnaDetailVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2402826054651443308L;

    /**
     * 딜러번호
     **/
    private String dlrCd;
    /**
     * 문제번호
     **/
    private String pblmNo;
    /**
     * 딜러문제코드
     **/
    private String dlrPblmCd;
    /**
     * 답변문제번호
     **/
    private String answPblmNo;
    /**
     * 답변품목코드
     **/
    private String answItemCd;
    /**
     * 처리내용
     **/
    private String procCont;
    /**
     * 문제답변내용
     **/
    private String qestAnswCont;
    /**
     * 답변첨부파일경로명
     **/
    private String answFilePathNm;

    /**
     * 답변첨부파일명
     **/
    private String answFileNm;

    /**
     * 파일번호
     **/
    private String fileNo;

    /**
     * 파일일련번호
     **/
    private int fileSeq;

    /**
     * 파일사이즈값
     **/
    private int fileSizeVal = 0;

    /**
     * 파일데이터내용
     **/
    private byte[] fileDataCont;

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
     * @return the pblmNo
     */
    public String getPblmNo() {
        return pblmNo;
    }

    /**
     * @param pblmNo the pblmNo to set
     */
    public void setPblmNo(String pblmNo) {
        this.pblmNo = pblmNo;
    }

    /**
     * @return the dlrPblmCd
     */
    public String getDlrPblmCd() {
        return dlrPblmCd;
    }

    /**
     * @param dlrPblmCd the dlrPblmCd to set
     */
    public void setDlrPblmCd(String dlrPblmCd) {
        this.dlrPblmCd = dlrPblmCd;
    }

    /**
     * @return the answPblmNo
     */
    public String getAnswPblmNo() {
        return answPblmNo;
    }

    /**
     * @param answPblmNo the answPblmNo to set
     */
    public void setAnswPblmNo(String answPblmNo) {
        this.answPblmNo = answPblmNo;
    }

    /**
     * @return the answItemCd
     */
    public String getAnswItemCd() {
        return answItemCd;
    }

    /**
     * @param answItemCd the answItemCd to set
     */
    public void setAnswItemCd(String answItemCd) {
        this.answItemCd = answItemCd;
    }

    /**
     * @return the procCont
     */
    public String getProcCont() {
        return procCont;
    }

    /**
     * @param procCont the procCont to set
     */
    public void setProcCont(String procCont) {
        this.procCont = procCont;
    }

    /**
     * @return the qestAnswCont
     */
    public String getQestAnswCont() {
        return qestAnswCont;
    }

    /**
     * @param qestAnswCont the qestAnswCont to set
     */
    public void setQestAnswCont(String qestAnswCont) {
        this.qestAnswCont = qestAnswCont;
    }

    /**
     * @return the answFilePathNm
     */
    public String getAnswFilePathNm() {
        return answFilePathNm;
    }

    /**
     * @param answFilePathNm the answFilePathNm to set
     */
    public void setAnswFilePathNm(String answFilePathNm) {
        this.answFilePathNm = answFilePathNm;
    }

    /**
     * @return the answFileNm
     */
    public String getAnswFileNm() {
        return answFileNm;
    }

    /**
     * @param answFileNm the answFileNm to set
     */
    public void setAnswFileNm(String answFileNm) {
        this.answFileNm = answFileNm;
    }

    /**
     * @return the fileNo
     */
    public String getFileNo() {
        return fileNo;
    }

    /**
     * @param fileNo the fileNo to set
     */
    public void setFileNo(String fileNo) {
        this.fileNo = fileNo;
    }

    /**
     * @return the fileSeq
     */
    public int getFileSeq() {
        return fileSeq;
    }

    /**
     * @param fileSeq the fileSeq to set
     */
    public void setFileSeq(int fileSeq) {
        this.fileSeq = fileSeq;
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
     * @return the fileDataCont
     */
    public byte[] getFileDataCont() {
        return fileDataCont;
    }

    /**
     * @param fileDataCont the fileDataCont to set
     */
    public void setFileDataCont(byte[] fileDataCont) {
        this.fileDataCont = fileDataCont;
    }
}
