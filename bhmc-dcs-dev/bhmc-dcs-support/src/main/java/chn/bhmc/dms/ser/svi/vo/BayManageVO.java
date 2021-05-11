package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;


public class BayManageVO extends BaseSaveVO<Object> {

	private static final long serialVersionUID = 7601614535185580114L;

	BayMasterVO bayMasterVO;

	BaseSaveVO<BayDetailVO> bayManageSaveVO;

    /**
     * @return the bayMasterVO
     */
    public BayMasterVO getBayMasterVO() {
        return bayMasterVO;
    }

    /**
     * @param bayMasterVO the bayMasterVO to set
     */
    public void setBayMasterVO(BayMasterVO bayMasterVO) {
        this.bayMasterVO = bayMasterVO;
    }

    /**
     * @return the bayManageSaveVO
     */
    public BaseSaveVO<BayDetailVO> getBayManageSaveVO() {
        return bayManageSaveVO;
    }

    /**
     * @param bayManageSaveVO the bayManageSaveVO to set
     */
    public void setBayManageSaveVO(BaseSaveVO<BayDetailVO> bayManageSaveVO) {
        this.bayManageSaveVO = bayManageSaveVO;
    }


}
