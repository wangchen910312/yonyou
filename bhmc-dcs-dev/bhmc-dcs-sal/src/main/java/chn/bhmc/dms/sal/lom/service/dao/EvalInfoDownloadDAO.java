package chn.bhmc.dms.sal.lom.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.lom.vo.EvalInfoDownloadSearchVO;
import chn.bhmc.dms.sal.lom.vo.EvalInfoVO;

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

@Mapper("evalInfoDownloadDAO")
public interface EvalInfoDownloadDAO {

    /**
     * Searching Order Grade Condition.
     */
   public List<EvalInfoVO> selectEvalInfoDownloadCondition(EvalInfoDownloadSearchVO searchVO);

   /**
    *  Counting of Order Grade Condition.
    */
   public int selectEvalInfoDownloadConditionCnt(EvalInfoDownloadSearchVO searchVO);

}
