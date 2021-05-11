package chn.bhmc.dms.mob.api.sales.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.sales.vo.ContractReSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.ContractReVO;



/**
 *
 * 계약종합조회
 *
 * @author Kim Jin Suk
 * @since 2016. 10. 24.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.10.24.     Kim Jin Suk           최초 생성
 *
 */

@Mapper("SalesContractProgressDAO")
public interface SalesContractProgressDAO {

    /**
      * 조회 조건에 해당하는 계약품의진척을 조회한다.
      */
    public List<ContractReVO> selectContractProgressByCondition(ContractReSearchVO searchVO) throws Exception;

    /**
     *  조회 조건에 해당하는 계약품의진척 목록 총 갯수를 조회한다.
     */
    public int selectContractProgressByConditionCnt(ContractReSearchVO searchVO) throws Exception;

}