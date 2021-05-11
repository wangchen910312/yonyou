package chn.bhmc.dms.sal.usc.service;

import java.util.List;

import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.sal.usc.vo.TopSelectionUsedCarVO;
import chn.bhmc.dms.sal.usc.vo.UsedCarMasterSaveVO;
import chn.bhmc.dms.sal.usc.vo.UsedCarMasterSearchVO;
import chn.bhmc.dms.sal.usc.vo.UsedCarMasterVO;

/**
 * 차량 OCN 구성정보 조회
 *
 * @author Kimyewon
 * @since 2016. 6. 2.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                     수정자                       수정내용
 *  ----------------    ------------    ---------------------------
 *   2016. 6. 2.       Kim yewon         최초 생성
 * </pre>
 */

public interface UsedCarMasterService {

	/**
     * 조회 조건에 해당하는 중고차량마스터정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleOcnSearchVO
     * @return 조회 목록
     */
	public List<UsedCarMasterVO> selectUsedCarMasterByCondition(UsedCarMasterSearchVO searchVO) throws Exception;


	/**
     * 조회 조건에 해당하는  중고차량마스터정보 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UsedCarMasterSearchVO
     * @return
     */
    public int selectUsedCarMasterByConditionCnt(UsedCarMasterSearchVO searchVO);

    /**
     *
     * DCS 정비 이력 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<RepairOrderVO> selectUsedCarRepairOrderByCondition(UsedCarMasterSearchVO searchVO) throws Exception;

    /**
    *
    *  수선 중고차 여부
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
    public int selectUsedCarRepairOrderByConditionCnt(UsedCarMasterSearchVO searchVO) throws Exception;

    //중고차량정보(단건) 조회
    public UsedCarMasterVO selectUsedCar(UsedCarMasterSearchVO searchVO) throws Exception;

    //수선차량정보(단건) 조회
    public TopSelectionUsedCarVO selectTopSelectionCar(String sVinNo) throws Exception;



    //중고차량정보 multi저장.(상세정보 & 차량소유자 & 차량운전자)
    public void multiSaveUsedCar(UsedCarMasterSaveVO saveVO) throws Exception;


    /**
     * 조회 조건에 해당하는 차량소유자 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UsedCarMasterSearchVO
     * @return 조회 목록
     */
    public int selectUsedCarOwnerByConditionCnt(UsedCarMasterSearchVO searchVO) throws Exception;
    public List<UsedCarMasterVO> selectUsedCarOwnerByCondition(UsedCarMasterSearchVO searchVO) throws Exception;


    /**
     * 중고차량마스터 - 차량소유자 저장
     * @param saveVO
     * @return
     * @throws Exception
     */
    public void saveUsedCarOwner(BaseSaveVO<UsedCarMasterVO> obj, UsedCarMasterVO usedCarMasterVO) throws Exception;

    /**
     * 조회 조건에 해당하는 차량운전자 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UsedCarMasterSearchVO
     * @return 조회 목록
     */
    public int selectUsedCarDriverByConditionCnt(UsedCarMasterSearchVO searchVO) throws Exception;
    public List<UsedCarMasterVO> selectUsedCarDriverByCondition(UsedCarMasterSearchVO searchVO) throws Exception;



    /**
     * 중고차량마스터 - 차량운전자 저장
     * @param saveVO
     * @return
     * @throws Exception
     */
    public void saveUsedCarDriver(BaseSaveVO<UsedCarMasterVO> obj,UsedCarMasterVO usedCarMasterVO) throws Exception;


    /**
     * 중고차 - 계약 차량목록 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectUsedCarContsByConditionCnt(UsedCarMasterSearchVO searchVO) throws Exception;
    public List<UsedCarMasterVO> selectUsedCarContsByCondition(UsedCarMasterSearchVO searchVO) throws Exception;


}
