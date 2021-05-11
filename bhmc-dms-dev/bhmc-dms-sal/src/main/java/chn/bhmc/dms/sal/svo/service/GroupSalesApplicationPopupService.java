package chn.bhmc.dms.sal.svo.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.FileItemVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationJdgVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationPopupVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationSaveVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationSearchVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationVehVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterPopupVO;




/**
 *  집단판매 신청 서비스
 *
 * @author Bong
 * @since 2016. 3. 20.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.20         Bong            최초 생성
 * </pre>
 */

public interface GroupSalesApplicationPopupService {


    /**
     * 법인 - 집단판매 신청 메인 조회 (Grid)
     */
    public int selectGroupSalesApplicationByConditionCnt(GroupSalesApplicationSearchVO searchVO) throws Exception;
    public List<GroupSalesApplicationVO> selectGroupSalesApplicationByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception;

    /**
     * 법인 - 집단판매요청 적용 차량 조회
     */
    public List<GroupSalesApplicationPopupVO> applyGroupSalesApplicationPopup(GroupSalesApplicationSaveVO searchVO) throws Exception;

    /**
     * 법인 - 집단판매 신청 상세 조회
     */
    public List<GroupSalesApplicationVO> selectGroupSalesApplicationDetailByCondition(GroupSalesApplicationVO searchVO) throws Exception;

    /**
     * 법인 - 집단판매 신청 차량상세 조회
     */
    public List<GroupSalesApplicationVehVO> selectGroupSalesApplicationDetVehByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception;

    /**
     * 법인 - 집단판매 신청 차량심사 상세 조회
     */
    public List<GroupSalesApplicationJdgVO> selectGroupSalesApplicationDetJdgByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception;

    /**
     * 법인 - 집단 판매신청 저장/수정 (SA_0414T)
     */
    public GroupSalesApplicationVO multiGroupSalesApplication(GroupSalesApplicationSaveVO saveVO) throws Exception;


    /**
     * 법인 - 집단 판매신청 확정 (SA_0414T)
     */
    public GroupSalesApplicationVO updateGroupSalesApplicationCnfrm(GroupSalesApplicationVO saveVO) throws Exception;

    /**
     * 법인 - 집단 판매신청 삭제 (SA_0413T, SA_0414T, SA_0415T)
     */
    public int deleteGroupSalesApplication(GroupSalesApplicationVO delVO) throws Exception;



    /**
     * 법인 - 집단 판매신청 저장/수정 (SA_0413T, SA_0415T)
     */
    public List<GroupSalesApplicationVehVO> groupSalesApplication(GroupSalesApplicationSaveVO saveVO) throws Exception;


    //집단판매신청 시 조회할 차량(팝업)
    public int selectVehicleInfoByConditionCnt(GroupSalesApplicationSearchVO searchVO) throws Exception;
    public List<VehicleMasterPopupVO> selectVehicleInfoByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception;
    public List<VehicleMasterPopupVO> selectDcsVehicleInfoByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception;


    //집단판매신청된 차량을 상세조회.
    public int selectDetlVehPopByConditionCnt(GroupSalesApplicationSearchVO searchVO) throws Exception;
    public List<GroupSalesApplicationVehVO> selectDetlVehPopByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception;


    /**
    *
    * 스펙 사용여부
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
    public List<VehicleMasterPopupVO> selectVehicleInfoUseYnByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception;

    /**
     * 집단판매신청된 차량 삭제
     */
    public void deleteGroupSalesVeh(GroupSalesApplicationSaveVO VO) throws Exception;


    public void updateGroupSalesFile(GroupSalesApplicationVehVO vehVO) throws Exception;
    /**
     * 추가된 보충자료 파일의 저장과 인터페이스 미들테이블에의 삽입
     *
     * @param vehVO
     */
    public void updateSaveAddFile(GroupSalesApplicationVehVO vehVO) throws Exception;

    /**
     *
     * 저장된 파일 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<FileItemVO> selectGroupSalesFileByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 법인 - 집단판매 신청 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationVO
     * @return 조회 목록
     */
    public GroupSalesApplicationVO selectGroupSalesApplicationDetailByKey(GroupSalesApplicationSearchVO searchVO) throws Exception;

}
