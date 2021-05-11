package chn.bhmc.dms.crm.dmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.BlueMembershipBhmcCalcSearchVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipBhmcCalcVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfCalcPointInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipBhmcCalcDAO.java
 * @Description : 블루멤버십 BHMC 정산 DAO
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

@Mapper("blueMembershipBhmcCalcDAO")
public interface BlueMembershipBhmcCalcDAO {
    /**
     * 조회 조건에 해당하는 블루멤버십 정산목록 수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipBhmcCalcSearchVO
     * @return
     */
    public int selectBlueMembershipCalcsByConditionCnt(BlueMembershipBhmcCalcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 블루멤버십 정산 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipBhmcCalcSearchVO
     * @return 조회 목록
     */
    public List<BlueMembershipBhmcCalcVO> selectBlueMembershipCalcsByCondition(BlueMembershipBhmcCalcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 블루멤버십 정산 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipBhmcCalcSearchVO
     * @return 조회 목록
     */
    public BlueMembershipBhmcCalcVO selectBlueMembershipCalcsByKey(BlueMembershipBhmcCalcVO bhmcCalcVO) throws Exception;

    /**
     * 조회 조건에 해당하는 블루멤버십 정산 상세목록 수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipBhmcCalcSearchVO
     * @return
     */
    public int selectBlueMembershipCalcDetailsByConditionCnt(BlueMembershipBhmcCalcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 블루멤버십 정산 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipBhmcCalcSearchVO
     * @return 조회 목록
     */
    public List<BlueMembershipCalcVO> selectBlueMembershipCalcDetailsByCondition(BlueMembershipBhmcCalcSearchVO searchVO) throws Exception;

    /**
     * 블루멤버십 정상 동의여부 저장
     * @param searchVO - BlueMembershipBhmcCalcVO
     * @return 수정 Cnt
     */
    public int updateCalcAcceptInfo(BlueMembershipBhmcCalcVO bhmcCalcVO) throws Exception;

    /**
     * 블루멤버십 정산 상세정보 (정산응답 요청작업시 param으로 보내는 리스트)
     * @param searchVO - BlueMembershipBhmcCalcSearchVO
     * @return 블루멤버십 정산 상세정보
     */
    public List<BlueMembershipIfCalcPointInfoVO> selectBlueMembershipPointInfosByCondition(BlueMembershipBhmcCalcSearchVO searchVO);
}