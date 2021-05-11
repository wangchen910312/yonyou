package chn.bhmc.dms.ser.wac.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.wac.service.ClaimInvoiceRemittanceService;
import chn.bhmc.dms.ser.wac.service.dao.ClaimInvoiceRemittanceDAO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRemittanceReceiptVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRemittanceSaveVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceRemittanceVO;
import chn.bhmc.dms.ser.wac.vo.FindClaimInvoiceRemittanceSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInvoiceRemittanceDAO.java
 * @Description : 索赔发票汇款service层实现类
 * @author chen shengan
 * @since 2021. 04. 09
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 09   chen shengan       索赔发票汇款service层实现类
 * </pre>
 */
@Service("claimInvoiceRemittanceService")
public class ClaimInvoiceRemittanceServiceImpl extends HService implements ClaimInvoiceRemittanceService, JxlsSupport {
	
	@Resource(name="claimInvoiceRemittanceDAO")
	ClaimInvoiceRemittanceDAO claimInvoiceRemittanceDAO;
	
	/**
     * 导出汇款单列表信息
     *
     * @param FindClaimInvoiceRemittanceSearchVO
     * @return ClaimInvoiceRemittanceVO
     */
	@Override
	public void initJxlsContext(Context context, HMap params) throws Exception {
		FindClaimInvoiceRemittanceSearchVO searchVO = new FindClaimInvoiceRemittanceSearchVO();
		
		ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
		List<ClaimInvoiceRemittanceVO> list = selectClaimInvoiceRemittanceExcel(searchVO);
		if (list.size() > 0){
			context.putVar("items", list);
		}
	}

	/**
     * 查询汇款单信息
     *
     * @param FindClaimInvoiceRemittanceSearchVO
     * @return ClaimInvoiceRemittanceVO
     */
	@Override
	public List<ClaimInvoiceRemittanceVO> findClaimInvoiceRemittance(
			FindClaimInvoiceRemittanceSearchVO findClaimInvoiceRemittanceSearchVO) throws Exception {
		String langCd = LocaleContextHolder.getLocale().getLanguage();
		findClaimInvoiceRemittanceSearchVO.setsLangCd(langCd);
		List<ClaimInvoiceRemittanceVO> claimInvoiceRemittanceVOList = claimInvoiceRemittanceDAO.findClaimInvoiceRemittance(findClaimInvoiceRemittanceSearchVO);
		return claimInvoiceRemittanceVOList;
	}

	/**
     * 查询汇款单数量
     *
     * @param FindClaimInvoiceRemittanceSearchVO
     * @return int
     */
	@Override
	public int findClaimInvoiceRemittanceCnt(FindClaimInvoiceRemittanceSearchVO findClaimInvoiceRemittanceSearchVO)
			throws Exception {
		int count = claimInvoiceRemittanceDAO.findClaimInvoiceRemittanceCnt(findClaimInvoiceRemittanceSearchVO);
		return count;
	}

	/**
     * 修改汇款单汇款状态
     *
     * @param FindClaimInvoiceRemittanceSearchVO
     * @return int
     */
	@Override
	public int updateClaimInvoiceRemittance(FindClaimInvoiceRemittanceSearchVO findClaimInvoiceRemittanceSearchVO)
			throws Exception {
		// 查询该汇款单最新状态
		List<ClaimInvoiceRemittanceVO> claimInvoiceRemittanceVOList = findClaimInvoiceRemittance(findClaimInvoiceRemittanceSearchVO);
		for (ClaimInvoiceRemittanceVO claimInvoiceRemittanceVO : claimInvoiceRemittanceVOList){ 
			// 判断该汇款单是否是未汇款状态
			if (findClaimInvoiceRemittanceSearchVO.getInvcNo().equals(claimInvoiceRemittanceVO.getInvcNo()) && 
					!claimInvoiceRemittanceVO.getPaymTp().equals("01")){
				return -1;
			}
		}
		String userId = LoginUtil.getUserId();
		findClaimInvoiceRemittanceSearchVO.setUserId(userId);
		int count = claimInvoiceRemittanceDAO.updateClaimInvoiceRemittance(findClaimInvoiceRemittanceSearchVO);
		if (count > 0){ // 判断汇款单状态是否修改成功
			List<ClaimInvoiceRemittanceVO> claimInvoiceRemittanceVOs = new ArrayList<>();
			ClaimInvoiceRemittanceVO claimInvoiceRemittanceVO = new ClaimInvoiceRemittanceVO();
			claimInvoiceRemittanceVO.setDlrCd(findClaimInvoiceRemittanceSearchVO.getDlrCd());
			claimInvoiceRemittanceVO.setInvcNo(findClaimInvoiceRemittanceSearchVO.getInvcNo());
			claimInvoiceRemittanceVOs.add(claimInvoiceRemittanceVO);
			addClaimInvoiceRemittanceInterfaceTable(claimInvoiceRemittanceVOs); // 插入接口表信息
		}
		return count;
	}

