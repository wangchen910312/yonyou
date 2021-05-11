package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.VenderTelService;
import chn.bhmc.dms.par.pmm.service.dao.VenderTelDAO;
import chn.bhmc.dms.par.pmm.vo.VenderTelSearchVO;
import chn.bhmc.dms.par.pmm.vo.VenderTelVO;

/**
 * 거래처 연락처 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 4. 21.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 4. 21.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("venderTelService")
public class VenderTelServiceImpl extends HService implements VenderTelService {

    @Resource(name="venderTelDAO")
    private VenderTelDAO venderTelDAO;

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderTelService#insertVenderTel(chn.bhmc.dms.par.pmm.vo.VenderTelVO)
     */
    @Override
    public int insertVenderTel(VenderTelVO venderTelVO) throws Exception {
        venderTelVO.setDlrCd(LoginUtil.getDlrCd());
        venderTelVO.setRegUsrId(LoginUtil.getUserId());
        return venderTelDAO.insertVenderTel(venderTelVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderTelService#updateVenderTel(chn.bhmc.dms.par.pmm.vo.VenderTelVO)
     */
    @Override
    public int updateVenderTel(VenderTelVO venderTelVO) throws Exception {
        venderTelVO.setDlrCd(LoginUtil.getDlrCd());
        venderTelVO.setUpdtUsrId(LoginUtil.getUserId());
        return venderTelDAO.updateVenderTel(venderTelVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderTelService#deleteVenderTel(chn.bhmc.dms.par.pmm.vo.VenderTelVO)
     */
    @Override
    public int deleteVenderTel(VenderTelVO venderTelVO) throws Exception {
        venderTelVO.setDlrCd(LoginUtil.getDlrCd());
        venderTelVO.setUpdtUsrId(LoginUtil.getUserId());
        return venderTelDAO.deleteVenderTel(venderTelVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderTelService#selectVenderTelsByCondition(chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO)
     */
    @Override
    public List<VenderTelVO> selectVenderTelsByCondition(VenderTelSearchVO searchVO) throws Exception {
        return venderTelDAO.selectVenderTelsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderTelService#selectVenderTelsByConditionCnt(chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO)
     */
    @Override
    public int selectVenderTelsByConditionCnt(VenderTelSearchVO searchVO) throws Exception {
        return venderTelDAO.selectVenderTelsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.VenderTelService#selectVenderTelsMaxTwoRowByCondition(chn.bhmc.dms.par.pmm.vo.VenderTelSearchVO)
     */
    @Override
    public List<VenderTelVO> selectVenderTelsMaxTwoRowByCondition(VenderTelSearchVO searchVO) throws Exception {

        return venderTelDAO.selectVenderTelsMaxTwoRowByCondition(searchVO);
    }






}
