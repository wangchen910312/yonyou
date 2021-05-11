package chn.bhmc.dms.cmm.cmp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.service.CastleService;
import chn.bhmc.dms.cmm.cmp.service.dao.CastleDAO;
import chn.bhmc.dms.cmm.cmp.vo.CastleSaveVO;
import chn.bhmc.dms.cmm.cmp.vo.CastleSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.CastleVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 성정보 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("castleService")
public class CastleServiceImpl extends HService implements CastleService {

    /**
     * 성정보 관리 DAO
     */
    @Resource(name="castleDAO")
    CastleDAO castleDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertCastle(CastleVO castleVO) throws Exception {

        CastleVO obj = selectCastleByKey(castleVO.getCstlCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return castleDAO.insertCastle(castleVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateCastle(CastleVO castleVO) throws Exception {
        return castleDAO.updateCastle(castleVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteCastle(CastleVO castleVO) throws Exception {
        return castleDAO.deleteCastle(castleVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiCastles(CastleSaveVO castleSaveVO)  throws Exception {

        String usrId = LoginUtil.getUserId();

        for(CastleVO castleVO : castleSaveVO.getInsertList()){
            castleVO.setRegUsrId(usrId);
            insertCastle(castleVO);
        }

        for(CastleVO castleVO : castleSaveVO.getUpdateList()){
            castleVO.setUpdtUsrId(usrId);
            updateCastle(castleVO);
        }

        for(CastleVO castleVO : castleSaveVO.getDeleteList()){
            deleteCastle(castleVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public CastleVO selectCastleByKey(String cstlCd) throws Exception {
        return castleDAO.selectCastleByKey(cstlCd);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<CastleVO> selectCastlesByCondition(CastleSearchVO searchVO) throws Exception {
        return castleDAO.selectCastlesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectCastlesByConditionCnt(CastleSearchVO searchVO) throws Exception {
        return castleDAO.selectCastlesByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<CastleVO> selectSungList(CastleSearchVO searchVO) throws Exception {
        return castleDAO.selectSungList(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<CastleVO> selectCityListBySung(CastleSearchVO searchVO) throws Exception {
        return castleDAO.selectCityListBySung(searchVO);
    }

}
