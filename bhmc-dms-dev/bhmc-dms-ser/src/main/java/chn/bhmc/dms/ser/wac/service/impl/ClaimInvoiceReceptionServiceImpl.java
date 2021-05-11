package chn.bhmc.dms.ser.wac.service.impl;

import java.math.BigDecimal;
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
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.wac.service.ClaimInvoiceReceptionService;
import chn.bhmc.dms.ser.wac.service.dao.ClaimInvoiceReceptionDao;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceDetailVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceExcelVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceTaxNoVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInvoiceVO;


/**
 * 
 *<p>Title:索赔发票创建</p>
 * @author yixd 2021年4月7日23:01:50
 * @param
 * @return
 */
@Service("claimInvoiceReceptionService")
public class ClaimInvoiceReceptionServiceImpl extends HService implements ClaimInvoiceReceptionService,JxlsSupport {
	@Resource(name="claimInvoiceReceptionDao")
	ClaimInvoiceReceptionDao claimInvoiceReceptionDAO;
	/**
	 * 
	 *<p>Title:查询结算单数量</p>
	 * @author yixd
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
	 * @author yixd
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
	 * @author yixd
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
	 * @author yixd
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
    *<p>Title:取消操作</p>
    * @author yixd
    * @serialData 2021年4月14日
	* @method 
	* 1、开票状态为“未开票”
    * 2、快递状态为“未邮寄”
    * 3、下发DCS
    * @param invcNo 索赔结算单号
    * @return String
    */
	@Override
	public String cancelClaimInvoiceReception(String invcNo) {
		String result = "success";//返回取消结果
		//1、根据结算报表编号查询结算单信息
		List<ClaimInvoiceVO> claimInvoiceVOList = new ArrayList<ClaimInvoiceVO>();//接收根据结算单编号查询的结算单信息,怕一个结算单编号对应多个结算单，导致异常现象
		claimInvoiceVOList = claimInvoiceReceptionDAO.selectClaimInvoiceReceptionByInvcNo(invcNo);//根据结算报表编号查询结算单信息
		//2、判断结算单号是否存在多条
		if(claimInvoiceVOList.size()>1){
			 result = "根据结算单号查询出多条结算单信息！";
		}else{
			ClaimInvoiceVO claimInvoiceVO = claimInvoiceVOList.get(0);//正常就应该是一条索赔结算单信息
			//3、判断当前的取消状态是否是已取消，如果是，则不可以再取消，如果不是，才可以取消
			if("Y".equals(claimInvoiceVO.getCancelYn())){
				result = "当前结算单已取消，不可以再取消！";
			}else{
				//4、开票状态为“未开票”/快递状态为“未邮寄”/是否取消为“Y”
			    claimInvoiceReceptionDAO.updateClaimInvoiceCancel(invcNo);//取消存储
			    //5、提报到DCS 存入发票主表接口表
			    claimInvoiceReceptionDAO.insertClaimInvoiceIS(claimInvoiceVO);//提报-存入结算单发票主表接口表
			}
		}
		
		return result;
	}

	
	/**
    * 
    *<p>Title:退票接收操作</p>
    * @author yixd
    * @serialData 2021年4月14日
	* @method 
    * 快递状态为“退票接收”
    * 下发DCS
    * @param invcNo 索赔结算单号
    * @return String
    */
	@Override
	public String quitReceiveClaimInvoiceReception(String invcNo) {
		String result = "success";//返回取消结果
		//1、根据结算报表编号查询结算单信息
		List<ClaimInvoiceVO> claimInvoiceVOList = new ArrayList<ClaimInvoiceVO>();//接收根据结算单编号查询的结算单信息,怕一个结算单编号对应多个结算单，导致异常现象
		claimInvoiceVOList = claimInvoiceReceptionDAO.selectClaimInvoiceReceptionByInvcNo(invcNo);//根据结算报表编号查询结算单信息
		//2、判断结算单号是否存在多条
		if(claimInvoiceVOList.size()>1){
			 result = "根据结算单号查询出多条结算单信息！";
		}else{
			ClaimInvoiceVO claimInvoiceVO = claimInvoiceVOList.get(0);//正常就应该是一条索赔结算单信息
			//3、判断当前的快递状态是否是退票接收，如果是，则不可以再操作退票接收，如果不是，才可以退票接收
			if("04".equals(claimInvoiceVO.getTrsfTp())){
				result = "当前结算单快递状态是退票接收，不可以再进行退票接收操作！";
			}else{
				//4、快递状态为“退票接收”
			    claimInvoiceReceptionDAO.updateClaimInvoiceQuitReceive(invcNo);//退票接收存储
			    //5、提报到DCS 存入发票主表接口表
			    claimInvoiceReceptionDAO.insertClaimInvoiceIS(claimInvoiceVO);//提报-存入结算单发票主表接口表
			}
		}
		
		return result;
	}
	
	
	
