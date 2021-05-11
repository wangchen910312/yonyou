package chn.bhmc.dms.cmm.cmp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.service.SalesMgrDetlService;
import chn.bhmc.dms.cmm.cmp.service.dao.SalesMgrDetlDAO;
import chn.bhmc.dms.cmm.cmp.vo.SalesMgrDetlSaveVO;
import chn.bhmc.dms.cmm.cmp.vo.SalesMgrDetlSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.SalesMgrDetlVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 판매고문 직무상세 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2017. 7. 27.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.07.27         Kang Seok Han   최초 생성
 * </pre>
 */

@Service("salesMgrDetlService")
public class SalesMgrDetlServiceImpl extends HService implements SalesMgrDetlService {

    /**
     * 판매고문 직무상세 관리 DAO
     */
    @Resource(name="salesMgrDetlDAO")   
    SalesMgrDetlDAO salesMgrDetlDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertSalesMgrDetl(SalesMgrDetlVO salesMgrDetlVO) throws Exception {

        SalesMgrDetlVO obj = selectSalesMgrDetlByKey(salesMgrDetlVO.getSaleMgrDetlCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return salesMgrDetlDAO.insertSalesMgrDetl(salesMgrDetlVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateSalesMgrDetl(SalesMgrDetlVO salesMgrDetlVO) throws Exception {
        return salesMgrDetlDAO.updateSalesMgrDetl(salesMgrDetlVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteSalesMgrDetl(SalesMgrDetlVO salesMgrDetlVO) throws Exception {
        return salesMgrDetlDAO.deleteSalesMgrDetl(salesMgrDetlVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiSalesMgrDetls(SalesMgrDetlSaveVO salesMgrDetlSaveVO)  throws Exception {

        String usrId = LoginUtil.getUserId();

        for(SalesMgrDetlVO salesMgrDetlVO : salesMgrDetlSaveVO.getInsertList()){
            salesMgrDetlVO.setRegUsrId(usrId);
            insertSalesMgrDetl(salesMgrDetlVO);
        }

        for(SalesMgrDetlVO salesMgrDetlVO : salesMgrDetlSaveVO.getUpdateList()){
            salesMgrDetlVO.setUpdtUsrId(usrId);
            updateSalesMgrDetl(salesMgrDetlVO);
        }

        for(SalesMgrDetlVO salesMgrDetlVO : salesMgrDetlSaveVO.getDeleteList()){
            deleteSalesMgrDetl(salesMgrDetlVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public SalesMgrDetlVO selectSalesMgrDetlByKey(String salesMgrDetlCd) throws Exception {
        return salesMgrDetlDAO.selectSalesMgrDetlByKey(salesMgrDetlCd);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<SalesMgrDetlVO> selectSalesMgrDetlsByCondition(SalesMgrDetlSearchVO searchVO) throws Exception {
        return salesMgrDetlDAO.selectSalesMgrDetlsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectSalesMgrDetlsByConditionCnt(SalesMgrDetlSearchVO searchVO) throws Exception {
        return salesMgrDetlDAO.selectSalesMgrDetlsByConditionCnt(searchVO);
    }
}
