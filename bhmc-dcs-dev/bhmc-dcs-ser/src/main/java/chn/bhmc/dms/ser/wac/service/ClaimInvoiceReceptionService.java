package chn.bhmc.dms.ser.wac.service;

import java.util.List;

import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceVO;

/**
 * 
 *<p>Title:索赔发票接收</p>
 * @author wangc 2021年4月7日23:00:52
 * @param
 * @return
 */
public interface ClaimInvoiceReceptionService {
	/**
	 * 
	 *<p>Title:查询结算单数量</p>
	 * @author wangc
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return int
	 */
	public int selectClaimInvoiceReceptionForInvoiceByInvoiceCnt(ClaimInvoiceSearchVO searchVO);
	/**
	 * 
	 *<p>Title:查询结算单列表信息</p>
	 * @author wangc
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return List<ClaimInvoiceVO>
	 */
	public List<ClaimInvoiceVO> selectClaimInvoiceReceptionForInvoiceByInvoicel(ClaimInvoiceSearchVO searchVO);
	
	/**
	 * 
	 *<p>Title:查询发票单列表数量</p>
	 * @author wangc
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return int
	 */
	public int selectClaimInvoiceDetailForInvoiceByInvoiceCnt(ClaimInvoiceDetailSearchVO searchVO);
	
	/**
	 * 
	 *<p>Title:查询发票单列表信息</p>
	 * @author wangc
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return int
	 */
	public List<ClaimInvoiceDetailVO> selectClaimInvoiceDetailForInvoiceByInvoicel(ClaimInvoiceDetailSearchVO searchVO);
	
	
	/**
    * 
    *<p>Title:退票操作</p>
    * @author wangc
    * @serialData 2021年4月8日
    * @param invcNo 索赔结算单信息
    * @return String
    */
	public String refundClaimInvoiceReception(ClaimInvoiceSearchVO searchVO);
	
	/**
    * 
    *<p>Title:收票操作</p>
    * @author wangc
    * @serialData 2021年4月8日
    * @param invcNo 索赔结算单信息
    * @return String
    */
	public String takerClaimInvoiceReception(String invcNo);
	

}
