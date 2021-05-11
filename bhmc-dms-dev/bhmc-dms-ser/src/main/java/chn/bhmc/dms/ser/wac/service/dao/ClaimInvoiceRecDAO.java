package chn.bhmc.dms.ser.wac.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRecExcelDownloadVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRecSettlementISVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRecSettlementSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRecSettlementVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRecVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInvoiceRecDAO.java
 * @Description : 索赔发票收款 DAO
 * @author lixinfei
 * @since 2021. 04. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 21.     lixinfei      索赔发票收款 DAO
 * </pre>
 */

@Mapper("claimInvoiceRecDAO")
public interface ClaimInvoiceRecDAO {

    /**
    *
    * 索赔发票收款 主单 数量查找
    *
    * @param searchVO - ClaimInvoiceEditSearchVO
    * @return long
    * @throws Exception
    */
    public long selectClaimInvoiceRecSettlementByConditionCnt(ClaimInvoiceRecSettlementSearchVO searchVO)throws Exception;

    /**
    *
    * 索赔发票收款 主单 分页查询
    *
    * @param searchVO - ClaimInvoiceRecSettlementSearchVO
    * @return List<ClaimInvoiceEditVO>
    * @throws Exception
    */
    public List<ClaimInvoiceRecSettlementVO> selectClaimInvoiceRecSettlementByCondition(ClaimInvoiceRecSettlementSearchVO searchVO)throws Exception;
  
    
    /**
    *
    * 索赔发票收款 发票 数量查找
    *
    * @param searchVO - ClaimInvoiceRecSettlementSearchVO
    * @return long
    * @throws Exception
    */
    public long selectClaimInvoiceRecByConditionCnt(ClaimInvoiceRecSettlementSearchVO searchVO)throws Exception;

    /**
    *
    * 索赔发票收款 发票 分页查询
    *
    * @param searchVO - ClaimInvoiceRecSettlementSearchVO
    * @return List<ClaimInvoiceRecVO>
    * @throws Exception
    */
    public List<ClaimInvoiceRecVO> selectClaimInvoiceRecByCondition(ClaimInvoiceRecSettlementSearchVO searchVO)throws Exception;
    
    /**
    * 索赔发票收款 下载Excel List查询
    * @param searchVO - ClaimInvoiceRecSettlementSearchVO
    * @return List<ClaimInvoiceRecExcelDownloadVO>
    * @throws Exception
    */
    public List<ClaimInvoiceRecExcelDownloadVO> selectClaimInvoiceRecByConditionForExcelDownload(ClaimInvoiceRecSettlementSearchVO searchVO)throws Exception;
    
    /**
     * 查询当前索赔发票主单是否为未收款状态  01(未汇款),02(已汇款),03(已收款)
     * 返回当前主单状态
     * @param searchVO - ClaimInvoiceRecSettlementSearchVO
     * @return String
     * @throws Exception
     */
    public ClaimInvoiceRecSettlementISVO selectClaimInvoiceRecSettlementPaymTpByCondition(ClaimInvoiceRecSettlementSearchVO searchVO)throws Exception;
    
    /**
     * 更新索赔主单收款状态
     * @param searchVO - ClaimInvoiceRecSettlementVO
     * @return int
     * @throws Exception
     */
    public int updateClaimInvoiceRecPaymTp(ClaimInvoiceRecSettlementVO saveVO)throws Exception;
    
    /**
     * 对接口表SE_0960IS插入索赔主单数据
     * @param searchVO - ClaimInvoiceRecSettlementISVO
     * @return int
     * @throws Exception
     */
    public int insertClaimInvoiceRecSettlementToInterfaceTable(ClaimInvoiceRecSettlementISVO saveISVO)throws Exception;

}