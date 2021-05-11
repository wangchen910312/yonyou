package chn.bhmc.dms.ser.ro.vo;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 工位与摄像通道对应VO
 * </pre>
 *
 * @ClassName   : VedioChannelBayVO.java
 * @Description : 工位与摄像通道对应 VO.
 * @author Li Yanyong
 * @since 2020. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020. 4. 1.     Li Yanyong      최초 생성
 * </pre>
 */

public class VedioChannelBayVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4537327758954400433L;

    /**
     * 经销商代码
     */
    private String dlrCd;
    
    
    /**
     * 工位代码
     */
    private String bayNo;

    
    /**
     * 设备编号
     */
    private String equipNo;
    
    /**
     * 设备验证码
     */
    private String equipVerifyNo;
    
    /**
     * 通道号
     */
    private String channelNo;
    
    /**
     * 通道名称
     */
    private String channelNm;
    
    /**
     * 是否有效
     */
    private String useYn;

    /**
     * 设备状态
     */
    @NotBlank
    private String equipUseYn;

    /**
     * 视频通道地址
     */
    private String channelAddrHls;
    private String channelAddrRtmp;
    
    
    /**
     * 是否开通直播
     */
    private String payYn;

    /**
     * 是否注册
     */
    private String regYn;
    
    /**
     * 是否播放声音
     */
    private String voiceYn;
    
    /**
     * 摄像头所属位置
     */
    private String cameraLocation;
    

    /**
     * 创建人
     */
    private String regUsrId;

    /**
     * 创建时间
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * 修改人
     */
    private String updtUsrId;


    /**
     * 修改时间
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;


    /**
     * 备注
     */
    private String remark;


	public String getDlrCd() {
		return dlrCd;
	}


	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}


	public String getBayNo() {
		return bayNo;
	}


	public void setBayNo(String bayNo) {
		this.bayNo = bayNo;
	}


	public String getEquipNo() {
		return equipNo;
	}


	public void setEquipNo(String equipNo) {
		this.equipNo = equipNo;
	}


	public String getEquipVerifyNo() {
		return equipVerifyNo;
	}


	public void setEquipVerifyNo(String equipVerifyNo) {
		this.equipVerifyNo = equipVerifyNo;
	}


	public String getChannelNo() {
		return channelNo;
	}


	public void setChannelNo(String channelNo) {
		this.channelNo = channelNo;
	}


	public String getChannelNm() {
		return channelNm;
	}


	public void setChannelNm(String channelNm) {
		this.channelNm = channelNm;
	}


	public String getUseYn() {
		return useYn;
	}


	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}


	public String getEquipUseYn() {
		return equipUseYn;
	}


	public void setEquipUseYn(String equipUseYn) {
		this.equipUseYn = equipUseYn;
	}


	public String getPayYn() {
		return payYn;
	}


	public void setPayYn(String payYn) {
		this.payYn = payYn;
	}


	public String getRegYn() {
		return regYn;
	}


	public void setRegYn(String regYn) {
		this.regYn = regYn;
	}


	public String getVoiceYn() {
		return voiceYn;
	}


	public void setVoiceYn(String voiceYn) {
		this.voiceYn = voiceYn;
	}


	public String getCameraLocation() {
		return cameraLocation;
	}


	public void setCameraLocation(String cameraLocation) {
		this.cameraLocation = cameraLocation;
	}


	public String getRegUsrId() {
		return regUsrId;
	}


	public void setRegUsrId(String regUsrId) {
		this.regUsrId = regUsrId;
	}


	public Date getRegDt() {
		return regDt;
	}


	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}


	public String getUpdtUsrId() {
		return updtUsrId;
	}


	public void setUpdtUsrId(String updtUsrId) {
		this.updtUsrId = updtUsrId;
	}


	public Date getUpdtDt() {
		return updtDt;
	}


	public void setUpdtDt(Date updtDt) {
		this.updtDt = updtDt;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	public String getChannelAddrHls() {
		return channelAddrHls;
	}


	public void setChannelAddrHls(String channelAddrHls) {
		this.channelAddrHls = channelAddrHls;
	}


	public String getChannelAddrRtmp() {
		return channelAddrRtmp;
	}


	public void setChannelAddrRtmp(String channelAddrRtmp) {
		this.channelAddrRtmp = channelAddrRtmp;
	}


}
