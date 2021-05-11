package chn.bhmc.dms.mob.api.repair.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceReceiveSearchVO.java
 * @Description : 수납관리 SearchVO
 * @author YIN XUEYUAN
 * @since 2016. 4. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 20.    YIN XUEYUAN     최초 생성
 * </pre>
 */

public class ServiceReceiveSearchVO extends SearchVO{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4355720305609197666L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     *  RO번호
     **/
    private String sRoDocNo;

    /**
     *  RO그룹번호
     **/
    private String sRoGrpNo;

    /**
     *  정산번호
     **/
    private String sCalcDocNo;

    /**
     *  수납번호
     **/
    private String sRcvDocNo;

    /**
     *  수납번호
     **/
    private String sRcvSubDocNo;

    /**
     *  예약번호
     **/
    private String sResvDocNo;

    /**
     *  SA명
     **/
    private String sSaNm;

    /**
     *  VIN
     **/
    private String sVinNo;

    /**
     *  VIN
     **/
    private String sTecNm;

    /**
     *  운전자
     **/
    private String sDriverNm;

    /**
     *  소유자
     **/
    private String sCarOwnerNm;

    /**
     *  소유자
     **/
    private String sCarOwnerId;

    /**
     *  RO상태
     **/
    private String sRoStatCd;

    /**
     *  차량번호
     **/
    private String sCarRegNo;

    /**
     *  RO유형
     **/
    private String sRoTp;

    /**
     *  수납상태
     **/
    private String sRcvStatCd;

    /**
     *  수납상태
     **/
    private String sRcvHistStatCd;

    /**
     *  수납일자(From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRcvFromDt;

    /**
     *  수납일자(To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRcvToDt;

    /**
     *  정산일자(From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCalcFromDt;

    /**
     *  정산일자(To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCalcToDt;

    /**
     *  정산완료일자(From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRcvCpltFromDt;

    /**
     *  정산일자(To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRcvCpltToDt;

    /**
     *  지불자
     **/
    private String sPaymUsrNm;

    /**
     *  지불자유형
     **/
    private String sPaymTp;

    /**
     * 지불유형
     */
    private String sPaymMthTp;

    /**
     *  정비정산자
     **/
    private String sCalcPrsnNm;

    /**
     *  지불기한
     **/
    private String sPaymPrid;

    /**
     * 청산여부
     */
    private String sPaymYn;

    /**
     * 정비부품구분코드
     **/
    private String sSerParDstinCd;

    private String sCalcStatCd;

    public String getsDlrCd() {
        return sDlrCd;
    }

    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    public String getsRoDocNo() {
        return sRoDocNo;
    }

    public void setsRoDocNo(String sRoDocNo) {
        this.sRoDocNo = sRoDocNo;
    }

    public String getsRoGrpNo() {
        return sRoGrpNo;
    }

    public void setsRoGrpNo(String sRoGrpNo) {
        this.sRoGrpNo = sRoGrpNo;
    }

    public String getsCalcDocNo() {
        return sCalcDocNo;
    }

    public void setsCalcDocNo(String sCalcDocNo) {
        this.sCalcDocNo = sCalcDocNo;
    }

    public String getsRcvSubDocNo() {
        return sRcvSubDocNo;
    }

    public void setsRcvSubDocNo(String sRcvSubDocNo) {
        this.sRcvSubDocNo = sRcvSubDocNo;
    }

    public String getsRcvDocNo() {
        return sRcvDocNo;
    }

    public void setsRcvDocNo(String sRcvDocNo) {
        this.sRcvDocNo = sRcvDocNo;
    }

    public String getsResvDocNo() {
        return sResvDocNo;
    }

    public void setsResvDocNo(String sResvDocNo) {
        this.sResvDocNo = sResvDocNo;
    }

    public String getsSaNm() {
        return sSaNm;
    }

    public void setsSaNm(String sSaNm) {
        this.sSaNm = sSaNm;
    }

