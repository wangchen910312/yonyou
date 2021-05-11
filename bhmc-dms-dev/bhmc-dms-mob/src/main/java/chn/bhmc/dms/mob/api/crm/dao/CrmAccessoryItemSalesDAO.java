package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.AccessoryItemSalesSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.AccessoryItemSalesVO;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AccessoryItemSalesDAO
 * @Description : 용품판매관리 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 30.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Mapper("CrmaccessoryItemSalesDAO")
public interface CrmAccessoryItemSalesDAO {

    


    /**
     * 용품판매문서 번호에 해당하는 품목을 모두 삭제한다.
     * @param goodsContractNo
     * @return
     *
    public int deleteAccessoryItemSalesItemByGoodsContractNo(@Param("dlrCd") String dlrCd, @Param("goodsContractNo") String goodsContractNo);
    */


    /**
     * 조회조건에 해당하는 용품판매문서 목록수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAccessoryItemSalesByConditionCnt(AccessoryItemSalesSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 용품판매문서 목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<AccessoryItemSalesVO> selectAccessoryItemSalesByCondition(AccessoryItemSalesSearchVO searchVO) throws Exception;

}