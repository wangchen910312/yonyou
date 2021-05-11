package chn.bhmc.dms.sal.ctl.service;

import java.util.List;

import chn.bhmc.dms.sal.ctl.vo.OneShotCtrlMngSaveVO;
import chn.bhmc.dms.sal.ctl.vo.OneShotCtrlMngSearchVO;
import chn.bhmc.dms.sal.ctl.vo.OneShotCtrlMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OneShotCtrlMngService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 11. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 10.     Lee Seungmin     최초 생성
 * </pre>
 */

public interface OneShotCtrlMngService {

    /**
     * 조회 조건에 해당하는 좌측 전략출고를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeadlineCtrlMngSearchVO
     * @return 조회 목록
     */
    public List<OneShotCtrlMngVO> selectOneShotLeftByCondition(OneShotCtrlMngSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 좌측 전략출고 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeadlineCtrlMngSearchVO
     * @return
     */
    public int selectOneShotLeftByConditionCnt(OneShotCtrlMngSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 우측 소매출고, 소매출고취소, 전략출고취소를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeadlineCtrlMngSearchVO
     * @return 조회 목록
     */
    public List<OneShotCtrlMngVO> selectOneShotRightByCondition(OneShotCtrlMngSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 우측 소매출고, 소매출고취소, 전략출고취소를 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeadlineCtrlMngSearchVO
     * @return
     */
    public int selectOneShotRightByConditionCnt(OneShotCtrlMngSearchVO searchVO) throws Exception;

    /**
     * 입력, 수정를 한꺼번에 수행한다.
     * @param saveVO - 입력, 수정 데이터가 포함된 CommonCodeSaveVO
     * @return
     */
    public void saveOneShotCtrlMng(OneShotCtrlMngSaveVO saveVO) throws Exception;

    /**
     * 딜러들의 좌측 마감통제를 일괄 입력, 수정를 한꺼번에 수행한다.
     * @param saveVO - 입력, 수정 데이터가 포함된 CommonCodeSaveVO
     * @return
     */
    public void saveOneShotCtrlMngAll(OneShotCtrlMngSaveVO saveVO) throws Exception;

    /**
     * 딜러들의 우측 마감통제를 일괄 입력, 수정를 한꺼번에 수행한다.
     * @param saveVO - 입력, 수정 데이터가 포함된 CommonCodeSaveVO
     * @return
     */
    public void saveOneShotCtrlMngRightAll(OneShotCtrlMngSaveVO saveVO) throws Exception;

    
    /**
     * 모델, 지도가격, 배기등급을 불러온다.
     * @param list
     * @return
     * @throws Exception
     */
    public List<OneShotCtrlMngVO> selectSungCityCondition(List<OneShotCtrlMngVO> list) throws Exception;


}
