package chn.bhmc.dms.ser.rev.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartReservationSearchVO.java
 * @Description : 부품예약 SearchVO
 * @author KyungMok Kim
 * @since 2016. 5. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 18.    KyungMok Kim     최초 생성
 * </pre>
 */

public class PartReservationSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8942495521687458205L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     *  예약번호
     **/
    private String sParResvDocNo;

    private String sPreFixId;

    /**
     * VIN NO
     */
    private String sVinNo;

    private String sParResvStatCd;

    private String sCarRegNo;

    private String sDriverNm;

    private String sCarOwnerNm;

    private String sParResvTp;

    // 01: STATUS, 02: 예약접수
    private String sListType;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sParResvStartDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sParResvEndDt;

    private String sRegUsrNm ;

    private String sPartNm;





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
     * @return the sParResvDocNo
     */
    public String getsParResvDocNo() {
        return sParResvDocNo;
    }

    /**
     * @param sParResvDocNo the sParResvDocNo to set
     */
    public void setsParResvDocNo(String sParResvDocNo) {
        this.sParResvDocNo = sParResvDocNo;
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
     * @return the sParResvStatCd
     */
    public String getsParResvStatCd() {
        return sParResvStatCd;
    }

    /**
     * @param sParResvStatCd the sParResvStatCd to set
     */
    public void setsParResvStatCd(String sParResvStatCd) {
        this.sParResvStatCd = sParResvStatCd;
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
     * @return the sDriverNm
     */
    public String getsDriverNm() {
        return sDriverNm;
    }

    /**
     * @param sDriverNm the sDriverNm to set
     */
    public void setsDriverNm(String sDriverNm) {
        this.sDriverNm = sDriverNm;
    }

    /**
     * @return the sListType
     */
    public String getsListType() {
        return sListType;
    }

    /**
     * @param sListType the sListType to set
     */
    public void setsListType(String sListType) {
        this.sListType = sListType;
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
     * @return the sParResvStartDt
     */
    public Date getsParResvStartDt() {
        return sParResvStartDt;
    }

    /**
     * @param sParResvStartDt the sParResvStartDt to set
     */
    public void setsParResvStartDt(Date sParResvStartDt) {
        this.sParResvStartDt = sParResvStartDt;
    }

    /**
     * @return the sParResvEndDt
     */
    public Date getsParResvEndDt() {
        return sParResvEndDt;
    }

    /**
     * @param sParResvEndDt the sParResvEndDt to set
     */
    public void setsParResvEndDt(Date sParResvEndDt) {
        this.sParResvEndDt = sParResvEndDt;
    }

    /**
     * @return the sParResvTp
     */
    public String getsParResvTp() {
        return sParResvTp;
    }

    /**
     * @param sParResvTp the sParResvTp to set
     */
    public void setsParResvTp(String sParResvTp) {
        this.sParResvTp = sParResvTp;
    }

    /**
     * @return the sPartNm
     */
    public String getsPartNm() {
        return sPartNm;
    }

    /**
     * @param sPartNm the sPartNm to set
     */
    public void setsPartNm(String sPartNm) {
        this.sPartNm = sPartNm;
    }


}