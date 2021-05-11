package chn.bhmc.dms.crm.dmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcSearchVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipCalcDAO.java
 * @Description : 블루멤버십 정산 DAO
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

@Mapper("blueMembershipCalcDAO")
public interface BlueMembershipCalcDAO {
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
}
