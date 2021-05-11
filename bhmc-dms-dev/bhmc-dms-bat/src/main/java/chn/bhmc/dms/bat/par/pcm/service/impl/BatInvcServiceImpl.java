package chn.bhmc.dms.bat.par.pcm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.par.pcm.service.BatInvcService;
import chn.bhmc.dms.bat.par.pcm.service.dao.BatInvcDAO;
import chn.bhmc.dms.bat.par.pcm.vo.BatInvcSearchVO;
import chn.bhmc.dms.bat.par.pcm.vo.BatInvcVO;

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
@Service("batInvcService")
public class BatInvcServiceImpl extends HService implements BatInvcService {

    @Resource(name="batInvcDAO")
    private BatInvcDAO batInvcDAO;

    /*
     * @see chn.bhmc.dms.bat.par.pcm.service.BatInvcService#insertBatInvcHeader(chn.bhmc.dms.bat.par.pcm.vo.BatInvcVO)
     */
    @Override
    public int insertBatInvcHeader(BatInvcVO batInvcVO) throws Exception {
        return batInvcDAO.insertBatInvcHeader(batInvcVO);
    }

    /*
     * @see chn.bhmc.dms.bat.par.pcm.service.BatInvcService#updateBatInvcHeader(chn.bhmc.dms.bat.par.pcm.vo.BatInvcVO)
     */
    @Override
    public int updateBatInvcHeader(BatInvcVO batInvcVO) throws Exception {
        return batInvcDAO.updateBatInvcHeader(batInvcVO);
    }

    /*
     * @see chn.bhmc.dms.bat.par.pcm.service.BatInvcService#selectInvcByKey(java.lang.String, java.lang.String)
     */
    @Override
    public BatInvcVO selectInvcByKey(String dlrCd, String invcDocNo) throws Exception {
        return batInvcDAO.selectInvcByKey(dlrCd, invcDocNo);
    }

    /*
     * @see chn.bhmc.dms.bat.par.pcm.service.BatInvcService#selectInvcsByCondition(chn.bhmc.dms.bat.par.pcm.vo.BatInvcSearchVO)
     */
    @Override
    public List<BatInvcVO> selectInvcsByCondition(BatInvcSearchVO searchVO) throws Exception {
        return batInvcDAO.selectInvcsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.bat.par.pcm.service.BatInvcService#selectInvcsByConditionCnt(chn.bhmc.dms.bat.par.pcm.vo.BatInvcSearchVO)
     */
    @Override
    public int selectInvcsByConditionCnt(BatInvcSearchVO searchVO) throws Exception {
        return batInvcDAO.selectInvcsByConditionCnt(searchVO);
    }


}
