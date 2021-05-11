package chn.bhmc.dms.sal.svi.service;

import java.util.List;

import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationSearchVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationVehVO;

import chn.bhmc.dms.cmm.sci.vo.FileItemVO;

import chn.bhmc.dms.sal.svi.vo.GroupSalesReviewSaveVO;
import chn.bhmc.dms.sal.svi.vo.GroupSalesReviewSearchVO;
import chn.bhmc.dms.sal.svi.vo.GroupSalesReviewVO;




/**
 *  집단판매 심사 서비스
 *
 * @author Bong
 * @since 2016. 4. 08.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.08         Bong            최초 생성
 * </pre>
 */

public interface GroupSalesReviewService {


    /**
     * 법인 - 집단판매 신청 메인 조회 (Grid)
     */
    public int selectGroupSalesReviewByConditionCnt(GroupSalesReviewSearchVO searchVO) throws Exception;
    public List<GroupSalesReviewVO> selectGroupSalesReviewByCondition(GroupSalesReviewSearchVO searchVO) throws Exception;

    public List<GroupSalesReviewVO> selectGroupSalesReviewExcelByCondition(GroupSalesReviewSearchVO searchVO) throws Exception;


    //집단판매신청된 차량을 상세조회.
    public int selectDetlVehPopByConditionCnt(GroupSalesReviewSearchVO searchVO) throws Exception;
    public List<GroupSalesReviewVO> selectDetlVehPopByCondition(GroupSalesReviewSearchVO searchVO) throws Exception;



    /**
     * 법인 - 집단 판매신청 저장/수정 (SA_0413T, SA_0414T, SA_0415T)
     */
    public int saveGroupSalesReview(GroupSalesReviewSaveVO saveVO) throws Exception;

    /**
    *
    * 등록된 파일 조회
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
    public List<FileItemVO> selectGroupSalesFileByCondition(GroupSalesReviewSearchVO searchVO) throws Exception;




}
