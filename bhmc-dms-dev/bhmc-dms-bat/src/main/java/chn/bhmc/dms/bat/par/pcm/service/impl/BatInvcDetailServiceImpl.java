package chn.bhmc.dms.bat.par.pcm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.par.pcm.service.BatInvcDetailService;
import chn.bhmc.dms.bat.par.pcm.service.dao.BatInvcDetailDAO;
import chn.bhmc.dms.bat.par.pcm.vo.BatInvcDetailVO;
import chn.bhmc.dms.bat.par.pcm.vo.BatInvcSearchVO;

/**
 * BatInvcServiceImpl Implement class
 *
 * @author In Bo Shim
 * @since 2016. 5. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 17.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("batInvcDetailService")
public class BatInvcDetailServiceImpl extends HService implements BatInvcDetailService {

    @Resource(name="batInvcDetailDAO")
    private BatInvcDetailDAO batInvcDetailDAO;

    /*
     * @see chn.bhmc.dms.bat.par.pcm.service.BatInvcDetailService#insertBatInvcDetail(chn.bhmc.dms.bat.par.pcm.vo.BatInvcDetailVO)
     */
    @Override
    public int insertBatInvcDetail(BatInvcDetailVO batInvcVO) throws Exception {
        return batInvcDetailDAO.insertBatInvcDetail(batInvcVO);
    }

    /*
     * @see chn.bhmc.dms.bat.par.pcm.service.BatInvcDetailService#updateBatInvcDetail(chn.bhmc.dms.bat.par.pcm.vo.BatInvcDetailVO)
     */
    @Override
    public int updateBatInvcDetail(BatInvcDetailVO batInvcVO) throws Exception {
        return batInvcDetailDAO.updateBatInvcDetail(batInvcVO);
    }

    /*
     * @see chn.bhmc.dms.bat.par.pcm.service.BatInvcDetailService#selectInvcByKey(java.lang.String, java.lang.String)
     */
    @Override
    public BatInvcDetailVO selectInvcDetailByKey(String dlrCd, String invcDocNo) throws Exception {
        return batInvcDetailDAO.selectInvcDetailByKey(dlrCd, invcDocNo);
    }

    /*
     * @see chn.bhmc.dms.bat.par.pcm.service.BatInvcDetailService#selectInvcDetailsByCondition(chn.bhmc.dms.bat.par.pcm.vo.BatInvcSearchVO)
     */
    @Override
    public List<BatInvcDetailVO> selectInvcDetailsByCondition(BatInvcSearchVO searchVO) throws Exception {
        return batInvcDetailDAO.selectInvcDetailsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.bat.par.pcm.service.BatInvcDetailService#selectInvcDetailsByConditionCnt(chn.bhmc.dms.bat.par.pcm.vo.BatInvcSearchVO)
     */
    @Override
    public int selectInvcDetailsByConditionCnt(BatInvcSearchVO searchVO) throws Exception {
        return batInvcDetailDAO.selectInvcDetailsByConditionCnt(searchVO);
    }
}
