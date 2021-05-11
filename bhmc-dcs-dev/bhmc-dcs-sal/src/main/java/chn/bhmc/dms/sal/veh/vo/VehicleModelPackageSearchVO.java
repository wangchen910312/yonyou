package chn.bhmc.dms.sal.veh.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleModelPackageSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Bong
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18.     Bong                 최초 생성
 * </pre>
 */

public class VehicleModelPackageSearchVO extends SearchVO{

    private static final long serialVersionUID = -6023274259297438078L;


    private String sCarlineCd;       // 차종코드
    private String sModelCd;       // 모델코드
    private String sModelNm;       // 모델명
    private String sOcnCd;           // OCN코드
    private String sFscCd; 
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartDt;         // 적용 시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndDt;           // 적용 종료일자
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
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
    }
    /**
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
    }

    /**
     * @return the sModelNm
     */
    public String getsModelNm() {
        return sModelNm;
    }
    /**
     * @param sModelNm the sModelNm to set
     */
    public void setsModelNm(String sModelNm) {
        this.sModelNm = sModelNm;
    }
    /**
     * @return the sOcnCd
     */
    public String getsOcnCd() {
        return sOcnCd;
    }
    /**
     * @param sOcnCd the sOcnCd to set
     */
    public void setsOcnCd(String sOcnCd) {
        this.sOcnCd = sOcnCd;
    }
    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }
    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
    }
    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }
    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
	public String getsFscCd() {
		return sFscCd;
	}
	public void setsFscCd(String sFscCd) {
		this.sFscCd = sFscCd;
	}


}
