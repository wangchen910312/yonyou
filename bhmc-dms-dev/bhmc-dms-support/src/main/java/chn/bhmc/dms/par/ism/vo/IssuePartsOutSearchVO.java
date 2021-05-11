package chn.bhmc.dms.par.ism.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 부품출고 헤더 검색 VO
 *
 * @ClassName   : IssuePartsOutSearchVO.java
 * @Description : IssuePartsOutSearchVO Class
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

public class IssuePartsOutSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8358627347568500550L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String sDlrCd;

    /**
     * 출고문서번호
     **/
    @NotEmpty
    private String sGiDocNo;

    /**
     * 출고문서유형
     **/
    @NotEmpty
    private String sGiDocTp;

    /**
     * 출고문서상태코드
     **/
    @NotEmpty
    private String sGiDocStatCd;

    /**
     * 위탁서유형
     **/
    @NotEmpty
    private String sParGiTp;

    /**
     * 위탁문서번호(부품요청문서번호)
     **/
    @NotEmpty
    private String sParReqDocNo;

    /**
     * 부품요청번호
     **/
    @NotEmpty
    private String sItemCd;

    /**
     * 서비스담당자ID
     **/
    @NotEmpty
    private String sSerPrsnId;

    /**
     * 고객코드
     **/
    @NotEmpty
    private String sCustCd;

    /**
     * 고객명
     **/
    @NotEmpty
    private String sCustNm;

    /**
     * 차대번호
     **/
    @NotEmpty
    private String sVinNo;

    /**
     * 차량번호
     **/
    @NotEmpty
    private String sCarNo;

    /**
     * 등록시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqStartDt;

    /**
     * 등록종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqEndDt;

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sGiDocNo
     */
    public String getsGiDocNo() {
        return sGiDocNo;
    }

    /**
     * @param sGiDocNo the sGiDocNo to set
     */
    public void setsGiDocNo(String sGiDocNo) {
        this.sGiDocNo = sGiDocNo;
    }

    /**
     * @return the sGiDocTp
     */
    public String getsGiDocTp() {
        return sGiDocTp;
    }

    /**
     * @param sGiDocTp the sGiDocTp to set
     */
    public void setsGiDocTp(String sGiDocTp) {
        this.sGiDocTp = sGiDocTp;
    }

    /**
     * @return the sGiDocStatCd
     */
    public String getsGiDocStatCd() {
        return sGiDocStatCd;
    }

    /**
     * @param sGiDocStatCd the sGiDocStatCd to set
     */
    public void setsGiDocStatCd(String sGiDocStatCd) {
        this.sGiDocStatCd = sGiDocStatCd;
    }

    /**
     * @return the sParGiTp
     */
    public String getsParGiTp() {
        return sParGiTp;
    }

    /**
     * @param sParGiTp the sParGiTp to set
     */
    public void setsParGiTp(String sParGiTp) {
        this.sParGiTp = sParGiTp;
    }

    /**
     * @return the sParReqDocNo
     */
    public String getsParReqDocNo() {
        return sParReqDocNo;
    }

    /**
     * @param sParReqDocNo the sParReqDocNo to set
     */
    public void setsParReqDocNo(String sParReqDocNo) {
        this.sParReqDocNo = sParReqDocNo;
    }

    /**
     * @return the sItemCd
     */
    public String getsItemCd() {
        return sItemCd;
    }

    /**
     * @param sItemCd the sItemCd to set
     */
    public void setsItemCd(String sItemCd) {
        this.sItemCd = sItemCd;
    }

    /**
     * @return the sSerPrsnId
     */
    public String getsSerPrsnId() {
        return sSerPrsnId;
    }

    /**
     * @param sSerPrsnId the sSerPrsnId to set
     */
    public void setsSerPrsnId(String sSerPrsnId) {
        this.sSerPrsnId = sSerPrsnId;
    }

    /**
     * @return the sCustCd
     */
    public String getsCustCd() {
        return sCustCd;
    }

    /**
     * @param sCustCd the sCustCd to set
     */
    public void setsCustCd(String sCustCd) {
        this.sCustCd = sCustCd;
    }

    /**
     * @return the sCustNm
     */
    public String getsCustNm() {
        return sCustNm;
    }

    /**
     * @param sCustNm the sCustNm to set
     */
    public void setsCustNm(String sCustNm) {
        this.sCustNm = sCustNm;
    }

    /**
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }

    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }

    /**
     * @return the sCarNo
     */
    public String getsCarNo() {
        return sCarNo;
    }

    /**
     * @param sCarNo the sCarNo to set
     */
    public void setsCarNo(String sCarNo) {
        this.sCarNo = sCarNo;
    }

    /**
     * @return the sReqStartDt
     */
    public Date getsReqStartDt() {
        return sReqStartDt;
    }

    /**
     * @param sReqStartDt the sReqStartDt to set
     */
    public void setsReqStartDt(Date sReqStartDt) {
        this.sReqStartDt = sReqStartDt;
    }

    /**
     * @return the sReqEndDt
     */
    public Date getsReqEndDt() {
        return sReqEndDt;
    }

    /**
     * @param sReqEndDt the sReqEndDt to set
     */
    public void setsReqEndDt(Date sReqEndDt) {
        this.sReqEndDt = sReqEndDt;
    }
}
