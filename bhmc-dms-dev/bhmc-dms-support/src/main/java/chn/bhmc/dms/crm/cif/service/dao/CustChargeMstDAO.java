package chn.bhmc.dms.crm.cif.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cif.vo.CustChargeMstVO;

import chn.bhmc.dms.crm.cif.vo.CustChargeMstSearchVO;



/**
 * 예치금 Master DAO
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

@Mapper("custChargeMstDAO")
public interface CustChargeMstDAO {

    /**
     *
     * @param searchVO
     * @return
     */
    public int selectCustChargeMstByConditionCnt(CustChargeMstSearchVO searchVO) throws Exception;

    /**
     *
     * @param searchV
     * @return
     */

    public List<CustChargeMstVO> selectCustChargeMstByCondition(CustChargeMstSearchVO searchVO) throws Exception;
    public CustChargeMstVO selectCustChargeMstByKey(CustChargeMstSearchVO searchVO) throws Exception;
    public int insertCustChargeMst(CustChargeMstVO custChargeMstVO) throws Exception;
    public int updateCustChargeMst(CustChargeMstVO custChargeMstVO) throws Exception;
}
