package chn.bhmc.dms.cmm.cmp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.vo.OfficeVO;

import chn.bhmc.dms.cmm.cmp.service.DivisionService;
import chn.bhmc.dms.cmm.cmp.service.dao.DivisionDAO;
import chn.bhmc.dms.cmm.cmp.vo.DivisionSaveVO;
import chn.bhmc.dms.cmm.cmp.vo.DivisionSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DivisionVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 사업부 관리 서비스 구현 클래스
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

@Service("divisionService")
public class DivisionServiceImpl extends HService implements DivisionService {

    /**
     * 사업부 관리 DAO
     */
    @Resource(name="divisionDAO")
    DivisionDAO divisionDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertDivision(DivisionVO divisionVO) throws Exception {

        DivisionVO obj = selectDivisionByKey(divisionVO.getDiviCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return divisionDAO.insertDivision(divisionVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateDivision(DivisionVO divisionVO) throws Exception {
        return divisionDAO.updateDivision(divisionVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteDivision(DivisionVO divisionVO) throws Exception {
        return divisionDAO.deleteDivision(divisionVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiDivisions(DivisionSaveVO divisionSaveVO)  throws Exception {

        String usrId = LoginUtil.getUserId();

        for(DivisionVO divisionVO : divisionSaveVO.getInsertList()){
            divisionVO.setRegUsrId(usrId);
            insertDivision(divisionVO);
        }

        for(DivisionVO divisionVO : divisionSaveVO.getUpdateList()){
            divisionVO.setUpdtUsrId(usrId);
            updateDivision(divisionVO);
        }

        for(DivisionVO divisionVO : divisionSaveVO.getDeleteList()){
            deleteDivision(divisionVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public DivisionVO selectDivisionByKey(String diviCd) throws Exception {
        return divisionDAO.selectDivisionByKey(diviCd);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<DivisionVO> selectDivisionsByCondition(DivisionSearchVO searchVO) throws Exception {
        return divisionDAO.selectDivisionsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectDivisionsByConditionCnt(DivisionSearchVO searchVO) throws Exception {
        return divisionDAO.selectDivisionsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<DivisionVO> selectDivisionList() throws Exception {
        return divisionDAO.selectDivisionList();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<OfficeVO> selectOfficeListByDivision(DivisionSearchVO searchVO) throws Exception {
        return divisionDAO.selectOfficeListByDivision(searchVO);
    }

}
