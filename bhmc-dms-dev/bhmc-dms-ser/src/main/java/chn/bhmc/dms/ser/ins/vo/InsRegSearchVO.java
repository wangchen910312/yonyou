package chn.bhmc.dms.ser.ins.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InsSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 5.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class InsRegSearchVO extends SearchVO{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5289563400217745322L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 차대번호
     **/
    private String sVinNo;

    /**
     * 보험문서번호
     **/
    private String sIncDocNo;

    /**
     * 차량등록번호
     **/
    private String sCarRegNo;

    /**
     * 보험사약어코드
     **/
    private String sIncCmpShtCd;

    /**
     * 피보험자ID
     **/
    private String sRincPrsnId;

    /**
     * 보험사코드
     **/
    private String sIncCmpCd;

    /**
     * 보험구분코드
     **/
    private String sIncDstinCd;

    /**
     * 보험총금액
     **/
    private Double sIncTotAmt;

    private int sLineNo;

    /**
     * 보험시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sIncStartDt;

    /**
     * 보험종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sIncEndDt;

    /**
     * 상업보험유형
     **/
    private String sCmcIncTp;

    /**
     * 상업보험명
     **/
    private String sCmcIncNm;

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
     * @return the sIncDocNo
     */
    public String getsIncDocNo() {
        return sIncDocNo;
    }

    /**
     * @param sIncDocNo the sIncDocNo to set
     */
    public void setsIncDocNo(String sIncDocNo) {
        this.sIncDocNo = sIncDocNo;
    }

    /**
     * @return the sCarRegNo
     */
    public String getsCarRegNo() {
        return sCarRegNo;
    }

    /**
     * @param sCarRegNo the sCarRegNo to set
     */
    public void setsCarRegNo(String sCarRegNo) {
        this.sCarRegNo = sCarRegNo;
    }

    /**
     * @return the sIncCmpShtCd
     */
    public String getsIncCmpShtCd() {
        return sIncCmpShtCd;
    }

    /**
     * @param sIncCmpShtCd the sIncCmpShtCd to set
     */
    public void setsIncCmpShtCd(String sIncCmpShtCd) {
        this.sIncCmpShtCd = sIncCmpShtCd;
    }

    /**
     * @return the sRincPrsnId
     */
    public String getsRincPrsnId() {
        return sRincPrsnId;
    }

    /**
     * @param sRincPrsnId the sRincPrsnId to set
     */
    public void setsRincPrsnId(String sRincPrsnId) {
        this.sRincPrsnId = sRincPrsnId;
    }

    /**
     * @return the sIncCmpCd
     */
    public String getsIncCmpCd() {
        return sIncCmpCd;
    }

    /**
     * @param sIncCmpCd the sIncCmpCd to set
     */
    public void setsIncCmpCd(String sIncCmpCd) {
        this.sIncCmpCd = sIncCmpCd;
    }

    /**
     * @return the sIncDstinCd
     */
    public String getsIncDstinCd() {
        return sIncDstinCd;
    }

    /**
     * @param sIncDstinCd the sIncDstinCd to set
     */
    public void setsIncDstinCd(String sIncDstinCd) {
        this.sIncDstinCd = sIncDstinCd;
    }

    /**
     * @return the sIncTotAmt
     */
    public Double getsIncTotAmt() {
        return sIncTotAmt;
    }

    /**
     * @param sIncTotAmt the sIncTotAmt to set
     */
    public void setsIncTotAmt(Double sIncTotAmt) {
        this.sIncTotAmt = sIncTotAmt;
    }

    /**
     * @return the sIncStartDt
     */
    public Date getsIncStartDt() {
        return sIncStartDt;
    }

    /**
     * @param sIncStartDt the sIncStartDt to set
     */
    public void setsIncStartDt(Date sIncStartDt) {
        this.sIncStartDt = sIncStartDt;
    }

    /**
     * @return the sIncEndDt
     */
    public Date getsIncEndDt() {
        return sIncEndDt;
    }

    /**
     * @param sIncEndDt the sIncEndDt to set
     */
    public void setsIncEndDt(Date sIncEndDt) {
        this.sIncEndDt = sIncEndDt;
    }

    /**
     * @return the sCmcIncTp
     */
    public String getsCmcIncTp() {
        return sCmcIncTp;
    }

    /**
     * @param sCmcIncTp the sCmcIncTp to set
     */
    public void setsCmcIncTp(String sCmcIncTp) {
        this.sCmcIncTp = sCmcIncTp;
    }

    /**
     * @return the sCmcIncNm
     */
    public String getsCmcIncNm() {
        return sCmcIncNm;
    }

    /**
     * @param sCmcIncNm the sCmcIncNm to set
     */
    public void setsCmcIncNm(String sCmcIncNm) {
        this.sCmcIncNm = sCmcIncNm;
    }

    /**
     * @return the sLineNo
     */
    public int getsLineNo() {
        return sLineNo;
    }

    /**
     * @param sLineNo the sLineNo to set
     */
    public void setsLineNo(int sLineNo) {
        this.sLineNo = sLineNo;
    }



}
