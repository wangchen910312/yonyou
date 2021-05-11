package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.FincInfoMngSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.FincInfoMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FincInfoMngDAO
 * @Description : 금융정보관리 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 09.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Mapper("CrmfincInfoMngDAO")
public interface CrmFincInfoMngDAO {

    /**
     * CRM : 고객의 금융 정보 조회
     */
    public int selectCustFincInfosByConditionCnt(FincInfoMngSearchVO searchVO) throws Exception;
    public List<FincInfoMngVO> selectCustFincInfosByCondition(FincInfoMngSearchVO searchVO) throws Exception;

}