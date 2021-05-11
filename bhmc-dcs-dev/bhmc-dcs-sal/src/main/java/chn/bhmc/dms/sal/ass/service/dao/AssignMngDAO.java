package chn.bhmc.dms.sal.ass.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.ass.vo.AssignSearchVO;
import chn.bhmc.dms.sal.ass.vo.AssignVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AssignMngDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 3. 3
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 3      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("assignMngDAO")
public interface AssignMngDAO {

    /**
      * 조회 조건에 해당하는 배정 정보를 조회한다.
      */
    public List<AssignVO> selectAssignByCondition(AssignSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 배정목록 총 갯수를 조회한다.
     */
    public int selectAssignByConditionCnt(AssignSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 배정팝업목록 정보를 조회한다.
     */
    public List<AssignVO> selectAssignPopupListByCondition(AssignSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 배정팝업목록 총 갯수를 조회한다.
     */
    public int selectAssignPopupListByConditionCnt(AssignSearchVO searchVO);


    /**
     *  배정관리 - 배정처리 (배정되였던 계약번호인지를 확인한다.)
     */
    public String selectContractNo(String contractNo);


    /**
     *  배정관리 - 배정처리한다.
     */
    public boolean insertVehicleAssign(AssignVO assignVO);


    /**
     *  배정관리 - 배정처리한다.
     */
    public boolean insertVehicleAssignH(AssignVO assignVO);


    /**
     *  배정관리 - 계약정보를 업데이트 한다.
     */
    public boolean updateAssignOrder(AssignVO assignVO);


    /**
     *  배정관리 - 차량정보를 업데이트 한다.
     */
    public boolean updateAssignVehicle(AssignVO assignVO);


    /**
     *  배정관리 - 배정취소 - 배정테이블 (STS - 02) 변경.
     */
    public boolean updateVehicleAssign(AssignVO assignVO);


    /**
     *  배정관리 - 배정취소 - 배정테이블 삭제.
     */
    public boolean deleteVehicleAssign(AssignVO assignVO);


    /**
     *  배정관리 - 차량교환 - 배정테이블 업데이트1.
     */
    public boolean updateVehicleExchangeO(AssignVO assignVO);


    /**
     *  배정관리 - 차량교환 - 배정테이블 업데이트2.
     */
    public boolean updateVehicleExchangeT(AssignVO assignVO);


    /**
     *  배정관리 - 차량교환 - 배정히스토리테이블 isnert.
     */
    public boolean insertExchangeH(AssignVO assignVO);


    /**
     * 조회 조건에 해당하는 배정계약현황을 조회한다.
     */
    public List<AssignVO> selectAssignStsByCondition(AssignSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 배정계약현황목록 총 갯수를 조회한다.
     */
    public int selectAssignStsByConditionCnt(AssignSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 배정취소이력현황을 조회한다.
     */
    public List<AssignVO> selectAssignCancelStsByCondition(AssignSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 배정취소이력목록 총 갯수를 조회한다.
     */
    public int selectAssignCancelStsByConditionCnt(AssignSearchVO searchVO);


}
