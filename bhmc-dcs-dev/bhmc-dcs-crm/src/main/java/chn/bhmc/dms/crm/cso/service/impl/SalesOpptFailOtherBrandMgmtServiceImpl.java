package chn.bhmc.dms.crm.cso.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.SalesOpptFailOtherBrandMgmtService;
import chn.bhmc.dms.crm.cso.service.dao.SalesOpptFailOtherBrandMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtVO;

/**
 * 판매기회 타브랜드 실패 관리 서비스 구현 클래스
 *
 * @author liu jing
 * @since 2016.12.12.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.12.12         liu jing            최초 생성
 * </pre>
 */

@Service("salesOpptFailOtherBrandMgmtService")
public class SalesOpptFailOtherBrandMgmtServiceImpl extends HService implements SalesOpptFailOtherBrandMgmtService {
    /**
     *
     * 조건에 따라 판매기회 타브랜드 실패 차량 관리 DAO
     */
	@Resource(name="salesOpptFailOtherBrandMgmtDAO")
	SalesOpptFailOtherBrandMgmtDAO salesOpptFailOtherBrandMgmtDAO;

	/**
     * 판매기회 실패목록 수량 조회
     */
    @Override
    public void updateDistOpptFailOtherBrand() throws Exception {
        salesOpptFailOtherBrandMgmtDAO.updateDistOpptFailOtherBrand();
}

	/*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptFailOtherBrandMgmtService#selectSalesOpptFailOtherBrandMgmtsByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtVO)
     * insert
     */
	@Override
    public void insertSalesOpptFailOtherBrand(SalesOpptFailOtherBrandMgmtVO VO) throws Exception{
        salesOpptFailOtherBrandMgmtDAO.insertSalesOpptFailOtherBrand(VO);
    }

	/*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptFailOtherBrandMgmtService#updateDistOpptFailOtherBrand(chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtVO)
     * update
     */
    @Override
    public void updateSalesOpptFailOtherBrand(SalesOpptFailOtherBrandMgmtVO VO) throws Exception {
        salesOpptFailOtherBrandMgmtDAO.updateSalesOpptFailOtherBrand(VO);
    }

	/*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptFailOtherBrandMgmtService#selectSalesOpptFailOtherBrandMgmtsByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtVO)
     * Delete (사용 안함)
     */
	@Override
    public void deleteSalesOpptFailOtherBrand(SalesOpptFailOtherBrandMgmtVO VO) throws Exception{

    }
    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptFailOtherBrandMgmtService#selectSalesOpptFailOtherBrandMgmtsByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtVO)
     * 데이터 개숫 조회
     */
    @Override
    public int selectSalesOpptFailOtherBrandMgmtsByConditionCnt(SalesOpptFailOtherBrandMgmtSearchVO searchVO)
            throws Exception {
        return salesOpptFailOtherBrandMgmtDAO.selectSalesOpptFailOtherBrandMgmtsByConditionCnt(searchVO);
    }
    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptFailOtherBrandMgmtService#selectSalesOpptFailOtherBrandMgmtsByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtVO)
     * 데이터 리스트 조회
     */
    @Override
    public List<SalesOpptFailOtherBrandMgmtVO> selectSalesOpptFailOtherBrandMgmtsByCondition(
            SalesOpptFailOtherBrandMgmtSearchVO searchVO) throws Exception {
        return salesOpptFailOtherBrandMgmtDAO.selectSalesOpptFailOtherBrandMgmtsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptFailOtherBrandMgmtService#multiSalesOpptFailOtherBrandMgmtMain(chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtVO)
     * 데이터 update, insert, delete
     */
    @Override
    public void multiSalesOpptFailOtherBrandMgmtMain(SalesOpptFailOtherBrandMgmtSaveVO saveVO) throws Exception {
            String userId = LoginUtil.getUserId();
            for(SalesOpptFailOtherBrandMgmtVO salesOpptFailOtherBrandMgmtVO : saveVO.getInsertList()){
                salesOpptFailOtherBrandMgmtVO.setRegUsrId(userId);
                this.insertSalesOpptFailOtherBrand(salesOpptFailOtherBrandMgmtVO);
            }
            for(SalesOpptFailOtherBrandMgmtVO salesOpptFailOtherBrandMgmtVO : saveVO.getUpdateList()){
                salesOpptFailOtherBrandMgmtVO.setRegUsrId(userId);
                this.updateSalesOpptFailOtherBrand(salesOpptFailOtherBrandMgmtVO);
            }
//            for(SalesOpptFailOtherBrandMgmtVO salesOpptFailOtherBrandMgmtVO : saveVO.getDeleteList()){
//                this.deleteLjTest(salesOpptFailOtherBrandMgmtVO);
//            }
        }

}
