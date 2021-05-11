package chn.bhmc.dms.cva.cmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cva.cmm.vo.CvaDealerSearchVO;
import chn.bhmc.dms.cva.cmm.vo.CvaDealerVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
  * @ClassName   : CvaCommonDAO
 * @Description : DAO 공통
 * @author
 * @since 2016. 11. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 28.    Yoon SE Ran            최초 생성
 * </pre>
 */

@Mapper("cvaCommonDAO")
public interface CvaCommonDAO {

    /**
     * 딜러마스터에서 딜러를 조회.
     */
    public int selectCvaDealerCnt(CvaDealerSearchVO searchVO) throws Exception;

    public List<CvaDealerVO> selectCvaDealer(CvaDealerSearchVO searchVO) throws Exception;
}
