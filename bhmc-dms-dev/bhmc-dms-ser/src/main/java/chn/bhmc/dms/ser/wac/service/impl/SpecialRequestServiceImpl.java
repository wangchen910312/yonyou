package chn.bhmc.dms.ser.wac.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.wac.service.SpecialRequestService;
import chn.bhmc.dms.ser.wac.service.dao.SpecialRequestDao;
import chn.bhmc.dms.ser.wac.vo.PwaSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaVO;
import chn.bhmc.dms.ser.wac.vo.SpecialRequestSearchVo;
import chn.bhmc.dms.ser.wac.vo.SpecialRequestVo;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
/**  
 * @ClassName: SpecialRequestController
 * <p>Title:DMS特殊申请（保修工单确认申请） </p >
 * @Description: serviceImpl
 * @author wangc
 * @date 2021-03-29 02:55:01
*/ 
@Service("specialRequestService")
public class SpecialRequestServiceImpl extends HService implements SpecialRequestService , JxlsSupport{
	
	@Resource(name="specialRequestDao")
	SpecialRequestDao specialRequestDao;//DMS特殊申请
	
	//特殊车辆申请 SER140 DMS->DCS jiaMing 2021-4-7 
		@Autowired
	    ServiceCommonService serviceCommonService;
	/**
	 * 
	 * @MethodName: selectRates
	 * <p>Title: 返回工单列表结果信息</p >
	 * @Description: TODO
	 * @author wangc
	 * @param searchVO
	 * @return List<SpecialRequestVo>
	 * @date 2021-03-29 05:56:40 
	 * @param searchVO
	 * @return List<SpecialRequestSearchVo>
	 */
	@Override
	public List<SpecialRequestSearchVo> selectSpecialRequests(SpecialRequestSearchVo searchVO) {
		
		List<SpecialRequestSearchVo> listSpecialRequestSearchVo = new ArrayList<SpecialRequestSearchVo>();
		
		listSpecialRequestSearchVo = specialRequestDao.selectSpecialRequests(searchVO);
		
		return listSpecialRequestSearchVo;
	}
	/**
	 * 
	 * @MethodName: selectSpecialRequestForSpecialBySpecialCnt
	 * <p>Title: 申请工单列表数量</p >
	 * @Description: TODO
	 * @author wangc
	 * @param searchVO
	 * @return int
	 * @date 2021-03-30 03:50:20 
	 */
	@Override
	public int selectSpecialRequestForSpecialBySpecialCnt(SpecialRequestSearchVo searchVO) {
         
		searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());//设置语言
        