    public String getsVinNo() {
        return sVinNo;
    }

    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }

    public String getsDriverNm() {
        return sDriverNm;
    }

    public void setsDriverNm(String sDriverNm) {
        this.sDriverNm = sDriverNm;
    }

    public String getsCarOwnerNm() {
        return sCarOwnerNm;
    }

    public void setsCarOwnerNm(String sCarOwnerNm) {
        this.sCarOwnerNm = sCarOwnerNm;
    }

    public String getsCarOwnerId() {
        return sCarOwnerId;
    }

    public void setsCarOwnerId(String sCarOwnerId) {
        this.sCarOwnerId = sCarOwnerId;
    }

    public String getsRoStatCd() {
        return sRoStatCd;
    }

    public void setsRoStatCd(String sRoStatCd) {
        this.sRoStatCd = sRoStatCd;
    }

    public String getsCarRegNo() {
        return sCarRegNo;
    }

    public void setsCarRegNo(String sCarRegNo) {
        this.sCarRegNo = sCarRegNo;
    }

    public String getsRoTp() {
        return sRoTp;
    }

    public void setsRoTp(String sRoTp) {
        this.sRoTp = sRoTp;
    }

    public Date getsRcvFromDt() {
        return sRcvFromDt;
    }

    public void setsRcvFromDt(Date sRcvFromDt) {
        this.sRcvFromDt = sRcvFromDt;
    }

    public Date getsRcvToDt() {
        return sRcvToDt;
    }

    public void setsRcvToDt(Date sRcvToDt) {
        this.sRcvToDt = sRcvToDt;
    }

    public Date getsCalcFromDt() {
        return sCalcFromDt;
    }

    public void setsCalcFromDt(Date sCalcFromDt) {
        this.sCalcFromDt = sCalcFromDt;
    }

    public Date getsCalcToDt() {
        return sCalcToDt;
    }

    public void setsCalcToDt(Date sCalcToDt) {
        this.sCalcToDt = sCalcToDt;
    }

    public String getsRcvStatCd() {
        return sRcvStatCd;
    }

    public void setsRcvStatCd(String sRcvStatCd) {
        this.sRcvStatCd = sRcvStatCd;
    }

    public String getsRcvHistStatCd() {
        return sRcvHistStatCd;
    }

    public void setsRcvHistStatCd(String sRcvHistStatCd) {
        this.sRcvHistStatCd = sRcvHistStatCd;
    }

    public String getsTecNm() {
        return sTecNm;
    }

    public void setsTecNm(String sTecNm) {
        this.sTecNm = sTecNm;
    }

    /**
     * @return the sPaymUsrNm
     */
    public String getsPaymUsrNm() {
        return sPaymUsrNm;
    }

    /**
     * @param sPaymUsrNm the sPaymUsrNm to set
     */
    public void setsPaymUsrNm(String sPaymUsrNm) {
        this.sPaymUsrNm = sPaymUsrNm;
    }

    /**
     * @return the sSerParDstinCd
     */
    public String getsSerParDstinCd() {
        return sSerParDstinCd;
    }

    /**
     * @param sSerParDstinCd the sSerParDstinCd to set
     */
    public void setsSerParDstinCd(String sSerParDstinCd) {
        this.sSerParDstinCd = sSerParDstinCd;
    }

    /**
     * @return the sPaymTp
     */
    public String getsPaymTp() {
        return sPaymTp;
    }

    /**
     * @param sPaymTp the sPaymTp to set
     */
    public void setsPaymTp(String sPaymTp) {
        this.sPaymTp = sPaymTp;
    }

    /**
     * @return the sCalcPrsnNm
     */
    public String getsCalcPrsnNm() {
        return sCalcPrsnNm;
    }

    /**
     * @param sCalcPrsnNm the sCalcPrsnNm to set
     */
    public void setsCalcPrsnNm(String sCalcPrsnNm) {
        this.sCalcPrsnNm = sCalcPrsnNm;
    }

    /**
     * @return the sPaymPrid
     */
    public String getsPaymPrid() {
        return sPaymPrid;
    }

    /**
     * @param sPaymPrid the sPaymPrid to set
     */
    public void setsPaymPrid(String sPaymPrid) {
        this.sPaymPrid = sPaymPrid;
    }

    /**
     * @return the sCalcStatCd
     */
    public String getsCalcStatCd() {
        return sCalcStatCd;
    }

    /**
     * @param sCalcStatCd the sCalcStatCd to set
     */
    public void setsCalcStatCd(String sCalcStatCd) {
        this.sCalcStatCd = sCalcStatCd;
    }

    public String getsPaymYn() {
        return sPaymYn;
    }

    public void setsPaymYn(String sPaymYn) {
        this.sPaymYn = sPaymYn;
    }

    public Date getsRcvCpltFromDt() {
        return sRcvCpltFromDt;
    }

    public void setsRcvCpltFromDt(Date sRcvCpltFromDt) {
        this.sRcvCpltFromDt = sRcvCpltFromDt;
    }

    public Date getsRcvCpltToDt() {
        return sRcvCpltToDt;
    }

    public void setsRcvCpltToDt(Date sRcvCpltToDt) {
        this.sRcvCpltToDt = sRcvCpltToDt;
    }

    public String getsPaymMthTp() {
        return sPaymMthTp;
    }

    public void setsPaymMthTp(String sPaymMthTp) {
        this.sPaymMthTp = sPaymMthTp;
    }




}