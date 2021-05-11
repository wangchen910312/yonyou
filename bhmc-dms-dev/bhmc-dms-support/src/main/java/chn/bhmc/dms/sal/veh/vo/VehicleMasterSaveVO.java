package chn.bhmc.dms.sal.veh.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleMasterSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 12.     Kim yewom              최초 생성
 * </pre>
 */

public class VehicleMasterSaveVO extends BaseSaveVO<VehicleMasterVO>  {

    private static final long serialVersionUID = -404572985973453926L;
    private String opFlag;//标识操作 JC:交车（ 区分saveVehicleMasterMain操作时发动机号是否需置为空）
    private String carId;
    private String dlrCd;

    VehicleMasterVO vehicleMasterVO;
    BaseSaveVO<VehicleMasterVO> ownerGridVO = new BaseSaveVO<VehicleMasterVO>();
    BaseSaveVO<VehicleMasterVO> driverGridVO = new BaseSaveVO<VehicleMasterVO>();


    //옵션
    private List<VehicleMasterVO> insertOptionList = new ArrayList<VehicleMasterVO>();
    private List<VehicleMasterVO> updateOptionList = new ArrayList<VehicleMasterVO>();
    private List<VehicleMasterVO> deleteOptionList = new ArrayList<VehicleMasterVO>();



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
    public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	/**
     * @return the insertOptionList
     */
    public List<VehicleMasterVO> getInsertOptionList() {
        return insertOptionList;
    }
    /**
     * @param insertOptionList the insertOptionList to set
     */
    public void setInsertOptionList(List<VehicleMasterVO> insertOptionList) {
        this.insertOptionList = insertOptionList;
    }
    /**
     * @return the updateOptionList
     */
    public List<VehicleMasterVO> getUpdateOptionList() {
        return updateOptionList;
    }
    /**
     * @param updateOptionList the updateOptionList to set
     */
    public void setUpdateOptionList(List<VehicleMasterVO> updateOptionList) {
        this.updateOptionList = updateOptionList;
    }
    /**
     * @return the deleteOptionList
     */
    public List<VehicleMasterVO> getDeleteOptionList() {
        return deleteOptionList;
    }
    /**
     * @param deleteOptionList the deleteOptionList to set
     */
    public void setDeleteOptionList(List<VehicleMasterVO> deleteOptionList) {
        this.deleteOptionList = deleteOptionList;
    }
    /**
     * @return the vehicleMasterVO
     */
    public VehicleMasterVO getVehicleMasterVO() {
        return vehicleMasterVO;
    }
    /**
     * @param vehicleMasterVO the vehicleMasterVO to set
     */
    public void setVehicleMasterVO(VehicleMasterVO vehicleMasterVO) {
        this.vehicleMasterVO = vehicleMasterVO;
    }
    /**
     * @return the ownerGridVO
     */
    public BaseSaveVO<VehicleMasterVO> getOwnerGridVO() {
        return ownerGridVO;
    }
    /**
     * @param ownerGridVO the ownerGridVO to set
     */
    public void setOwnerGridVO(BaseSaveVO<VehicleMasterVO> ownerGridVO) {
        this.ownerGridVO = ownerGridVO;
    }
    /**
     * @return the driverGridVO
     */
    public BaseSaveVO<VehicleMasterVO> getDriverGridVO() {
        return driverGridVO;
    }
    /**
     * @param driverGridVO the driverGridVO to set
     */
    public void setDriverGridVO(BaseSaveVO<VehicleMasterVO> driverGridVO) {
        this.driverGridVO = driverGridVO;
    }
    
    public String getOpFlag() {
		return opFlag;
	}
	public void setOpFlag(String opFlag) {
		this.opFlag = opFlag;
	}
	/**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