	/**
     * 查询发票信息
     *
     * @param FindClaimInvoiceRemittanceSearchVO
     * @return int
     */
	@Override
	public List<ClaimInvoiceRemittanceReceiptVO> selectReceiptByInvcNo(
			FindClaimInvoiceRemittanceSearchVO findClaimInvoiceRemittanceSearchVO) throws Exception {
		List<ClaimInvoiceRemittanceReceiptVO> claimInvoiceRemittanceReceiptVOList = claimInvoiceRemittanceDAO.selectReceiptByInvcNo(findClaimInvoiceRemittanceSearchVO);
		return claimInvoiceRemittanceReceiptVOList;
	}

	/**
     * 查询发票信息数量
     *
     * @param FindClaimInvoiceRemittanceSearchVO
     * @return int
     */
	@Override
	public int selectReceiptByInvcNoCnt(FindClaimInvoiceRemittanceSearchVO findClaimInvoiceRemittanceSearchVO)
			throws Exception {
		int count = claimInvoiceRemittanceDAO.selectReceiptByInvcNoCnt(findClaimInvoiceRemittanceSearchVO);
		return count;
	}

	/**
	 * 查询导出excel需要的数据
	 * @param findClaimInvoiceRemittanceSearchVO
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<ClaimInvoiceRemittanceVO> selectClaimInvoiceRemittanceExcel(
			FindClaimInvoiceRemittanceSearchVO findClaimInvoiceRemittanceSearchVO) throws Exception {
		String langCd = LocaleContextHolder.getLocale().getLanguage();
		findClaimInvoiceRemittanceSearchVO.setsLangCd(langCd);
		List<ClaimInvoiceRemittanceVO> list = claimInvoiceRemittanceDAO.selectClaimInvoiceRemittanceExcel(findClaimInvoiceRemittanceSearchVO);
		return list;
	}

	/**
	 * 批量修改汇款单信息
	 * @param List<FindClaimInvoiceRemittanceSearchVO>
	 * @return
	 * @throws Exception
	 */
	@Override
	public int updateClaimInvoiceRemittanceBatch(ClaimInvoiceRemittanceSaveVO claimInvoiceRemittanceSaveVO) throws Exception {
		String userId = LoginUtil.getUserId();
		List<ClaimInvoiceRemittanceVO> list = claimInvoiceRemittanceSaveVO.getUpdateList();
		int count = claimInvoiceRemittanceDAO.updateClaimInvoiceRemittanceBatch(list, userId);
		addClaimInvoiceRemittanceInterfaceTable(list);
		return count;
	}

	/**
     * 批量添加汇款单状态下发接口表信息
     *
     * @param 
     * @return int
     */
	@Override
	public int addClaimInvoiceRemittanceInterfaceTable(List<ClaimInvoiceRemittanceVO> list) throws Exception {
		List<ClaimInvoiceRemittanceVO> addList = new ArrayList<>();
		Boolean bool = true;
		List<ClaimInvoiceRemittanceVO> claimInvoiceRemittanceVOList = claimInvoiceRemittanceDAO.selectClaimInvoiceRemittanceInterfaceTable(); // 查询接口表信息
		for (ClaimInvoiceRemittanceVO claimInvoiceRemittanceVO : list){ // 循环需要插入接口表的信息
			bool = true;
			for (ClaimInvoiceRemittanceVO vo : claimInvoiceRemittanceVOList){ // 循环接口表信息
				// 判断接口表中是否已存在需要插入的信息
				if (claimInvoiceRemittanceVO.getDlrCd().equals(vo.getDlrCd()) && claimInvoiceRemittanceVO.getInvcNo().equals(vo.getInvcNo())){
					bool = false;
					break;
				}
			}
			if (bool){ // 将接口表中不存在的需要插入的信息添加到集合中
				addList.add(claimInvoiceRemittanceVO);
			}
		}
		if (addList.size() > 0){
			claimInvoiceRemittanceDAO.addClaimInvoiceRemittanceInterfaceTable(addList); // 插入接口表信息
		}
		return 0;
	}

}
