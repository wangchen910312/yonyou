package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WarrantyOrderVO.java
 * @Description : 保修工单审核搜索VO
 * @author lixinfei
 * @since 2021. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 4. 1.    lixinfei     		保修工单审核搜索VO
 * </pre>
 */
public class ReviewWarrantyOrderSearchVO extends SearchVO{
    
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8989180152887275745L;
	
	/**
	 * 事业部
	 */
    private String sDiviCd;
	
	/**
	 * 办事处
	 */
    private String sOffCd;
	
	/**
	 * SE_1162T 经销商代码
	 */
	private String sDlrCd;
	
	/**
	 * SE_1162T 审核状态（单据状态）
	 */
	private String sReqStatCd;
	
	/**
	 * SE_1162T 车牌号
	 */
	private String sCarRegNo;
	
	/**
	 * SE_1162T 判定人(审核人名称)
	 */
	private String sApproveUsrNm;
	
	/**
	 * SE_1162T 开单起始日期
	 */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoStartDt;
    
    /**
     * SE_1162T 开单结束日期 
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoEndDt;
	
	/**
	 * SE_1162T 审核起始日期
	 */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sApproveDtStart;
    
    /**
     * SE_1162T 审核结束日期 
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sApproveDtEnd;

    
	public String getsDiviCd() {
		return sDiviCd;
	}

	public void setsDiviCd(String sDiviCd) {
		this.sDiviCd = sDiviCd;
	}

	public String getsOffCd() {
		return sOffCd;
	}

	public void setsOffCd(String sOffCd) {
		this.sOffCd = sOffCd;
	}

	public String getsDlrCd() {
		return sDlrCd;
	}

	public void setsDlrCd(String sDlrCd) {
		this.sDlrCd = sDlrCd;
	}

	public String getsReqStatCd() {
		return sReqStatCd;
	}

	public void setsReqStatCd(String sReqStatCd) {
		this.sReqStatCd = sReqStatCd;
	}

	public String getsCarRegNo() {
		return sCarRegNo;
	}

	public void setsCarRegNo(String sCarRegNo) {
		this.sCarRegNo = sCarRegNo;
	}

	public String getsApproveUsrNm() {
		return sApproveUsrNm;
	}

	public void setsApproveUsrNm(String sApproveUsrNm) {
		this.sApproveUsrNm = sApproveUsrNm;
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

    public Date getsApproveDtStart() {
        return sApproveDtStart;
    }

    public void setsApproveDtStart(Date sApproveDtStart) {
        this.sApproveDtStart = sApproveDtStart;
    }

    public Date getsApproveDtEnd() {
        return sApproveDtEnd;
    }

    public void setsApproveDtEnd(Date sApproveDtEnd) {
        this.sApproveDtEnd = sApproveDtEnd;
    }

}
