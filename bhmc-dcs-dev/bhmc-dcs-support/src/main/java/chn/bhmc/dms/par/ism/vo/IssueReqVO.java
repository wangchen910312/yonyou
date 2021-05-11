package chn.bhmc.dms.par.ism.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 구매요청헤더 VO
 *
 * @ClassName   : IssueReqVO.java
 * @Description : IssueReqVO Class
 * @author In Bo Shim
 * @since 2016. 2. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 15.     In Bo Shim     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"           , mesgKey="par.lbl.dlrCd")
   ,@ValidField(field="parReqDocNo"     , mesgKey="par.lbl.parReqDocNo")
   ,@ValidField(field="parGiTp"         , mesgKey="par.lbl.parGiTp")
   ,@ValidField(field="parReqStatCd"    , mesgKey="par.lbl.parReqStatCd")
   ,@ValidField(field="cancYn"          , mesgKey="par.lbl.cancYn")
   ,@ValidField(field="roDocNo"         , mesgKey="par.lbl.roDocNo")
   ,@ValidField(field="resvDocNo"       , mesgKey="par.lbl.resvDocNo")
   ,@ValidField(field="pltCd"           , mesgKey="par.lbl.pltCd")
   ,@ValidField(field="serPrsnId"       , mesgKey="par.lbl.serPrsnId")
   ,@ValidField(field="custCd"          , mesgKey="par.lbl.custCd")
   ,@ValidField(field="custNm"          , mesgKey="par.lbl.custNm")
   ,@ValidField(field="vinNo"           , mesgKey="par.lbl.vinNo")
   ,@ValidField(field="carNo"           , mesgKey="par.lbl.carNo")
})
public class IssueReqVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6300404273163251411L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * 부품요청문서번호
     **/

    private String parReqDocNo = "";

    /**
     * 부품출고유형
     **/

    private String parGiTp = "";

    /**
     * 부품요청상태코드
     **/
    @NotEmpty
    private String parReqStatCd = "";

    /**
     * 준비문서번호
     **/
    @NotEmpty
    private String readyDocNo = "";

    /**
     * 준비상태코드
     **/
    @NotEmpty
    private String readyStatCd = "";

    /**
     * 취소여부
     **/
    private String cancYn = "";

    /**
     * RO일련번호
     **/
    private String roDocNo = "";

    /**
     * 예약문서번호
     **/
    private String resvDocNo = "";

    /**
     * 센터코드
     **/
    private String pltCd;

    /**
     * 서비스담당자ID
     **/
    private String serPrsnId = "";

    /**
     * 고객코드
     **/
    private String custCd = "";

    /**
     * 고객명
     **/
    private String custNm = "";

    /**
     * 차대번호
     **/
    private String vinNo = "";

    /**
     * 차량번호
     **/
    private String carNo = "";

    /**
     * 차종
     **/
    private String carlineCd = "";

    /**
     * 출고문서번호
     **/
    private String giDocNo = "";

    /**
     * 출고문서유형
     **/
    private String giDocTp = "";

    /**
     * 출고문서상태코드
     **/
    private String giDocStatCd = "";

    /**
     * 출고상태코드
     **/
    private String giStatCd = "";

    /**
     * 차용문서번호
     **/
    private String borrowDocNo = "";

    /**
     * 차용상태코드
     **/
    private String borrowStatCd = "";

    /**
     * 기타예류문서번호
     **/
    private String etcRvDocNo = "";

    /**
     * 기타예류상태코드
     **/
    private String etcRvStatCd = "";

    /**
     * 수불문서년월일자
     **/
    private  String mvtDocYyMm = "";

    /**
     * 수불문서번호
     **/
    private  String mvtDocNo = "";

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
     * @return the parReqStatCd
     */
    public String getParReqStatCd() {
        return parReqStatCd;
    }

    /**
     * @param parReqStatCd the parReqStatCd to set
     */
    public void setParReqStatCd(String parReqStatCd) {
        this.parReqStatCd = parReqStatCd;
    }

    /**
     * @return the readyDocNo
     */
    public String getReadyDocNo() {
        return readyDocNo;
    }

    /**
     * @param readyDocNo the readyDocNo to set
     */
    public void setReadyDocNo(String readyDocNo) {
        this.readyDocNo = readyDocNo;
    }

    /**
     * @return the readyStatCd
     */
    public String getReadyStatCd() {
        return readyStatCd;
    }

    /**
     * @param readyStatCd the readyStatCd to set
     */
    public void setReadyStatCd(String readyStatCd) {
        this.readyStatCd = readyStatCd;
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
     * @return the resvDocNo
     */
    public String getResvDocNo() {
        return resvDocNo;
    }

    /**
     * @param resvDocNo the resvDocNo to set
     */
    public void setResvDocNo(String resvDocNo) {
        this.resvDocNo = resvDocNo;
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
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }

    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
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
     * @return the giStatCd
     */
    public String getGiStatCd() {
        return giStatCd;
    }

    /**
     * @param giStatCd the giStatCd to set
     */
    public void setGiStatCd(String giStatCd) {
        this.giStatCd = giStatCd;
    }

    /**
     * @return the borrowDocNo
     */
    public String getBorrowDocNo() {
        return borrowDocNo;
    }

    /**
     * @param borrowDocNo the borrowDocNo to set
     */
    public void setBorrowDocNo(String borrowDocNo) {
        this.borrowDocNo = borrowDocNo;
    }

    /**
     * @return the borrowStatCd
     */
    public String getBorrowStatCd() {
        return borrowStatCd;
    }

    /**
     * @param borrowStatCd the borrowStatCd to set
     */
    public void setBorrowStatCd(String borrowStatCd) {
        this.borrowStatCd = borrowStatCd;
    }

    /**
     * @return the etcRvDocNo
     */
    public String getEtcRvDocNo() {
        return etcRvDocNo;
    }

    /**
     * @param etcRvDocNo the etcRvDocNo to set
     */
    public void setEtcRvDocNo(String etcRvDocNo) {
        this.etcRvDocNo = etcRvDocNo;
    }

    /**
     * @return the etcRvStatCd
     */
    public String getEtcRvStatCd() {
        return etcRvStatCd;
    }

    /**
     * @param etcRvStatCd the etcRvStatCd to set
     */
    public void setEtcRvStatCd(String etcRvStatCd) {
        this.etcRvStatCd = etcRvStatCd;
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
