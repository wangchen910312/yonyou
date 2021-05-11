package chn.bhmc.dms.sal.bsc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.bsc.service.FinancialProductMngService;
import chn.bhmc.dms.sal.bsc.service.dao.FinancialProductMngDAO;
import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementSearchVO;
import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementVO;

/**
 * @ClassName   : FinancialProductMngServiceImpl
 * @Description : 금융상품관리(v.2)
 * @author Kim Jin Suk
 * @since 2017.01.12
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                       수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.01.12         Kim Jin Suk            최초 생성
 * </pre>
 */

@Service("financialProductMngService")
public class FinancialProductMngServiceImpl extends HService implements FinancialProductMngService {

    /**
     * 금융상품관리 DAO 선언
     */
    @Resource(name="financialProductMngDAO")
    FinancialProductMngDAO financialProductMngDAO;

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<FinancialProductsManagementVO> selectFinancialProductMngByCondition(FinancialProductsManagementSearchVO searchVO) throws Exception {
        return financialProductMngDAO.selectFinancialProductMngByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectFinancialProductMngByConditionCnt(FinancialProductsManagementSearchVO searchVO) throws Exception{
        return financialProductMngDAO.selectFinancialProductMngByConditionCnt(searchVO);
    }

    /**
     * 해당 키의 값을 조회한다.
     */
    @Override
    public List<FinancialProductsManagementVO> selectFinancialProductMngByKey(FinancialProductsManagementVO searchVO) throws Exception {
        return financialProductMngDAO.selectFinancialProductMngByKey(searchVO);
    }

    /**
     * 저장
     */
    @Override
    public FinancialProductsManagementVO saveFinancialProductMng(FinancialProductsManagementVO saveVO) throws Exception {

        saveVO.setDlrCd(LoginUtil.getDlrCd());
        saveVO.setUpdtUsrId(LoginUtil.getUserId());

        if( financialProductMngDAO.selectFinancialProductMngByKey(saveVO).size() > 0 ){
            financialProductMngDAO.updateFinancialProductMng(saveVO);
        }else{
            saveVO.setRegUsrId(LoginUtil.getUserId());
            financialProductMngDAO.insertFinancialProductMng(saveVO);
        }

        return saveVO;
    }
    
    
    /**
     *금융상품리스트를 조회한다. (계약품의관리 사용)
     */
    @Override
    public List<FinancialProductsManagementVO> selectFinancialProductAmtListsByCondition() throws Exception{
        FinancialProductsManagementSearchVO searchVO = new FinancialProductsManagementSearchVO();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        
        return financialProductMngDAO.selectFinancialProductAmtListsByCondition(searchVO);
    }
    
    /**
     *금융상품리스트를 조회한다. (계약품의관리 사용) - Bhaf I/F 정보
     */
    @Override
    public List<FinancialProductsManagementVO> selectFinancialBhafProductListsByCondition(String fincCmpCd) throws Exception{
        FinancialProductsManagementSearchVO searchVO = new FinancialProductsManagementSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsFincCmpCd(fincCmpCd);
        return financialProductMngDAO.selectFinancialBhafProductListsByCondition(searchVO);
    }
}
