package chn.bhmc.dms.crm.cif.service;

import java.util.List;

import chn.bhmc.dms.crm.cif.vo.CustChargeHistVO;
import chn.bhmc.dms.crm.cif.vo.CustChargeHistSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustChargeMstSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustChargeMstVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustChargeMgmtService.java
 * @Description : 예치금 충전 관리.
 * @author Liu jing
 * @since 2017. 1. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 17.     liu jing                  최초 생성
 * </pre>
 */

public interface CustChargeMgmtService {

    /**
     * 고객예치금 마스터 개수 조회 한다.
     * @param CustChargeMstSearchVO
     * @return int
     */
    public int selectCustChargeMstByConditionCnt(CustChargeMstSearchVO searchVO) throws Exception;

    /**
     * 고객예치금 마스터 조회 한다.
     * @param CustChargeMstSearchVO
     * @return List<CustChargeMstVO>
     */
    public List<CustChargeMstVO> selectCustChargeMstByCondition(CustChargeMstSearchVO searchVO) throws Exception;

    /**
     * 고객예치금 마스터 조회 한다.
     * @param CustChargeMstSearchVO
     * @return CustChargeMstVO
     */
    public CustChargeMstVO selectCustChargeMstByKey(CustChargeMstSearchVO searchVO)  throws Exception;

    /**
     * 고객예치금 사용 시 마스터에 이력 insert
     * @param CustChargeMstVO
     * @return int
     */
    public int insertCustChargeMst(CustChargeMstVO custChargeMstVO) throws Exception;

    //public int updateCustChargeMst(CustChargeMstVO custChargeMstVO) throws Exception;

    /**
     * 고객예치금 이력 개수 조회 한다.
     * @param CustChargeHistSearchVO
     * @return int
     */
    public int selectCustChargeHistByConditionCnt(CustChargeHistSearchVO searchVO) throws Exception;

    /**
     * 고객예치금 이력 조회 한다.
     * @param CustChargeHistSearchVO
     * @return List<CustChargeHistVO>
     */
    public List<CustChargeHistVO> selectCustChargeHistByCondition(CustChargeHistSearchVO searchVO) throws Exception;

    /**
     * 고객예치금 사용 (+ 또는 -)을 한다.
     * @param CustChargeHistVO
     * @return int
     */
    public int insertCustChargeHist(CustChargeHistVO custChargeHistVO) throws Exception;
    
    //public int updateCustChargeHist(CustChargeHistVO custChargeHistVO) throws Exception;

}
