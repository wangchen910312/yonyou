package chn.bhmc.dms.mob.api.sales.service;

import java.util.List;

import chn.bhmc.dms.mob.api.sales.vo.SalesInvoiceVO;

public interface SalesInvoiceScanService {
	
	/**
	 * 查询扫描发票信息
	 * @param saveInvoiceVO
	 * @return
	 * @throws Exception
	 */
	public List<SalesInvoiceVO> selectInvoiceInfo(SalesInvoiceVO invoiceVO) throws Exception;
	
	/**
	 * 写扫描发票信息
	 * @param saveInvoiceVO
	 * @return
	 * @throws Exception
	 */
	public int insertInvoiceInfo(SalesInvoiceVO invoiceVO) throws Exception;
	
	/**
	 * 更新扫描发票信息
	 * @param saveInvoiceVO
	 * @return
	 * @throws Exception
	 */
	public int updateInvoiceInfo(SalesInvoiceVO invoiceVO) throws Exception;

	/**
	 * 查询发票信息
	 * @param searchVo
	 * @return
	 * @throws Exception
	 */
	public int selectInvoiceInfoCnt(SalesInvoiceVO searchVo) throws Exception;
    
	/**
	 * 发标信息
	 * @param searchVo
	 * @return
	 * @throws Exception
	 */
	public String processInvoiceInformation(SalesInvoiceVO searchVo) throws Exception;
}
