package chn.bhmc.dms.par.pmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 출고유형 VO
 *
 * @ClassName   : IssueTypeVO.java
 * @Description : IssueTypeVO Class
 * @author In Bo Shim
 * @since 2016. 1. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 6.     In Bo Shim     최초 생성
 * </pre>
 */

public class IssueTypeVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7330000925416415147L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private  String       dlrCd;

    /**
     * 부품출고유형
     **/
    @NotEmpty
    private  String       parGiTp;

    /**
     * 출고유형명
     **/
    @NotEmpty
    private  String       giTpNm;

    /**
     * 기본출고유형여부
     **/
    @NotEmpty
    private  String       baseGiTpYn;

    /**
     * 요청관리여부
     **/
    @NotEmpty
    private  String       reqMngYn;

    /**
     * 예약관리여부
     **/
    @NotEmpty
    private  String       resvMngYn;

    /**
     * 구매여부
     **/
    @NotEmpty
    private  String       purcYn;

    /**
     * 출고지시관리여부
     **/
    @NotEmpty
    private  String       giOrdMngYn;

    /**
     * 수불유형
     **/
    @NotEmpty
    private  String       mvtTp;

    /**
     * 사용여부
     **/
    @NotEmpty
    private  String       useYn;

    /**
     * 비고
     **/
    @NotEmpty
    private  String       remark;

    /**
     * DB저장여부
     **/
    @NotEmpty
    private  String       dbYn;

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
     * @return the parGiTp
     */
    public String getParGiTp() {
        return parGiTp;
    }

    /**
     * @param parGiTp the parGiTp to set
     */
    public void setParGiTp(String parGiTp) {
        this.parGiTp = parGiTp;
    }

    /**
     * @return the giTpNm
     */
    public String getGiTpNm() {
        return giTpNm;
    }

    /**
     * @param giTpNm the giTpNm to set
     */
    public void setGiTpNm(String giTpNm) {
        this.giTpNm = giTpNm;
    }

    /**
     * @return the baseGiTpYn
     */
    public String getBaseGiTpYn() {
        return baseGiTpYn;
    }

    /**
     * @param baseGiTpYn the baseGiTpYn to set
     */
    public void setBaseGiTpYn(String baseGiTpYn) {
        this.baseGiTpYn = baseGiTpYn;
    }

    /**
     * @return the reqMngYn
     */
    public String getReqMngYn() {
        return reqMngYn;
    }

    /**
     * @param reqMngYn the reqMngYn to set
     */
    public void setReqMngYn(String reqMngYn) {
        this.reqMngYn = reqMngYn;
    }

    /**
     * @return the resvMngYn
     */
    public String getResvMngYn() {
        return resvMngYn;
    }

    /**
     * @param resvMngYn the resvMngYn to set
     */
    public void setResvMngYn(String resvMngYn) {
        this.resvMngYn = resvMngYn;
    }

    /**
     * @return the purcYn
     */
    public String getPurcYn() {
        return purcYn;
    }

    /**
     * @param purcYn the purcYn to set
     */
    public void setPurcYn(String purcYn) {
        this.purcYn = purcYn;
    }

    /**
     * @return the giOrdMngYn
     */
    public String getGiOrdMngYn() {
        return giOrdMngYn;
    }

    /**
     * @param giOrdMngYn the giOrdMngYn to set
     */
    public void setGiOrdMngYn(String giOrdMngYn) {
        this.giOrdMngYn = giOrdMngYn;
    }

    /**
     * @return the mvtTp
     */
    public String getMvtTp() {
        return mvtTp;
    }

    /**
     * @param mvtTp the mvtTp to set
     */
    public void setMvtTp(String mvtTp) {
        this.mvtTp = mvtTp;
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
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the dbYn
     */
    public String getDbYn() {
        return dbYn;
    }

    /**
     * @param dbYn the dbYn to set
     */
    public void setDbYn(String dbYn) {
        this.dbYn = dbYn;
    }

}
