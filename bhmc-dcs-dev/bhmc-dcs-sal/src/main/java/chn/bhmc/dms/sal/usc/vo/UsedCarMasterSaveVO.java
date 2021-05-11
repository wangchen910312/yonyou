package chn.bhmc.dms.sal.usc.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarMasterSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 6. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 3.     Kim yewom              최초 생성
 * </pre>
 */

public class UsedCarMasterSaveVO extends BaseSaveVO<UsedCarMasterVO>  {

    private static final long serialVersionUID = -404572985973453926L;

    UsedCarMasterVO usedCarMasterVO;
    BaseSaveVO<UsedCarMasterVO> ownerGridVO;
    BaseSaveVO<UsedCarMasterVO> driverGridVO;


    // 차량소유자
    @Valid
    private List<UsedCarMasterVO> insertOwnerList = new ArrayList<UsedCarMasterVO>();
    @Valid
    private List<UsedCarMasterVO> updateOwnerList = new ArrayList<UsedCarMasterVO>();
    @Valid
    private List<UsedCarMasterVO> deleteOwnerList = new ArrayList<UsedCarMasterVO>();

    // 차량운전자
    @Valid
    private List<UsedCarMasterVO> insertDriverList = new ArrayList<UsedCarMasterVO>();
    private List<UsedCarMasterVO> updateDriverList = new ArrayList<UsedCarMasterVO>();
    private List<UsedCarMasterVO> deleteDriverList = new ArrayList<UsedCarMasterVO>();






    /**
     * @return the ownerGridVO
     */
    public BaseSaveVO<UsedCarMasterVO> getOwnerGridVO() {
        return ownerGridVO;
    }
    /**
     * @param ownerGridVO the ownerGridVO to set
     */
    public void setOwnerGridVO(BaseSaveVO<UsedCarMasterVO> ownerGridVO) {
        this.ownerGridVO = ownerGridVO;
    }
    /**
     * @return the driverGridVO
     */
    public BaseSaveVO<UsedCarMasterVO> getDriverGridVO() {
        return driverGridVO;
    }
    /**
     * @param driverGridVO the driverGridVO to set
     */
    public void setDriverGridVO(BaseSaveVO<UsedCarMasterVO> driverGridVO) {
        this.driverGridVO = driverGridVO;
    }
    /**
     * @return the usedCarMasterVO
     */
    public UsedCarMasterVO getUsedCarMasterVO() {
        return usedCarMasterVO;
    }
    /**
     * @param usedCarMasterVO the usedCarMasterVO to set
     */
    public void setUsedCarMasterVO(UsedCarMasterVO usedCarMasterVO) {
        this.usedCarMasterVO = usedCarMasterVO;
    }
    /**
     * @return the insertOwnerList
     */
    public List<UsedCarMasterVO> getInsertOwnerList() {
        return insertOwnerList;
    }
    /**
     * @param insertOwnerList the insertOwnerList to set
     */
    public void setInsertOwnerList(List<UsedCarMasterVO> insertOwnerList) {
        this.insertOwnerList = insertOwnerList;
    }
    /**
     * @return the updateOwnerList
     */
    public List<UsedCarMasterVO> getUpdateOwnerList() {
        return updateOwnerList;
    }
    /**
     * @param updateOwnerList the updateOwnerList to set
     */
    public void setUpdateOwnerList(List<UsedCarMasterVO> updateOwnerList) {
        this.updateOwnerList = updateOwnerList;
    }
    /**
     * @return the deleteOwnerList
     */
    public List<UsedCarMasterVO> getDeleteOwnerList() {
        return deleteOwnerList;
    }
    /**
     * @param deleteOwnerList the deleteOwnerList to set
     */
    public void setDeleteOwnerList(List<UsedCarMasterVO> deleteOwnerList) {
        this.deleteOwnerList = deleteOwnerList;
    }
    /**
     * @return the insertDriverList
     */
    public List<UsedCarMasterVO> getInsertDriverList() {
        return insertDriverList;
    }
    /**
     * @param insertDriverList the insertDriverList to set
     */
    public void setInsertDriverList(List<UsedCarMasterVO> insertDriverList) {
        this.insertDriverList = insertDriverList;
    }
    /**
     * @return the updateDriverList
     */
    public List<UsedCarMasterVO> getUpdateDriverList() {
        return updateDriverList;
    }
    /**
     * @param updateDriverList the updateDriverList to set
     */
    public void setUpdateDriverList(List<UsedCarMasterVO> updateDriverList) {
        this.updateDriverList = updateDriverList;
    }
    /**
     * @return the deleteDriverList
     */
    public List<UsedCarMasterVO> getDeleteDriverList() {
        return deleteDriverList;
    }
    /**
     * @param deleteDriverList the deleteDriverList to set
     */
    public void setDeleteDriverList(List<UsedCarMasterVO> deleteDriverList) {
        this.deleteDriverList = deleteDriverList;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }



}
