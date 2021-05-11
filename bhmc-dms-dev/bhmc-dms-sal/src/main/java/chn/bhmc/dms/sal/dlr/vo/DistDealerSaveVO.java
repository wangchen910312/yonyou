package chn.bhmc.dms.sal.dlr.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;


public class DistDealerSaveVO extends BaseSaveVO<Object> {

	private static final long serialVersionUID = 7601614535185580114L;

	DistDealerVO distDealerVO;

	String dlrCd;
	String regUsrId;

	BaseSaveVO<DistDealerVO> saveData;



    /**
     * @return the distDealerVO
     */
    public DistDealerVO getDistDealerVO() {
        return distDealerVO;
    }

    /**
     * @param distDealerVO the distDealerVO to set
     */
    public void setDistDealerVO(DistDealerVO distDealerVO) {
        this.distDealerVO = distDealerVO;
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
     * @return the saveData
     */
    public BaseSaveVO<DistDealerVO> getSaveData() {
        return saveData;
    }

    /**
     * @param saveData the saveData to set
     */
    public void setSaveData(BaseSaveVO<DistDealerVO> saveData) {
        this.saveData = saveData;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }




}
