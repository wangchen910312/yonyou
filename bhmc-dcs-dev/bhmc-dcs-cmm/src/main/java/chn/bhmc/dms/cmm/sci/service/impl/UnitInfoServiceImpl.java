package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.service.dao.UnitInfoDAO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 단위 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("unitInfoService")
public class UnitInfoServiceImpl extends HService implements UnitInfoService {

    /**
     * 단위 관리 DAO
     */
	@Resource(name="unitInfoDAO")
	UnitInfoDAO unitInfoDAO;

	/**
	 * {@inheritDoc}
	 */
    @Override
    public int insertUnitInfo(UnitInfoVO unitInfoVO)  throws Exception {
        return unitInfoDAO.insertUnitInfo(unitInfoVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateUnitInfo(UnitInfoVO unitInfoVO)  throws Exception {
        return unitInfoDAO.updateUnitInfo(unitInfoVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteUnitInfo(int unitSeq)  throws Exception {
        return unitInfoDAO.deleteUnitInfo(unitSeq);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public UnitInfoVO selectUnitInfoByKey(int unitSeq)  throws Exception {
        return unitInfoDAO.selectUnitInfoByKey(unitSeq);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiUnitInfos(BaseSaveVO<UnitInfoVO> obj)  throws Exception {

        String userId = LoginUtil.getUserId();

        for(UnitInfoVO unitInfoVO : obj.getInsertList()){
            unitInfoVO.setRegUsrId(userId);
            unitInfoDAO.insertUnitInfo(unitInfoVO);
        }

        for(UnitInfoVO unitInfoVO : obj.getUpdateList()){
            unitInfoVO.setUpdtUsrId(userId);
            unitInfoDAO.updateUnitInfo(unitInfoVO);
        }

        for(UnitInfoVO unitInfoVO : obj.getDeleteList()){
            unitInfoDAO.deleteUnitInfo(unitInfoVO.getUnitSeq());
        }
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<UnitInfoVO> selectUnitInfosByCondition(UnitInfoSearchVO searchVO)  throws Exception {
        return unitInfoDAO.selectUnitInfosByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectUnitInfosByConditionCnt(UnitInfoSearchVO searchVO)  throws Exception {
        return unitInfoDAO.selectUnitInfosByConditionCnt(searchVO);
    }




}
