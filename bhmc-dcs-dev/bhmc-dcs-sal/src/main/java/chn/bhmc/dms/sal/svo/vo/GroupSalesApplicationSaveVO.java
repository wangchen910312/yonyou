package chn.bhmc.dms.sal.svo.vo;


import java.util.List;

import javax.validation.Valid;

import chn.bhmc.dms.core.datatype.BaseSaveVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GroupSalesApplicationSaveVO
 * @Description : 집단 판매 신청 VO
 * @author Bong
 * @since 2016. 3. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 3. 20.    Bong              최초 생성
 * </pre>
 */

public class GroupSalesApplicationSaveVO extends BaseSaveVO<GroupSalesApplicationVO> {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7325236452633850428L;


    private String dlrCd;
    private String usrId;
    private int reqSeq;

    
    GroupSalesApplicationVO groupSalesApplicationVO;

    BaseSaveVO<GroupSalesApplicationVehVO> vehicleVO;

    /**
     * 법인 - 집단판매신청 목록
     */
    @Valid
    private GroupSalesApplicationVO groupSalesApplication;

    /**
     * 법인 - 집단판매신청 차량정보 신규 목록
     */
    @Valid
    private List<GroupSalesApplicationVehVO> insertGroupSalesApplicationVehList;

    /**
     * 법인 - 집단판매신청 차량 정보 수정 목록
     */
    @Valid
    private List<GroupSalesApplicationVehVO> updateGroupSalesApplicationVehList;

    /**
     * 법인 - 집단판매신청 차량 정보 삭제 목록
     */
    @Valid
    private List<GroupSalesApplicationVehVO> deleteGroupSalesApplicationVehList;

    /**
     * 법인 - 집단판매신청 팝업 적용 목록
     */
    @Valid
    private List<GroupSalesApplicationPopupVO> applyList;






    public GroupSalesApplicationVO getGroupSalesApplicationVO() {
		return groupSalesApplicationVO;
	}

	public void setGroupSalesApplicationVO(GroupSalesApplicationVO groupSalesApplicationVO) {
		this.groupSalesApplicationVO = groupSalesApplicationVO;
	}

	public BaseSaveVO<GroupSalesApplicationVehVO> getVehicleVO() {
		return vehicleVO;
	}

	public void setVehicleVO(BaseSaveVO<GroupSalesApplicationVehVO> vehicleVO) {
		this.vehicleVO = vehicleVO;
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
     * @return the reqSeq
     */
    public int getReqSeq() {
        return reqSeq;
    }

    /**
     * @param reqSeq the reqSeq to set
     */
    public void setReqSeq(int reqSeq) {
        this.reqSeq = reqSeq;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * @return the groupSalesApplication
     */
    public GroupSalesApplicationVO getGroupSalesApplication() {
        return groupSalesApplication;
    }

    /**
     * @param groupSalesApplication the groupSalesApplication to set
     */
    public void setGroupSalesApplication(GroupSalesApplicationVO groupSalesApplication) {
        this.groupSalesApplication = groupSalesApplication;
    }

    /**
     * @return the insertGroupSalesApplicationVehList
     */
    public List<GroupSalesApplicationVehVO> getInsertGroupSalesApplicationVehList() {
        return insertGroupSalesApplicationVehList;
    }

    /**
     * @param insertGroupSalesApplicationVehList the insertGroupSalesApplicationVehList to set
     */
    public void setInsertGroupSalesApplicationVehList(List<GroupSalesApplicationVehVO> insertGroupSalesApplicationVehList) {
        this.insertGroupSalesApplicationVehList = insertGroupSalesApplicationVehList;
    }

    /**
     * @return the updateGroupSalesApplicationVehList
     */
    public List<GroupSalesApplicationVehVO> getUpdateGroupSalesApplicationVehList() {
        return updateGroupSalesApplicationVehList;
    }

    /**
     * @param updateGroupSalesApplicationVehList the updateGroupSalesApplicationVehList to set
     */
    public void setUpdateGroupSalesApplicationVehList(List<GroupSalesApplicationVehVO> updateGroupSalesApplicationVehList) {
        this.updateGroupSalesApplicationVehList = updateGroupSalesApplicationVehList;
    }

    /**
     * @return the deleteGroupSalesApplicationVehList
     */
    public List<GroupSalesApplicationVehVO> getDeleteGroupSalesApplicationVehList() {
        return deleteGroupSalesApplicationVehList;
    }

    /**
     * @param deleteGroupSalesApplicationVehList the deleteGroupSalesApplicationVehList to set
     */
    public void setDeleteGroupSalesApplicationVehList(List<GroupSalesApplicationVehVO> deleteGroupSalesApplicationVehList) {
        this.deleteGroupSalesApplicationVehList = deleteGroupSalesApplicationVehList;
    }

    /**
     * @return the applyList
     */
    public List<GroupSalesApplicationPopupVO> getApplyList() {
        return applyList;
    }

    /**
     * @param applyList the applyList to set
     */
    public void setApplyList(List<GroupSalesApplicationPopupVO> applyList) {
        this.applyList = applyList;
    }





}
