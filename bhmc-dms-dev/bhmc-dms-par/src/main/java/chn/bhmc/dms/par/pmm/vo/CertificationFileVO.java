package chn.bhmc.dms.par.pmm.vo;
import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 합격증  파일 VO
 * </pre>
 *
 * @ClassName   : CertificationFileVO.java
 * @Description : CertificationFileVO Class
 * @author In Bo Shim
 * @since 2016. 11. 05.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 05.     In Bo Shim     최초 생성
 * </pre>
 */

public class CertificationFileVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3710267015745276277L;
    /**
     * 딜러코드
     **/
    private String dlrCd;
    /**
     * 합격증번호
     **/
    private String certNo;
    /**
     * 엔진실린더유형
     **/
    private String enginCylTp;
    /**
     * 엔진실린더번호
     **/
    private String enginCylNo;
    /**
     * 엔진실린더사진명
     **/
    private String enginCylPhotoNm;
    /**
     * 파일번호
     **/
    private String fileNo;
    /**
     * 파일명
     **/
    private String fileNm;
    /**
     * 파일일련번호
     **/
    private int fileSeq;
    /**
     * 파일사이즈값
     **/
    private String fileSizeVal;
    /**
     * 파일데이터내용
     **/
    private byte[] fileDataCont;
    /**
     * 등록자ID
     **/
    private String regUsrId;
    /**
     * 수정자ID
     **/
    private String updtUsrId;
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
     * @return the certNo
     */
    public String getCertNo() {
        return certNo;
    }
    /**
     * @param certNo the certNo to set
     */
    public void setCertNo(String certNo) {
        this.certNo = certNo;
    }
    /**
     * @return the enginCylTp
     */
    public String getEnginCylTp() {
        return enginCylTp;
    }
    /**
     * @param enginCylTp the enginCylTp to set
     */
    public void setEnginCylTp(String enginCylTp) {
        this.enginCylTp = enginCylTp;
    }
    /**
     * @return the enginCylNo
     */
    public String getEnginCylNo() {
        return enginCylNo;
    }
    /**
     * @param enginCylNo the enginCylNo to set
     */
    public void setEnginCylNo(String enginCylNo) {
        this.enginCylNo = enginCylNo;
    }
    /**
     * @return the enginCylPhotoNm
     */
    public String getEnginCylPhotoNm() {
        return enginCylPhotoNm;
    }
    /**
     * @param enginCylPhotoNm the enginCylPhotoNm to set
     */
    public void setEnginCylPhotoNm(String enginCylPhotoNm) {
        this.enginCylPhotoNm = enginCylPhotoNm;
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
    public String getFileSizeVal() {
        return fileSizeVal;
    }
    /**
     * @param fileSizeVal the fileSizeVal to set
     */
    public void setFileSizeVal(String fileSizeVal) {
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

}
