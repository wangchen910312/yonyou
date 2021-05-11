package chn.bhmc.dms.par.cpm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 기술자문헤더 VO.
 *
 * @ClassName   : SkilAndQnaHeaderVO.java
 * @Description : SkilAndQnaHeaderVO Class
 * @author In Bo Shim
 * @since 2016. 7. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 24.     In Bo Shim     최초 생성
 * </pre>
 */

public class SkillAndQnaHeaderVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4233651822794526225L;

    /**
     * 딜러번호
     **/
    private String dlrCd;
    /**
     * 문제번호
     **/
    private String pblmNo;

    /**
     * 답변문제번호
     **/
    private String answPblmNo;

    /**
     * 모델코드(차종)
     **/
    private String modelCd;

    /**
     * 차대번호
     **/
    private String vinNo;

    /**
     * 제목명
     **/
    private String titleNm;

    /**
     * 품목코드
     **/
    private String itemCd;

    /**
     * 문제내용
     **/
    private String pblmCont;

    /**
     * 문제상태코드
     **/
    private String pblmStatCd;

    /**
     * 딜러측문제요청상태코드
     **/
    private String dlrCdPblmStatCd;

    /**
     * 질문자ID
     **/
    private String qestId;

    /**
     * 딜러회사코드
     **/
    private String dlrCmpCd;

    /**
     * 추가질문내용
     **/
    private String addQestCont;

    /**
     * 딜러문제코드
     **/
    private String dlrPblmCd;

    /**
     * 첨부파일명
     **/
    private String fileNm;

    /**
     * 파일번호
     **/
    private String fileNo;

    /**
     * 파일사이즈값
     **/
    private int fileSizeVal = 0;

    /**
     * 파일데이터내용
     **/
    private byte[] fileDataCont;

    /**
     * 전송구분자
     **/
    private String sendYn = "N";

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
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }

    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the titleNm
     */
    public String getTitleNm() {
        return titleNm;
    }

    /**
     * @param titleNm the titleNm to set
     */
    public void setTitleNm(String titleNm) {
        this.titleNm = titleNm;
    }

    /**
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }

    /**
     * @param itemCd the itemCd to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    /**
     * @return the pblmCont
     */
    public String getPblmCont() {
        return pblmCont;
    }

    /**
     * @param pblmCont the pblmCont to set
     */
    public void setPblmCont(String pblmCont) {
        this.pblmCont = pblmCont;
    }

    /**
     * @return the pblmStatCd
     */
    public String getPblmStatCd() {
        return pblmStatCd;
    }

    /**
     * @param pblmStatCd the pblmStatCd to set
     */
    public void setPblmStatCd(String pblmStatCd) {
        this.pblmStatCd = pblmStatCd;
    }

    /**
     * @return the dlrCdPblmStatCd
     */
    public String getDlrCdPblmStatCd() {
        return dlrCdPblmStatCd;
    }

    /**
     * @param dlrCdPblmStatCd the dlrCdPblmStatCd to set
     */
    public void setDlrCdPblmStatCd(String dlrCdPblmStatCd) {
        this.dlrCdPblmStatCd = dlrCdPblmStatCd;
    }

    /**
     * @return the qestId
     */
    public String getQestId() {
        return qestId;
    }

    /**
     * @param qestId the qestId to set
     */
    public void setQestId(String qestId) {
        this.qestId = qestId;
    }

    /**
     * @return the dlrCmpCd
     */
    public String getDlrCmpCd() {
        return dlrCmpCd;
    }

    /**
     * @param dlrCmpCd the dlrCmpCd to set
     */
    public void setDlrCmpCd(String dlrCmpCd) {
        this.dlrCmpCd = dlrCmpCd;
    }

    /**
     * @return the addQestCont
     */
    public String getAddQestCont() {
        return addQestCont;
    }

    /**
     * @param addQestCont the addQestCont to set
     */
    public void setAddQestCont(String addQestCont) {
        this.addQestCont = addQestCont;
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

    /**
     * @return the sendYn
     */
    public String getSendYn() {
        return sendYn;
    }

    /**
     * @param sendYn the sendYn to set
     */
    public void setSendYn(String sendYn) {
        this.sendYn = sendYn;
    }
}
