package chn.bhmc.dms.ser.wac.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;

import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRecSettlementSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRecSettlementVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRecVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInvoiceRecService.java
 * @Description : 索赔发票收款Service
 * @author lixinfei
 * @since 2021. 04. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 21.     lixinfei      索赔发票收款Service
 * </pre>
 */

public interface ClaimInvoiceRecService {

    /**
    *
    * 索赔发票收款 主单 数量查找
    *
    * @param searchVO - ClaimInvoiceRecSettlementSearchVO
    * @return long
    * @throws Exception
    */
    public long selectClaimInvoiceRecSettlementByConditionCnt(ClaimInvoiceRecSettlementSearchVO searchVO)throws Exception;

    /**
    *
    * 索赔发票收款 主单 分页查询
    *
    * @param searchVO - ClaimInvoiceRecSettlementSearchVO
    * @return List<ClaimInvoiceRecSettlementVO>
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
     * 更新当前索赔单收款信息，若返回1更新成功，否则失败
     * SE_0960T PAYM_TP汇款状态  01(未汇款),02(已汇款),03(已收款)    
     * <p>Title: </p >
     * @author lixinfei 2021年4月7日 下午5:45:40
     * @param ClaimInvoiceRecSettlementVO
     * @return String
     */
    public String updateClaimInvoiceRecPaymTp(@RequestBody ClaimInvoiceRecSettlementVO saveVO)throws Exception;

}