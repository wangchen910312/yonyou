package chn.bhmc.dms.ser.wac.service;

import java.util.List;

import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceVO;

/**
 * 
 *<p>Title:索赔发票创建</p>
 * @author yixd 2021年4月7日23:00:52
 * @param
 * @return
 */
public interface ClaimInvoiceReceptionService {
	/**
	 * 
	 *<p>Title:查询结算单数量</p>
	 * @author yixd
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return int
	 */
	public int selectClaimInvoiceReceptionForInvoiceByInvoiceCnt(ClaimInvoiceSearchVO searchVO);
	/**
	 * 
	 *<p>Title:查询结算单列表信息</p>
	 * @author yixd
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return List<ClaimInvoiceVO>
	 */
	public List<ClaimInvoiceVO> selectClaimInvoiceReceptionForInvoiceByInvoicel(ClaimInvoiceSearchVO searchVO);
	
	/**
	 * 
	 *<p>Title:查询发票单列表数量</p>
	 * @author yixd
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return int
	 */
	public int selectClaimInvoiceDetailForInvoiceByInvoiceCnt(ClaimInvoiceDetailSearchVO searchVO);
	
	/**
	 * 
	 *<p>Title:查询发票单列表信息</p>
	 * @author yixd
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return int
	 */
	public List<ClaimInvoiceDetailVO> selectClaimInvoiceDetailForInvoiceByInvoicel(ClaimInvoiceDetailSearchVO searchVO);
	
		
	/**
    * 
    *<p>Title:取消操作</p>
    * @author yixd
    * @serialData 2021年4月14日
    * @param invcNo 索赔结算单号
    * @return String
    */
	public String cancelClaimInvoiceReception(String invcNo);
	
	
	/**
    * 
    *<p>Title:退票接收操作</p>
    * @author yixd
    * @serialData 2021年4月14日
    * @param invcNo 索赔结算单号
    * @return String
    */
	public String quitReceiveClaimInvoiceReception(String invcNo);
	
	
	/**
    * 
    *<p>Title:保存操作</p>
    * @author yixd
    * @serialData 2021年4月14日
    * @param searchVO 索赔结算单VO
    * @return String
    */
	public String saveReceiveClaimInvoiceReception(ClaimInvoiceSearchVO searchVO);
	
	/**
    * 
    *<p>Title:提报操作</p>
    * @author yixd
    * @serialData 2021年4月15日
    * @param searchVO 索赔结算单VO
    * @return String
    */
	public String submitReceiveClaimInvoiceReception(ClaimInvoiceSearchVO searchVO);
	

	/**
    * 
    *<p>Title:删除发票子表</p>
    * @author yixd
    * @serialData 2021年4月16日
    * @param searchVO 索赔结算单VO
    * @return String
    */
   public String delClaimInvoiceDetailReception(ClaimInvoiceDetailVO searchVO);
	
	

}
