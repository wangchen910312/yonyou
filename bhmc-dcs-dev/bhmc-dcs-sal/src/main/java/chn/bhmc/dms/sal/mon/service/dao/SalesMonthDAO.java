package chn.bhmc.dms.sal.mon.service.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.cmm.cmp.vo.CarSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
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
import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderSearchVO;
import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalesMonthDAO.java
 * @Description : lyy
 * @author Ki hyun Kwon
 * @since 2017. 8. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 14.     Ki hyun Kwon     최초 생성
 * </pre>
 */
@Mapper("salesMonthDAO")
public interface SalesMonthDAO {

    public void updateOrderInfoErpToDms(String month) throws Exception;
    public List<NotAssignedOrderVO> selectDlrIp(String dlrCd) throws Exception;
    public List<DealerVO> selectDealerListByCondition(DealerSearchVO searchVO);
    //备份
    public void saveDmsOrderInfo(NotAssignedOrderVO vo) throws Exception;
    //删除本经销商的数据
    public void deleteDealerData(HashMap<String, Object> deleteMap) throws Exception;
    //搜集问题数据并插入tmp表中以便于前台展示
    public void saveDmsOrderTmp(NotAssignedOrderVO vo) throws Exception;
    //删除DMS仍存在差异数据TMP表
	public void deleteTmpDms(HashMap<String, Object> deleteMap) throws Exception;
	//查询差异车辆数据
	public List<AssignVO> selectDmsSalesCar(AssignSearchVO searchVO);
	//查询差异车辆数量
	public int selectDmsSalesCarCnt(AssignSearchVO searchVO);
	//删除经销商连接失败TMP表
	public void deleteTmpConnectionError();
	//添加连接失败数据到临时表
	public void saveConnectionErrorTmp(DealerVO dealer);
	//查询所有连接失败的经销商信息
	public List<DealerVO> selectConnectionError();
	//清空dms存在差异临时表
	public void deleteTmpDmsAll();
	//添加数据到车辆差异临时表
	public void saveCarTmp(AssignVO tmpVO);
	//清空存在差异车辆临时表
	public void deleteCarTmpAll();
	//查询sap数量     新增数量对比 start
	public List<NumberContrastVO> selectSapNumber(@Param("month") String month);
	//查询dcs数量
	public List<NumberContrastVO> selectDcsNumber(@Param("month") String month);
	//清空数量对比表
	public void deleteNumber();
	//新增sap数量差异
	public void insertNumberContrast(NumberContrastVO numberContrastVO);
	//修改dcs数量差异
	public void updateDcsAllot(NumberContrastVO numberContrastVO);
	//修改dms数量差异
	public void updateDmsAllot(NumberContrastVO numberContrastVO);
	//查询数量对比数据数量
	public int selectNumberContrastCnt(NumberContrastVO numberContrastVO);
	//查询数量对比数据
	public List<NumberContrastVO> selectNumberContrast(NumberContrastVO numberContrastVO);
	/*--------------------------------------------------------月结修改 Start------------------------------------------------------------*/
	/*--------------------------------------------------------月结 DCS订单处理 Start-----------------------------------------------------*/
	//核对DCS与ERP差异
	public int callDcsSalesOrderCheck(String month) throws Exception;
	//查询差异条数
	public int selectDcsOrderDiffCnt(TmpDcsOrderCheckVO tmpDcsOrderCheckVO);
	//查询差异数量
	public List<TmpDcsOrderCheckVO> selectDcsOrderDiff(TmpDcsOrderCheckVO tmpDcsOrderCheckVO);
	//查询差异数量下载
	public List<TmpDcsOrderCheckVO> selectDcsOrderDiffForDownload(TmpDcsOrderCheckVO tmpDcsOrderCheckVO);
	
	//查询DCS订单差异详情条数
	public int selectDcsErpOrdDetailCnt(TmpDcsOrderCheckVO tmpDcsOrderCheckVO);
	//查询DCS订单差异详情
	public List<TmpDcsErpOrderDetailVO> selectDcsErpOrdDetail(TmpDcsOrderCheckVO tmpDcsOrderCheckVO);
	//查询DCS订单差异详情下载
	public List<TmpDcsErpOrderDetailVO> selectDcsErpOrdDetailForDownload(TmpDcsOrderCheckVO tmpDcsOrderCheckVO);
	
