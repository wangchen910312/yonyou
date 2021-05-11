package chn.bhmc.dms.sal.mon.service;

import java.util.List;

import chn.bhmc.dms.cmm.cmp.vo.CarSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.NumberContrastVO;
import chn.bhmc.dms.cmm.cmp.vo.OrderSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDcsCarCheckVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDcsErpCarDetailVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDcsErpOrderDetailVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDcsOrderCheckVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDmsCarCheckVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDmsErpCarDetailVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDmsErpOrderDetailVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDmsOrderCheckVO;
import chn.bhmc.dms.cmm.cmp.vo.TmpDmsUpdateSqlVO;
import chn.bhmc.dms.sal.ass.vo.AssignSearchVO;
import chn.bhmc.dms.sal.ass.vo.AssignVO;

/**
 * 금융상품정보 I/F DCS -> DMS
 * @author Kim Jin Suk
 * @since 2017. 4. 17
 * @version 1.0
 * @see <pre>
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2017. 4. 17         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface SalesMonthService {

    
    public String updateOrderInfoErpToDmsThread(String month) throws Exception;
    
    public String updateDmsOrderBySql(String sql, String month, String dlrCd) throws Exception;
    
	public String updateDmsCar(AssignSearchVO searchVO);

	public String updateDmsCarBySql(String dlrCd, String sql);

	public long selectDmsSalesCarCnt(AssignSearchVO searchVO);

	public List<AssignVO> selectDmsSalesCar(AssignSearchVO searchVO);
	
	/** 2019/6/12 自动化月结增加数量对比 start
     * sap/dcs/dms 数量对比
     */
	public String updateNumberContrast(String month);

	public int selectNumberContrastCnt(NumberContrastVO numberContrastVO);

	public List<NumberContrastVO> selectNumberContrast(NumberContrastVO numberContrastVO);
	
	/*-----------------------------------------------------月结修改 Start-------------------------------------------------------*/
	
	/*-----------------------------------------------------DCS 订单处理 Start-------------------------------------------------------*/
	/**
	 * 搜集DCS与ERP订单差异
	 * @param month
	 * @return
	 */
	public int callDcsSalesOrderCheck(String month) throws Exception;
	
	/**
	 * 查询DCS与ERP订单差异数量列表前统计
	 * @param month
	 * @return
	 */
	public int selectDcsOrderDiffCnt(TmpDcsOrderCheckVO tmpDcsOrderCheckVO);
	
	/**
	 * 查询DCS与ERP订单差异数量
	 * @param month
	 * @return
	 */
	public List<TmpDcsOrderCheckVO> selectDcsOrderDiff(TmpDcsOrderCheckVO tmpDcsOrderCheckVO);
	/**
	 * 查询DCS与ERP订单详情条数
	 * @param month
	 * @return
	 */
    public int selectDcsErpOrdDetailCnt(TmpDcsOrderCheckVO searchVO)  throws Exception;
    /**
	 * 查询DCS与ERP订单详情
	 * @param month
	 * @return
	 */
    public List<TmpDcsErpOrderDetailVO> selectDcsErpOrdDetail(TmpDcsOrderCheckVO tmpDcsOrderCheckVO) throws Exception;
	
	/**
	 * 修改DCS与ERP订单差异
	 * @param month
	 * @return
	 */
	public int updateOrderInfoErpToDcs(String month) throws Exception;
	
	
	/*-----------------------------------------------------DCS 订单处理 End-------------------------------------------------------*/
	/*-----------------------------------------------------DMS 订单处理 Start-------------------------------------------------------*/
	/**
	 * 搜集DCS与ERP订单差异
	 * @param month
	 * @return
	 */
	public int callDmsSalesOrderCheck(String month) throws Exception;
	
	/**
	 * 查询待搜集DMS与ERP订单差异的经销商
	 * @param month
	 * @return
	 */
	public String searchOrderInfoErpToDms(OrderSearchVO searchVO) throws Exception;
	
	
	/**
	 * 查询当前已经搜集了多少家订单差异
	 */
	public String checkOrderProcessShow(OrderSearchVO searchVO) throws Exception;
	
	/**
	 * 查询DCS与ERP订单差异数量列表前统计
	 * @param month
	 * @return
	 */
	public int selectDmsOrderDiffCnt(TmpDmsOrderCheckVO tmpDmsOrderCheckVO);
	
	/**
	 * 查询DMS与ERP订单差异数量
	 * @param month
	 * @return
	 */
	public List<TmpDmsOrderCheckVO> selectDmsOrderDiff(TmpDmsOrderCheckVO tmpDmsOrderCheckVO);
	
	/**
	 * 查询DMS与ERP订单详情条数
	 * @param month
	 * @return
	 */
	public int selectDmsErpOrdDetailCnt(TmpDmsOrderCheckVO searchVO)  throws Exception;
	  
	/**
	 * 查询DMS与ERP订单详情数量
	 * @param month
	 * @return
	 */
	public List<TmpDmsErpOrderDetailVO> selectDmsErpOrdDetail(TmpDmsOrderCheckVO searchVO) throws Exception;
	/**
	 * 处理DMS与ERP订单差异
	 * @param month
	 * @return
	 */
	public String updateOrderInfoErpToDms(OrderSearchVO orderSearchVO) throws Exception;
	
	/**
	 * 处理DMS与ERP订单差异
	 * @param month
	 * @return
	 */
	public String updateOrderInfoErpToDmsByThread(OrderSearchVO orderSearchVO) throws Exception;
	
	/**
	 * 查询当前已经修复了多少家
	 */
	public String updateOrderProcessShow(OrderSearchVO searchVO) throws Exception;
	
	/**
	 * 在DMS端批量执行SQL
	 * @param month
	 * @return
	 */
	public String updateBySql(String dlrCd,String sql) throws Exception;
	
	/**
	 * 在DMS端批量执行SQL
	 * @param month
	 * @return
	 */
	public String updateBySqlByThread(String dlrCd,String sql) throws Exception;
	
	/*-----------------------------------------------------DMS 订单处理 End-------------------------------------------------------*/
	
	/*-----------------------------------------------------DCS 车辆处理 Start-------------------------------------------------------*/
	/**
	 * 搜集DCS与ERP车辆差异
	 * @param month
	 * @return
	 */
	public int callDcsSalesCarCheck(String month) throws Exception;
	
	/**
	 * 查询DCS与ERP车辆差异数量列表前统计
	 * @param month
	 * @return
	 */
	public int selectDcsCarDiffCnt(TmpDcsCarCheckVO tmpDcsCarCheckVO);
	
	/**
	 * 查询DCS与ERP车辆差异数量
	 * @param month
	 * @return
	 */
	public List<TmpDcsCarCheckVO> selectDcsCarDiff(TmpDcsCarCheckVO tmpDcsCarCheckVO);
	
	/**
	 * 查询DCS与ERP车辆详情条数
	 * @param month
	 * @return
	 */
    public int selectDcsErpCarDetailCnt(TmpDcsCarCheckVO searchVO)  throws Exception;
    
    /**
	 * 查询DCS与ERP车辆详情
	 * @param month
	 * @return
	 */
    public List<TmpDcsErpCarDetailVO> selectDcsErpCarDetail(TmpDcsCarCheckVO tmpDcsOrderCheckVO) throws Exception;
	
	/**
	 * 修改DCS与ERP车辆差异
	 * @param month
	 * @return
	 */
	public int updateCarInfoErpToDcs(String month) throws Exception;
	
	
	/*-----------------------------------------------------DCS 车辆处理 End-------------------------------------------------------*/
	/*-----------------------------------------------------DMS 车辆处理 Start-------------------------------------------------------*/
	/**
	 * 搜集DCS与ERP车辆差异
	 * @param month
	 * @return
	 */
	public int callDmsSalesCarCheck(String month) throws Exception;
	
	/**
	 * 查询待搜集DCS与ERP车辆差异的经销商
	 * @param month
	 * @return
	 */
	public String searchCarInfoErpToDms(CarSearchVO searchVO) throws Exception;
	
	/**
	 * 查询当前已经搜集了多少家车辆差异
	 */
	public String checkCarProcessShow(CarSearchVO searchVO) throws Exception;
	
	/**
	 * 查询DCS与ERP车辆差异数量列表前统计
	 * @param month
	 * @return
	 */
	public int selectDmsCarDiffCnt(TmpDmsCarCheckVO tmpDmsCarCheckVO);
	
	/**
	 * 查询DMS与ERP车辆差异数量
	 * @param month
	 * @return
	 */
	public List<TmpDmsCarCheckVO> selectDmsCarDiff(TmpDmsCarCheckVO tmpDmsCarCheckVO);
	
	/**
	 * 查询DMS与ERP车辆详情条数
	 * @param month
	 * @return
	 */
    public int selectDmsErpCarDetailCnt(TmpDmsCarCheckVO searchVO)  throws Exception;
    
    /**
	 * 查询DMS与ERP车辆详情
	 * @param month
	 * @return
	 */
    public List<TmpDmsErpCarDetailVO> selectDmsErpCarDetail(TmpDmsCarCheckVO tmpDmsOrderCheckVO) throws Exception;
    
	/**
	 * 处理DMS与ERP车辆差异
	 * @param month
	 * @return
	 */
	public String updateCarInfoErpToDms(String month) throws Exception;
	
	/**
	 * 处理DMS与ERP车辆差异
	 * @param month
	 * @return
	 */
	public String updateCarInfoErpToDmsByThread(String month) throws Exception;
	
	/**
	 * 查询当前已经修复了多少家
	 */
	public String updateCarProcessShow(CarSearchVO searchVO) throws Exception;
	/*-----------------------------------------------------DMS 车辆处理 End-------------------------------------------------------*/
	/*--------------------------------------------------------月结 DCS执行SQL Start---------------------------------------------------*/
	/**
	 * 初始化待修复的经销商数据
	 */
	public String batchInsertDealerForUpdate(TmpDmsUpdateSqlVO tmpDmsUpdateSqlVO) throws Exception;
	
	/**
	 * DMS执行SQL结果查询统计
	 * @param month
	 * @return
	 */
	public int selectDmsUpdateResultCnt(TmpDmsUpdateSqlVO tmpDmsUpdateSqlVO);
	
	/**
	 * DMS执行SQL结果查询数量
	 * @param month
	 * @return
	 */
	public List<TmpDmsUpdateSqlVO> selectDmsUpdateResult(TmpDmsUpdateSqlVO tmpDmsUpdateSqlVO);
	
	/**
	 * 根据SQL修复DCS数据
	 */
	public int updateDcsBySql(String sql) throws Exception;
	/**
	 * 查询当前已经执行了多少家的SQL
	 */
	public String batchUpdateBySqlProcessShow(CarSearchVO searchVO) throws Exception;
	/*--------------------------------------------------------月结 DCS执行SQL End-----------------------------------------------------*/
	/*--------------------------------------------------------月结多线程修改 Start--------------------------------------------------------*/
	/**
	 * 查询待搜集DMS与ERP订单差异的经销商
	 * @param month
	 * @return
	 */
	public String searchOrderInfoErpToDmsByThread(OrderSearchVO searchVO) throws Exception;
	
	/**
	 * 查询待搜集DCS与ERP车辆差异的经销商
	 * @param month
	 * @return
	 */
	public String searchCarInfoErpToDmsByThread(CarSearchVO searchVO) throws Exception;
	/*--------------------------------------------------------月结多线程修改 End----------------------------------------------------------*/
	
	/*-----------------------------------------------------月结修改 End-------------------------------------------------------*/
}
