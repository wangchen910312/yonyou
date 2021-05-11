package chn.bhmc.dms.crm.dmm.service;

import java.util.List;

import chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcSearchVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipCalcService.java
 * @Description : 블루멤버십 정산 interface
 * @author Kim Hyun Ho
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public interface BlueMembershipCalcService {
    /**
     * 조회 조건에 해당하는 블루멤버십 정산목록 수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipCalcSearchVO
     * @return
     */
    public int selectBlueMembershipCalcsByConditionCnt(BlueMembershipCalcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 블루멤버십 정산 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipCalcSearchVO
     * @return 조회 목록
     */
    public List<BlueMembershipCalcVO> selectBlueMembershipCalcsByCondition(BlueMembershipCalcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 블루멤버십 정산 Total 포인트 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipCalcSearchVO
     * @return 조회 목록
     */
    public BlueMembershipCalcVO selectBluePointInfosCondition(BlueMembershipCalcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 블루멤버십 정산 상세목록 수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipCalcSearchVO
     * @return
     */
    public int selectBlueMembershipCalcDetailsByConditionCnt(BlueMembershipCalcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 블루멤버십 정산 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipCalcSearchVO
     * @return 조회 목록
     */
    public List<BlueMembershipCalcVO> selectBlueMembershipCalcDetailsByCondition(BlueMembershipCalcSearchVO searchVO) throws Exception;

    /**
     * 블루멤버십 Total 포인트 정보를 조회한다. (인터페이스)
     * @param searchVO - 검색할 정보가 담긴 BlueMembershipCalcSearchVO
     * @return BlueMembershipCalcVO
     */
    public BlueMembershipCalcVO selectBlueMembershipTotPointIfByKey(BlueMembershipCalcSearchVO searchVO) throws Exception;
}
