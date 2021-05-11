package chn.bhmc.dms.par.ism.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 부품출고 헤더 VO
 *
 * @ClassName   : IssuePartsOutVO.java
 * @Description : IssuePartsOutVO Class
 * @author In Bo Shim
 * @since 2016. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 23.     In Bo Shim     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="giDocNo", mesgKey="par.lbl.giDocNo")
    ,@ValidField(field="giDocTp", mesgKey="par.lbl.giDocTp")
    ,@ValidField(field="giDocStatCd", mesgKey="par.lbl.giDocStatCd")
    ,@ValidField(field="cancYn", mesgKey="par.lbl.cancYn")
    ,@ValidField(field="parReqDocNo", mesgKey="par.lbl.parReqDocNo")
    ,@ValidField(field="roDocNo", mesgKey="par.lbl.roDocNo")
    ,@ValidField(field="pltCd", mesgKey="par.lbl.pltCd")
    ,@ValidField(field="serPrsnId", mesgKey="par.lbl.serPrsnId")
    ,@ValidField(field="custCd", mesgKey="par.lbl.custCd")
    ,@ValidField(field="custNm", mesgKey="par.lbl.custNm")
    ,@ValidField(field="vinNo", mesgKey="par.lbl.vinNo")
    ,@ValidField(field="carNo", mesgKey="par.lbl.carNo")
    ,@ValidField(field="mvtDocYyMm", mesgKey="par.lbl.mvtDocYyMm")
    ,@ValidField(field="mvtDocNo", mesgKey="par.lbl.mvtDocNo")
})
public class IssuePartsOutVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8319482020280002324L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd = "";

    /**
     * 출고문서번호
     **/
    @NotEmpty
    private String giDocNo = "";

    /**
     * 출고문서유형
     **/
    @NotEmpty
    private String giDocTp = "";

    /**
     * 출고문서상태코드
     **/
    @NotEmpty
    private String giDocStatCd = "";

    /**
     * 취소여부
     **/
    @NotEmpty
    private String cancYn = "";

    /**
     * 부품요청문서번호
     **/
    @NotEmpty
    private String parReqDocNo = "";

    /**
     * 위탁서유형
     **/
    @NotEmpty
    private String parGiTp = "";

    /**
     * RO문서번호
     **/
    @NotEmpty
    private String roDocNo = "";

    /**
     * RO유형
     **/
    @NotEmpty
    private String roTp = "";

    /**
     * 센터코드
     **/
    @NotEmpty
    private String pltCd = "";

    /**
     * 서비스담당자ID
     **/
    @NotEmpty
    private String serPrsnId = "";

    /**
     * 고객코드
     **/
    @NotEmpty
    private String custCd = "";

    /**
     * 고객명
     **/
    @NotEmpty
    private String custNm = "";

    /**
     * 차대번호
     **/
    @NotEmpty
    private String vinNo = "";

    /**
     * 차량번호
     **/
    @NotEmpty
    private String carNo = "";

    /**
     * 수불문서년월일자
     **/
    private String mvtDocYyMm = "";

    /**
     * 수불문서번호
     **/
    private String mvtDocNo = "";

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
     * @return the giDocNo
     */
    public String getGiDocNo() {
        return giDocNo;
    }

    /**
     * @param giDocNo the giDocNo to set
     */
    public void setGiDocNo(String giDocNo) {
        this.giDocNo = giDocNo;
    }

    /**
     * @return the giDocTp
     */
    public String getGiDocTp() {
        return giDocTp;
    }

    /**
     * @param giDocTp the giDocTp to set
     */
    public void setGiDocTp(String giDocTp) {
        this.giDocTp = giDocTp;
    }

    /**
     * @return the giDocStatCd
     */
    public String getGiDocStatCd() {
        return giDocStatCd;
    }

    /**
     * @param giDocStatCd the giDocStatCd to set
     */
    public void setGiDocStatCd(String giDocStatCd) {
        this.giDocStatCd = giDocStatCd;
    }

    /**
     * @return the cancYn
     */
    public String getCancYn() {
        return cancYn;
    }

    /**
     * @param cancYn the cancYn to set
     */
    public void setCancYn(String cancYn) {
        this.cancYn = cancYn;
    }

    /**
     * @return the parReqDocNo
     */
    public String getParReqDocNo() {
        return parReqDocNo;
    }

    /**
     * @param parReqDocNo the parReqDocNo to set
     */
    public void setParReqDocNo(String parReqDocNo) {
        this.parReqDocNo = parReqDocNo;
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
     * @return the roTp
     */
    public String getRoTp() {
        return roTp;
    }

    /**
     * @param roTp the roTp to set
     */
    public void setRoTp(String roTp) {
        this.roTp = roTp;
    }

    /**
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }

    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }

    /**
     * @return the serPrsnId
     */
    public String getSerPrsnId() {
        return serPrsnId;
    }

    /**
     * @param serPrsnId the serPrsnId to set
     */
    public void setSerPrsnId(String serPrsnId) {
        this.serPrsnId = serPrsnId;
    }

    /**
     * @return the custCd
     */
    public String getCustCd() {
        return custCd;
    }

    /**
     * @param custCd the custCd to set
     */
    public void setCustCd(String custCd) {
        this.custCd = custCd;
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
     * @return the carNo
     */
    public String getCarNo() {
        return carNo;
    }

    /**
     * @param carNo the carNo to set
     */
    public void setCarNo(String carNo) {
        this.carNo = carNo;
    }

    /**
     * @return the mvtDocYyMm
     */
    public String getMvtDocYyMm() {
        return mvtDocYyMm;
    }

    /**
     * @param mvtDocYyMm the mvtDocYyMm to set
     */
    public void setMvtDocYyMm(String mvtDocYyMm) {
        this.mvtDocYyMm = mvtDocYyMm;
    }

    /**
     * @return the mvtDocNo
     */
    public String getMvtDocNo() {
        return mvtDocNo;
    }

    /**
     * @param mvtDocNo the mvtDocNo to set
     */
    public void setMvtDocNo(String mvtDocNo) {
        this.mvtDocNo = mvtDocNo;
    }
}