	//批量修复DCS订单数据
	public void updateOrderInfoErpToDcs(String month) throws Exception;
	/*--------------------------------------------------------月结 DCS订单处理 End-----------------------------------------------------*/
	/*--------------------------------------------------------月结 DMS订单处理 Start-----------------------------------------------------*/
	//核对DCS与ERP差异
	public int callDmsSalesOrderCheck(String month) throws Exception;
	//查询待查询差异的经销商
	public List<TmpDmsOrderCheckVO> selectDealerListByOrderCheck(TmpDmsOrderCheckVO searchVO);
	//查询已核对过经销商数量
	public int checkOrderProcessShow(OrderSearchVO searchVO);
	//查询全部经销商数量
	public int checkOrderProcessShowAll(OrderSearchVO searchVO);
	//修改dms订单已配和未配数量及与SAP的差异数量
	public void tmpDcsOrderCheckVO(TmpDmsOrderCheckVO tmpDmsOrderCheckVO);
	//修改dms订单连接经销商结果
	public void updateTmpOrderCheckResult(TmpDmsOrderCheckVO tmpDmsOrderCheckVO);
	//修改dms订单连接经销商结果
	public void updateTmpOrderUpdateResult(TmpDmsOrderCheckVO tmpDmsOrderCheckVO);
	//查询已修复过经销商数量
	public int updateOrderProcessShow(OrderSearchVO searchVO);
	//查询全部待修复经销商数量
	public int updateOrderProcessShowAll(OrderSearchVO searchVO);
	//查询差异条数
	public int selectDmsOrderDiffCnt(TmpDmsOrderCheckVO tmpDmsOrderCheckVO);
	//查询差异数量
	public List<TmpDmsOrderCheckVO> selectDmsOrderDiff(TmpDmsOrderCheckVO tmpDmsOrderCheckVO);
	//查询差异数量下载
	public List<TmpDmsOrderCheckVO> selectDmsOrderDiffForDownload(TmpDmsOrderCheckVO tmpDmsOrderCheckVO);
	
	//查询DCS订单差异详情条数
	public int selectDmsErpOrdDetailCnt(TmpDmsOrderCheckVO tmpDmsOrderCheckVO);
	//查询DCS订单差异详情
	public List<TmpDmsErpOrderDetailVO> selectDmsErpOrdDetail(TmpDmsOrderCheckVO tmpDmsOrderCheckVO);
	//查询DCS订单差异详情下载
	public List<TmpDmsErpOrderDetailVO> selectDmsErpOrdDetailForDownload(TmpDmsOrderCheckVO tmpDmsOrderCheckVO);
		
	//查询待查询差异的经销商
	public List<TmpDmsOrderCheckVO> selectDealerListByOrderDiff(TmpDmsOrderCheckVO searchVO);
	//查询待执行SQL的经销商
	public List<TmpDmsOrderCheckVO> selectDealerByDlrCd(TmpDmsOrderCheckVO searchVO);
	//修改dms订单连接经销商结果
	public void updateTmpDmsSqlResult(TmpDmsUpdateSqlVO tmpDmsUpdateSqlVO);
	/*--------------------------------------------------------月结 DMS订单处理 End-----------------------------------------------------*/
	
