package chn.bhmc.dms.sal.prm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.prm.service.SalesAllowanceService;
import chn.bhmc.dms.sal.prm.service.dao.SalesAllowanceDAO;
import chn.bhmc.dms.sal.prm.vo.SalesAllowanceSearchVO;
import chn.bhmc.dms.sal.prm.vo.SalesAllowanceVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalesAllowanceServiceImpl
 * @Description : Sales Allowance
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.26       최초 생성
 * </pre>
 */

@Service("salesAllowanceService")
public class SalesAllowanceServiceImpl extends HService implements SalesAllowanceService {

    /**
     * Sales Allowance 현황 DAO 선언
     */
    @Resource(name="salesAllowanceDAO")
    SalesAllowanceDAO salesAllowanceDAO;


    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesAllowanceSearchVO
     * @return
     */
    @Override
    public int selectSalesAllowanceMainsByConditionCnt(SalesAllowanceSearchVO searchVO) throws Exception{
        return salesAllowanceDAO.selectSalesAllowanceMainsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesAllowanceSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SalesAllowanceVO> selectSalesAllowanceMainsByCondition(SalesAllowanceSearchVO searchVO) throws Exception{
        return salesAllowanceDAO.selectSalesAllowanceMainsByCondition(searchVO);
    }



    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesAllowanceSearchVO
     * @return
     */
    @Override
    public int selectSalesAllowanceSubsByConditionCnt(SalesAllowanceSearchVO searchVO) throws Exception{
        return salesAllowanceDAO.selectSalesAllowanceSubsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesAllowanceSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SalesAllowanceVO> selectSalesAllowanceSubsByCondition(SalesAllowanceSearchVO searchVO) throws Exception{
        return salesAllowanceDAO.selectSalesAllowanceSubsByCondition(searchVO);
    }

}