		return specialRequestDao.selectSpecialRequestForSpecialBySpecialCnt(searchVO);
	}
	/**
	 * 
	 * @MethodName: selectSpecialRequestForSpecialBySpecial
	 * <p>Title: 申请工单列表详细信息</p >
	 * @Description: TODO
	 * @author wangc
	 * @param searchVO
	 * @return List<SpecialRequestVo>
	 * @date 2021-03-30 03:50:59 
	 */
	@Override
	public List<SpecialRequestVo> selectSpecialRequestForSpecialBySpecial(SpecialRequestSearchVo searchVO) {

	     searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());//设置语言

	     return specialRequestDao.selectSpecialRequestForSpecialBySpecial(searchVO);
	}
	
	/**
	 * 
	 * @MethodName: addSpecialRequest
	 * <p>Title: 特殊申请的保存和申请</p >
	 * @Description:流程 
	 * 1、基础信息赋值
	 * 2、判断是保存还是提报
	 * 3、判断该工单是否存在申请单（提报）
	 * 4、更新保存操作/保存更新成提报或者新增一个提报
	 * @author wangc
	 * @param SpecialRequestVo
	 * @return String
	 * @date 2021-03-31 08:08:40 
	 */
	@Override
	public String addSpecialRequest(SpecialRequestVo addVO) {
		String result = "";//返回结果值
		int getNum = 0;//判断该工单是否存在申请单
		Date nowDate = new Date();//当前时间
		
		//1、基础信息查询及赋值 
		addVO.setDlrCd(LoginUtil.getDlrCd());//店代码
		SpecialRequestVo workOrderVo = specialRequestDao.selectWorkOrder(addVO.getRoDocNo());//根据维修委托单号查询工单信息
		//如果已经APP确认了，就不可以再申请和保存了
		if("01".equals(workOrderVo.getCustConfirmCd())){
			return "该工单已经在APP确认了，不可以再做保存/申请操作！";
		}
		addVO.setRoUpdtDt(workOrderVo.getRoUpdtDt());//工单修改时间
		addVO.setCarRegNo(workOrderVo.getCarRegNo());//车牌号
		addVO.setVinNo(workOrderVo.getVinNo());//车辆识别码
		addVO.setRoDt(workOrderVo.getRoDt());//开单时间  维修委托时间
		addVO.setDlChkDt(workOrderVo.getDlChkDt());//交车确认日期
		addVO.setRoTp(workOrderVo.getRoTp());//维修委托类型
		addVO.setCarOwnerId(workOrderVo.getCarOwnerId());//车辆所有者ID
		addVO.setCarOwnerNm(workOrderVo.getCarOwnerNm());//车辆所有者名字
		addVO.setDriverId(workOrderVo.getDriverId());// 送修人id
		addVO.setDriverNm(workOrderVo.getDriverNm());//送修人姓名
		addVO.setDriverHpNo(workOrderVo.getDriverHpNo());//送修人手机号
		addVO.setFileDocNo(addVO.getFileDocNo());//上传文件ID
		addVO.setUpdtUserId(LoginUtil.getUserId());//修改人id
		addVO.setUpdtDt(nowDate);//修改时间
		//2、判断是保存还是提报
		if("00".equals(addVO.getReqStatCd())){
			addVO.setRegDt(nowDate);//录入日期 
			addVO.setRegUsrId(LoginUtil.getUserId());//录入人id
			//3、判断该工单是否存在申请单（提报）
			getNum = specialRequestDao.getReqCountSpecial(addVO.getRoDocNo());
			if(getNum>0){
				result = "已经有提报了，不可以再保存！";
			}else{
				//4、更新保存操作
				specialRequestDao.mergeSaveSpecial(addVO);
			}
		}else if("01".equals(addVO.getReqStatCd())){
			addVO.setRegDt(nowDate);//录入日期 
			addVO.setRegUsrId(LoginUtil.getUserId());//录入人id
			addVO.setReqDt(nowDate);//申请日期 
			addVO.setReqUsrId(LoginUtil.getUserId());//申请人id
			addVO.setReqUsrNm(addVO.getReqUsrNm());//申请人姓名
			addVO.setReqTskNm(selectReqTskNm(LoginUtil.getTskCd()));// 申请人岗位
			addVO.setReqHpNo(addVO.getReqHpNo());//申请人手机
			//3、判断该工单是否存在申请单（提报）
			getNum = specialRequestDao.getReqCountSpecial(addVO.getRoDocNo());
			if(getNum>0){
				result = "不能重复提报";
			}else{
				//特殊车辆申请DMS->DCS SER140 jiaMing 2021-4-7 start
				String  reqStatCd = "";
				SpecialRequestVo specialRequestVo = specialRequestDao.selectSpecialRequest(addVO);
				if(null != specialRequestVo){
					reqStatCd = specialRequestVo.getReqStatCd();
				}
				//特殊车辆申请DMS->DCS SER140 jiaMing 2021-4-7 end 
				//4、保存更新成提报或者新增一个提报
				specialRequestDao.mergeReqSpecial(addVO);
				
				//5、根据维修委托单号、店代码、车辆识别码查询唯一申请信息 
				SpecialRequestVo resultSpecialRequestVo = specialRequestDao.selectSpecialRequest(addVO);
				
				//特殊车辆申请DMS->DCS SER140 jiaMing 2021-4-7 start
				try{
		            //Camel InterFace Header Info SER140 发送信息
		            Map<String, Object> message = new HashMap<String, Object>();

		            message.put("REQ_NO", resultSpecialRequestVo.getReqNo()); //申请编号
		            message.put("DLR_CD",resultSpecialRequestVo.getDlrCd());//店代码
		            message.put("CAR_REG_NO",resultSpecialRequestVo.getCarRegNo());//车架号
		            message.put("VIN_NO",resultSpecialRequestVo.getVinNo());//vin
		            message.put("RO_DOC_NO", resultSpecialRequestVo.getRoDocNo());//工单号
		            message.put("RO_DT", DateUtil.convertToDateTimeString(resultSpecialRequestVo.getRoDt()));//
		            message.put("RO_TP", resultSpecialRequestVo.getRoTp());
		            message.put("CAR_OWNER_ID", resultSpecialRequestVo.getCarOwnerId());
		            message.put("CAR_OWNER_NM", resultSpecialRequestVo.getCarOwnerNm());
		            message.put("DRIVER_ID", resultSpecialRequestVo.getDriverId());
		            message.put("DRIVER_NM", resultSpecialRequestVo.getDriverNm());// getscanRcptPubDtDateUtil.convertToDateTimeString(obj.getReceiptIssDt())
		            message.put("DRIVER_HP_NO", resultSpecialRequestVo.getDriverHpNo());
		            message.put("FILE_DOC_NO", resultSpecialRequestVo.getFileDocNo());
		            message.put("REQ_STAT_CD", resultSpecialRequestVo.getReqStatCd());
		            message.put("REQ_REASON_TP", resultSpecialRequestVo.getReqReasonTp());
		            message.put("REQ_REASON_DESC", resultSpecialRequestVo.getReqReasonDesc());
		            message.put("APPROVE_DESC", resultSpecialRequestVo.getApproveDesc());
		            message.put("REQ_USR_ID", resultSpecialRequestVo.getReqUsrId());
		            message.put("REQ_DT", DateUtil.convertToDateTimeString(resultSpecialRequestVo.getReqDt()));
		            message.put("APPROVE_USR_ID", resultSpecialRequestVo.getApproveUsrId());
		            message.put("APPROVE_USR_NM",  resultSpecialRequestVo.getApproveUsrNm());
		            message.put("REG_USR_ID",  resultSpecialRequestVo.getRegUsrId());
		            message.put("REG_DT",  DateUtil.convertToDateTimeString(resultSpecialRequestVo.getRegDt()));
		            message.put("REQ_TSK_NM",  resultSpecialRequestVo.getReqTskNm());
		            message.put("REQ_HP_NO",  resultSpecialRequestVo.getReqHpNo());
		            message.put("UPDT_USR_ID", resultSpecialRequestVo.getUpdtUserId() );
		            message.put("UPDT_DT",  DateUtil.convertToDateTimeString(resultSpecialRequestVo.getUpdtDt()));
		            message.put("RO_UPDT_DT",  DateUtil.convertToDateTimeString(resultSpecialRequestVo.getRoUpdtDt()));
		            message.put("REQ_USR_NM",  resultSpecialRequestVo.getReqUsrNm());
					message.put("DL_CHK_DT",  DateUtil.convertToDateTimeString(resultSpecialRequestVo.getDlChkDt()));
		            //REQ_STAT_CD 单据状态  “00”保存 “01”提报 “02”通过“03”拒绝 “04”驳回  驳回可以再次提报，拒绝就不能了。
		            if(reqStatCd.equals("04")){
		            	message.put("IS_INUP","N");//增加个标识，Y代表 新增加的上传的  N 代表修改时上传的N 
		            }else{
		            	message.put("IS_INUP","Y");//增加个标识，Y代表 新增加的上传的  N 代表修改时上传的N
		            }
		            //salesCommonCamelService.executeCamelClent(message,"SAL170");
					 serviceCommonService.executeCamelClent(message,"SER140");
		       }catch(Exception e){
		           log.error(e.getMessage(),e);
		           try {
					 throw e;
				  } catch (Exception e1) {
					e1.printStackTrace();
				  }
		       }
			 //特殊车辆申请DMS->DCS SER140 jiaMing 2021-4-7 end 
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
	 * @date 2021-04-06 05:38:41 
	 */
    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

    	SpecialRequestSearchVo searchVO = new SpecialRequestSearchVo();
    	 
    	
        if(!StringUtils.isBlank(params.get("sFromRoDt").toString())&&!"null".equals(params.get("sFromRoDt").toString())){
            String sFromRoDt = params.get("sFromRoDt").toString();
            Date dFromRoDt = DateUtil.convertToDate(sFromRoDt);
            searchVO.setsFromRoDt(dFromRoDt);//开单开始日期
        }
        if(!StringUtils.isBlank(params.get("sToRoDt").toString())&&!"null".equals(params.get("sToRoDt").toString())){
            String sToRoDt = params.get("sToRoDt").toString();
            Date dToRoDt = DateUtil.convertToDate(sToRoDt);
            searchVO.setsToRoDt(dToRoDt);//结束日期
        }
        if(!StringUtils.isBlank(params.get("sFromReqDt").toString())&&!"null".equals(params.get("sFromReqDt").toString())){
            String sFromReqDt = params.get("sFromReqDt").toString();
            Date dFromReqDt = DateUtil.convertToDate(sFromReqDt);
            searchVO.setsFromReqDt(dFromReqDt);;//申请开始日期
        }
        if(!StringUtils.isBlank(params.get("sToReqDt").toString())&&!"null".equals(params.get("sToReqDt").toString())){
            String sToReqDt = params.get("sToReqDt").toString();
            Date dToReqDt = DateUtil.convertToDate(sToReqDt);
            searchVO.setsToReqDt(dToReqDt);;//申请结束日期
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        List<SpecialRequestVo> list = specialRequestDao.selectSpecialRequestForSpecialBySpecialExcel(searchVO);//导出Excel信息

        context.putVar("items", list);

    }
	/**
	 * 
	 * @MethodName: selectReqTskNm
	 * <p>Title: 根据岗位编码查询岗位名称</p >
	 * @Description: TODO
	 * @author wangc
	 * @param tskCd
	 * @param params
	 * @date 2021年4月21日20:54:20 
	 */
	@Override
	public String selectReqTskNm(String tskCd) {

		return specialRequestDao.selectReqTskNm(tskCd);
	}
	
	/**
	 * @MethodName: selectReqTskNm
	 * <p>Title: 根据岗位编码查询岗位名称</p >
	 * @Description: TODO
	 * @author wangc
	 * @param tskCd
	 * @param params
	 * @date 2021年4月21日20:54:20 
	 */
	@Override
	public String selectReqHpNo(String userId) {
		
		return specialRequestDao.selectReqHpNo(userId);
	}

}