	/*--------------------------------------------------------月结 DCS车辆处理 Start-----------------------------------------------------*/
	//核对DCS与ERP差异
	public int callDcsSalesCarCheck(String month) throws Exception;
	//查询差异条数
	public int selectDcsCarDiffCnt(TmpDcsCarCheckVO tmpDcsCarCheckVO);
	//查询差异数量
	public List<TmpDcsCarCheckVO> selectDcsCarDiff(TmpDcsCarCheckVO tmpDcsCarCheckVO);
	//查询差异数量
	public List<TmpDcsCarCheckVO> selectDcsCarDiffForDownload(TmpDcsCarCheckVO tmpDcsCarCheckVO);
	//批量修复DCS车辆数据
	public void updateCarInfoErpToDcs(String month) throws Exception;
	//查询差异详情条数
	public int selectDcsErpCarDetailCnt(TmpDcsCarCheckVO tmpDcsCarCheckVO);
	//查询车辆差异详情
	public List<TmpDcsErpCarDetailVO> selectDcsErpCarDetail(TmpDcsCarCheckVO tmpDcsCarCheckVO);
	//查询车辆差异详情
	public List<TmpDcsErpCarDetailVO> selectDcsErpCarDetailForDownload(TmpDcsCarCheckVO tmpDcsCarCheckVO);
	/*--------------------------------------------------------月结 DCS车辆处理 End-----------------------------------------------------*/
	/*--------------------------------------------------------月结 DMS车辆处理 Start-----------------------------------------------------*/
	//核对DCS与ERP差异
	public int callDmsSalesCarCheck(String month) throws Exception;
	//查询待查询差异的经销商
	public List<TmpDmsCarCheckVO> selectDealerListByCarCheck(TmpDmsCarCheckVO searchVO);
	//查询已核对过经销商数量
	public int checkCarProcessShow(CarSearchVO searchVO);
	//查询全部经销商数量
	public int checkCarProcessShowAll(CarSearchVO searchVO);
	//修改dms订单已配和未配数量及与SAP的差异数量
	public void tmpDcsCarCheckVO(TmpDmsCarCheckVO tmpDmsCarCheckVO);
	//修改dms订单连接经销商结果
	public void updateTmpCarCheckResult(TmpDmsCarCheckVO tmpDmsCarCheckVO);
	//修改dms订单连接经销商结果
	public void updateTmpCarUpdateResult(TmpDmsCarCheckVO tmpDmsCarCheckVO);
	//查询已修复过经销商数量
	public int updateCarProcessShow(CarSearchVO searchVO);
	//查询全部待修复经销商数量
	public int updateCarProcessShowAll(CarSearchVO searchVO);
	//查询差异条数
	public int selectDmsCarDiffCnt(TmpDmsCarCheckVO tmpDmsCarCheckVO);
	//查询差异数量
	public List<TmpDmsCarCheckVO> selectDmsCarDiff(TmpDmsCarCheckVO tmpDmsCarCheckVO);
	//查询差异数量下载
	public List<TmpDmsCarCheckVO> selectDmsCarDiffForDownload(TmpDmsCarCheckVO tmpDmsCarCheckVO);
	//查询待查询差异的经销商
	public List<TmpDmsCarCheckVO> selectDealerListByCarDiff(TmpDmsCarCheckVO searchVO);
	//修改dms订单连接经销商结果
	public void updateTmpDmsCarSqlResult(TmpDmsUpdateSqlVO tmpDmsUpdateSqlVO);
	//查询差异详情条数
	public int selectDmsErpCarDetailCnt(TmpDmsCarCheckVO tmpDmsCarCheckVO);
	//查询车辆差异详情
	public List<TmpDmsErpCarDetailVO> selectDmsErpCarDetail(TmpDmsCarCheckVO tmpDmsCarCheckVO);
	//查询车辆差异详情
	public List<TmpDmsErpCarDetailVO> selectDmsErpCarDetailForDownload(TmpDmsCarCheckVO tmpDmsCarCheckVO);
	//查询待修复车辆差异详情
	public List<TmpDmsErpCarDetailVO> selectDmsErpCarDetailForUpdate(TmpDmsCarCheckVO tmpDmsCarCheckVO);
	//修改dms车辆执行结果
	public void updateTmpDmsCarUpdateResult(TmpDmsErpCarDetailVO tmpDmsErpCarDetailVO);
	/*--------------------------------------------------------月结 DMS车辆处理 End-----------------------------------------------------*/
    
	/*--------------------------------------------------------月结 DCS执行SQL Start---------------------------------------------------*/
	//根据SQL修复DCS数据
    public void deleteTmpDmsForUpdate() throws Exception;
    //查询已经执行过SQL的经销商数量
  	public int batchInsertDealerForUpdate(TmpDmsUpdateSqlVO tmpDmsUpdateSqlVO);
  //查询差异条数
  	public int selectDmsUpdateResultCnt(TmpDmsUpdateSqlVO tmpDmsUpdateSqlVO);
  	//查询差异数量
  	public List<TmpDmsUpdateSqlVO> selectDmsUpdateResult(TmpDmsUpdateSqlVO tmpDmsUpdateSqlVO);
    //根据SQL修复DCS数据
    public void updateDcsBySql(String sql) throws Exception;
    //查询待执行SQL的经销商
  	public List<TmpDmsUpdateSqlVO> selectDealerByDlrCds(TmpDmsUpdateSqlVO searchVO);
    //查询已经执行过SQL的经销商数量
  	public int batchUpdateBySqlProcessShow(CarSearchVO searchVO);
  	//查询全部需要执行SQL经销商数量
  	public int batchUpdateBySqlProcessShowAll(CarSearchVO searchVO);
  	
  	//执行事务提交存储过程
  	public void callIfMergeCommit() throws Exception;
    /*--------------------------------------------------------月结 DCS执行SQL End-----------------------------------------------------*/
	
    /*--------------------------------------------------------月结修改 End-------------------------------------------------------------*/
}
