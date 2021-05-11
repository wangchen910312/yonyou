package chn.bhmc.dms.ser.res.service;

import java.util.List;

import chn.bhmc.dms.ser.res.vo.RescueSaveVO;
import chn.bhmc.dms.ser.res.vo.RescueSearchVO;
import chn.bhmc.dms.ser.res.vo.RescueVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RescueService.java
 * @Description : 구원서비스 Service
 * @author YIN XUEYUAN
 * @since 2016. 6. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 19.   YIN XUEYUAN     최초 생성
 * </pre>
 */

public interface RescueService {

    /**
     * 조회 조건에 해당하는 구원서비스 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RescueSearchVO
     * @return 조회 목록
     */
    public int selectRescueByConditionCnt(RescueSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 구원서비스를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RescueSearchVO
     * @return 조회 목록
     */
    public List<RescueVO> selectRescueByCondition(RescueSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 구원서비스현황 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RescueSearchVO
     * @return 조회 목록
     */
    public int selectRescueListByConditionCnt(RescueSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 구원서비스현황 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RescueSearchVO
     * @return 조회 목록
     */
    public List<RescueVO> selectRescueListByCondition(RescueSearchVO searchVO)throws Exception;

    /**
     * 구원서비스, 부품, 공임을 등록/수정한다.
     * @param reservationReceiptSaveVO - 구원/부품/공임을 포함하는 RescueSaveVO
     * @return
     */
    public String multiRescue(RescueSaveVO rescueSaveVO) throws Exception;

    /**
     * 구원서비스를 등록/수정한다.
     * @param vo - 구원/부품/공임을 포함하는 RescueSaveVO
     * @return
     */
    public void updateRescue(RescueVO vo) throws Exception;

    /**
     *
     * 구원서비스를 등록한다.
     *
     * @param vo
     * @throws Exception
     */
    public String insertRescue(RescueVO vo) throws Exception;


    /**
     * 조회 조건에 해당하는 구원 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RescueSearchVO
     * @return 조회 목록
     */
    public RescueVO selectRescueByKey(RescueSearchVO searchVO) throws Exception;


}