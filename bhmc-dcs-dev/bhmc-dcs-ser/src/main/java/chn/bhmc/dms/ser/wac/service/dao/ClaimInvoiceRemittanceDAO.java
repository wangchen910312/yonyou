package chn.bhmc.dms.ser.wac.service.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRemittanceReceiptVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRemittanceVO;
import chn.bhmc.dms.ser.wac.vo.FindClaimInvoiceRemittanceSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInvoiceRemittanceDAO.java
 * @Description : 索赔发票汇款DAO层
 * @author chen shengan
 * @since 2021. 04. 09
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 09   chen shengan       索赔发票汇款DAO层
 * </pre>
 */
@Mapper("claimInvoiceRemittanceDAO")
public interface ClaimInvoiceRemittanceDAO {

	/**
     * 查询汇款单信息
     *
     * @param FindClaimInvoiceRemittanceSearchVO
     * @return ClaimInvoiceRemittanceVO
     */
	public List<ClaimInvoiceRemittanceVO> findClaimInvoiceRemittance (FindClaimInvoiceRemittanceSearchVO findClaimInvoiceRemittanceSearchVO) throws Exception;
	
	/**
     * 查询汇款单数量
     *
     * @param FindClaimInvoiceRemittanceSearchVO
     * @return int
     */
	public int findClaimInvoiceRemittanceCnt (FindClaimInvoiceRemittanceSearchVO findClaimInvoiceRemittanceSearchVO) throws Exception;
	
	/**
     * 修改汇款单汇款状态
     *
     * @param FindClaimInvoiceRemittanceSearchVO
     * @return int
     */
	public int updateClaimInvoiceRemittance (FindClaimInvoiceRemittanceSearchVO findClaimInvoiceRemittanceSearchVO) throws Exception;
	
	/**
	 * 查询发票信息
	 * @param findClaimInvoiceRemittanceSearchVO
	 * @return
	 * @throws Exception
	 */
	public List<ClaimInvoiceRemittanceReceiptVO> selectReceiptByInvcNo (FindClaimInvoiceRemittanceSearchVO findClaimInvoiceRemittanceSearchVO) throws Exception;
	
	/**
	 * 查询发票信息数量
	 * @param findClaimInvoiceRemittanceSearchVO
	 * @return
	 * @throws Exception
	 */
	public int selectReceiptByInvcNoCnt (FindClaimInvoiceRemittanceSearchVO findClaimInvoiceRemittanceSearchVO) throws Exception;
	
	/**
	 * 查询导出excel需要的数据
	 * @param findClaimInvoiceRemittanceSearchVO
	 * @return
	 * @throws Exception
	 */
	public List<ClaimInvoiceRemittanceVO> selectClaimInvoiceRemittanceExcel (FindClaimInvoiceRemittanceSearchVO findClaimInvoiceRemittanceSearchVO) throws Exception;
	
	/**
     * 批量修改汇款单汇款状态
     *
     * @param 
     * @return int
     */
	public int updateClaimInvoiceRemittanceBatch (@Param("list")List<ClaimInvoiceRemittanceVO> list, @Param("userId")String userId) throws Exception;
	
	/**
     * 批量添加汇款单状态下发接口表信息
     *
     * @param 
     * @return int
     */
	public int addClaimInvoiceRemittanceInterfaceTable (@Param("list")List<ClaimInvoiceRemittanceVO> list) throws Exception;
	
	/**
     * 查询汇款单状态下发接口表信息
     *
     * @param 
     * @return int
     */
	public List<ClaimInvoiceRemittanceVO> selectClaimInvoiceRemittanceInterfaceTable () throws Exception;
	
}
