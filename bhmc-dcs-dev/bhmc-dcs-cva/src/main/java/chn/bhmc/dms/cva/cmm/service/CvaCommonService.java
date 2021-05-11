package chn.bhmc.dms.cva.cmm.service;

import java.util.List;

import chn.bhmc.dms.cva.cmm.vo.CvaDealerSearchVO;
import chn.bhmc.dms.cva.cmm.vo.CvaDealerVO;


/**
 * CVA 공통서비스
 *
 * @author Yoon Se Ran
 * @since 2016. 11. 28.
 * @version 1.0
 * @see <pre>
 *
 *       수정일                         수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016. 11. 28.       Yoon Se Ran            최초 생성
 * </pre>
 */

public interface CvaCommonService {

    //딜러마스터의 딜러를  조회.
    public int selectCvaDealerCnt(CvaDealerSearchVO searchVO) throws Exception;
    public List<CvaDealerVO> selectCvaDealer(CvaDealerSearchVO searchVO) throws Exception;

}
