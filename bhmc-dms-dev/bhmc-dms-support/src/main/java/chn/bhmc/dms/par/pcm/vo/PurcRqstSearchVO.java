package chn.bhmc.dms.par.pcm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * 구매요청 검색 VO
 *
 * @ClassName   : PurcRgstSearchVO.java
 * @Description : PurcRgstSearchVO Class
 * @author In Bo Shim
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     In Bo Shim     최초 생성
 * </pre>
 */

public class PurcRqstSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3683579349238879306L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String sDlrCd;

    /**
     * 공급처
     **/
    private String sBpCd;

    /**
     * 공급처명
     **/
    private String sBpNm;

    /**
     * 참조문서번호
     **/
    @NotEmpty
    private String sRefDocNo;

    /**
     * 구매요청번호
     **/
    @NotEmpty
    private String sPurcReqNo;

    /**
     * 구매요청라인번호
     **/
    @NotEmpty
    private int sPurcReqLineNo;

    /**
     * 구매요청유형
     **/
    private String sPurcReqTp;

    /**
     * 구매요청상태코드
     **/
    private String sPurcReqStatCd;

    /**
     * 센터코드
     **/
    private String sPltCd;

    /**
     * 창고코드
     **/
    private String sStrgeCd;

    /**
     * 품목코드
     **/
    private String sItemCd;

    /**
     * 품목명
     **/
    private String sItemNm;

    /**
     * 삭제여부
     **/
    @NotEmpty
    private String sDelYn;

    /**
     * 구매요청자
     **/
    private String sRegUsrId;

    /**
     * 구매요청시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPurcReqStartDt;

    /**
     * 구매요청종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPurcReqEndDt;

    /**
     * ABC CLASS
     **/
    private String sAbcInd;

    /**
     * 품목구분코드
     **/
    private String sItemDstinCd;


    /**
     * 차형
     **/
    private String sCarlineCd;

    /**
     * 생성시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqStartDt;

    /**
     * 생성종료일자
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
     * @return the sBpCd
     */
    public String getsBpCd() {
        return sBpCd;
    }

    /**
     * @param sBpCd the sBpCd to set
     */
    public void setsBpCd(String sBpCd) {
        this.sBpCd = sBpCd;
    }

    /**
     * @return the sBpNm
     */
    public String getsBpNm() {
        return sBpNm;
    }

    /**
     * @param sBpNm the sBpNm to set
     */
    public void setsBpNm(String sBpNm) {
        this.sBpNm = sBpNm;
    }

    /**
     * @return the sRefDocNo
     */
    public String getsRefDocNo() {
        return sRefDocNo;
    }

    /**
     * @param sRefDocNo the sRefDocNo to set
     */
    public void setsRefDocNo(String sRefDocNo) {
        this.sRefDocNo = sRefDocNo;
    }

    /**
     * @return the sPurcReqNo
     */
    public String getsPurcReqNo() {
        return sPurcReqNo;
    }

    /**
     * @param sPurcReqNo the sPurcReqNo to set
     */
    public void setsPurcReqNo(String sPurcReqNo) {
        this.sPurcReqNo = sPurcReqNo;
    }

    /**
     * @return the sPurcReqLineNo
     */
    public int getsPurcReqLineNo() {
        return sPurcReqLineNo;
    }

    /**
     * @param sPurcReqLineNo the sPurcReqLineNo to set
     */
    public void setsPurcReqLineNo(int sPurcReqLineNo) {
        this.sPurcReqLineNo = sPurcReqLineNo;
    }

    /**
     * @return the sPurcReqTp
     */
    public String getsPurcReqTp() {
        return sPurcReqTp;
    }

    /**
     * @param sPurcReqTp the sPurcReqTp to set
     */
    public void setsPurcReqTp(String sPurcReqTp) {
        this.sPurcReqTp = sPurcReqTp;
    }

    /**
     * @return the sPurcReqStatCd
     */
    public String getsPurcReqStatCd() {
        return sPurcReqStatCd;
    }

    /**
     * @param sPurcReqStatCd the sPurcReqStatCd to set
     */
    public void setsPurcReqStatCd(String sPurcReqStatCd) {
        this.sPurcReqStatCd = sPurcReqStatCd;
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
     * @return the sStrgeCd
     */
    public String getsStrgeCd() {
        return sStrgeCd;
    }

    /**
     * @param sStrgeCd the sStrgeCd to set
     */
    public void setsStrgeCd(String sStrgeCd) {
        this.sStrgeCd = sStrgeCd;
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
     * @return the sDelYn
     */
    public String getsDelYn() {
        return sDelYn;
    }

    /**
     * @param sDelYn the sDelYn to set
     */
    public void setsDelYn(String sDelYn) {
        this.sDelYn = sDelYn;
    }

    /**
     * @return the sPurcReqStartDt
     */
    public Date getsPurcReqStartDt() {
        return sPurcReqStartDt;
    }

    /**
     * @param sPurcReqStartDt the sPurcReqStartDt to set
     */
    public void setsPurcReqStartDt(Date sPurcReqStartDt) {
        this.sPurcReqStartDt = sPurcReqStartDt;
    }

    /**
     * @return the sPurcReqEndDt
     */
    public Date getsPurcReqEndDt() {
        return sPurcReqEndDt;
    }

    /**
     * @param sPurcReqEndDt the sPurcReqEndDt to set
     */
    public void setsPurcReqEndDt(Date sPurcReqEndDt) {
        this.sPurcReqEndDt = sPurcReqEndDt;
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
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }

    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
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
     * @return the sItemDstinCd
     */
    public String getsItemDstinCd() {
        return sItemDstinCd;
    }

    /**
     * @param sItemDstinCd the sItemDstinCd to set
     */
    public void setsItemDstinCd(String sItemDstinCd) {
        this.sItemDstinCd = sItemDstinCd;
    }

    /**
     * @return the sRegUsrId
     */
    public String getsRegUsrId() {
        return sRegUsrId;
    }

    /**
     * @param sRegUsrId the sRegUsrId to set
     */
    public void setsRegUsrId(String sRegUsrId) {
        this.sRegUsrId = sRegUsrId;
    }
}
