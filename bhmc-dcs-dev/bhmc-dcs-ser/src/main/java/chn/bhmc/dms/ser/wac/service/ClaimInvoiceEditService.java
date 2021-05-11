package chn.bhmc.dms.ser.wac.service;

import java.util.List;

import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceEditMap;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceEditSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceEditVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInvoiceEditService.java
 * @Description : 索赔发票编辑Service
 * @author lixinfei
 * @since 2021. 04. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 21.     lixinfei      索赔发票编辑Service
 * </pre>
 */

public interface ClaimInvoiceEditService {

    /**
    *
    * 索赔发票编辑 数量查找
    *
    * @param searchVO - ClaimInvoiceEditSearchVO
    * @return long
    * @throws Exception
    */
    public long selectClaimInvoiceEditByConditionCnt(ClaimInvoiceEditSearchVO searchVO)throws Exception;


    /**
    *
    * 索赔发票编辑 分页查询
    *
    * @param searchVO - ClaimInvoiceEditSearchVO
    * @return List<ClaimInvoiceEditVO>
    * @throws Exception
    */
    public List<ClaimInvoiceEditVO> selectClaimInvoiceEditByCondition(ClaimInvoiceEditSearchVO searchVO)throws Exception;
    
    /**
     * 更新当前发票备注信息，若返回1更新成功，否则失败
     * SA_0502T     发票信息表（SETTLEMENT_NO 与 索赔结算单信息INVC_NO、经销商代码DLR_CD 关联查询）
     * - REMARK 备注
     * <p>Title: </p >
     * @author lixinfei 2021年4月7日 下午5:45:40
     * @param ClaimInvoiceEditMap
     * @return StringBuffer
     */
    public StringBuffer updateClaimInvoiceByInvcNo(ClaimInvoiceEditMap claimInvoiceEditMap)throws Exception;
    

}