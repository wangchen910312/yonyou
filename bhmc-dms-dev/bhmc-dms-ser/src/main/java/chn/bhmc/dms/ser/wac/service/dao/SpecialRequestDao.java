package chn.bhmc.dms.ser.wac.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.ser.wac.vo.SpecialRequestSearchVo;
import chn.bhmc.dms.ser.wac.vo.SpecialRequestVo;
/**
 * 
 * @ClassName: SpecialRequestDao
 * <p>Title:DMS特殊申请 </p >
 * @Description: Dao
 * @author wangc
 * @date 2021-03-29 08:55:58
 */
@Mapper("specialRequestDao")
public interface SpecialRequestDao {
	/**
	 * 
	 * @MethodName: selectRates
	 * <p>Title: 返回工单列表结果信息</p >
	 * @Description: Dao
	 * @author wangc
	 * @param searchVO
	 * @return List<SpecialRequestSearchVo>
	 * @date 2021-03-29 09:07:14 
	 * @param searchVO
	 * @return List<SpecialRequestSearchVo>
	 */
	List<SpecialRequestSearchVo> selectSpecialRequests(SpecialRequestSearchVo searchVO);
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
	int selectSpecialRequestForSpecialBySpecialCnt(SpecialRequestSearchVo searchVO);
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
	List<SpecialRequestVo> selectSpecialRequestForSpecialBySpecial(SpecialRequestSearchVo searchVO);

	/**
	 * 
	 * @MethodName: getReqCountSpecial
	 * <p>Title:查询提报信息 </p >
	 * @Description: 根据维修委托单号查询是否有正在提报的信息
	 * @author wangc
	 * @param roDocNo 维修委托单号
	 * @param reqStatCd 申请单状态
	 * @return int
	 * @date 2021-03-31 10:38:24 
	 */
	int getReqCountSpecial(String roDocNo);
	/**
	 * 
	 * @MethodName: updatesReqSpecial
	 * <p>Title: 申请单更新提报状态功能</p >
	 * @Description: TODO
	 * @author wangc
	 * @param addVO
	 * @return int
	 * @date 2021-04-01 02:35:30 
	 */
	int mergeReqSpecial (SpecialRequestVo addVO);
	
	/**
	 * 
	 * @MethodName: updatesReqSpecial
	 * <p>Title: 申请单更新保存状态功能</p >
	 * @Description: TODO
	 * @author wangc
	 * @param addVO
	 * @return int
	 * @date 2021-04-01 02:35:30 
	 */
	int mergeSaveSpecial (SpecialRequestVo addVO);
	
	/**
	 * 
	 * @MethodName: selectSpecialRequest
	 * <p>Title: 根据维修委托单号、店代码、车辆识别码查询唯一申请信息 </p >
	 * @Description: TODO
	 * @author wangc
	 * @param addVO
	 * @return SpecialRequestVo
	 * @date 2021-04-06 04:57:51 
	 */
	SpecialRequestVo selectSpecialRequest(SpecialRequestVo addVO);
	
	/**
	 * 
	 * @MethodName: selectWorkOrder
	 * <p>Title: 根据维修委托单号查询工单信息</p >
	 * @Description: TODO
	 * @author wangc
	 * @param roDocNo
	 * @return SpecialRequestVo
	 * @date 2021-04-06 06:11:05 
	 */
	SpecialRequestVo selectWorkOrder(String roDocNo);
	
	/**
	 * 
	 * @MethodName: selectSpecialRequestForSpecialBySpecialExcel
	 * <p>Title: 导出Excel信息</p >
	 * @Description: TODO
	 * @author wangc
	 * @param searchVO
	 * @return List<SpecialRequestVo>
	 * @date 2021-04-14 08:44:42 
	 * @param searchVO
	 */
	List<SpecialRequestVo> selectSpecialRequestForSpecialBySpecialExcel(SpecialRequestSearchVo searchVO);
	
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
	String selectReqTskNm(String tskCd);
	
	
	
	/*
	 * @MethodName: selectReqTskNm
	 * <p>Title: 根据用户的id账号查询手机号码</p >
	 * @Description: TODO
	 * @author wangc
	 * @param tskCd
	 * @param params
	 * @date 2021年4月21日20:54:20  
	 */
	String selectReqHpNo(String userId);

	

}
