package chn.bhmc.dms.crm.cso.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;

/**
 * 판매기회프로세스 저장  VO
 *
 * @ClassName   : SalesOpptProcessMgmtSaveVO
 * @Description : SalesOpptProcessMgmtSaveVO
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07     in moon lee     최초 생성
 * </pre>
 */
public class SalesOpptProcessMgmtSaveVO extends BaseSaveVO<AddressInfoVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5091746083386843175L;

    public SalesOpptProcessMgmtVO salesOpptProcessMgmtVO;

    public BaseSaveVO<AddressInfoVO> addressInfoVOList;

    public List<AddressInfoVO> addressInfoCurrList;

    public List<SalesOpptProcessMgmtVO> batchUploadList = new ArrayList<SalesOpptProcessMgmtVO>();


    /**
     * @return the salesOpptProcessMgmtVO
     */
    public SalesOpptProcessMgmtVO getSalesOpptProcessMgmtVO() {
        return salesOpptProcessMgmtVO;
    }

    /**
     * @param salesOpptProcessMgmtVO the salesOpptProcessMgmtVO to set
     */
    public void setSalesOpptProcessMgmtVO(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) {
        this.salesOpptProcessMgmtVO = salesOpptProcessMgmtVO;
    }

    /**
     * @return the addressInfoVOList
     */
    public BaseSaveVO<AddressInfoVO> getAddressInfoVOList() {
        return addressInfoVOList;
    }

    /**
     * @param addressInfoVOList the addressInfoVOList to set
     */
    public void setAddressInfoVOList(BaseSaveVO<AddressInfoVO> addressInfoVOList) {
        this.addressInfoVOList = addressInfoVOList;
    }

    /**
     * @return the batchUploadList
     */
    public List<SalesOpptProcessMgmtVO> getBatchUploadList() {
        return batchUploadList;
    }

    /**
     * @param batchUploadList the batchUploadList to set
     */
    public void setBatchUploadList(List<SalesOpptProcessMgmtVO> batchUploadList) {
        this.batchUploadList = batchUploadList;
    }



}