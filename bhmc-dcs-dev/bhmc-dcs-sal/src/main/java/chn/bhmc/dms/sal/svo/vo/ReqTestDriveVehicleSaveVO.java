package chn.bhmc.dms.sal.svo.vo;


import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : reqTestDriveVehicleSaveVO
 * @Description : 시승차량 신청 VO
 * @author Bong
 * @since 2016. 3. 03.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 3. 03.    Bong              최초 생성
 * </pre>
 */

public class ReqTestDriveVehicleSaveVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7325236452633850428L;

    @Valid
    private ReqTestDriveVehicleVO reqTestDriveVehicleVO;

    /**
     * 차량 추가목록
     */
    @Valid
    private List<ReqTestDriveVehiclePopupCarVO> insertTestDriveVehicleList = new ArrayList<ReqTestDriveVehiclePopupCarVO>();

    /**
     * 차량 수정목록
     */
    @Valid
    private List<ReqTestDriveVehiclePopupCarVO> updateTestDriveVehicleList = new ArrayList<ReqTestDriveVehiclePopupCarVO>();

    /**
     * 차량 삭제목록
     */
    private List<ReqTestDriveVehiclePopupCarVO> deleteTestDriveVehicleList = new ArrayList<ReqTestDriveVehiclePopupCarVO>();

    /**
     * @return the reqTestDriveVehicleVO
     */
    public ReqTestDriveVehicleVO getReqTestDriveVehicleVO() {
        return reqTestDriveVehicleVO;
    }

    /**
     * @param reqTestDriveVehicleVO the reqTestDriveVehicleVO to set
     */
    public void setReqTestDriveVehicleVO(ReqTestDriveVehicleVO reqTestDriveVehicleVO) {
        this.reqTestDriveVehicleVO = reqTestDriveVehicleVO;
    }

    /**
     * @return the insertTestDriveVehicleList
     */
    public List<ReqTestDriveVehiclePopupCarVO> getInsertTestDriveVehicleList() {
        return insertTestDriveVehicleList;
    }

    /**
     * @param insertTestDriveVehicleList the insertTestDriveVehicleList to set
     */
    public void setInsertTestDriveVehicleList(List<ReqTestDriveVehiclePopupCarVO> insertTestDriveVehicleList) {
        this.insertTestDriveVehicleList = insertTestDriveVehicleList;
    }

    /**
     * @return the updateTestDriveVehicleList
     */
    public List<ReqTestDriveVehiclePopupCarVO> getUpdateTestDriveVehicleList() {
        return updateTestDriveVehicleList;
    }

    /**
     * @param updateTestDriveVehicleList the updateTestDriveVehicleList to set
     */
    public void setUpdateTestDriveVehicleList(List<ReqTestDriveVehiclePopupCarVO> updateTestDriveVehicleList) {
        this.updateTestDriveVehicleList = updateTestDriveVehicleList;
    }

    /**
     * @return the deleteTestDriveVehicleList
     */
    public List<ReqTestDriveVehiclePopupCarVO> getDeleteTestDriveVehicleList() {
        return deleteTestDriveVehicleList;
    }

    /**
     * @param deleteTestDriveVehicleList the deleteTestDriveVehicleList to set
     */
    public void setDeleteTestDriveVehicleList(List<ReqTestDriveVehiclePopupCarVO> deleteTestDriveVehicleList) {
        this.deleteTestDriveVehicleList = deleteTestDriveVehicleList;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }



}
