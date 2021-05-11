package chn.bhmc.dms.ser.wac.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceExcelVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceTaxNoVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceVO;

/**
 * 
 *<p>索赔发票创建</p>
 * @author yixd 2021年4月7日23:00:52
 * @param
 * @return
 */

@Mapper("claimInvoiceReceptionDao")
public interface ClaimInvoiceReceptionDao {

	/**
	 * 
	 *<p>Title:查询结算单数量</p>
	 * @author yixd
	 * @param searchVO
	 * @return int
	 */
	int selectClaimInvoiceReceptionForInvoiceByInvoiceCnt(ClaimInvoiceSearchVO searchVO);
	/**
	 * 
	 *<p>Title:查询结算单列表信息</p>
	 * @author yixd
	 * @param searchVO
	 * @return List<ClaimInvoiceVO>
	 */
	List<ClaimInvoiceVO> selectClaimInvoiceReceptionForInvoiceByInvoicel(ClaimInvoiceSearchVO searchVO);
	
	/**
	 * 
	 *<p>Title:查询发票单数量</p>
	 * @author yixd
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return List<ClaimInvoiceVO>
	 */
	int selectClaimInvoiceDetailForInvoiceByInvoiceCnt(ClaimInvoiceDetailSearchVO searchVO);
	
	/**
	 * 
	 *<p>Title:查询发票单列表信息</p>
	 * @author yixd
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return List<ClaimInvoiceDetailVO> 
	 */
	List<ClaimInvoiceDetailVO> selectClaimInvoiceDetailForInvoiceByInvoicel(ClaimInvoiceDetailSearchVO searchVO);
	
	/**
	 * 
	 *<p>Title:根据结算报表编号、发票号、发票代码查询结算单信息</p>
	 * @author yixd
	 * @serialData 2021年4月13日
	 * @param invcNo
	 * @return List<ClaimInvoiceVO>
	 */
	List<ClaimInvoiceVO> selectClaimInvoiceReceptionByInvcNo(String invcNo);
	
	/**
	 * 
	 *<p>Title:根据结算报表编号查询索赔发票列表信息</p>
	 * @author yixd
	 * @serialData 2021年4月13日
	 * @param invcNo
	 * @return List<ClaimInvoiceDetailVO>
	 */
	List<ClaimInvoiceDetailVO> selectClaimInvoiceDtsReceptionByInvcNo(String invcNo);
	
	/**
	 * 
	 *<p>Title:查询系统默认纳税人识别号和发票抬头</p>
	 * @author yixd
	 * @serialData 2021年5月10日
	 * @param invcNo
	 * @return List<ClaimInvoiceTaxNoVO>
	 */
	List<ClaimInvoiceTaxNoVO> selectClaimInvoiceTaxNo(String invcNo);
	
	/**
	 * 
	 *<p>Title:根据结算单号查询结算金额</p>
	 * @author yixd
	 * @param invcNo
	 * @return double
	 */
	double selectClaimInvoiceBalanceAmtByInvcNo(String invcNo);
	
	/**
	 * 
	 *<p>Title:根据结算单号查询发票金额之和</p>
	 * @author yixd
	 * @param invcNo
	 * @return double
	 */
	double selectClaimInvoiceDetailSumAmtByInvcNo(String invcNo);
	
	/**
	 * 
	 *<p>Title:根据结算报表编号查询发票信息</p>
	 * @author yixd
	 * @serialData 2021年4月16日
	 * @param searchVO
	 * @return List<ClaimInvoiceDetailVO>
	 */
	List<ClaimInvoiceDetailVO> selectClaimInvoiceDetailReceptionByInvcNo(ClaimInvoiceDetailVO searchVO);
	
	
	/**
	 * 
	 *<p>Title:取消存储</p>
	 * @author yixd
	 * @serialData 2021年4月14日
	 * @param claimInvoiceVO
	 * @return 
	 */
	void updateClaimInvoiceCancel(String invcNo);	
	
	
	/**
	 * 
	 *<p>Title:退票接收存储</p>
	 * @author yixd
	 * @serialData 2021年4月14日
	 * @param claimInvoiceVO
	 * @return 
	 */
	void updateClaimInvoiceQuitReceive(String invcNo);
	
	/**
	 * 
	 *<p>Title:保存</p>
	 * @author yixd
	 * @serialData 2021年4月14日
	 * @param claimInvoiceVO
	 * @return 
	 */
	void insertClaimInvoice(ClaimInvoiceVO claimInvoiceVO);
	
	/**
	 * 
	 *<p>Title:保存接口表 se_0960is 结算单发票主表</p>
	 * @author yixd
	 * @serialData 2021年4月14日
	 * @param claimInvoiceVO
	 * @return 
	 */
	void insertClaimInvoiceIS(ClaimInvoiceVO claimInvoiceVO);
	
	/**
	 * 
	 *<p>Title:保存接口表sa_0502_4is 结算单发票子表</p>
	 * @author yixd
	 * @serialData 2021年4月14日
	 * @param claimInvoiceVO
	 * @return 
	 */
	void insertClaimInvoiceDetailIS(ClaimInvoiceDetailVO claimInvoiceDetailVO);
	
	/**
	 *<p>Title:保存-更新</p>
	 * @author yixd
	 * @serialData 2021年4月14日
	 * @param claimInvoiceVO
	 * @return 
	 */
	void updateClaimInvoice(ClaimInvoiceVO claimInvoiceVO);
	
	
	/**
	 *<p>Title:提报-更新</p>
	 * @author yixd
	 * @serialData 2021年4月14日
	 * @param claimInvoiceVO
	 * @return 
	 */
	void updateClaimInvoiceForSubmit(ClaimInvoiceVO claimInvoiceVO);
	
	/**
	 * 
	 *<p>Title:导出Excel实体类</p>
	 * @author wangc
	 * @serialData 2021年4月13日
	 * @author wangc
	 * @param searchVO
	 * @return
	 */
	List<ClaimInvoiceExcelVO> selectClaimInvoiceReceptionByExcel(ClaimInvoiceSearchVO searchVO);
	
	/**
	 *<p>Title:删除发票子表</p>
	 * @author yixd
	 * @serialData 2021年4月14日
	 * @param ClaimInvoiceDetailVO
	 * @return 
	 */
	void updateClaimInvoiceForDel(ClaimInvoiceDetailVO claimInvoiceVO);

}
