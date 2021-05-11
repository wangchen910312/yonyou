package chn.bhmc.dms.ser.wac.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimReqRtnVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since     author    description
 *  ===========    =============    ===========================
 *  2016. 8. 10.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class ClaimReqRtnVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5117697135248469565L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 클레임문서번호
     **/
    private String claimDocNo;

    /**
     * 클레임 상태코드
     */
    private String claimStatCd;

    /**
     * RO문서번호
     **/
    private String roDocNo;

    /**
     * 클레임년도
     **/
    private String claimYy;

    /**
     * 클레임버전코드
     **/
    private String claimVerCd;

    /**
     * 에러코드
     **/
    private String errCd;

    /**
     * 에러명
     **/
    private String errNm;

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
     * @return the claimDocNo
     */
    public String getClaimDocNo() {
        return claimDocNo;
    }

    /**
     * @param claimDocNo the claimDocNo to set
     */
    public void setClaimDocNo(String claimDocNo) {
        this.claimDocNo = claimDocNo;
    }

    /**
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }

    /**
     * @param roDocNo the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }

    /**
     * @return the claimYy
     */
    public String getClaimYy() {
        return claimYy;
    }

    /**
     * @param claimYy the claimYy to set
     */
    public void setClaimYy(String claimYy) {
        this.claimYy = claimYy;
    }

    /**
     * @return the claimVerCd
     */
    public String getClaimVerCd() {
        return claimVerCd;
    }

    /**
     * @param claimVerCd the claimVerCd to set
     */
    public void setClaimVerCd(String claimVerCd) {
        this.claimVerCd = claimVerCd;
    }

    /**
     * @return the errCd
     */
    public String getErrCd() {
        return errCd;
    }

    /**
     * @param errCd the errCd to set
     */
    public void setErrCd(String errCd) {
        this.errCd = errCd;
    }

    /**
     * @return the errNm
     */
    public String getErrNm() {
        return errNm;
    }

    /**
     * @param errNm the errNm to set
     */
    public void setErrNm(String errNm) {
        this.errNm = errNm;
    }

    /**
     * @return the claimStatCd
     */
    public String getClaimStatCd() {
        return claimStatCd;
    }

    /**
     * @param claimStatCd the claimStatCd to set
     */
    public void setClaimStatCd(String claimStatCd) {
        this.claimStatCd = claimStatCd;
    }




}
