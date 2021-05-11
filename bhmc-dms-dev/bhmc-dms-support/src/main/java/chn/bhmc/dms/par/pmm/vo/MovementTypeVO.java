package chn.bhmc.dms.par.pmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 수불유형 VO
 *
 * @ClassName   : MovementTypeVO.java
 * @Description : MovementTypeVO Class
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

public class MovementTypeVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3503436029406989974L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * 수불유형
     **/
    @NotEmpty
    private String mvtTp;

    /**
     * 수불유형명
     **/
    @NotEmpty
    private String mvtTpNm;

    /**
     * 기본수불유형여부
     **/
    @NotEmpty
    private String baseMvtTpYn;

    /**
     * 센터수불여부
     **/
    @NotEmpty
    private String cenMvtYn;

    /**
     * 창고수불여부
     **/
    @NotEmpty
    private String strgeMvtYn;

    /**
     * 수불입출고유형
     **/
    @NotEmpty
    private String mvtGrGiTp;

    /**
     * 재고정산유형
     **/
    @NotEmpty
    private String stockCalcTp;

    /**
     * 상대수불유형
     **/
    @NotEmpty
    private String combiMvtTp;

    /**
     * 취소수불여부
     **/
    @NotEmpty
    private String cancMvtYn;

    /**
     * 프로세스유형
     **/
    //PROCESS_TP
    private String processTp;

    /**
     * 코스트센터필수여부
     **/
    @NotEmpty
    private String costCenReqsYn;

    /**
     * 수불사유필수여부
     **/
    @NotEmpty
    private String mvtReasonReqsYn;

    /**
     * 사용여부
     **/
    @NotEmpty
    private String useYn;

    /**
     * 수요분석여부
     **/
    @NotEmpty
    private String dmndAnalyzeYn;

    /**
     * 기타입고여부
     **/
    @NotEmpty
    private String otherGrYn;

    /**
     * 기타출고여부
     **/
    @NotEmpty
    private String otherGiYn;

    /**
     * 비고
     **/
    @NotEmpty
    private String remark;

    /**
     * 재고상태코드
     **/
    @NotEmpty
    private String stockStatCd;

    /**
     * 최근입출고일자수정여부
     **/
    @NotEmpty
    private String rectGrGiDtUpdtYn;

    /**
     * DB저장여부
     **/
    @NotEmpty
    private String dbYn;

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
     * @return the mvtTpNm
     */
    public String getMvtTpNm() {
        return mvtTpNm;
    }

    /**
     * @param mvtTpNm the mvtTpNm to set
     */
    public void setMvtTpNm(String mvtTpNm) {
        this.mvtTpNm = mvtTpNm;
    }

    /**
     * @return the baseMvtTpYn
     */
    public String getBaseMvtTpYn() {
        return baseMvtTpYn;
    }

    /**
     * @param baseMvtTpYn the baseMvtTpYn to set
     */
    public void setBaseMvtTpYn(String baseMvtTpYn) {
        this.baseMvtTpYn = baseMvtTpYn;
    }

    /**
     * @return the cenMvtYn
     */
    public String getCenMvtYn() {
        return cenMvtYn;
    }

    /**
     * @param cenMvtYn the cenMvtYn to set
     */
    public void setCenMvtYn(String cenMvtYn) {
        this.cenMvtYn = cenMvtYn;
    }

    /**
     * @return the strgeMvtYn
     */
    public String getStrgeMvtYn() {
        return strgeMvtYn;
    }

    /**
     * @param strgeMvtYn the strgeMvtYn to set
     */
    public void setStrgeMvtYn(String strgeMvtYn) {
        this.strgeMvtYn = strgeMvtYn;
    }

    /**
     * @return the mvtGrGiTp
     */
    public String getMvtGrGiTp() {
        return mvtGrGiTp;
    }

    /**
     * @param mvtGrGiTp the mvtGrGiTp to set
     */
    public void setMvtGrGiTp(String mvtGrGiTp) {
        this.mvtGrGiTp = mvtGrGiTp;
    }

    /**
     * @return the stockCalcTp
     */
    public String getStockCalcTp() {
        return stockCalcTp;
    }

    /**
     * @param stockCalcTp the stockCalcTp to set
     */
    public void setStockCalcTp(String stockCalcTp) {
        this.stockCalcTp = stockCalcTp;
    }

    /**
     * @return the combiMvtTp
     */
    public String getCombiMvtTp() {
        return combiMvtTp;
    }

    /**
     * @param combiMvtTp the combiMvtTp to set
     */
    public void setCombiMvtTp(String combiMvtTp) {
        this.combiMvtTp = combiMvtTp;
    }

    /**
     * @return the cancMvtYn
     */
    public String getCancMvtYn() {
        return cancMvtYn;
    }

    /**
     * @param cancMvtYn the cancMvtYn to set
     */
    public void setCancMvtYn(String cancMvtYn) {
        this.cancMvtYn = cancMvtYn;
    }

    /**
     * @return the processTp
     */
    public String getProcessTp() {
        return processTp;
    }

    /**
     * @param processTp the processTp to set
     */
    public void setProcessTp(String processTp) {
        this.processTp = processTp;
    }

    /**
     * @return the costCenReqsYn
     */
    public String getCostCenReqsYn() {
        return costCenReqsYn;
    }

    /**
     * @param costCenReqsYn the costCenReqsYn to set
     */
    public void setCostCenReqsYn(String costCenReqsYn) {
        this.costCenReqsYn = costCenReqsYn;
    }

    /**
     * @return the mvtReasonReqsYn
     */
    public String getMvtReasonReqsYn() {
        return mvtReasonReqsYn;
    }

    /**
     * @param mvtReasonReqsYn the mvtReasonReqsYn to set
     */
    public void setMvtReasonReqsYn(String mvtReasonReqsYn) {
        this.mvtReasonReqsYn = mvtReasonReqsYn;
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
     * @return the dmndAnalyzeYn
     */
    public String getDmndAnalyzeYn() {
        return dmndAnalyzeYn;
    }

    /**
     * @param dmndAnalyzeYn the dmndAnalyzeYn to set
     */
    public void setDmndAnalyzeYn(String dmndAnalyzeYn) {
        this.dmndAnalyzeYn = dmndAnalyzeYn;
    }

    /**
     * @return the otherGrYn
     */
    public String getOtherGrYn() {
        return otherGrYn;
    }

    /**
     * @param otherGrYn the otherGrYn to set
     */
    public void setOtherGrYn(String otherGrYn) {
        this.otherGrYn = otherGrYn;
    }

    /**
     * @return the otherGiYn
     */
    public String getOtherGiYn() {
        return otherGiYn;
    }

    /**
     * @param otherGiYn the otherGiYn to set
     */
    public void setOtherGiYn(String otherGiYn) {
        this.otherGiYn = otherGiYn;
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
     * @return the stockStatCd
     */
    public String getStockStatCd() {
        return stockStatCd;
    }

    /**
     * @param stockStatCd the stockStatCd to set
     */
    public void setStockStatCd(String stockStatCd) {
        this.stockStatCd = stockStatCd;
    }

    /**
     * @return the rectGrGiDtUpdtYn
     */
    public String getRectGrGiDtUpdtYn() {
        return rectGrGiDtUpdtYn;
    }

    /**
     * @param rectGrGiDtUpdtYn the rectGrGiDtUpdtYn to set
     */
    public void setRectGrGiDtUpdtYn(String rectGrGiDtUpdtYn) {
        this.rectGrGiDtUpdtYn = rectGrGiDtUpdtYn;
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
