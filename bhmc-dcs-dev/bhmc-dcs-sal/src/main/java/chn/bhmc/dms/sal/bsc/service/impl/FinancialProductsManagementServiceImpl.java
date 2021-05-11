package chn.bhmc.dms.sal.bsc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.bsc.service.FinancialProductsManagementService;
import chn.bhmc.dms.sal.bsc.service.dao.FinancialProductsManagementDAO;
import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementModelVO;
import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementSearchVO;
import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FinancialProductsManagementServiceImpl
 * @Description : 금융상품 관리
 * @author Bong
 * @since 2016. 2. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.11         Bong            최초 생성
 * </pre>
 */

@Service("financialProductsManagementService")
public class FinancialProductsManagementServiceImpl extends HService implements FinancialProductsManagementService {

    /**
     * 금융상품관리 DAO 선언
     */
    @Resource(name="financialProductsManagementDAO")
    FinancialProductsManagementDAO financialProductsManagementDAO;

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<FinancialProductsManagementVO> selectFinancialProductsManagementByCondition(FinancialProductsManagementSearchVO searchVO) throws Exception {
        return financialProductsManagementDAO.selectFinancialProductsManagementByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectFinancialProductsManagementByConditionCnt(FinancialProductsManagementSearchVO searchVO)  throws Exception {
        return financialProductsManagementDAO.selectFinancialProductsManagementByConditionCnt(searchVO);
    }

    /**
     * 해당 키의 값을 조회한다.
     */
    @Override
    public List<FinancialProductsManagementVO> selectFinancialProductsManagementByKey(FinancialProductsManagementVO searchVO) throws Exception {
        return financialProductsManagementDAO.selectFinancialProductsManagementByKey(searchVO);
    }

    /**
     * 저장
     */
    @Override
    public FinancialProductsManagementVO saveFinancialProductsManagement(FinancialProductsManagementVO saveVO) throws Exception {

        saveVO.setDlrCd(LoginUtil.getDlrCd());
        saveVO.setUpdtUsrId(LoginUtil.getUserId());

        if( financialProductsManagementDAO.selectFinancialProductsManagementByKey(saveVO).size() > 0 ){
            financialProductsManagementDAO.updateFinancialProductsManagement(saveVO);
        }else{
            saveVO.setRegUsrId(LoginUtil.getUserId());
            financialProductsManagementDAO.insertFinancialProductsManagement(saveVO);
        }

        if(  saveVO.getFincCmpCd() != null
          && saveVO.getFincItemKindCd() != null
          && !"01".equals(saveVO.getFincItemKindCd()) ){

            for(FinancialProductsManagementModelVO vo : saveVO.getInsertFincModelList()){
                vo.setDlrCd(saveVO.getDlrCd());
                vo.setFincCmpCd(saveVO.getFincCmpCd());
                vo.setFincItemCd(saveVO.getFincItemCd());
                vo.setRegUsrId(LoginUtil.getUserId());
                vo.setUpdtUsrId(LoginUtil.getUserId());

                financialProductsManagementDAO.insertFincModel(vo);
            }

            for(FinancialProductsManagementModelVO vo : saveVO.getDeleteFincModelList()){
                vo.setDlrCd(saveVO.getDlrCd());
                vo.setFincCmpCd(saveVO.getFincCmpCd());
                vo.setFincItemCd(saveVO.getFincItemCd());

                financialProductsManagementDAO.deleteFincModel(vo);
            }
        }

        return saveVO;
    }


    /**
     * 금융상품관리 모델내역 갯수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public int selectFincTargetModelSearchsByConditionCnt(FinancialProductsManagementSearchVO searchVO) throws Exception{
        return financialProductsManagementDAO.selectFincTargetModelSearchsByConditionCnt(searchVO);
    }

    /**
     * 금융상품관리 모델내역을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<FinancialProductsManagementModelVO> selectFincTargetModelSearchsByCondition(FinancialProductsManagementSearchVO searchVO) throws Exception{
        return financialProductsManagementDAO.selectFincTargetModelSearchsByCondition(searchVO);
    }

    /**
     *금융상품리스트를 조회한다. (계약품의관리 사용) - 금액 선택
     */
    public List<FinancialProductsManagementVO> selectFinancialProductAmtListsByCondition(String sFincItemKindCd) throws Exception{
        FinancialProductsManagementSearchVO searchVO = new FinancialProductsManagementSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsFincItemKindCd(sFincItemKindCd);
        return financialProductsManagementDAO.selectFinancialProductAmtListsByCondition(searchVO);
    }
    /**
     *금융상품리스트를 조회한다. (계약품의관리 사용) - 모델 선택
     */
    public List<FinancialProductsManagementVO> selectFinancialProductModelListsByCondition(String sModelCd) throws Exception{
        FinancialProductsManagementSearchVO searchVO = new FinancialProductsManagementSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsModelCd(sModelCd);
        return financialProductsManagementDAO.selectFinancialProductModelListsByCondition(searchVO);
    }
}
