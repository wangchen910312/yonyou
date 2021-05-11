package chn.bhmc.dms.ser.svi.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName  : DcDetailVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since      author              description
 *  ===========    =============    ===========================
 *  2016. 9. 30.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class DcDetailVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1150947327241305360L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * preFixId
     **/
    @NotEmpty
    private String preFixId;

    /**
     * 할인코드
     **/
    @NotEmpty
    private String dcCd;

    /**
     * 할인일련번호
     **/
    private int dcSeq;

    /**
     * 고객번호
     **/
    //CUST_NO
    private String custNo;

    /**
     * 고객명
     **/
    //CUST_NM
    private String custNm;

    /**
     * 총횟수
     **/
    //TOT_CNT
    private Double totCnt;

    /**
     * 사용횟수
     **/
    //USE_CNT
    private Double useCnt;

    /**
     * 사용자ID
     **/
    //USR_ID
    private String usrId;

    /**
     * 사용자명
     **/
    //USR_NM
    private String usrNm;

    /**
     * 사용여부
     **/
    //USE_YN
    private String useYn;

    /**
     * 할인 권한구분
     */
    private String dcPermTp;

    private String sysNo;          //시스템번호
    private String deptCd;         //부서코드
    private String deptNm;         //부서명칭
    private String tskCd;          //직무코드
    private String tskNm;          //직무명칭
    private String sexCd;          //성별

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
     * @return the preFixId
     */
    public String getPreFixId() {
        return preFixId;
    }

    /**
     * @param preFixId the preFixId to set
     */
    public void setPreFixId(String preFixId) {
        this.preFixId = preFixId;
    }

    /**
     * @return the dcCd
     */
    public String getDcCd() {
        return dcCd;
    }

    /**
     * @param dcCd the dcCd to set
     */
    public void setDcCd(String dcCd) {
        this.dcCd = dcCd;
    }

    /**
     * @return the dcSeq
     */
    public int getDcSeq() {
        return dcSeq;
    }

    /**
     * @param dcSeq the dcSeq to set
     */
    public void setDcSeq(int dcSeq) {
        this.dcSeq = dcSeq;
    }

    /**
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }

    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }

    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }

    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }

    /**
     * @return the totCnt
     */
    public Double getTotCnt() {
        return totCnt;
    }

    /**
     * @param totCnt the totCnt to set
     */
    public void setTotCnt(Double totCnt) {
        this.totCnt = totCnt;
    }

    /**
     * @return the useCnt
     */
    public Double getUseCnt() {
        return useCnt;
    }

    /**
     * @param useCnt the useCnt to set
     */
    public void setUseCnt(Double useCnt) {
        this.useCnt = useCnt;
    }

    /**
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }

    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }

    /**
     * @return the usrNm
     */
    public String getUsrNm() {
        return usrNm;
    }

    /**
     * @param usrNm the usrNm to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
    }

    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }

    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    /**
     * @return the dcPermTp
     */
    public String getDcPermTp() {
        return dcPermTp;
    }

    /**
     * @param dcPermTp the dcPermTp to set
     */
    public void setDcPermTp(String dcPermTp) {
        this.dcPermTp = dcPermTp;
    }

    /**
     * @return the sysNo
     */
    public String getSysNo() {
        return sysNo;
    }

    /**
     * @param sysNo the sysNo to set
     */
    public void setSysNo(String sysNo) {
        this.sysNo = sysNo;
    }

    /**
     * @return the deptCd
     */
    public String getDeptCd() {
        return deptCd;
    }

    /**
     * @param deptCd the deptCd to set
     */
    public void setDeptCd(String deptCd) {
        this.deptCd = deptCd;
    }

    /**
     * @return the deptNm
     */
    public String getDeptNm() {
        return deptNm;
    }

    /**
     * @param deptNm the deptNm to set
     */
    public void setDeptNm(String deptNm) {
        this.deptNm = deptNm;
    }

    /**
     * @return the tskCd
     */
    public String getTskCd() {
        return tskCd;
    }

    /**
     * @param tskCd the tskCd to set
     */
    public void setTskCd(String tskCd) {
        this.tskCd = tskCd;
    }

    /**
     * @return the tskNm
     */
    public String getTskNm() {
        return tskNm;
    }

    /**
     * @param tskNm the tskNm to set
     */
    public void setTskNm(String tskNm) {
        this.tskNm = tskNm;
    }

    /**
     * @return the sexCd
     */
    public String getSexCd() {
        return sexCd;
    }

    /**
     * @param sexCd the sexCd to set
     */
    public void setSexCd(String sexCd) {
        this.sexCd = sexCd;
    }

}
