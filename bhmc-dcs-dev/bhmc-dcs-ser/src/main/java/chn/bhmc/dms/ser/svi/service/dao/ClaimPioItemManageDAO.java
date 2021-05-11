package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.svi.vo.ClaimPioItemSearchVO;
import chn.bhmc.dms.ser.svi.vo.ClaimPioItemVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimPioItemManageDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 1.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Mapper("claimPioItemManageDAO")
public interface ClaimPioItemManageDAO {

    /**
    *
    * PIO 부품 등록
    *
    * @param claimPioItemVO
    * @return
    * @throws Exception
    */
   public int insertClaimPioItemManage(ClaimPioItemVO claimPioItemVO)throws Exception;

   /**
    *
    * PIO 부품 수정
    *
    * @param claimPioItemVO
    * @return
    * @throws Exception
    */
   public int updateClaimPioItemManage(ClaimPioItemVO claimPioItemVO)throws Exception;

   /**
    *
    * PIO 부품 삭제
    *
    * @param claimPioItemVO
    * @return
    * @throws Exception
    */
   public int deleteClaimPioItemManage(ClaimPioItemVO claimPioItemVO)throws Exception;


   /**
    *
    * PIO 부품 목록수
    *
    * @param claimPioItemVO
    * @return
    * @throws Exception
    */
   public int selectClaimPioItemManageByConditionCnt(ClaimPioItemSearchVO searchVO)throws Exception;


   /**
    *
    * PIO 부품 목록
    *
    * @param claimPioItemVO
    * @return
    * @throws Exception
    */
   public List<ClaimPioItemVO> selectClaimPioItemManageByCondition(ClaimPioItemSearchVO searchVO)throws Exception;


}
