package chn.bhmc.dms.sal.prm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.prm.vo.SalesAllowanceSearchVO;
import chn.bhmc.dms.sal.prm.vo.SalesAllowanceVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalesAllowanceDAO
 * @Description : Sales Allowance DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.26      Kim Jin Suk            최초 생성
 * </pre>
 */

@Mapper("salesAllowanceDAO")
public interface SalesAllowanceDAO {

    /**
     *  메인 조회
     */
    public int selectSalesAllowanceMainsByConditionCnt(SalesAllowanceSearchVO searchVO) throws Exception;
    public List<SalesAllowanceVO> selectSalesAllowanceMainsByCondition(SalesAllowanceSearchVO searchVO) throws Exception;


    /**
     *  서브 조회
     */
    public int selectSalesAllowanceSubsByConditionCnt(SalesAllowanceSearchVO searchVO) throws Exception;
    public List<SalesAllowanceVO> selectSalesAllowanceSubsByCondition(SalesAllowanceSearchVO searchVO) throws Exception;

}