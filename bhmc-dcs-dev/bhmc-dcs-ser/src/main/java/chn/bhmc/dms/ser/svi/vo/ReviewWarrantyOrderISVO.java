package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WarrantyOrderVO.java
 * @Description : 保修工单审核接口VO
 * @author lixinfei
 * @since 2021. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 4. 1.    lixinfei     		保修工单审核接口VO
 * </pre>
 */
public class ReviewWarrantyOrderISVO extends BaseVO{
	
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8996184952891215786L;

    /**
     * SE_1163IS 主键ID
     */
    private String id;
    
    /**
     * SE_1163IS 店代码
     */
    private String dlrCd;
    
    /**
     * 申请编号
     */
    private String reqNo;
    
    /**
     * 审核状态
     */
    private String approveStatCd; 
    
    /**
     * 审核原因
     */
    private String approveDesc; 
    
    /**
     * 录入人ID
     */
    private String regUsrId;
    
    /**
     * 录入人姓名
     */
    private String regUsrNm;
    
    /**
     * 录入日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;
    
    /**
     * 下发状态
     */
    private String ifresult;
    
    /**
     * 下发状态描述
     */
    private String iffailmsg;
    
    /**
     * 接口数据创建时间
     */
    private String createdate;
    
    /**
     * 接口数据修改时间
     */
    private String updatedate;
    
    /**
     * 接口数据生成日期
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ifRegDt;
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getReqNo() {
        return reqNo;
    }

    public void setReqNo(String reqNo) {
        this.reqNo = reqNo;
    }

    public String getApproveStatCd() {
        return approveStatCd;
    }

    public void setApproveStatCd(String approveStatCd) {
        this.approveStatCd = approveStatCd;
    }

    public String getApproveDesc() {
        return approveDesc;
    }

    public void setApproveDesc(String approveDesc) {
        this.approveDesc = approveDesc;
    }

    public String getRegUsrId() {
        return regUsrId;
    }

    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    public String getRegUsrNm() {
        return regUsrNm;
    }

    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }

    public Date getRegDt() {
        return regDt;
    }

    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    public String getIfresult() {
        return ifresult;
    }

    public void setIfresult(String ifresult) {
        this.ifresult = ifresult;
    }

    public String getIffailmsg() {
        return iffailmsg;
    }

    public void setIffailmsg(String iffailmsg) {
        this.iffailmsg = iffailmsg;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(String updatedate) {
        this.updatedate = updatedate;
    }

    public Date getIfRegDt() {
        return ifRegDt;
    }

    public void setIfRegDt(Date ifRegDt) {
        this.ifRegDt = ifRegDt;
    }

    
   
	
}
