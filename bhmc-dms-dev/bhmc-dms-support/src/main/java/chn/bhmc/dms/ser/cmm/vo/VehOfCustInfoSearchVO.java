package chn.bhmc.dms.ser.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehOfCustInfoSearchVO.java
 * @Description : 서비스 공통용 고객및차량정보 조회 SearchVO.
 * @author Yin Xueyuan
 * @since 2016. 3. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 7.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class VehOfCustInfoSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8966795170053002499L;

    public String sCarId;
    public String sVinNo;
    public String sCarNo;
    public String sCustNm;
    public String sDlrCd;
    public String sPreFixId;
    public String sHpNo;
    public String sCarlineCd;
    public String sBhmcYn;
    public String sTelNo;
    public String sFullVinNo;
    public String sVinNo1;
    public String sVinNo2;
    public String sIsCarOwnerYn;
    public String sLtsModelCd;
    public String sCarDstinCd;
    public String sQueryJoin = "LEFT";
    private String sRoDocNo;
    private String sDiagDocNo;
    private String sBMJoinYn;
    private String sCustInfo;
    private String sLinkType;
    private String sDlrMbrYn;
    private String sMembershipStan;
    private String sCustCd;
    private String sCustTp;
    private String sHyundaiYn;
    private String sMathDocTp;
    //车辆销售日期
    private String custSaleDt;
    
    /**
     * 车辆销售日期
     * @return
     */
    public String getCustSaleDt() {
		return custSaleDt;
	}

	public void setCustSaleDt(String custSaleDt) {
		this.custSaleDt = custSaleDt;
	}

	/**
     * 자사 타사 구분
     */
    private String sOwnCarYn;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grteStartDt;           /*보증시작일자*/

    public String getsCarId() {
        return sCarId;
    }

    public void setsCarId(String sCarId) {
        this.sCarId = sCarId;
    }

    public String getsVinNo() {
        return sVinNo;
    }

    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }

    public String getsCarNo() {
        return sCarNo;
    }

    public void setsCarNo(String sCarNo) {
        this.sCarNo = sCarNo;
    }

    public String getsCustNm() {
        return sCustNm;
    }

    public void setsCustNm(String sCustNm) {
        this.sCustNm = sCustNm;
    }

    public String getsDlrCd() {
        return sDlrCd;
    }

    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    public String getsPreFixId() {
        return sPreFixId;
    }

    public void setsPreFixId(String sPreFixId) {
        this.sPreFixId = sPreFixId;
    }

    public String getsHpNo() {
        return sHpNo;
    }

    public void setsHpNo(String sHpNo) {
        this.sHpNo = sHpNo;
    }

    public String getsCarlineCd() {
        return sCarlineCd;
    }

    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }

    public String getsBhmcYn() {
        return sBhmcYn;
    }

    public void setsBhmcYn(String sBhmcYn) {
        this.sBhmcYn = sBhmcYn;
    }

    public String getsTelNo() {
        return sTelNo;
    }

    public void setsTelNo(String sTelNo) {
        this.sTelNo = sTelNo;
    }

    public String getsFullVinNo() {
        return sFullVinNo;
    }

    public void setsFullVinNo(String sFullVinNo) {
        this.sFullVinNo = sFullVinNo;
    }

    public String getsVinNo1() {
        return sVinNo1;
    }

    public void setsVinNo1(String sVinNo1) {
        this.sVinNo1 = sVinNo1;
    }

    public String getsVinNo2() {
        return sVinNo2;
    }

    public void setsVinNo2(String sVinNo2) {
        this.sVinNo2 = sVinNo2;
    }

    public String getsIsCarOwnerYn() {
        return sIsCarOwnerYn;
    }

    public void setsIsCarOwnerYn(String sIsCarOwnerYn) {
        this.sIsCarOwnerYn = sIsCarOwnerYn;
    }

    public String getsLtsModelCd() {
        return sLtsModelCd;
    }

    public void setsLtsModelCd(String sLtsModelCd) {
        this.sLtsModelCd = sLtsModelCd;
    }

    public String getsCarDstinCd() {
        return sCarDstinCd;
    }

    public void setsCarDstinCd(String sCarDstinCd) {
        this.sCarDstinCd = sCarDstinCd;
    }

    public String getsQueryJoin() {
        return sQueryJoin;
    }

    public void setsQueryJoin(String sQueryJoin) {
        this.sQueryJoin = sQueryJoin;
    }

    public String getsRoDocNo() {
        return sRoDocNo;
    }

    public void setsRoDocNo(String sRoDocNo) {
        this.sRoDocNo = sRoDocNo;
    }

    public String getsDiagDocNo() {
        return sDiagDocNo;
    }

    public void setsDiagDocNo(String sDiagDocNo) {
        this.sDiagDocNo = sDiagDocNo;
    }

    public Date getGrteStartDt() {
        return grteStartDt;
    }

    public void setGrteStartDt(Date grteStartDt) {
        this.grteStartDt = grteStartDt;
    }

    public String getsBMJoinYn() {
        return sBMJoinYn;
    }

    public void setsBMJoinYn(String sBMJoinYn) {
        this.sBMJoinYn = sBMJoinYn;
    }
    public String getsCustInfo() {
        return sCustInfo;
    }
    public void setsCustInfo(String sCustInfo) {
        this.sCustInfo = sCustInfo;
    }

    /**
     * @return the sLinkType
     */
    public String getsLinkType() {
        return sLinkType;
    }

    /**
     * @param sLinkType the sLinkType to set
     */
    public void setsLinkType(String sLinkType) {
        this.sLinkType = sLinkType;
    }

    /**
     * @return the sDlrMbrYn
     */
    public String getsDlrMbrYn() {
        return sDlrMbrYn;
    }

    /**
     * @param sDlrMbrYn the sDlrMbrYn to set
     */
    public void setsDlrMbrYn(String sDlrMbrYn) {
        this.sDlrMbrYn = sDlrMbrYn;
    }

    /**
     * @return the sMembershipStan
     */
    public String getsMembershipStan() {
        return sMembershipStan;
    }

    /**
     * @param sMembershipStan the sMembershipStan to set
     */
    public void setsMembershipStan(String sMembershipStan) {
        this.sMembershipStan = sMembershipStan;
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
     * @return the sCustTp
     */
    public String getsCustTp() {
        return sCustTp;
    }

    /**
     * @param sCustTp the sCustTp to set
     */
    public void setsCustTp(String sCustTp) {
        this.sCustTp = sCustTp;
    }

    /**
     * @return the sHyundaiYn
     */
    public String getsHyundaiYn() {
        return sHyundaiYn;
    }

    /**
     * @param sHyundaiYn the sHyundaiYn to set
     */
    public void setsHyundaiYn(String sHyundaiYn) {
        this.sHyundaiYn = sHyundaiYn;
    }

    /**
     * @return the sMathDocTp
     */
    public String getsMathDocTp() {
        return sMathDocTp;
    }

    /**
     * @param sMathDocTp the sMathDocTp to set
     */
    public void setsMathDocTp(String sMathDocTp) {
        this.sMathDocTp = sMathDocTp;
    }

    /**
     * @return the sOwnCarYn
     */
    public String getsOwnCarYn() {
        return sOwnCarYn;
    }

    /**
     * @param sOwnCarYn the sOwnCarYn to set
     */
    public void setsOwnCarYn(String sOwnCarYn) {
        this.sOwnCarYn = sOwnCarYn;
    }



}