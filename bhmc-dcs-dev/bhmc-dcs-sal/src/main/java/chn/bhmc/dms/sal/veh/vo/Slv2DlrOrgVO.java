package chn.bhmc.dms.sal.veh.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 기준정보 > 2급딜러 관리
 * </pre>
 *
 * @ClassName   : Slv2DlrOrgVO.java
 * @Description : 기준정보 > 2급딜러 관리
 * @author chibeom.song
 * @since 2017. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 17.   chibeom.song     최초 생성
 * </pre>
 */

public class Slv2DlrOrgVO extends BaseVO{

    private static final long serialVersionUID = 8835548827065572989L;

    // 내용
    private String langCd;
    private String sdlrCd;
    private String sdlrTp;
    private String sdlrTpNm;
    private String dlrCd;
    private String sdlrNm;
    private String taxpayerIdCd;
    private String ownNm;
    private String telNo;
    private String addr;
    private String useYn;
    private String regUsrId;
    private Date regDt;
    private String updtUsrId;
    private Date upDt;

    private String rDlrCd;
    private String rSdlrCd;
    private String rSdlrTp;
    private String rSdlrTpNm;
    private String rSdlrNm;
    private String rTaxpayerIdCd;
    private String rOwnNm;
    private String rTelNo;
    private String rAddr;
    private String rUseYn;

    private String uDlrCd;
    private String uSdlrCd;
    private String uSdlrTp;
    private String uSdlrTpNm;
    private String uSdlrNm;
    private String uTaxpayerIdCd;
    private String uOwnNm;
    private String uTelNo;
    private String uAddr;
    private String uUseYn;

