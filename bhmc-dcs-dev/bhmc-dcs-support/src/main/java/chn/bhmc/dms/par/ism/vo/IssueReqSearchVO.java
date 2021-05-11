package chn.bhmc.dms.par.ism.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 출고요청 검색 VO
 *
 * @ClassName   : IssueReqSearchVO.java
 * @Description : IssueReqSearchVO Class
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

public class IssueReqSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5130046355150414281L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String sDlrCd;

    /**
     * 부품요청문서번호
     **/

    private String sParReqDocNo;

    /**
     * 부품출고유형
     **/

    private String sParGiTp;

    /**
     * 부품요청상태코드
     **/

    private String sParReqStatCd;

    /**
     * 취소여부
     **/

    private String sCancYn;

    /**
     * RO일련번호
     **/
    //RO_SEQ
    private String sRoDocNo;

    /**
     * RO일련번호 라인번호
     **/
    private int sRoLineNo;

    /**
     * 예약문서번호
     **/
    private String sResvDocNo;

    /**
     * 예약문서번호 라인번호
     **/
    private int sResvDocLineNo;

    /**
     * 센터코드
     **/

    private String sPltCd;

    /**
     * 서비스담당자ID
     **/

    private String sSerPrsnId;

    /**
     * 고객코드
     **/

    private String sCustCd;

    /**
     * 고객명
     **/

    private String sCustNm;

    /**
     * 차대번호
     **/

    private String sVinNo;

    /**
     * 차량번호
     **/
    private String sCarNo;

    /**
     * 부품번호
     **/
    private String sItemCd;

    /**
     * 부품명
     **/
    private String sItemNm;

    /**
     * 시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqStartDt;

    /**
     * 종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqEndDt;

    /**
     * ABC Class
     **/
    private String sAbcInd;

    /**
     * 차종
     **/
    private String sCarLineCd;

    /**
     * 출고문서번호
     **/
    private String sGiDocNo;

    /**
     * 출고문서유형
     **/
    private String sGiDocTp;

    /**
     * 출고문서상태코드
     **/
    private String sGiDocStatCd;

    /**
     * 기타출고상태코드
     **/
    private String sEtcGiTp;

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
     * @return the sParReqStatCd
     */
    public String getsParReqStatCd() {
        return sParReqStatCd;
    }

    /**
     * @param sParReqStatCd the sParReqStatCd to set
     */
    public void setsParReqStatCd(String sParReqStatCd) {
        this.sParReqStatCd = sParReqStatCd;
    }

    /**
     * @return the sCancYn
     */
    public String getsCancYn() {
        return sCancYn;
    }

    /**
     * @param sCancYn the sCancYn to set
     */
    public void setsCancYn(String sCancYn) {
        this.sCancYn = sCancYn;
    }

    /**
     * @return the sRoDocNo
     */
    public String getsRoDocNo() {
        return sRoDocNo;
    }

    /**
     * @param sRoDocNo the sRoDocNo to set
     */
    public void setsRoDocNo(String sRoDocNo) {
        this.sRoDocNo = sRoDocNo;
    }

    /**
     * @return the sRoLineNo
     */
    public int getsRoLineNo() {
        return sRoLineNo;
    }

    /**
     * @param sRoLineNo the sRoLineNo to set
     */
    public void setsRoLineNo(int sRoLineNo) {
        this.sRoLineNo = sRoLineNo;
    }

    /**
     * @return the sResvDocNo
     */
    public String getsResvDocNo() {
        return sResvDocNo;
    }

    /**
     * @param sResvDocNo the sResvDocNo to set
     */
    public void setsResvDocNo(String sResvDocNo) {
        this.sResvDocNo = sResvDocNo;
    }

    /**
     * @return the sResvDocLineNo
     */
    public int getsResvDocLineNo() {
        return sResvDocLineNo;
    }

    /**
     * @param sResvDocLineNo the sResvDocLineNo to set
     */
    public void setsResvDocLineNo(int sResvDocLineNo) {
        this.sResvDocLineNo = sResvDocLineNo;
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
     * @return the sEtcGiTp
     */
    public String getsEtcGiTp() {
        return sEtcGiTp;
    }

    /**
     * @param sEtcGiTp the sEtcGiTp to set
     */
    public void setsEtcGiTp(String sEtcGiTp) {
        this.sEtcGiTp = sEtcGiTp;
    }
}
