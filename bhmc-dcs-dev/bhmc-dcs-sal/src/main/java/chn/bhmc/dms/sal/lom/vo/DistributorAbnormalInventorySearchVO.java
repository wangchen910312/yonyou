package chn.bhmc.dms.sal.lom.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TpVehicleMonitoringSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 3. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 23.     Lee Seungmin     최초 생성
 * </pre>
 */

public class DistributorAbnormalInventorySearchVO extends BaseSearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1543281975279037640L;

    private String sDlrCd;
    private String sVinNo;
    private String sVinNo1;
    private String sVinNo2;
    private String sTpCmpCd;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sSrchFrDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sSrchToDt;

    private String sSrchFrDtStr;
    private String sSrchToDtStr;
    
    private String sSdptCd;
    private String sSistOfficeCd;
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGrDtsFrDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGrDtsToDt;
    
    private String sGrDtsFrDtStr;
    private String sGrDtsToDtStr;

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }
    /**
     * @return the sVinNo1
     */
    public String getsVinNo1() {
        return sVinNo1;
    }
    /**
     * @return the sVinNo2
     */
    public String getsVinNo2() {
        return sVinNo2;
    }
    /**
     * @return the sTpCmpCd
     */
    public String getsTpCmpCd() {
        return sTpCmpCd;
    }
    /**
     * @return the sSrchFrDt
     */
    public Date getsSrchFrDt() {
        return sSrchFrDt;
    }
    /**
     * @return the sSrchToDt
     */
    public Date getsSrchToDt() {
        return sSrchToDt;
    }
    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }
    /**
     * @param sVinNo1 the sVinNo1 to set
     */
    public void setsVinNo1(String sVinNo1) {
        this.sVinNo1 = sVinNo1;
    }
    /**
     * @param sVinNo2 the sVinNo2 to set
     */
    public void setsVinNo2(String sVinNo2) {
        this.sVinNo2 = sVinNo2;
    }
    /**
     * @param sTpCmpCd the sTpCmpCd to set
     */
    public void setsTpCmpCd(String sTpCmpCd) {
        this.sTpCmpCd = sTpCmpCd;
    }
    /**
     * @param sSrchFrDt the sSrchFrDt to set
     */
    public void setsSrchFrDt(Date sSrchFrDt) {
        this.sSrchFrDt = sSrchFrDt;
    }
    /**
     * @param sSrchToDt the sSrchToDt to set
     */
    public void setsSrchToDt(Date sSrchToDt) {
        this.sSrchToDt = sSrchToDt;
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
     * @return the sSrchFrDtStr
     */
    public String getsSrchFrDtStr() {
        return sSrchFrDtStr;
    }
    /**
     * @return the sSrchToDtStr
     */
    public String getsSrchToDtStr() {
        return sSrchToDtStr;
    }
    /**
     * @param sSrchFrDtStr the sSrchFrDtStr to set
     */
    public void setsSrchFrDtStr(String sSrchFrDtStr) {
        this.sSrchFrDtStr = sSrchFrDtStr;
    }
    /**
     * @param sSrchToDtStr the sSrchToDtStr to set
     */
    public void setsSrchToDtStr(String sSrchToDtStr) {
        this.sSrchToDtStr = sSrchToDtStr;
    }
	public String getsSdptCd() {
		return sSdptCd;
	}
	public void setsSdptCd(String sSdptCd) {
		this.sSdptCd = sSdptCd;
	}
	public String getsSistOfficeCd() {
		return sSistOfficeCd;
	}
	public void setsSistOfficeCd(String sSistOfficeCd) {
		this.sSistOfficeCd = sSistOfficeCd;
	}
	public Date getsGrDtsFrDt() {
		return sGrDtsFrDt;
	}
	public void setsGrDtsFrDt(Date sGrDtsFrDt) {
		this.sGrDtsFrDt = sGrDtsFrDt;
	}
	public Date getsGrDtsToDt() {
		return sGrDtsToDt;
	}
	public void setsGrDtsToDt(Date sGrDtsToDt) {
		this.sGrDtsToDt = sGrDtsToDt;
	}
	public String getsGrDtsFrDtStr() {
		return sGrDtsFrDtStr;
	}
	public void setsGrDtsFrDtStr(String sGrDtsFrDtStr) {
		this.sGrDtsFrDtStr = sGrDtsFrDtStr;
	}
	public String getsGrDtsToDtStr() {
		return sGrDtsToDtStr;
	}
	public void setsGrDtsToDtStr(String sGrDtsToDtStr) {
		this.sGrDtsToDtStr = sGrDtsToDtStr;
	}
    


}
