package chn.bhmc.dms.ser.wac.service;

import java.util.List;

import chn.bhmc.dms.ser.wac.vo.SanbaoReturnSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoReturnVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoReturnApproveService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 7. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 26.     Kwon ki hyun     최초 생성
 * </pre>
 */

public interface SanbaoReturnApproveService {

    /**
    *
    * 삼포반품 승인 상세
    *
    * @return
    * @throws Exeption
    */
   public SanbaoReturnVO selectSanbaoReturnApproveByKey(SanbaoReturnSearchVO searchVO)throws Exception;

   /**
    *
    * 삼포 반품승인 그리드 목록수 조회
    *
    * @return
    * @throws Exception
    */
   public int selectSanbaoReturnApproveByConditionCnt(SanbaoReturnSearchVO searchVO)throws Exception;

   /**
    *
    * 삼포 반품승인 그리드 조회
    *
    * @return
    * @throws Exception
    */
   public List<SanbaoReturnVO> selectSanbaoReturnApproveByCondition(SanbaoReturnSearchVO searchVO)throws Exception;

   /**
    *
    * 삼포 반품 승인 수정.
    *
    * @param sanbaoReturnVO
    * @return
    * @throws Exception
    */
   public String updateSanbaoReturnApprove(SanbaoReturnVO sanbaoReturnVO)throws Exception;

   /**
   *
   * 삼포 반품 승인 사용 여부 수정.
   *
   * @param sanbaoReturnVO
   * @return
   * @throws Exception
   */
   public int updateSanbaoReturnApprovePWA(SanbaoReturnVO sanbaoReturnVO)throws Exception;



}
