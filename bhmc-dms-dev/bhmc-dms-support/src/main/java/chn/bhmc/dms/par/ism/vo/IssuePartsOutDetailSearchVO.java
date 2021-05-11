package chn.bhmc.dms.par.ism.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 부품출고 품목 검색 VO
 *
 * @ClassName   : IssuePartsOutDetailSearchVO.java
 * @Description : IssuePartsOutDetailSearchVO Class
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

public class IssuePartsOutDetailSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 717392221627758244L;

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
     * 출고문서라인번호
     **/
    private int sGiDocLineNo;

    /**
     * 센터코드
     **/
    private String sPltCd;

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
     * 부품코드
     **/
    @NotEmpty
    private String sItemCd;

    /**
     * 부품명
     **/
    @NotEmpty
    private String sItemNm;

    /**
     * ABC Class
     **/
    @NotEmpty
    private String sAbcInd;

    /**
     * 차종
     **/
    @NotEmpty
    private String sCarLineCd;

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
     * 출고시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGiDocStartDt;

    /**
     * 출고종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGiDocEndDt;

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
     * @return the sGiDocLineNo
     */
    public int getsGiDocLineNo() {
        return sGiDocLineNo;
    }

    /**
     * @param sGiDocLineNo the sGiDocLineNo to set
     */
    public void setsGiDocLineNo(int sGiDocLineNo) {
        this.sGiDocLineNo = sGiDocLineNo;
    }

    /**
     * @return the sPltCd
     */
    public String getsPltCd() {
        return sPltCd;
    }

    /**
     * @param sPltCd the sPltCd to set
     */
    public void setsPltCd(String sPltCd) {
        this.sPltCd = sPltCd;
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
     * @return the sItemNm
     */
    public String getsItemNm() {
        return sItemNm;
    }

    /**
     * @param sItemNm the sItemNm to set
     */
    public void setsItemNm(String sItemNm) {
        this.sItemNm = sItemNm;
    }

    /**
     * @return the sAbcInd
     */
    public String getsAbcInd() {
        return sAbcInd;
    }

    /**
     * @param sAbcInd the sAbcInd to set
     */
    public void setsAbcInd(String sAbcInd) {
        this.sAbcInd = sAbcInd;
    }

    /**
     * @return the sCarLineCd
     */
    public String getsCarLineCd() {
        return sCarLineCd;
    }

    /**
     * @param sCarLineCd the sCarLineCd to set
     */
    public void setsCarLineCd(String sCarLineCd) {
        this.sCarLineCd = sCarLineCd;
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

    /**
     * @return the sGiDocStartDt
     */
    public Date getsGiDocStartDt() {
        return sGiDocStartDt;
    }

    /**
     * @param sGiDocStartDt the sGiDocStartDt to set
     */
    public void setsGiDocStartDt(Date sGiDocStartDt) {
        this.sGiDocStartDt = sGiDocStartDt;
    }

    /**
     * @return the sGiDocEndDt
     */
    public Date getsGiDocEndDt() {
        return sGiDocEndDt;
    }

    /**
     * @param sGiDocEndDt the sGiDocEndDt to set
     */
    public void setsGiDocEndDt(Date sGiDocEndDt) {
        this.sGiDocEndDt = sGiDocEndDt;
    }
}
