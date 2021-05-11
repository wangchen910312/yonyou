package chn.bhmc.dms.sal.prm.service;

import java.util.List;

import chn.bhmc.dms.sal.prm.vo.PromotionSaveVO;
import chn.bhmc.dms.sal.prm.vo.PromotionSearchVO;
import chn.bhmc.dms.sal.prm.vo.PromotionVO;

/**
 * 프로모션 관리
 *
 * @author Kim yewon
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                       수정자                              수정내용
 *  ----------------   ------------    ---------------------------
 *   2016.02.15         Kim yewon            최초 생성
 * </pre>
 */

public interface PromotionService {


	/**
     * 조회 조건에 해당하는 프로모션 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PromotionSearchVO
     * @return 조회 목록
     */
	public List<PromotionVO> selectPromotionByCondition(PromotionSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 차량마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PromotionSearchVO
     * @return
     */
	public int selectPromotionByConditionCnt(PromotionSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 프로모션 대상고객을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PromotionSearchVO
     * @return 조회 목록
     */
    public List<PromotionVO> selectPromotionCustByCondition(PromotionSearchVO searchVO) throws Exception;

    /**
    * 조회 조건에 해당하는 프로모션 대상 모델을 조회한다.
    * @param searchVO - 조회 조건을 포함하는 PromotionSearchVO
    * @return 조회 목록
    */
   public List<PromotionVO> selectPromotionTargetModelByCondition(PromotionSearchVO searchVO) throws Exception;


   /**
    * 프로모션 승인요청.
    * @param VO - PromotionVO
    * @return 성공 int = 1
    * @throws Exception
    */
   public boolean approvalReqPromotion(PromotionVO VO) throws Exception;


   /**
    * 프로모션 승인.
    * @param VO - PromotionVO
    * @return 성공 int = 1
    * @throws Exception
    */
   public boolean promotionApproval(PromotionVO VO) throws Exception;


   /**
    * 프로모션 삭제.
    * @param VO - PromotionVO
    * @return
    * @throws Exception
    */
   public boolean deletePromotion(PromotionVO VO) throws Exception;


   /**
    * 프로모션 등록
    * @param VO -  PromotionSaveVO
    * @return
    */
   public void insertSavePromotion(PromotionSaveVO VO) throws Exception;



   /**
    * 프로모션 수정.
    * @param VO -  PromotionSaveVO
    * @return
    */
   public void updateSavePromotion(PromotionSaveVO VO) throws Exception;


   /**
    * 프로모션 - 대상고객저장.
    * @param VO -  PromotionSaveVO
    * @return
    */
   public void insertPromotionCustUpload(List<PromotionVO> list,String dlrCd,String promotionCd) throws Exception;



   public int insertPromotionCust(PromotionVO promotionVO) throws Exception;



   public PromotionVO selectPromotionCustByKey(String dlrCd, String promotionCd, String custNo) throws Exception;


}
