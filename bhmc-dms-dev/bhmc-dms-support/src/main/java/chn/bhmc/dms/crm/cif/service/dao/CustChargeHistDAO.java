package chn.bhmc.dms.crm.cif.service.dao;

import java.util.List;
import able.com.mybatis.Mapper;
import chn.bhmc.dms.crm.cif.vo.CustChargeHistVO;
import chn.bhmc.dms.crm.cif.vo.CustChargeHistSearchVO;


/**
 * 고객 예치금 History DAO
 *
 * @author liu jing
 * @since 2017. 1. 16.
 * @version 1.0
 * @see <pre>
 *
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.01.16         liu jing                   최초 생성
 * </pre>
 */

@Mapper("custChargeHistDAO")
public interface CustChargeHistDAO {

    public int selectCustChargeHistByConditionCnt(CustChargeHistSearchVO searchVO) throws Exception;
    public List<CustChargeHistVO> selectCustChargeHistByCondition(CustChargeHistSearchVO searchVO) throws Exception;
    public CustChargeHistVO selectCustChargeHistByKey(CustChargeHistSearchVO searchVO) throws Exception;
    public int insertCustChargeHist(CustChargeHistVO custChargeHistVO) throws Exception;
    public int updateCustChargeHist(CustChargeHistVO custChargeHistVO)throws Exception;
}