	/**
    * 
    *<p>Title:保存操作</p>
    * @author yixd
    * @serialData 2021年4月14日
	* @method 
	* 1、如果存在结算单号，则更新数据，如果不存在，则插入一条
    * @param invcNo 索赔结算单信息
    * @return String
    */
	@Override
	public String saveReceiveClaimInvoiceReception(ClaimInvoiceSearchVO searchVO) {
		String result = "success";//返回退票结果
		String invcNo = searchVO.getSinvcNo();// 索赔结算单信息
		Date nowDate = new Date();//当前时间
		
		//1、根据结算报表编号查询结算单信息
		List<ClaimInvoiceVO> claimInvoiceVOList = new ArrayList<ClaimInvoiceVO>();//接收根据结算单编号查询的结算单信息,怕一个结算单编号对应多个结算单，导致异常现象
		claimInvoiceVOList = claimInvoiceReceptionDAO.selectClaimInvoiceReceptionByInvcNo(invcNo);//根据结算报表编号查询结算单信息
		
		List<ClaimInvoiceDetailVO> claimInvoiceDetailVOList = new ArrayList<ClaimInvoiceDetailVO>();//接收根据结算单编号查询的结算单信息,怕一个结算单编号对应多个结算单，导致异常现象
		claimInvoiceDetailVOList = claimInvoiceReceptionDAO.selectClaimInvoiceDtsReceptionByInvcNo(invcNo);//根据结算报表编号查询发票列表
		
		//2、判断结算金额和发票金额之和是否相等
		Double claimInoviceBalanceAmt = 0.00 ;
		claimInoviceBalanceAmt = claimInvoiceReceptionDAO.selectClaimInvoiceBalanceAmtByInvcNo(invcNo);//根据结算单号查询结算金额
		
		Double claimInoviceDetailSumAmt = 0.00 ;
		claimInoviceDetailSumAmt = claimInvoiceReceptionDAO.selectClaimInvoiceDetailSumAmtByInvcNo(invcNo);//根据结算单号查询发票金额之和
		
		BigDecimal data1 = new BigDecimal(claimInoviceBalanceAmt); 
		BigDecimal data2 = new BigDecimal(claimInoviceDetailSumAmt); 
		 
		if(data1.compareTo(data2)!=0){
			result = "发票金额与结算报表信息不符";
			return result;
		}
		
		//3、判断纳税人识别号和发票抬头是否有误
		
		String taxNo = "";//税号  91110113MA0081AT4N
		String buyNm = "";//抬头 北京现代汽车有限公司销售分公司
		
		List<ClaimInvoiceTaxNoVO> claimInvoiceTaxNoVOList = new ArrayList<ClaimInvoiceTaxNoVO>();//查询系统默认纳税人识别号和发票抬头
		claimInvoiceTaxNoVOList = claimInvoiceReceptionDAO.selectClaimInvoiceTaxNo(invcNo);
		
		if(claimInvoiceTaxNoVOList.size()>0){
			taxNo = claimInvoiceTaxNoVOList.get(0).getTaxNo();
			buyNm = claimInvoiceTaxNoVOList.get(0).getBuyNm();
			
		}
		
		if(claimInvoiceDetailVOList.size()>0){//如果结算单发票子表有数据列表则插入接口表
	    	for(ClaimInvoiceDetailVO claimInvoiceDetailCheck : claimInvoiceDetailVOList){
	    		if(!taxNo.equals(claimInvoiceDetailCheck.getTaxpayerIdCd())||!buyNm.equals(claimInvoiceDetailCheck.getBuyNm())){
	    			result = "索赔发票的纳税人识别号或发票抬头不正确";
	    			return result;
	    		}
		    }
	    }
		
		//4、判断结算单号是否存在多条
		if(claimInvoiceVOList.size()>1){
			 result = "根据结算单号查询出多条结算单信息！";
		}else if(claimInvoiceVOList.size()<1){ //保存操作
			ClaimInvoiceVO claimInvoiceVO = new ClaimInvoiceVO();
			
			claimInvoiceVO.setDlrCd(LoginUtil.getDlrCd());
			claimInvoiceVO.setInvcNo(invcNo);
			claimInvoiceVO.setReceiptTp("01");//未开票
			claimInvoiceVO.setTrsfTp("01");//未邮寄
			claimInvoiceVO.setExpsCmpNm(searchVO.getSexpsCmpNm());//快递公司
			claimInvoiceVO.setTrsfNo(searchVO.getStrsfNo());//快递单号
			claimInvoiceVO.setRemark(searchVO.getSremark());//快递备注
			claimInvoiceVO.setSenderNm(searchVO.getSsenderNm());//寄件人
			claimInvoiceVO.setSenderTelno(searchVO.getSsenderTelno());//寄件人联系电话
			claimInvoiceVO.setSenderAddr(searchVO.getSsenderAddr());//寄件人地址
			claimInvoiceVO.setRegDt(nowDate);//录入日期 
			claimInvoiceVO.setRegUsrId(LoginUtil.getUserId());//录入人id
			
		    claimInvoiceReceptionDAO.insertClaimInvoice(claimInvoiceVO);//保存
		}else{// 更新操作
			ClaimInvoiceVO claimInvoiceVO = claimInvoiceVOList.get(0);//正常就应该是一条索赔结算单信息
			
			claimInvoiceVO.setExpsCmpNm(searchVO.getSexpsCmpNm());//快递公司
			claimInvoiceVO.setTrsfNo(searchVO.getStrsfNo());//快递单号
			claimInvoiceVO.setRemark(searchVO.getSremark());//快递备注
			claimInvoiceVO.setSenderNm(searchVO.getSsenderNm());//寄件人
			claimInvoiceVO.setSenderTelno(searchVO.getSsenderTelno());//寄件人联系电话
			claimInvoiceVO.setSenderAddr(searchVO.getSsenderAddr());//寄件人地址
			claimInvoiceVO.setUpdtDt(nowDate);//修改日期 
			claimInvoiceVO.setUpdtUsrId(LoginUtil.getUserId());//修改人id
			
		    claimInvoiceReceptionDAO.updateClaimInvoice(claimInvoiceVO);//更新操作
		}
		
		return result;
	}
	
