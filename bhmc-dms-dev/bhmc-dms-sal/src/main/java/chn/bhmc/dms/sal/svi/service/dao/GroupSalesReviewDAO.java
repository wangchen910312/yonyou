package chn.bhmc.dms.sal.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.svi.vo.GroupSalesReviewSearchVO;
import chn.bhmc.dms.sal.svi.vo.GroupSalesReviewVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GroupSalesReviewDAO
 * @Description : 집단판매 심사 DAO
 * @author Bong
 * @since 2016. 4. 08.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.08     Bong                  최초 생성
 * </pre>
 */

@Mapper("groupSalesReviewDAO")
public interface GroupSalesReviewDAO {


    /**
     * 조회 조건에 해당하는 법인 - 집단판매 신청 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesReviewSearchVO
     * @return 조회 목록
     */

    public List<GroupSalesReviewVO> selectGroupSalesReviewByCondition(GroupSalesReviewSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 법인 - 집단판매 신청 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesReviewSearchVO
     * @return
     */
    public int selectGroupSalesReviewByConditionCnt(GroupSalesReviewSearchVO searchVO) throws Exception;


    /**
     * 법인 - 집단 판매심사 저장/수정/삭제 SA_0414T
     */
    public int insertGroupSalesReview(GroupSalesReviewVO saveVO) throws Exception;


    /**
     * 법인 - 집단 판매심사 UPDATE SA_0414T
     */
    public int updateGroupSalesReview(GroupSalesReviewVO saveVO) throws Exception;


    //프로시저 추가[집단판매신청심사결과 송신]
    public int procPackageReview(GroupSalesReviewVO saveVO) throws Exception;
}