package chn.bhmc.dms.sal.prm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.sal.prm.vo.PromotionSaveVO;
import chn.bhmc.dms.sal.prm.vo.PromotionSearchVO;
import chn.bhmc.dms.sal.prm.vo.PromotionVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PromotionDAO.java
 * @Description : 프로모션 관리
 * @author Kim yewon
 * @since 2016. 1. 15
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 15      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("promotionDAO")
public interface PromotionDAO {

    /**
      * 조회 조건에 해당하는 프로모션 목록 정보를 조회한다.
      */
    public List<PromotionVO> selectPromotionByCondition(PromotionSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 프로모션 목록 총 갯수를 조회한다.
     */
    public int selectPromotionByConditionCnt(PromotionSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 프로모션 대상고객을 조회한다.
     */
    public List<PromotionVO> selectPromotionCustByCondition(PromotionSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 프로모션 대상모델을 조회한다.
     */
    public List<PromotionVO> selectPromotionTargetModelByCondition(PromotionSearchVO searchVO);


    /**
     * 프로모션 승인요청처리 한다.
     */
    public boolean approvalReqPromotion(PromotionVO vo);


    /**
     * 프로모션 승인처리 한다.
     */
    public boolean promotionApproval(PromotionVO vo);


    /**
     * 프로모션 삭제한다.
     */
    public boolean deletePromotion(PromotionVO vo);


    /**
     * 프로모션 신규추가 한다.
     */
    public boolean insertPromotion(PromotionVO vo);


    /**
     * 프로모션 수정 한다.
     */
    public boolean updatePromotion(PromotionVO vo);


    /**
     * 프로모션 대상계약유형을 삭제한다.(등록,수정 ==> 삭제후 insert)
     */
    public boolean deleteContractTp(PromotionSaveVO vo);


    /**
     * 프로모션 대상계약유형을 등록 수정한다.
     */
    public boolean createContractTp(PromotionSaveVO vo);


    /**
     * 프로모션 대상고객 등록.
     */
    public boolean insertCust(PromotionVO vo);



    /**
     * 프로모션 대상고객 삭제.
     */
    public boolean deleteCust(PromotionVO vo);



    /**
     * 프로모션 대상모델 등록.
     */
    public boolean insertModel(PromotionVO vo);


    /**
     * 프로모션 대상모델 삭제.
     */
    public boolean deleteModel(PromotionVO vo);


    /**
     * 마지막 등록된 프로모션코드를 조회.
     */
    public String selectPromotionCd(String dlrCd);


    public PromotionVO selectPromotionCustByKey(@Param("dlrCd") String dlrCd, @Param("promotionCd") String promotionCd, @Param("custCd") String custCd);
    public int insertPromotionCust(PromotionVO promotionVO);
    public int updatePromotionCust(PromotionVO promotionVO);


}
