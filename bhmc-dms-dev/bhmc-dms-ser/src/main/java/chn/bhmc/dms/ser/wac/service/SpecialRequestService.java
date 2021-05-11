package chn.bhmc.dms.ser.wac.service;

import java.util.List;

import chn.bhmc.dms.ser.wac.vo.SpecialRequestSearchVo;
import chn.bhmc.dms.ser.wac.vo.SpecialRequestVo;

/**  
 * @ClassName: SpecialRequestController
 * <p>Title:DMS特殊申请（保修工单确认申请） </p >
 * @Description: service
 * @author wangc
 * @date 2021-03-29 02:55:01 
*/  
public interface SpecialRequestService {
	/**
	 * 
	 * @MethodName: selectRates
	 * <p>Title: 返回工单列表结果信息</p >
	 * @Description: TODO
	 * @author wangc
	 * @param searchVO
	 * @return List<SpecialRequestVo>
	 * @date 2021-03-29 05:56:40 
	 */
	public List<SpecialRequestSearchVo> selectSpecialRequests(SpecialRequestSearchVo searchVO);
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
	public int selectSpecialRequestForSpecialBySpecialCnt(SpecialRequestSearchVo searchVO);
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
	public List<SpecialRequestVo> selectSpecialRequestForSpecialBySpecial(SpecialRequestSearchVo searchVO);
	
	/**
	 * 
	 * @MethodName: addSpecialRequest
	 * <p>Title: 特殊申请的保存和申请</p >
	 * @Description: TODO
	 * @author wangc
	 * @param SpecialRequestVo
	 * @return String
	 * @date 2021-03-31 08:08:40 
	 */
	public String addSpecialRequest(SpecialRequestVo addVO);
	
	
	/**
	 * 
	 * @MethodName: selectReqTskNm
	 * <p>Title: 根据岗位代码查询岗位信息</p >
	 * @Description: TODO
	 * @author wangc
	 * @param tskCd
	 * @return String
	 * @date 2021-04-21 08:45:29 
	 * @param tskCd
	 */
	public String selectReqTskNm(String tskCd);
	
	/**
	 * 
	 * @MethodName: selectReqHpNo
	 * <p>Title: 根据登录人的id获取申请人手机号</p >
	 * @Description: TODO
	 * @author wangc
	 * @param userId
	 * @return Object
	 * @date 2021-04-26 03:39:30 
	 * @param userId
	 */
	public String selectReqHpNo(String userId);

}
