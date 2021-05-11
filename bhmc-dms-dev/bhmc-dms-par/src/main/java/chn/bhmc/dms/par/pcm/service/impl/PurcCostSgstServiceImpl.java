package chn.bhmc.dms.par.pcm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pcm.service.PurcCostSgstService;
import chn.bhmc.dms.par.pcm.service.dao.PurcCostSgstDAO;
import chn.bhmc.dms.par.pcm.vo.PurcCostSgstSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcCostSgstVO;

/**
 * 구매제시 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 2. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 4.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("purcCostSgstService")
public class PurcCostSgstServiceImpl extends HService implements PurcCostSgstService {

    @Resource(name="purcCostSgstDAO")
    private PurcCostSgstDAO purcCostSgstDAO;

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcCostSgstService#insertPurcCostSgst(chn.bhmc.dms.par.pcm.vo.PurcCostSgstVO)
     */
    @Override
    public int insertPurcCostSgst(PurcCostSgstVO purcCostSgstVO) throws Exception {
        purcCostSgstVO.setDlrCd(LoginUtil.getDlrCd());
        purcCostSgstVO.setPltCd(LoginUtil.getPltCd());
        purcCostSgstVO.setRegUsrId(LoginUtil.getUserId());
        purcCostSgstVO.setUpdtUsrId(LoginUtil.getUserId());
        return purcCostSgstDAO.insertPurcCostSgst(purcCostSgstVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcCostSgstService#updatePurcCostSgst(chn.bhmc.dms.par.pcm.vo.PurcCostSgstVO)
     */
    @Override
    public int updatePurcCostSgst(PurcCostSgstVO purcCostSgstVO) throws Exception {
        purcCostSgstVO.setDlrCd(LoginUtil.getDlrCd());
        purcCostSgstVO.setPltCd(LoginUtil.getPltCd());
        purcCostSgstVO.setUpdtUsrId(LoginUtil.getUserId());
        return purcCostSgstDAO.updatePurcCostSgst(purcCostSgstVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcCostSgstService#deletePurcCostSgst(chn.bhmc.dms.par.pcm.vo.PurcCostSgstVO)
     */
    @Override
    public int deletePurcCostSgst(PurcCostSgstVO purcCostSgstVO) throws Exception {
        return purcCostSgstDAO.deletePurcCostSgst(purcCostSgstVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcCostSgstService#multiPurcCostesSgst(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiPurcCostesSgst(BaseSaveVO<PurcCostSgstVO> obj) throws Exception {

        // 구매제시 Update Data
        for(PurcCostSgstVO purcCostSgstVO : obj.getUpdateList()){
            purcCostSgstVO.setDlrCd(LoginUtil.getDlrCd());
            purcCostSgstVO.setPltCd(LoginUtil.getPltCd());
            purcCostSgstVO.setUpdtUsrId(LoginUtil.getUserId());
            purcCostSgstDAO.updatePurcCostSgst(purcCostSgstVO);
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcCostSgstService#selectPurcCostSgstByKey(java.lang.String)
     */
    @Override
    public PurcCostSgstVO selectPurcCostSgstByKey(String dlrCd) throws Exception {
        return purcCostSgstDAO.selectPurcCostSgstByKey(dlrCd);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcCostSgstService#selectPurcCostSgstesByCondition(chn.bhmc.dms.par.pcm.vo.PurcCostSgstSearchVO)
     */
    @Override
    public List<PurcCostSgstVO> selectPurcCostSgstesByCondition(PurcCostSgstSearchVO searchVO) throws Exception {
        return purcCostSgstDAO.selectPurcCostSgstesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcCostSgstService#selectPurcCostSgstesByConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcCostSgstSearchVO)
     */
    @Override
    public int selectPurcCostSgstesByConditionCnt(PurcCostSgstSearchVO searchVO) throws Exception {
        return purcCostSgstDAO.selectPurcCostSgstesByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcCostSgstService#selectSgstPurcOrdByCondition(chn.bhmc.dms.par.pcm.vo.PurcCostSgstSearchVO)
     */
    @Override
    public List<PurcCostSgstVO> selectSgstPurcOrdByCondition(PurcCostSgstSearchVO searchVO) throws Exception {
        return purcCostSgstDAO.selectSgstPurcOrdByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcCostSgstService#selectSgstPurcOrdByConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcCostSgstSearchVO)
     */
    @Override
    public int selectSgstPurcOrdByConditionCnt(PurcCostSgstSearchVO searchVO) throws Exception {

        return purcCostSgstDAO.selectSgstPurcOrdByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcCostSgstService#updatePurcCostSgstOrdCnfm(chn.bhmc.dms.par.pcm.vo.PurcCostSgstVO)
     */
    @Override
    public int updatePurcCostSgstOrdCnfm(PurcCostSgstVO purcCostSgstVO) throws Exception {

        return purcCostSgstDAO.updatePurcCostSgstOrdCnfm(purcCostSgstVO);
    }

}