    /**
     * @return the langCd
     */
    public String getLangCd() {
        return langCd;
    }
    /**
     * @param langCd the langCd to set
     */
    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }
    /**
     * @return the sdlrCd
     */
    public String getSdlrCd() {
        return sdlrCd;
    }
    /**
     * @param sdlrCd the sdlrCd to set
     */
    public void setSdlrCd(String sdlrCd) {
        this.sdlrCd = sdlrCd;
    }
    /**
     * @return the sdlrTp
     */
    public String getSdlrTp() {
        return sdlrTp;
    }
    /**
     * @param sdlrTp the sdlrTp to set
     */
    public void setSdlrTp(String sdlrTp) {
        this.sdlrTp = sdlrTp;
    }
    /**
     * @return the sdlrTpNm
     */
    public String getSdlrTpNm() {
        return sdlrTpNm;
    }
    /**
     * @param sdlrTpNm the sdlrTpNm to set
     */
    public void setSdlrTpNm(String sdlrTpNm) {
        this.sdlrTpNm = sdlrTpNm;
    }
    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }
    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }
    /**
     * @return the sdlrNm
     */
    public String getSdlrNm() {
        return sdlrNm;
    }
    /**
     * @param sdlrNm the sdlrNm to set
     */
    public void setSdlrNm(String sdlrNm) {
        this.sdlrNm = sdlrNm;
    }
    /**
     * @return the taxpayerIdCd
     */
    public String getTaxpayerIdCd() {
        return taxpayerIdCd;
    }
    /**
     * @param taxpayerIdCd the taxpayerIdCd to set
     */
    public void setTaxpayerIdCd(String taxpayerIdCd) {
        this.taxpayerIdCd = taxpayerIdCd;
    }
    /**
     * @return the ownNm
     */
    public String getOwnNm() {
        return ownNm;
    }
    /**
     * @param ownNm the ownNm to set
     */
    public void setOwnNm(String ownNm) {
        this.ownNm = ownNm;
    }
    /**
     * @return the telNo
     */
    public String getTelNo() {
        return telNo;
    }
    /**
     * @param telNo the telNo to set
     */
    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }
    /**
     * @return the addr
     */
    public String getAddr() {
        return addr;
    }
    /**
     * @param addr the addr to set
     */
    public void setAddr(String addr) {
        this.addr = addr;
    }
    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }
    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }
    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }
    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }
    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }
    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @return the rDlrCd
     */
    public String getrDlrCd() {
        return rDlrCd;
    }
    /**
     * @param rDlrCd the rDlrCd to set
     */
    public void setrDlrCd(String rDlrCd) {
        this.rDlrCd = rDlrCd;
    }
    /**
     * @return the rSdlrCd
     */
    public String getrSdlrCd() {
        return rSdlrCd;
    }
    /**
     * @param rSdlrCd the rSdlrCd to set
     */
    public void setrSdlrCd(String rSdlrCd) {
        this.rSdlrCd = rSdlrCd;
    }
    /**
     * @return the rSdlrTp
     */
    public String getrSdlrTp() {
        return rSdlrTp;
    }
    /**
     * @param rSdlrTp the rSdlrTp to set
     */
    public void setrSdlrTp(String rSdlrTp) {
        this.rSdlrTp = rSdlrTp;
    }
    /**
     * @return the rSdlrTpNm
     */
    public String getrSdlrTpNm() {
        return rSdlrTpNm;
    }
    /**
     * @param rSdlrTpNm the rSdlrTpNm to set
     */
    public void setrSdlrTpNm(String rSdlrTpNm) {
        this.rSdlrTpNm = rSdlrTpNm;
    }
    /**
     * @return the rSdlrNm
     */
    public String getrSdlrNm() {
        return rSdlrNm;
    }
    /**
     * @param rSdlrNm the rSdlrNm to set
     */
    public void setrSdlrNm(String rSdlrNm) {
        this.rSdlrNm = rSdlrNm;
    }
    /**
     * @return the rTaxpayerIdCd
     */
    public String getrTaxpayerIdCd() {
        return rTaxpayerIdCd;
    }
    /**
     * @param rTaxpayerIdCd the rTaxpayerIdCd to set
     */
    public void setrTaxpayerIdCd(String rTaxpayerIdCd) {
        this.rTaxpayerIdCd = rTaxpayerIdCd;
    }
    /**
     * @return the rOwnNm
     */
    public String getrOwnNm() {
        return rOwnNm;
    }
    /**
     * @param rOwnNm the rOwnNm to set
     */
    public void setrOwnNm(String rOwnNm) {
        this.rOwnNm = rOwnNm;
    }
    /**
     * @return the rTelNo
     */
    public String getrTelNo() {
        return rTelNo;
    }
    /**
     * @param rTelNo the rTelNo to set
     */
    public void setrTelNo(String rTelNo) {
        this.rTelNo = rTelNo;
    }
    /**
     * @return the rAddr
     */
    public String getrAddr() {
        return rAddr;
    }
    /**
     * @param rAddr the rAddr to set
     */
    public void setrAddr(String rAddr) {
        this.rAddr = rAddr;
    }
    /**
     * @return the rUseYn
     */
    public String getrUseYn() {
        return rUseYn;
    }
    /**
     * @param rUseYn the rUseYn to set
     */
    public void setrUseYn(String rUseYn) {
        this.rUseYn = rUseYn;
    }
    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }
    /**
     * @return the upDt
     */
    public Date getUpDt() {
        return upDt;
    }
    /**
     * @param upDt the upDt to set
     */
    public void setUpDt(Date upDt) {
        this.upDt = upDt;
    }
    /**
     * @return the uDlrCd
     */
    public String getuDlrCd() {
        return uDlrCd;
    }
    /**
     * @param uDlrCd the uDlrCd to set
     */
    public void setuDlrCd(String uDlrCd) {
        this.uDlrCd = uDlrCd;
    }
    /**
     * @return the uSdlrCd
     */
    public String getuSdlrCd() {
        return uSdlrCd;
    }
    /**
     * @param uSdlrCd the uSdlrCd to set
     */
    public void setuSdlrCd(String uSdlrCd) {
        this.uSdlrCd = uSdlrCd;
    }
    /**
     * @return the uSdlrTp
     */
    public String getuSdlrTp() {
        return uSdlrTp;
    }
    /**
     * @param uSdlrTp the uSdlrTp to set
     */
    public void setuSdlrTp(String uSdlrTp) {
        this.uSdlrTp = uSdlrTp;
    }
    /**
     * @return the uSdlrTpNm
     */
    public String getuSdlrTpNm() {
        return uSdlrTpNm;
    }
    /**
     * @param uSdlrTpNm the uSdlrTpNm to set
     */
    public void setuSdlrTpNm(String uSdlrTpNm) {
        this.uSdlrTpNm = uSdlrTpNm;
    }
    /**
     * @return the uSdlrNm
     */
    public String getuSdlrNm() {
        return uSdlrNm;
    }
    /**
     * @param uSdlrNm the uSdlrNm to set
     */
    public void setuSdlrNm(String uSdlrNm) {
        this.uSdlrNm = uSdlrNm;
    }
    /**
     * @return the uTaxpayerIdCd
     */
    public String getuTaxpayerIdCd() {
        return uTaxpayerIdCd;
    }
    /**
     * @param uTaxpayerIdCd the uTaxpayerIdCd to set
     */
    public void setuTaxpayerIdCd(String uTaxpayerIdCd) {
        this.uTaxpayerIdCd = uTaxpayerIdCd;
    }
    /**
     * @return the uOwnNm
     */
    public String getuOwnNm() {
        return uOwnNm;
    }
    /**
     * @param uOwnNm the uOwnNm to set
     */
    public void setuOwnNm(String uOwnNm) {
        this.uOwnNm = uOwnNm;
    }
    /**
     * @return the uTelNo
     */
    public String getuTelNo() {
        return uTelNo;
    }
    /**
     * @param uTelNo the uTelNo to set
     */
    public void setuTelNo(String uTelNo) {
        this.uTelNo = uTelNo;
    }
    /**
     * @return the uAddr
     */
    public String getuAddr() {
        return uAddr;
    }
    /**
     * @param uAddr the uAddr to set
     */
    public void setuAddr(String uAddr) {
        this.uAddr = uAddr;
    }
    /**
     * @return the uUseYn
     */
    public String getuUseYn() {
        return uUseYn;
    }
    /**
     * @param uUseYn the uUseYn to set
     */
    public void setuUseYn(String uUseYn) {
        this.uUseYn = uUseYn;
    }

}
