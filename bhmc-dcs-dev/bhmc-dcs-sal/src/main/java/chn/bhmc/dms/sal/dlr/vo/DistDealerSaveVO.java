package chn.bhmc.dms.sal.dlr.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;


public class DistDealerSaveVO  {

	private static final long serialVersionUID = 7601614535185580114L;
	private String dlrCd;
	private String regUsrId;
	private String usrId;
	private BaseSaveVO<DistDealerVO> dealerVO;
	
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
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }
    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }
    /**
     * @return the dealerVO
     */
    public BaseSaveVO<DistDealerVO> getDealerVO() {
        return dealerVO;
    }
    /**
     * @param dealerVO the dealerVO to set
     */
    public void setDealerVO(BaseSaveVO<DistDealerVO> dealerVO) {
        this.dealerVO = dealerVO;
    }
    
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}