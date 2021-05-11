package chn.bhmc.dms.sal.svo.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationJdgVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationPopupVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationSearchVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationVehVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GroupSalesApplicationDAO
 * @Description : 집단판매 신청 DAO
 * @author Bong
 * @since 2016. 3. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.20     Bong                  최초 생성
 * </pre>
 */

@Mapper("groupSalesApplicationDAO")
public interface GroupSalesApplicationDAO {


    /**
     * 조회 조건에 해당하는 법인 - 집단판매 신청 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationSearchVO
     * @return 조회 목록
     */

    public List<GroupSalesApplicationVO> selectGroupSalesApplicationByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 법인 - 집단판매 신청 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationSearchVO
     * @return
     */
    public int selectGroupSalesApplicationByConditionCnt(GroupSalesApplicationSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 법인 - 집단판매 신청 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationVO
     * @return 조회 목록
     */

    public List<GroupSalesApplicationVO> selectGroupSalesApplicationDetailByCondition(GroupSalesApplicationVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 법인 - 집단판매 신청 차량 상세정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationVO
     * @return 조회 목록
     */

    public List<GroupSalesApplicationVehVO> selectGroupSalesApplicationDetVehByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 법인 - 집단판매 신청 차량심사 상세정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationVO
     * @return 조회 목록
     */

    public List<GroupSalesApplicationJdgVO> selectGroupSalesApplicationDetJdgByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 법인 - 집단판매 신청 팝업 적용 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationSearchVO
     * @return 조회 목록
     */
    public List<GroupSalesApplicationPopupVO> applyGroupSalesApplicationPopup(GroupSalesApplicationPopupVO searchVO) throws Exception;

    /**
     * 법인 - 집단 판매신청 저장/수정/삭제 SA_0414T
     */
    public int insertGroupSalesApplication(GroupSalesApplicationVO saveVO) throws Exception;
    public int updateGroupSalesApplication(GroupSalesApplicationVO saveVO) throws Exception;
    public int updateGroupSalesApplicationCnfrm(GroupSalesApplicationVO saveVO) throws Exception;
    public int deleteGroupSalesApplication(GroupSalesApplicationVO saveVO) throws Exception;

    //신규
    public GroupSalesApplicationVO selectGroupSalesApplication(GroupSalesApplicationVO saveVO) throws Exception;


    /**
     * 조회 조건에 해당하는 법인 - 집단판매 신청 팝업 적용 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationSearchVO
     * @return 조회 목록
     */
    public List<GroupSalesApplicationVehVO> selectGroupSalesApplicationDetGrpByCondition(GroupSalesApplicationVehVO searchVO) throws Exception;

    /**
     * 법인 - 집단 판매신청 차량정보 저장/수정/삭제 SA_0415T
     */
    public int insertGroupSalesApplicationVeh(GroupSalesApplicationVehVO saveVO) throws Exception;
    public int updateGroupSalesApplicationVeh(GroupSalesApplicationVehVO saveVO) throws Exception;
    public int deleteGroupSalesApplicationVeh(GroupSalesApplicationVO saveVO) throws Exception;

    /**
     * 법인 - 집단 판매신청 차량 상세정보 저장/수정/삭제 SA_0413T
     */
    public int insertGroupSalesApplicationVehDet(GroupSalesApplicationVehVO saveVO) throws Exception;
    public int updateGroupSalesApplicationVehDet(GroupSalesApplicationVehVO saveVO) throws Exception;
    public int deleteGroupSalesApplicationVehDet(GroupSalesApplicationVO saveVO) throws Exception;


    /**
     * 조회 조건에 해당하는 차량마스터관리 - PopUp 목록을 조회한다.
     */
    public int selectVehicleInfoByConditionCnt(GroupSalesApplicationSearchVO searchVO) throws Exception;
    public List<VehicleMasterVO> selectVehicleInfoByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 차량마스터관리 - PopUp 목록을 조회한다.
     */
    public int selectDetlVehPopByConditionCnt(GroupSalesApplicationSearchVO searchVO) throws Exception;
    public List<GroupSalesApplicationVehVO> selectDetlVehPopByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception;

    /**
     * 집단판매신청된 차량을 삭제.
     */
    public boolean deleteGroupSalesVehDetl(GroupSalesApplicationVehVO vo);      //집단판매신청명세
    public boolean deleteGroupSalesVehSubHead(GroupSalesApplicationVehVO vo);   //집단판매신청서브헤더




    //집단판매신청정보수신1
    public int procFleetSaleFigureReq1(GroupSalesApplicationVO saveVO) throws Exception;
    //집단판매신청정보수신2
    public int procFleetSaleFigureReq2(GroupSalesApplicationVehVO saveVO) throws Exception;
    //집단판매신청정보수신3
    public int procFleetSaleFigureReq3(GroupSalesApplicationVehVO saveVO) throws Exception;


    //집단판매신청된 차량정보 테이블(SA_0413T) FILE_DOC_ID 수정.
    public boolean updateGroupSalesFile(GroupSalesApplicationVehVO vehVO);

    /**
     * Statements
     *
     * @param vehVO
     */
    public void deleteSaveAddFile(GroupSalesApplicationVehVO vehVO);

    public void updateSaveAddFile(GroupSalesApplicationVehVO vehVO);

    public void updateSaveAddFileForInterface(GroupSalesApplicationVehVO vehVO);

    /**
     * 조회 조건에 해당하는 법인 - 집단판매 신청 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationVO
     * @return 조회 목록
     */
    public GroupSalesApplicationVO selectGroupSalesApplicationDetailByKey(GroupSalesApplicationSearchVO searchVO) throws Exception;

}