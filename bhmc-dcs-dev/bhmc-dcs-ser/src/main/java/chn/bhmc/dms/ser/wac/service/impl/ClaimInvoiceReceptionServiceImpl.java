package chn.bhmc.dms.ser.wac.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;
import chn.bhmc.dms.ser.wac.service.ClaimInvoiceReceptionService;
import chn.bhmc.dms.ser.wac.service.dao.ClaimInvoiceReceptionDao;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceExcelVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceVO;
import able.com.util.fmt.StringUtil;
/**
 * 
 *<p>Title:索赔发票接收</p>
 * @author wangc 2021年4月7日23:01:50
 * @param
 * @return
 */
@Service("claimInvoiceReceptionService")
public class ClaimInvoiceReceptionServiceImpl extends HService implements ClaimInvoiceReceptionService , JxlsSupport{
	@Resource(name="claimInvoiceReceptionDao")
	ClaimInvoiceReceptionDao claimInvoiceReceptionDAO;
	/**
	 * 
	 *<p>Title:查询结算单数量</p>
	 * @author wangc
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return int
	 */
	@Override
	public int selectClaimInvoiceReceptionForInvoiceByInvoiceCnt(ClaimInvoiceSearchVO searchVO) {
		
		searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());//设置语言
		
		return claimInvoiceReceptionDAO.selectClaimInvoiceReceptionForInvoiceByInvoiceCnt(searchVO);
	}
	/**
	 * 
	 *<p>Title:查询结算单列表信息</p>
	 * @author wangc
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return List<ClaimInvoiceVO>
	 */
	@Override
	public List<ClaimInvoiceVO> selectClaimInvoiceReceptionForInvoiceByInvoicel(ClaimInvoiceSearchVO searchVO) {
		
		searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());//设置语言
		
		
		return claimInvoiceReceptionDAO.selectClaimInvoiceReceptionForInvoiceByInvoicel(searchVO);
	}
	
	/**
	 * 
	 *<p>Title:查询发票单数量</p>
	 * @author wangc
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return List<ClaimInvoiceVO>
	 */
	@Override
	public int selectClaimInvoiceDetailForInvoiceByInvoiceCnt(ClaimInvoiceDetailSearchVO searchVO) {
		searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());//设置语言
		return claimInvoiceReceptionDAO.selectClaimInvoiceDetailForInvoiceByInvoiceCnt(searchVO);
	}
	
	/**
	 * 
	 *<p>Title:查询发票单列表信息</p>
	 * @author wangc
	 * @serialData 2021年4月8日
	 * @param searchVO
	 * @return List<ClaimInvoiceDetailVO> 
	 */
	@Override
	public List<ClaimInvoiceDetailVO> selectClaimInvoiceDetailForInvoiceByInvoicel(
			ClaimInvoiceDetailSearchVO searchVO) {
		searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());//设置语言
		
		return claimInvoiceReceptionDAO.selectClaimInvoiceDetailForInvoiceByInvoicel(searchVO);
	}
	/**
    * 
    *<p>Title:退票操作</p>
    * @author wangc
    * @serialData 2021年4月8日
	* @method 
	* 1、根据结算报表编号查询结算单信息
    * 2、判断结算单号是否存在多条
    * 3、判断是否已经取消了，取消了不可以再退票
    * 4、判断当前的开票状态是否是已退票状态，如果是，则不可以再退票，如果不是，才可以退票
    * 5、修改开票状态变为已退票/快递状态为已邮寄等退票信息
    * 6、下发DMS
    * @param invcNo 索赔结算单信息
    * @return String
    */
	@Override
	public String refundClaimInvoiceReception(ClaimInvoiceSearchVO searchVO) {
		String result = "success";//返回退票结果
		String invcNo = searchVO.getSinvcNo();// 索赔结算单信息
		//1、根据结算报表编号查询结算单信息
		List<ClaimInvoiceVO> claimInvoiceVOList = new ArrayList<ClaimInvoiceVO>();//接收根据结算单编号查询的结算单信息,怕一个结算单编号对应多个结算单，导致异常现象
		claimInvoiceVOList = claimInvoiceReceptionDAO.selectClaimInvoiceReceptionByInvcNo(invcNo);//根据结算报表编号查询结算单信息
		//2、判断结算单号是否存在多条
		if(claimInvoiceVOList.size()>1){
			 result = "根据结算单号查询出多条结算单信息！";
		}else{
			ClaimInvoiceVO claimInvoiceVO = claimInvoiceVOList.get(0);//正常就应该是一条索赔结算单信息
			//3、判断是否已经取消了，取消了不可以再退票
			if("Y".equals(claimInvoiceVO.getCancelYn())){
				result = "当前结算单状态已取消，不可以在退票！";
			}else{
				//4、判断当前的开票状态是否是已退票状态，如果是，则不可以再退票，如果不是，才可以退票
				if("03".equals(claimInvoiceVO.getReceiptTp())){
					result = "当前结算单状态已退票，不可以再退票！";
				}else{
					//5、修改开票状态变为已退票/快递状态为已邮寄等退票信息
					claimInvoiceVO.setReceiptTp("03");//已退票
					claimInvoiceVO.setTrsfTp("02");//已邮寄
					claimInvoiceVO.setFailMsg(searchVO.getSfailMsg());//退票原因
					claimInvoiceVO.setFailRemark(searchVO.getSfailRemark());//退票备注
					//claimInvoiceVO.setTrsfNo(searchVO.getStrsfNo());//快递单号
					//claimInvoiceVO.setExpsCmpNm(searchVO.getSexpsCmpNm());//快递公司
					//claimInvoiceVO.setSenderNm(searchVO.getSsenderNm());//寄件人
					//claimInvoiceVO.setSenderTelno(searchVO.getSsenderTelno());//寄件人联系电话
				    claimInvoiceReceptionDAO.updateClaimInvoiceRefund(claimInvoiceVO);//退票存储
				    //6、下发DMS
				    claimInvoiceReceptionDAO.updateInvoiceService(claimInvoiceVO);//下发DMS
				}
				
			}
			
		}
		return result;
	}
	
	/**
    * 
    *<p>Title:收票操作</p>
    * @author wangc
    * @serialData 2021年4月8日
	* @method 
	* 1、根据结算报表编号查询结算单信息
    * 2、判断结算单号是否存在多条
    * 3、判断是否已经取消了，取消了不可以再收票
    * 4、判断当前的开票状态是否是已退票状态，如果是，则不可以再退票，如果不是，才可以退票
    * 4、判断当前的开票状态是否是已收票状态，如果是，则不可以再收票，如果不是，才可以收票
    * 5、开票状态为“已开票”/快递状态为“车厂接收”
    * 6、下发DMS
    * @param invcNo 索赔结算单信息
    * @return String
    */
	@Override
	public String takerClaimInvoiceReception(String invcNo) {
		String result = "success";//返回收票结果
		//1、根据结算报表编号查询结算单信息
		List<ClaimInvoiceVO> claimInvoiceVOList = new ArrayList<ClaimInvoiceVO>();//接收根据结算单编号查询的结算单信息,怕一个结算单编号对应多个结算单，导致异常现象
		claimInvoiceVOList = claimInvoiceReceptionDAO.selectClaimInvoiceReceptionByInvcNo(invcNo);//根据结算报表编号查询结算单信息
		//2、判断结算单号是否存在多条
		if(claimInvoiceVOList.size()>1){
			 result = "根据结算单号查询出多条结算单信息！";
		}else{
			ClaimInvoiceVO claimInvoiceVO = claimInvoiceVOList.get(0);//正常就应该是一条索赔结算单信息
			//3、判断是否已经取消了，取消了不可以再收票
			if("Y".equals(claimInvoiceVO.getCancelYn())){
				result = "当前结算单状态已取消，不可以在收票！";
			}else{
				//4、判断当前的开票状态是否是已退票状态，如果是，则不可以再退票，如果不是，才可以退票
				if("03".equals(claimInvoiceVO.getReceiptTp())){
					result = "当前结算单状态已退票，不可以在收票！";
				//4、判断当前的开票状态是否是已收票状态，如果是，则不可以再收票，如果不是，才可以收票
				}else if("02".equals(claimInvoiceVO.getReceiptTp())){
					result = "当前结算单状态已收票，不可以在收票！";
				}else{
					//5、开票状态为“已开票”/快递状态为“车厂接收”
				    claimInvoiceReceptionDAO.updateClaimInvoiceTaker(invcNo);//收票存储
				    //6、下发DMS
				    claimInvoiceReceptionDAO.updateInvoiceService(claimInvoiceVO);//下发DMS
				}
				
			}
			
		}
		
		return result;
	}
	/**
	 * 
	 * @MethodName: initJxlsContext
	 * <p>Title: Excel的导出方法</p >
	 * @Description: TODO
	 * @author wangc
	 * @param context
	 * @param params
	 * @throws Exception void
	 * @date 2021年4月14日10:40:14
	 */
	@Override
	public void initJxlsContext(Context context, HMap params) throws Exception {
		ClaimInvoiceSearchVO searchVO = new ClaimInvoiceSearchVO();
    	 
        if(!StringUtils.isBlank(params.get("sinvcsFromDt").toString())&&!"null".equals(params.get("sinvcsFromDt").toString())){
            String sFromRoDt = params.get("sinvcsFromDt").toString();
            Date dFromRoDt = DateUtil.convertToDate(sFromRoDt);
            searchVO.setSinvcsFromDt(dFromRoDt);//结算报表年月日开始时间
        }
        if(!StringUtils.isBlank(params.get("sinvcsToDt").toString())&&!"null".equals(params.get("sinvcsToDt").toString())){
            String sToRoDt = params.get("sinvcsToDt").toString();
            Date dToRoDt = DateUtil.convertToDate(sToRoDt);
            searchVO.setSinvcsToDt(dToRoDt);//结算报表年月日结束时间
        }
       
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        List<ClaimInvoiceExcelVO> list = claimInvoiceReceptionDAO.selectClaimInvoiceReceptionByExcel(searchVO);		
        context.putVar("items", list);
	}
	
	
}
