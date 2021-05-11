package chn.bhmc.dms.ser.wac.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceEditISVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceEditSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceEditVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInvoiceEditDAO.java
 * @Description : 索赔发票编辑DAO
 * @author lixinfei
 * @since 2021. 04. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 21.    lixinfei        索赔发票编辑DAO
 * </pre>
 */
@Mapper("claimInvoiceEditDAO")
public interface ClaimInvoiceEditDAO {

    /**
    *
    * 索赔发票编辑 数量查询
    *
    * @param searchVO - ClaimStatusSearchVO
    * @return long
    * @throws Exception
    */
    public long selectClaimInvoiceEditByConditionCnt(ClaimInvoiceEditSearchVO searchVO)throws Exception;

    /**
    *
    * 索赔发票编辑 分页查询
    *
    * @param searchVO - ClaimStatusSearchVO
    * @return List<ClaimInvoiceEditVO>
    * @throws Exception
    */
    public List<ClaimInvoiceEditVO> selectClaimInvoiceEditByCondition(ClaimInvoiceEditSearchVO searchVO)throws Exception;

    /**
    *
    * 查询当前修改的发票所在的索赔主单是否为“未开票”状态
    * 若当前修改发票所在的索赔主单不是未开票状态，则阻止本次修改
    *
    * @param searchVO - ClaimInvoiceEditSearchVO
    * @return long
    * @throws Exception
    */
    public String selectClaimInvoiceStateByCondition(ClaimInvoiceEditSearchVO searchVO)throws Exception;
    
    /**
     * 更新当前发票备注信息，若返回1更新成功，否则失败
     * SA_0502T     发票信息表（SETTLEMENT_NO 与 索赔结算单信息INVC_NO、经销商代码DLR_CD 关联查询）
     * <p>Title: </p >
     * @author lixinfei 2021年4月7日 下午5:45:40
     * @param ClaimInvoiceEditMap
     * @return int
     */
    public int updateClaimInvoiceByInvcNo(ClaimInvoiceEditVO claimInvoiceEditVO)throws Exception;
    
    /**
    *
    * 索赔发票编辑 查询接口表SA_0502_2IS是否存在当前发票信息
    *
    * @param String String
    * @return int
    * @throws Exception
    */
    public int selectClaimInvoiceEditIfExistByReceiptId(ClaimInvoiceEditVO claimInvoiceEditVO)throws Exception;
    
    /**
     * 更新当前发票在接口表SA_0502_2IS中的信息，若返回1更新成功，否则失败
     * SA_0502T     发票信息表（SETTLEMENT_NO 与 索赔结算单信息INVC_NO、经销商代码DLR_CD 关联查询）
     * <p>Title: </p >
     * @author lixinfei 2021年4月7日 下午5:45:40
     * @param ClaimInvoiceEditISVO
     * @return int
     */
    public int updateClaimInvoiceByReceiptId(ClaimInvoiceEditISVO claimInvoiceEditISVO)throws Exception;
    
    /**
     * SA_0502_2IS插入一条发票记录，若返回了插入数量，则插入成功，否则失败
     * <p>Title: </p >
     * @author lixinfei 2021年4月7日 下午5:43:23
     * @param ClaimInvoiceEditISVO
     * @return long
     */
    public long insertClaimInvoiceToInterfaceTable(ClaimInvoiceEditISVO claimInvoiceEditISVO)throws Exception;
    
    
}