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
 * @ClassName   : CarCheckSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author KyungMok Kim
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     KyungMok Kim     최초 생성
 * </pre>
 */

public class CarCheckSearchVO extends SearchVO{



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1266355947508761479L;

    private String sDlrCd;

    private String sCarRegNo;       // 차량번호

    private String sCarChkDocNo;    // 차량번검번호

    private String sRoTp;           // RO유형

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoFromDt;         // RO시간

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoToDt;           // RO시간

    private String sVinNo;          // VIN

    private String sRegUsrNm;       // 점검확인자

    private String sChkTp;          // 차량점검유형

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegFromDt;        // 점검확인시간

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegToDt;          // 점검확인시간

    private String sCarOwnerNm;     // 차량소유자

    private String sSaNm;           // 차량점검자

    private String sCarChkStatCd;   // 차량점검상태

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCompleteFromDt;   // 점검완료시간

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCompleteToDt;     // 점검완료시간

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
     * @return the sCarChkDocNo
     */
    public String getsCarChkDocNo() {
        return sCarChkDocNo;
    }

    /**
     * @param sCarChkDocNo the sCarChkDocNo to set
     */
    public void setsCarChkDocNo(String sCarChkDocNo) {
        this.sCarChkDocNo = sCarChkDocNo;
    }

    /**
     * @return the sRoTp
     */
    public String getsRoTp() {
        return sRoTp;
    }

    /**
     * @param sRoTp the sRoTp to set
     */
    public void setsRoTp(String sRoTp) {
        this.sRoTp = sRoTp;
    }

    /**
     * @return the sRoFromDt
     */
    public Date getsRoFromDt() {
        return sRoFromDt;
    }

    /**
     * @param sRoFromDt the sRoFromDt to set
     */
    public void setsRoFromDt(Date sRoFromDt) {
        this.sRoFromDt = sRoFromDt;
    }

    /**
     * @return the sRoToDt
     */
    public Date getsRoToDt() {
        return sRoToDt;
    }

    /**
     * @param sRoToDt the sRoToDt to set
     */
    public void setsRoToDt(Date sRoToDt) {
        this.sRoToDt = sRoToDt;
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
     * @return the sChkTp
     */
    public String getsChkTp() {
        return sChkTp;
    }

    /**
     * @param sChkTp the sChkTp to set
     */
    public void setsChkTp(String sChkTp) {
        this.sChkTp = sChkTp;
    }

    /**
     * @return the sRegFromDt
     */
    public Date getsRegFromDt() {
        return sRegFromDt;
    }

    /**
     * @param sRegFromDt the sRegFromDt to set
     */
    public void setsRegFromDt(Date sRegFromDt) {
        this.sRegFromDt = sRegFromDt;
    }

    /**
     * @return the sRegToDt
     */
    public Date getsRegToDt() {
        return sRegToDt;
    }

    /**
     * @param sRegToDt the sRegToDt to set
     */
    public void setsRegToDt(Date sRegToDt) {
        this.sRegToDt = sRegToDt;
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
     * @return the sSaNm
     */
    public String getsSaNm() {
        return sSaNm;
    }

    /**
     * @param sSaNm the sSaNm to set
     */
    public void setsSaNm(String sSaNm) {
        this.sSaNm = sSaNm;
    }

    /**
     * @return the sCarChkStatCd
     */
    public String getsCarChkStatCd() {
        return sCarChkStatCd;
    }

    /**
     * @param sCarChkStatCd the sCarChkStatCd to set
     */
    public void setsCarChkStatCd(String sCarChkStatCd) {
        this.sCarChkStatCd = sCarChkStatCd;
    }

    /**
     * @return the sCompleteFromDt
     */
    public Date getsCompleteFromDt() {
        return sCompleteFromDt;
    }

    /**
     * @param sCompleteFromDt the sCompleteFromDt to set
     */
    public void setsCompleteFromDt(Date sCompleteFromDt) {
        this.sCompleteFromDt = sCompleteFromDt;
    }

    /**
     * @return the sCompleteToDt
     */
    public Date getsCompleteToDt() {
        return sCompleteToDt;
    }

    /**
     * @param sCompleteToDt the sCompleteToDt to set
     */
    public void setsCompleteToDt(Date sCompleteToDt) {
        this.sCompleteToDt = sCompleteToDt;
    }

}
