package chn.bhmc.dms.ser.wac.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceExcelVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceVO;

@Mapper("claimInvoiceReceptionDao")
public interface ClaimInvoiceReceptionDao {

	/**
	 * 
	 *<p>Title:查询结算单数量</p>
	 * @author wangc
	 * @param searchVO
	 * @return int
	 */
	int selectClaimInvoiceReceptionForInvoiceByInvoiceCnt(ClaimInvoiceSearchVO searchVO);
	/**
	 * 
	 *<p>Title:查询结算单列表信息</p>
	 * @author wangc
	 * @param searchVO
	 * @return List<ClaimInvoiceVO>
	 */
	List<ClaimInvoiceVO> selectClaimInvoiceReceptionForInvoiceByInvoicel(ClaimInvoiceSearchVO searchVO);
	
	/**
	 * 
	 *<p>Title:查询发票单数量</p>
	 * @author wangc
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return List<ClaimInvoiceVO>
	 */
	int selectClaimInvoiceDetailForInvoiceByInvoiceCnt(ClaimInvoiceDetailSearchVO searchVO);
	
	/**
	 * 
	 *<p>Title:查询发票单列表信息</p>
	 * @author wangc
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return List<ClaimInvoiceDetailVO> 
	 */
	List<ClaimInvoiceDetailVO> selectClaimInvoiceDetailForInvoiceByInvoicel(ClaimInvoiceDetailSearchVO searchVO);
	
	/**
	 * 
	 *<p>Title:根据结算报表编号查询结算单信息</p>
	 * @author wangc
	 * @serialData 2021年4月13日
	 * @param invcNo
	 * @return List<ClaimInvoiceVO>
	 */
	List<ClaimInvoiceVO> selectClaimInvoiceReceptionByInvcNo(String invcNo);
	
	/**
	 * 
	 *<p>Title:退票存储</p>
	 * @author wangc
	 * @serialData 2021年4月13日
	 * @param claimInvoiceVO
	 * @return 
	 */
	void updateClaimInvoiceRefund(ClaimInvoiceVO claimInvoiceVO);
	/**
	 * 
	 *<p>Title:收票存储</p>
	 * @author wangc
	 * @serialData 2021年4月13日
	 * @param claimInvoiceVO
	 * @return 
	 */
	void updateClaimInvoiceTaker(String invcNo);
	
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
	 * 
	 *<p>Title:下发给DMS</p>
	 * @author wangc
	 * @param claimInvoiceVO
	 * @return
	 * @param claimInvoiceVO
	 */
	void updateInvoiceService(ClaimInvoiceVO claimInvoiceVO);

}
