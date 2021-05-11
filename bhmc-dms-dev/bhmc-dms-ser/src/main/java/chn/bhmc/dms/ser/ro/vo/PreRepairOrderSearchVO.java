package chn.bhmc.dms.ser.ro.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderSearchVO.java
 * @Description : RO SearchVO
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.    KyungMok Kim     최초 생성
 * </pre>
 */

public class PreRepairOrderSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8942495594871858205L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     *  RO번호
     **/
    private String sPreRoDocNo;

    /**
     *  예약번호
     **/
    private String sResvDocNo;

    /**
     *  주행거리
     **/
    private String sRunDistVal;

    /**
     *  SA명
     **/
    private String sSaNm;

    /**
     *  VIN
     **/
    private String sVinNo;

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
     *  테크니션
     **/
    private String sTecNm;

    /**
     *  베이
     **/
    private String sBayNo;

    /**
     *  RO상태
     **/
    private String sPreRoStatCd;

    /**
     *  차량번호
     **/
    private String sCarRegNo;

    /**
     *  페인트상태
     **/
    private String sPaintStatCd;

    /**
     *  세차상태
     **/
    private String sCarWashStatCd;

    /**
     *  품질검사상태
     **/
    private String sQtTestStatCd;

    /**
     *  RO유형
     **/
    private String sPreRoTp;

    /**
     * 부품번호
     */
    private String sItemCd;

    private String sPreFixId;

    /**
     *  RO발행일자(From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPreRoFromDt;

    /**
     *  RO발행일자(To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPreRoToDt;

    /**
     *  예정인도시간
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sExpcDlFromDt;

    /**
     *  예정인도시간
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sExpcDlToDt;

    /**
     *  조회 조건(01:정비이력, 02:수납검색)
     **/
    private String listType;

    /**
     *  미배정 테이타 안 보여줌
     **/
    private String sRoTp1;

     /**
     *  RO작업시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoStartDt;

    /**
     *  RO작업종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoEndDt;

    private int sRunDistFromVal;

    private int sRunDistToVal;

    private String sRegUsrNm;



    /**
     * @return the sRegUsrNm
     */
    public String getsRegUsrNm() {
        return sRegUsrNm;
    }

    /**
     * @param sRegUsrNm the sRegUsrNm to set
     */
    public void setsRegUsrNm(String sRegUsrNm) {
        this.sRegUsrNm = sRegUsrNm;
    }

    /**
     * @return the sPreFixId
     */
    public String getsPreFixId() {
        return sPreFixId;
    }

    /**
     * @param sPreFixId the sPreFixId to set
     */
    public void setsPreFixId(String sPreFixId) {
        this.sPreFixId = sPreFixId;
    }

    public String getsDlrCd() {
        return sDlrCd;
    }

    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }


    /**
     * @return the sPreRoDocNo
     */
    public String getsPreRoDocNo() {
        return sPreRoDocNo;
    }

    /**
     * @param sPreRoDocNo the sPreRoDocNo to set
     */
    public void setsPreRoDocNo(String sPreRoDocNo) {
        this.sPreRoDocNo = sPreRoDocNo;
    }

    public String getsResvDocNo() {
        return sResvDocNo;
    }

    public void setsResvDocNo(String sResvDocNo) {
        this.sResvDocNo = sResvDocNo;
    }

    public String getsRunDistVal() {
        return sRunDistVal;
    }

    public void setsRunDistVal(String sRunDistVal) {
        this.sRunDistVal = sRunDistVal;
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

    public String getsTecNm() {
        return sTecNm;
    }

    public void setsTecNm(String sTecNm) {
        this.sTecNm = sTecNm;
    }

    public String getsBayNo() {
        return sBayNo;
    }

    public void setsBayNo(String sBayNo) {
        this.sBayNo = sBayNo;
    }

    public String getsCarRegNo() {
        return sCarRegNo;
    }

    public void setsCarRegNo(String sCarRegNo) {
        this.sCarRegNo = sCarRegNo;
    }

    public String getsPaintStatCd() {
        return sPaintStatCd;
    }

    public void setsPaintStatCd(String sPaintStatCd) {
        this.sPaintStatCd = sPaintStatCd;
    }

    public String getsCarWashStatCd() {
        return sCarWashStatCd;
    }

    public void setsCarWashStatCd(String sCarWashStatCd) {
        this.sCarWashStatCd = sCarWashStatCd;
    }

    public String getsQtTestStatCd() {
        return sQtTestStatCd;
    }

    public void setsQtTestStatCd(String sQtTestStatCd) {
        this.sQtTestStatCd = sQtTestStatCd;
    }

    /**
     * @return the sCarOwnerNm
     */
    public String getsCarOwnerNm() {
        return sCarOwnerNm;
    }

    /**
     * @param sCarOwnerNm the sCarOwnerNm to set
     */
    public void setsCarOwnerNm(String sCarOwnerNm) {
        this.sCarOwnerNm = sCarOwnerNm;
    }

    /**
     * @return the sCarOwnerId
     */
    public String getsCarOwnerId() {
        return sCarOwnerId;
    }

    /**
     * @param sCarOwnerId the sCarOwnerId to set
     */
    public void setsCarOwnerId(String sCarOwnerId) {
        this.sCarOwnerId = sCarOwnerId;
    }

    public Date getsExpcDlFromDt() {
        return sExpcDlFromDt;
    }

    public void setsExpcDlFromDt(Date sExpcDlFromDt) {
        this.sExpcDlFromDt = sExpcDlFromDt;
    }

    public Date getsExpcDlToDt() {
        return sExpcDlToDt;
    }

    public void setsExpcDlToDt(Date sExpcDlToDt) {
        this.sExpcDlToDt = sExpcDlToDt;
    }

    /**
     * @return the listType
     */
    public String getListType() {
        return listType;
    }

    /**
     * @param listType the listType to set
     */
    public void setListType(String listType) {
        this.listType = listType;
    }

    public Date getsRoStartDt() {
        return sRoStartDt;
    }

    public void setsRoStartDt(Date sRoStartDt) {
        this.sRoStartDt = sRoStartDt;
    }

    public Date getsRoEndDt() {
        return sRoEndDt;
    }

    public void setsRoEndDt(Date sRoEndDt) {
        this.sRoEndDt = sRoEndDt;
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

    public String getsRoTp1() {
        return sRoTp1;
    }

    public void setsRoTp1(String sRoTp1) {
        this.sRoTp1 = sRoTp1;
    }

    /**
     * @return the sRunDistFromVal
     */
    public int getsRunDistFromVal() {
        return sRunDistFromVal;
    }

    /**
     * @param sRunDistFromVal the sRunDistFromVal to set
     */
    public void setsRunDistFromVal(int sRunDistFromVal) {
        this.sRunDistFromVal = sRunDistFromVal;
    }

    /**
     * @return the sRunDistToVal
     */
    public int getsRunDistToVal() {
        return sRunDistToVal;
    }

    /**
     * @param sRunDistToVal the sRunDistToVal to set
     */
    public void setsRunDistToVal(int sRunDistToVal) {
        this.sRunDistToVal = sRunDistToVal;
    }

    /**
     * @return the sPreRoStatCd
     */
    public String getsPreRoStatCd() {
        return sPreRoStatCd;
    }

    /**
     * @param sPreRoStatCd the sPreRoStatCd to set
     */
    public void setsPreRoStatCd(String sPreRoStatCd) {
        this.sPreRoStatCd = sPreRoStatCd;
    }

    /**
     * @return the sPreRoTp
     */
    public String getsPreRoTp() {
        return sPreRoTp;
    }

    /**
     * @param sPreRoTp the sPreRoTp to set
     */
    public void setsPreRoTp(String sPreRoTp) {
        this.sPreRoTp = sPreRoTp;
    }

    /**
     * @return the sPreRoFromDt
     */
    public Date getsPreRoFromDt() {
        return sPreRoFromDt;
    }

    /**
     * @param sPreRoFromDt the sPreRoFromDt to set
     */
    public void setsPreRoFromDt(Date sPreRoFromDt) {
        this.sPreRoFromDt = sPreRoFromDt;
    }

    /**
     * @return the sPreRoToDt
     */
    public Date getsPreRoToDt() {
        return sPreRoToDt;
    }

    /**
     * @param sPreRoToDt the sPreRoToDt to set
     */
    public void setsPreRoToDt(Date sPreRoToDt) {
        this.sPreRoToDt = sPreRoToDt;
    }

}