package chn.bhmc.dms.crm.cso.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService;
import chn.bhmc.dms.crm.cso.service.dao.SalesOpptHoldTypeMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtVO;

/**
 * 판매기회유입유형 관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.07         in moon lee            최초 생성
 * </pre>
 */

@Service("salesOpptHoldTypeMgmtService")
public class SalesOpptHoldTypeMgmtServiceImpl extends HService implements SalesOpptHoldTypeMgmtService {

    /**
     * Customer Management
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 판매기회유입유형 관리 DAO
     */
    @Resource(name="salesOpptHoldTypeMgmtDAO")
    SalesOpptHoldTypeMgmtDAO salesOpptHoldTypeMgmtDAO;


    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService#selectSalesOpptHoldTypeMgmtsByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtSearchVO)
     */
    @Override
    public int selectSalesOpptHoldTypeMgmtsByConditionCnt(SalesOpptHoldTypeMgmtSearchVO searchVO) throws Exception {
        if (StringUtil.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd());};

        return salesOpptHoldTypeMgmtDAO.selectSalesOpptHoldTypeMgmtsByConditionCnt(searchVO);
    }


    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService#selectSalesOpptHoldTypeMgmtsByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtSearchVO)
     */
    @Override
    public List<SalesOpptHoldTypeMgmtVO> selectSalesOpptHoldTypeMgmtsByCondition(SalesOpptHoldTypeMgmtSearchVO searchVO)
            throws Exception {
        if (StringUtil.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd());};

        return salesOpptHoldTypeMgmtDAO.selectSalesOpptHoldTypeMgmtsByCondition(searchVO);
    }


    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService#multiSalesOpptHoldType(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiSalesOpptHoldType(BaseSaveVO<SalesOpptHoldTypeMgmtVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(SalesOpptHoldTypeMgmtVO salesOpptHoldTypeMgmtVO : obj.getInsertList()){
            salesOpptHoldTypeMgmtVO.setRegUsrId(userId);
            salesOpptHoldTypeMgmtVO.setUpdtUsrId(userId);
            insertSalesOpptHoldType(salesOpptHoldTypeMgmtVO);
        }

        for(SalesOpptHoldTypeMgmtVO salesOpptHoldTypeMgmtVO : obj.getUpdateList()){
            salesOpptHoldTypeMgmtVO.setUpdtUsrId(userId);
            updateSalesOpptHoldType(salesOpptHoldTypeMgmtVO);
        }

        for(SalesOpptHoldTypeMgmtVO salesOpptHoldTypeMgmtVO : obj.getDeleteList()){
            deleteSalesOpptHoldType(salesOpptHoldTypeMgmtVO);
        }

    }


    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService#insertSalesOpptHoldType(chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtVO)
     */
    @Override
    public int insertSalesOpptHoldType(SalesOpptHoldTypeMgmtVO salesOpptHoldTypeMgmtVO) throws Exception {
        if (StringUtil.isEmpty(salesOpptHoldTypeMgmtVO.getDlrCd())) { salesOpptHoldTypeMgmtVO.setDlrCd(LoginUtil.getDlrCd());};
        if (StringUtil.isEmpty(salesOpptHoldTypeMgmtVO.getRegUsrId())) { salesOpptHoldTypeMgmtVO.setRegUsrId(LoginUtil.getUserId());};
        if (StringUtil.isEmpty(salesOpptHoldTypeMgmtVO.getUpdtUsrId())) { salesOpptHoldTypeMgmtVO.setUpdtUsrId(LoginUtil.getUserId());};
        return salesOpptHoldTypeMgmtDAO.insertSalesOpptHoldType(salesOpptHoldTypeMgmtVO);
    }


    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService#updateSalesOpptHoldType(chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtVO)
     */
    @Override
    public int updateSalesOpptHoldType(SalesOpptHoldTypeMgmtVO salesOpptHoldTypeMgmtVO) throws Exception {
        if (StringUtil.isEmpty(salesOpptHoldTypeMgmtVO.getDlrCd())) { salesOpptHoldTypeMgmtVO.setDlrCd(LoginUtil.getDlrCd());};
        if (StringUtil.isEmpty(salesOpptHoldTypeMgmtVO.getRegUsrId())) { salesOpptHoldTypeMgmtVO.setRegUsrId(LoginUtil.getUserId());};
        if (StringUtil.isEmpty(salesOpptHoldTypeMgmtVO.getUpdtUsrId())) { salesOpptHoldTypeMgmtVO.setUpdtUsrId(LoginUtil.getUserId());};
        return salesOpptHoldTypeMgmtDAO.updateSalesOpptHoldType(salesOpptHoldTypeMgmtVO);
    }


    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService#deleteSalesOpptHoldType(chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtVO)
     */
    @Override
    public int deleteSalesOpptHoldType(SalesOpptHoldTypeMgmtVO salesOpptHoldTypeMgmtVO) throws Exception {
        if (StringUtil.isEmpty(salesOpptHoldTypeMgmtVO.getDlrCd())) { salesOpptHoldTypeMgmtVO.setDlrCd(LoginUtil.getDlrCd());};
        return salesOpptHoldTypeMgmtDAO.deleteSalesOpptHoldType(salesOpptHoldTypeMgmtVO);
    }




}