	/**
    * 
    *<p>Title:提报操作</p>
    * @author yixd
    * @serialData 2021年4月14日
	* @method 
	* 1、如果存在结算单号，则更新数据，如果不存在，则插入一条
    * @param invcNo 索赔结算单信息
    * @return String
    */
	@Override
	public String submitReceiveClaimInvoiceReception(ClaimInvoiceSearchVO searchVO) {
		String result = "success";//返回退票结果
		String invcNo = searchVO.getSinvcNo();// 索赔结算单信息
		Date nowDate = new Date();//当前时间
		
		//1、根据结算报表编号查询结算单信息
		List<ClaimInvoiceVO> claimInvoiceVOList = new ArrayList<ClaimInvoiceVO>();//接收根据结算单编号查询的结算单信息,怕一个结算单编号对应多个结算单，导致异常现象
		claimInvoiceVOList = claimInvoiceReceptionDAO.selectClaimInvoiceReceptionByInvcNo(invcNo);//根据结算报表编号查询结算单信息
		
		List<ClaimInvoiceDetailVO> claimInvoiceDetailVOList = new ArrayList<ClaimInvoiceDetailVO>();//接收根据结算单编号查询的结算单信息,怕一个结算单编号对应多个结算单，导致异常现象
		claimInvoiceDetailVOList = claimInvoiceReceptionDAO.selectClaimInvoiceDtsReceptionByInvcNo(invcNo);//根据结算报表编号查询发票列表
		
		//2、判断结算金额和发票金额之和是否相等
		Double claimInoviceBalanceAmt = 0.00 ;
		claimInoviceBalanceAmt = claimInvoiceReceptionDAO.selectClaimInvoiceBalanceAmtByInvcNo(invcNo);//根据结算单号查询结算金额
		
		Double claimInoviceDetailSumAmt = 0.00 ;
		claimInoviceDetailSumAmt = claimInvoiceReceptionDAO.selectClaimInvoiceDetailSumAmtByInvcNo(invcNo);//根据结算单号查询发票金额之和
		
		BigDecimal data1 = new BigDecimal(claimInoviceBalanceAmt); 
		BigDecimal data2 = new BigDecimal(claimInoviceDetailSumAmt); 
		
		System.out.print("--------------data1="+data1+"-----date2="+data2+"---data1.compareTo(data2)="+data1.compareTo(data2));
		 
		if(data1.compareTo(data2)!=0){
			result = "发票金额与结算报表信息不符";
			return result;
		}
		
		//3、判断纳税人识别号和发票抬头是否有误
		
		String taxNo = "";//税号  91110113MA0081AT4N
		String buyNm = "";//抬头 北京现代汽车有限公司销售分公司
		
		List<ClaimInvoiceTaxNoVO> claimInvoiceTaxNoVOList = new ArrayList<ClaimInvoiceTaxNoVO>();//查询系统默认纳税人识别号和发票抬头
		claimInvoiceTaxNoVOList = claimInvoiceReceptionDAO.selectClaimInvoiceTaxNo(invcNo);
		
		if(claimInvoiceTaxNoVOList.size()>0){
			taxNo = claimInvoiceTaxNoVOList.get(0).getTaxNo();
			buyNm = claimInvoiceTaxNoVOList.get(0).getBuyNm();
		}
		
		if(claimInvoiceDetailVOList.size()>0){//如果结算单发票子表有数据列表则插入接口表
	    	for(ClaimInvoiceDetailVO claimInvoiceDetailCheck : claimInvoiceDetailVOList){
	    		if(!taxNo.equals(claimInvoiceDetailCheck.getTaxpayerIdCd())||!buyNm.equals(claimInvoiceDetailCheck.getBuyNm())){
	    			result = "索赔发票的纳税人识别号或发票抬头不正确";
	    			return result;
	    		}
		    }
	    }
		
		//4、判断结算单号是否存在多条
		if(claimInvoiceVOList.size()>1){
			 result = "根据结算单号查询出多条结算单信息";
		}else if(claimInvoiceVOList.size()<1){ //提报-保存
			
			ClaimInvoiceVO claimInvoiceVO = new ClaimInvoiceVO();
			
			claimInvoiceVO.setDlrCd(LoginUtil.getDlrCd());
			claimInvoiceVO.setInvcNo(invcNo);
			claimInvoiceVO.setReceiptTp("02");//已开票
			claimInvoiceVO.setTrsfTp("02");//已邮寄
			claimInvoiceVO.setExpsCmpNm(searchVO.getSexpsCmpNm());//快递公司
			claimInvoiceVO.setTrsfNo(searchVO.getStrsfNo());//快递单号
			claimInvoiceVO.setRemark(searchVO.getSremark());//快递备注
			claimInvoiceVO.setSenderNm(searchVO.getSsenderNm());//寄件人
			claimInvoiceVO.setSenderTelno(searchVO.getSsenderTelno());//寄件人联系电话
			claimInvoiceVO.setSenderAddr(searchVO.getSsenderAddr());//寄件人地址
			claimInvoiceVO.setRegDt(nowDate);//录入日期 
			claimInvoiceVO.setRegUsrId(LoginUtil.getUserId());//录入人id
			
		    claimInvoiceReceptionDAO.insertClaimInvoice(claimInvoiceVO);//提报-保存
		    
		    //提报到DCS 存入发票主表接口表及发票子表接口表
		    claimInvoiceReceptionDAO.insertClaimInvoiceIS(claimInvoiceVO);//提报-存入结算单发票主表接口表
		    if(claimInvoiceDetailVOList.size()>0){//如果结算单发票子表有数据列表则插入接口表
		    	for(ClaimInvoiceDetailVO claimInvoiceDetail : claimInvoiceDetailVOList){
			    	claimInvoiceReceptionDAO.insertClaimInvoiceDetailIS(claimInvoiceDetail);//提报-存入结算单发票子表接口表
			    }
		    }
		    
		}else{// 提报-更新
			ClaimInvoiceVO claimInvoiceVO = claimInvoiceVOList.get(0);//正常就应该是一条索赔结算单信息
			
			claimInvoiceVO.setReceiptTp("02");//已开票
			claimInvoiceVO.setTrsfTp("02");//已邮寄
			claimInvoiceVO.setExpsCmpNm(searchVO.getSexpsCmpNm());//快递公司
			claimInvoiceVO.setTrsfNo(searchVO.getStrsfNo());//快递单号
			claimInvoiceVO.setRemark(searchVO.getSremark());//快递备注
			claimInvoiceVO.setSenderNm(searchVO.getSsenderNm());//寄件人
			claimInvoiceVO.setSenderTelno(searchVO.getSsenderTelno());//寄件人联系电话
			claimInvoiceVO.setSenderAddr(searchVO.getSsenderAddr());//寄件人地址
			claimInvoiceVO.setUpdtDt(nowDate);//修改日期 
			claimInvoiceVO.setUpdtUsrId(LoginUtil.getUserId());//修改人id
			
		    claimInvoiceReceptionDAO.updateClaimInvoiceForSubmit(claimInvoiceVO);//提报-更新
		    
		    //提报到DCS 存入发票主表接口表及发票子表接口表
		    claimInvoiceReceptionDAO.insertClaimInvoiceIS(claimInvoiceVO);//提报-存入结算单发票主表接口表
		    if(claimInvoiceDetailVOList.size()>0){//如果结算单发票子表有数据列表则插入接口表
		    	for(ClaimInvoiceDetailVO claimInvoiceDetail : claimInvoiceDetailVOList){
			    	claimInvoiceReceptionDAO.insertClaimInvoiceDetailIS(claimInvoiceDetail);//提报-存入结算单发票子表接口表
			    }
		    }
		    
		}
		
		return result;
	}
	

		
	/**
    * 
    *<p>Title:删除发票子表</p>
    * @author yixd
    * @serialData 2021年4月14日
	* @method 
    * @param invcNo 索赔结算单信息
    * @return String
    */
	@Override
	public String delClaimInvoiceDetailReception(ClaimInvoiceDetailVO searchVO) {
		String result = "success";//返回结果
		Date nowDate = new Date();//当前时间
		
		//1、查询索赔发票个数
		List<ClaimInvoiceDetailVO> claimInvoiceDetailVOList = new ArrayList<ClaimInvoiceDetailVO>();//接收根据结算单编号查询的结算单信息,怕一个结算单编号对应多个结算单，导致异常现象
		claimInvoiceDetailVOList = claimInvoiceReceptionDAO.selectClaimInvoiceDetailReceptionByInvcNo(searchVO);//根据结算报表编号查询发票信息
		//2、判断结算单号是否存在多条
		if(claimInvoiceDetailVOList.size()>1){
			 result = "根据结算单号、发票号、发票代码查询出多条发票信息！";
		}else{// 提报-更新
			ClaimInvoiceDetailVO claimInvoiceDetailVO = claimInvoiceDetailVOList.get(0);//正常就应该是一条索赔结算单信息
			
			claimInvoiceDetailVO.setReceiptStatus("05");//索赔删除
			claimInvoiceDetailVO.setUpdtDt(nowDate);//修改日期 
			claimInvoiceDetailVO.setUpdtUsrId(LoginUtil.getUserId());//修改人id
			
		    claimInvoiceReceptionDAO.updateClaimInvoiceForDel(claimInvoiceDetailVO);//删除-更新
		}
		
		return result;
	}	
	
		
	
	/**
	 * 
	 * @MethodName: initJxlsContext
	 * <p>Title: Excel的导出方法</p >
	 * @Description: TODO
	 * @author yixd
	 * @param context
	 * @param params
	 * @throws Exception void
	 * @date 2021年4月14日10:40:14
	 */
	@Override
	public void initJxlsContext(Context context, HMap params) {
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
