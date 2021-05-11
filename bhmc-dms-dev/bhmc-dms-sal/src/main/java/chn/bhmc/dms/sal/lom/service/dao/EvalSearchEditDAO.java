package chn.bhmc.dms.sal.lom.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.lom.vo.EvalInfoVO;
import chn.bhmc.dms.sal.lom.vo.EvalSearchEditSearchVO;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehiclePopupVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EvalInfoDownloadDAO.java
 * @Description : 평가정보 다운로드 DAO
 * @author 유승봉
 * @since 2016. 5. 02.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 02.       Bong                최초 생성
 * </pre>
 */

@Mapper("evalSearchEditDAO")
public interface EvalSearchEditDAO {

    /**
     * Searching Order Grade Condition.
     */
   public List<EvalInfoVO> selectEvalSearchEditCondition(EvalSearchEditSearchVO searchVO);

   /**
    *  Counting of Order Grade Condition.
    */
   public int selectEvalSearchEditConditionCnt(EvalSearchEditSearchVO searchVO);

   /**
    * 평가정보를 수정한다.
    * @param ConfirmWearingVehiclePopupVO
    * @return
    */
  public int updateEvalSearchEdit(ConfirmWearingVehiclePopupVO LocalVO);

   /**
    * Searching Order Grade Condition.
    */
  public List<EvalInfoVO> selectEvalHistorySrchCondition(EvalSearchEditSearchVO searchVO);

  /**
   *  Counting of Order Grade Condition.
   */
  public int selectEvalHistorySrchConditionCnt(EvalSearchEditSearchVO searchVO);
}
