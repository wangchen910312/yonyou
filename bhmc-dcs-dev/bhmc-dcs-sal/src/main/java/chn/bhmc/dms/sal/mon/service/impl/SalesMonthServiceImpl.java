package chn.bhmc.dms.sal.mon.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONObject;
import org.jxls.common.Context;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.cmm.cmp.vo.CarSearchVO;
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
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.ass.vo.AssignSearchVO;
import chn.bhmc.dms.sal.ass.vo.AssignVO;
import chn.bhmc.dms.sal.mon.service.SalesMonthService;
import chn.bhmc.dms.sal.mon.service.dao.SalesMonthDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FincProductServiceImpl
 * @Description : 금융상품정보 I/F DCS -> DMS
 * @author Kim Jin Suk
 * @since 2017. 4. 17
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 4. 17                            최초 생성
 * </pre>
 */

@Service("salesMonthService")
public class SalesMonthServiceImpl extends HService implements SalesMonthService, JxlsSupport {

	public static final Logger logger = LoggerFactory.getLogger("chn.bhmc.dms.app.log.error");
	
	//最大线程数
	final static int MAX_QPS = 30;
	//获得线程执行坑位
	final static Semaphore semaphore = new Semaphore(MAX_QPS);
	//超时时间秒数
	public static final int TIMEOUT = 60;
	
	private String devOrPrd = "BHDCSOP";
	
    @Resource(name="salesMonthDAO")
    SalesMonthDAO salesMonthDAO;

    /**
     * 批量修改DMS月结信息
     */
    @Override
    public String updateOrderInfoErpToDmsThread(String month1) throws Exception{
    	return "停止使用该方法";
    	/*String errorStr = "";
    	final String month = month1;
    	DealerSearchVO searchVO = new DealerSearchVO();
    	//List<DealerVO> list = salesMonthDAO.selectDealerListByCondition(searchVO);
    	Map<String,String> map = gDlrCdMap();
    	DealerVO dealer = new DealerVO();
    	for (Map.Entry<String, String> m : map.entrySet()) {
    		 dealer = new DealerVO();
    		 dealer.setDmsIpNm(m.getValue());
    		 dealer.setDlrCd(m.getKey());
    		 list.add(dealer);
    	}
    	for (int i = 0; i < list.size(); i++) {
			DealerVO dealer = (DealerVO) list.get(i);
			if (null != dealer.getDmsIpNm() && !dealer.getDmsIpNm().equals("")) {
				// 连接经销商数据库执行SQL
				Connection conn = null;
				try {
					conn = dbConnection(dealer.getDmsIpNm());
				} catch (Exception e) {
					System.out.println("#" + e.getMessage());
					// 经销商连接不成功放入表 dealer
					salesMonthDAO.saveConnectionErrorTmp(dealer);
					continue;
				}

				if (null != conn) {
					Statement stmt = null;
					try {
						stmt = conn.createStatement();
						// 查询经销商数据差异结果集,备份差异
						ResultSet rs = null;
						try {

							StringBuffer sSql = new StringBuffer();
							sSql.append("SELECT * FROM SA_0416T T WHERE T.SALES_NO IN(\n");
							sSql.append("         SELECT NVL(A.SALES_NO,B.SALES_NO) FROM (\n");
							sSql.append("         SELECT DLR_CD, SALES_NO ,CNDY, UPDT_DT,PRTY , ALDY , EMONT\n");
							sSql.append("         FROM SA_0416T\n WHERE 1=1\n");
							sSql.append("              AND ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '").append(month).append("')  OR PRTY = 'A')\n");
							sSql.append("     ) A FULL JOIN (\n");
							sSql.append("         SELECT DLR_CD, SALES_NO ,CNDY,UPDT_DT,PRTY , ALDY , EMONT \n");
							sSql.append("         FROM SA_0416T@").append(devOrPrd).append("\n");
							sSql.append("         WHERE 1=1\n");
							sSql.append("          AND ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '").append(month).append("')  OR PRTY = 'A')\n");
							sSql.append("          AND DLR_CD = '").append(dealer.getDlrCd()).append("'\n");
							sSql.append("     ) B    ON A.SALES_NO = B.SALES_NO\n");
							sSql.append("     WHERE 1=1\n");
							sSql.append("     AND ( NVL(A.PRTY,'1') <> NVL(B.PRTY,'2') OR (NVL(A.ALDY,'1') <> NVL(B.ALDY,'2') AND NVL(A.PRTY,'1') <> 'A' )))");

							System.out.println(sSql.toString());
							rs = stmt.executeQuery(sSql.toString());
							ResultSetMetaData meta = rs.getMetaData();

							while (rs.next()) {
								NotAssignedOrderVO bakVO = new NotAssignedOrderVO();
								bakVO.setCarlineNm(rs.getString("DLR_CD"));
								bakVO.setModelCd(rs.getString("PRTY"));
								bakVO.setOcnCd(rs.getString("ALDY"));
								bakVO.setSalesNo(rs.getString("SALES_NO"));
								bakVO.setOrdYymm(rs.getString("ORD_YYMM"));
								bakVO.setOrdWeek(rs.getString("ORD_WEEK"));
								bakVO.setOrdSeq(rs.getInt("ORD_SEQ"));
								bakVO.setCarlineCd(rs.getString("CARLINE_CD"));

								salesMonthDAO.saveDmsOrderInfo(bakVO);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						} finally {
							try {
								rs.close();
							} catch (SQLException e) {
								e.printStackTrace();
							}
						}

						// 备份完毕，批量更新
						StringBuffer sqlUpdate = new StringBuffer();
						sqlUpdate.append("update sa_0416t a set (A.PRTY,A.ALDY) = (select B.PRTY,B.ALDY from SA_0416T@").append(devOrPrd).append(" b where b.sales_no = a.sales_no) where sales_no IN\n");
						sqlUpdate.append("(SELECT NVL(A.SALES_NO,B.SALES_NO) FROM (\n");
						sqlUpdate.append(" SELECT DLR_CD, SALES_NO ,CNDY, UPDT_DT,PRTY , ALDY , EMONT\n");
						sqlUpdate.append(" FROM SA_0416T\n");
						sqlUpdate.append(" WHERE 1=1\n");
						sqlUpdate.append(" AND  ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '")
								.append(month).append("')  OR PRTY = 'A'  )\n");
						sqlUpdate.append(" ) A FULL JOIN (\n");
						sqlUpdate.append(" SELECT DLR_CD, SALES_NO ,CNDY,UPDT_DT,PRTY , ALDY , EMONT\n");
						sqlUpdate.append(" FROM SA_0416T@").append(devOrPrd).append(" \n");
						sqlUpdate.append(" WHERE 1=1\n");
						sqlUpdate.append(" AND   ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '")
								.append(month).append("')  OR PRTY = 'A'  )\n");
						sqlUpdate.append(" AND DLR_CD = '").append(dealer.getDlrCd()).append("'\n");
						sqlUpdate.append(" ) B ON A.SALES_NO = B.SALES_NO\n");
						sqlUpdate.append(" WHERE 1=1\n");
						sqlUpdate.append(" AND ( NVL(A.PRTY,'1') <> NVL(B.PRTY,'2') OR (NVL(A.ALDY,'1') <> NVL(B.ALDY,'2') AND NVL(A.PRTY,'1') <> 'A' )))\n");
						System.out.println(sqlUpdate.toString());
						stmt.execute(sqlUpdate.toString());
						

						// 修改后，再次查询未修改成功的单据插入DMS临时表展示到前台
						ResultSet rsRepet = null;

						try {
							StringBuffer sqlRepet = new StringBuffer();
							sqlRepet.append("SELECT * FROM SA_0416T T WHERE T.SALES_NO IN(\n");
							sqlRepet.append("         SELECT NVL(A.SALES_NO,B.SALES_NO) FROM (\n");
							sqlRepet.append(
									"         SELECT DLR_CD, SALES_NO ,CNDY, UPDT_DT,PRTY , ALDY , EMONT\n");
							sqlRepet.append("         FROM SA_0416T\n WHERE 1=1\n");
							sqlRepet.append(
									"              AND ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '")
									.append(month).append("')  OR PRTY = 'A')\n");
							sqlRepet.append("     ) A FULL JOIN (\n");
							sqlRepet.append(
									"    SELECT DLR_CD, SALES_NO ,CNDY,UPDT_DT,PRTY , ALDY , EMONT \n");
							sqlRepet.append("         FROM SA_0416T@").append(devOrPrd).append("\n");
							sqlRepet.append("         WHERE 1=1\n");
							sqlRepet.append(
									"          AND ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '")
									.append(month).append("')  OR PRTY = 'A')\n");
							sqlRepet.append("          AND DLR_CD = '").append(dealer.getDlrCd())
									.append("'\n");
							sqlRepet.append("     ) B    ON A.SALES_NO = B.SALES_NO\n");
							sqlRepet.append("     WHERE 1=1\n");
							sqlRepet.append(
									"          AND ( NVL(A.PRTY,'1') <> NVL(B.PRTY,'2') OR (NVL(A.ALDY,'1') <> NVL(B.ALDY,'2') AND NVL(A.PRTY,'1') <> 'A' )))");
							System.out.println(sqlRepet.toString());
							rsRepet = stmt.executeQuery(sqlRepet.toString());

							ResultSetMetaData meta = rsRepet.getMetaData();

							while (rsRepet.next()) {
								NotAssignedOrderVO tmpVO = new NotAssignedOrderVO();
								tmpVO.setCarlineNm(rsRepet.getString("DLR_CD"));
								tmpVO.setModelCd(rsRepet.getString("PRTY"));
								tmpVO.setOcnCd(rsRepet.getString("ALDY"));
								tmpVO.setSalesNo(rsRepet.getString("SALES_NO"));
								tmpVO.setOrdYymm(rsRepet.getString("ORD_YYMM"));
								tmpVO.setOrdWeek(rsRepet.getString("ORD_WEEK"));
								tmpVO.setOrdSeq(rsRepet.getInt("ORD_SEQ"));
								tmpVO.setCarlineCd(rsRepet.getString("CARLINE_CD"));
								salesMonthDAO.saveDmsOrderTmp(tmpVO);
							}
						} catch (SQLException e) {
							e.printStackTrace();
						} finally {
							try {
								rs.close();
							} catch (SQLException e) {
								e.printStackTrace();
							}
						}

					} catch (SQLException e) {
						e.printStackTrace();
					} catch (Exception e) {
						e.printStackTrace();
						conn.rollback();
					} finally {
						try {
							conn.commit();
							stmt.close();
							conn.close();

						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
    	
    	// 查询连接失败的经销商信息
		List<DealerVO> listError = salesMonthDAO.selectConnectionError();
		if(listError.size()>0){
			for (int i = 0; i < listError.size(); i++) {
				errorStr+=listError.get(i).getDlrCd()+",";
			}
		}
		if (!"".equals(errorStr)) {
			return errorStr;
		} else {
			return "0";
		}*/
    }
    /**
     * 批量修改DMS月结信息
     */
    /*@Override
    public String updateOrderInfoErpToDms(String month1) throws Exception{
    	return "停止使用该方法";
    	String errorStr = "";
    	final String month = month1;
    	DealerSearchVO searchVO = new DealerSearchVO();
    	//获得所有经销商
        List<DealerVO> list = salesMonthDAO.selectDealerListByCondition(searchVO);
    	//分割list,均分数据到list中
    	List<List<DealerVO>> spiltList =spiltList(list,50);
		//多线程计数器,用于挂起线程等子线程执行完毕在执行主线程
		final CountDownLatch latch=new CountDownLatch(spiltList.size());
		System.out.println("主线程开始执行....");
		//先清空经销商地址链接失败临时表
		salesMonthDAO.deleteTmpConnectionError();
		salesMonthDAO.deleteTmpDmsAll();
		for (int i = 0; i < spiltList.size(); i++) {
			final List<DealerVO> list2 = spiltList.get(i);
			new Thread() {
				public void run() {
					try {
						System.out.println("子线程开始执行....");
						int temp = 0;
						// 循环经销商list
						for (int i = 0; i < list2.size(); i++) {
							DealerVO dealer = (DealerVO) list2.get(i);
							if (null != dealer.getDmsIpNm() && !dealer.getDmsIpNm().equals("")) {
								// 连接经销商数据库执行SQL
								Connection conn = null;
								try {
									conn = dbConnection(dealer.getDmsIpNm());
								} catch (Exception e) {
									if(temp == 5){
										temp = 0;
										// 经销商连接不成功放入表 dealer
										salesMonthDAO.saveConnectionErrorTmp(dealer);
									}else{
										temp++;
										i--;
										Thread.sleep(1000);
									}
									System.out.println("#" + e.getMessage());
									continue;
								}

								if (null != conn) {
									Statement stmt = null;
									try {
										stmt = conn.createStatement();
										// 查询经销商数据差异结果集,备份差异
										ResultSet rs = null;
										try {

											StringBuffer sSql = new StringBuffer();
											sSql.append("  SELECT T.DLR_CD,T.SALES_NO,T.PRTY,T.ALDY FROM SA_0416T T WHERE T.SALES_NO IN(\n");
											sSql.append("  SELECT NVL(A.SALES_NO,B.SALES_NO) FROM (\n");
											sSql.append("  SELECT DLR_CD, SALES_NO ,CNDY, UPDT_DT,PRTY , ALDY , EMONT\n");
											sSql.append("  FROM SA_0416T\n WHERE 1=1\n");
											sSql.append("  AND ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '")
													.append(month).append("')  OR PRTY = 'A')\n");
											sSql.append("  ) A FULL JOIN (\n");
											sSql.append("  SELECT DLR_CD, SALES_NO ,CNDY,UPDT_DT,PRTY , ALDY , EMONT \n");
											sSql.append("  FROM SA_0416T@").append(devOrPrd).append("\n");
											sSql.append("  WHERE 1=1\n");
											sSql.append("  AND ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '")
													.append(month).append("')  OR PRTY = 'A')\n");
											sSql.append("  AND DLR_CD = '").append(dealer.getDlrCd())
													.append("'\n");
											sSql.append("  ) B  ON A.SALES_NO = B.SALES_NO\n");
											sSql.append("  WHERE 1=1\n");
											sSql.append("  AND ( NVL(A.PRTY,'1') <> NVL(B.PRTY,'2') OR (NVL(A.ALDY,'1') <> NVL(B.ALDY,'2') AND NVL(A.PRTY,'1') <> 'A' )))");

											System.out.println(sSql.toString());
											rs = stmt.executeQuery(sSql.toString());
											ResultSetMetaData meta = rs.getMetaData();

											while (rs.next()) {
												NotAssignedOrderVO bakVO = new NotAssignedOrderVO();
												bakVO.setCarlineNm(rs.getString("DLR_CD"));
												bakVO.setModelCd(rs.getString("PRTY"));
												bakVO.setOcnCd(rs.getString("ALDY"));
												bakVO.setSalesNo(rs.getString("SALES_NO"));
												bakVO.setOrdYymm(rs.getString("ORD_YYMM"));
												bakVO.setOrdWeek(rs.getString("ORD_WEEK"));
												bakVO.setOrdSeq(rs.getInt("ORD_SEQ"));
												bakVO.setCarlineCd(rs.getString("CARLINE_CD"));

												salesMonthDAO.saveDmsOrderInfo(bakVO);
											}
										} catch (SQLException e) {
											e.printStackTrace();
										} finally {
											try {
												rs.close();
											} catch (SQLException e) {
												e.printStackTrace();
											}
										}

										// 备份完毕，批量更新
										StringBuffer sqlUpdate = new StringBuffer();
										sqlUpdate.append(" update sa_0416t a set (A.PRTY,A.ALDY) = (select B.PRTY,B.ALDY from SA_0416T@").append(devOrPrd).append(" b where b.sales_no = a.sales_no) where sales_no IN\n");
										sqlUpdate.append("(SELECT NVL(A.SALES_NO,B.SALES_NO) FROM (\n");
										sqlUpdate.append(" SELECT DLR_CD, SALES_NO ,CNDY, UPDT_DT,PRTY , ALDY , EMONT\n");
										sqlUpdate.append(" FROM SA_0416T\n");
										sqlUpdate.append(" WHERE 1=1\n");
										sqlUpdate.append("  AND  ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '")
												.append(month).append("')  OR PRTY = 'A'  )\n");
										sqlUpdate.append("  ) A FULL JOIN (\n");
										sqlUpdate.append(" SELECT DLR_CD, SALES_NO ,CNDY,UPDT_DT,PRTY , ALDY , EMONT\n");
										sqlUpdate.append(" FROM SA_0416T@").append(devOrPrd).append(" \n");
										sqlUpdate.append(" WHERE 1=1\n");
										sqlUpdate.append(" AND   ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '")
												.append(month).append("')  OR PRTY = 'A'  )\n");
										sqlUpdate.append(" AND DLR_CD = '").append(dealer.getDlrCd()).append("'\n");
										sqlUpdate.append(" ) B ON A.SALES_NO = B.SALES_NO\n");
										sqlUpdate.append(" WHERE 1=1\n");
										sqlUpdate.append(" AND ( NVL(A.PRTY,'1') <> NVL(B.PRTY,'2') OR (NVL(A.ALDY,'1') <> NVL(B.ALDY,'2') AND NVL(A.PRTY,'1') <> 'A' )))\n");
										System.out.println(sqlUpdate.toString());
										stmt.execute(sqlUpdate.toString());
										

										// 修改后，再次查询未修改成功的单据插入DMS临时表展示到前台
										ResultSet rsRepet = null;

										try {
											StringBuffer sqlRepet = new StringBuffer();
											sqlRepet.append("  SELECT T.DLR_CD,T.SALES_NO,T.PRTY,T.ALDY FROM SA_0416T T WHERE T.SALES_NO IN(\n");
											sqlRepet.append("  SELECT NVL(A.SALES_NO,B.SALES_NO) FROM (\n");
											sqlRepet.append("  SELECT DLR_CD, SALES_NO ,CNDY, UPDT_DT,PRTY , ALDY , EMONT\n");
											sqlRepet.append("  FROM SA_0416T\n WHERE 1=1\n");
											sqlRepet.append("  AND ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '")
													.append(month).append("')  OR PRTY = 'A')\n");
											sqlRepet.append("  ) A FULL JOIN (\n");
											sqlRepet.append("  SELECT DLR_CD, SALES_NO ,CNDY,UPDT_DT,PRTY , ALDY , EMONT \n");
											sqlRepet.append("  FROM SA_0416T@").append(devOrPrd).append("\n");
											sqlRepet.append("  WHERE 1=1\n");
											sqlRepet.append("  AND ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '")
													.append(month).append("')  OR PRTY = 'A')\n");
											sqlRepet.append("  AND DLR_CD = '").append(dealer.getDlrCd())
													.append("'\n");
											sqlRepet.append("  ) B  ON A.SALES_NO = B.SALES_NO\n");
											sqlRepet.append("  WHERE 1=1\n");
											sqlRepet.append("  AND ( NVL(A.PRTY,'1') <> NVL(B.PRTY,'2') OR (NVL(A.ALDY,'1') <> NVL(B.ALDY,'2') AND NVL(A.PRTY,'1') <> 'A' )))");
											System.out.println(sqlRepet.toString());
											rsRepet = stmt.executeQuery(sqlRepet.toString());

											ResultSetMetaData meta = rsRepet.getMetaData();

											while (rsRepet.next()) {
												NotAssignedOrderVO tmpVO = new NotAssignedOrderVO();
												tmpVO.setCarlineNm(rsRepet.getString("DLR_CD"));
												tmpVO.setModelCd(rsRepet.getString("PRTY"));
												tmpVO.setOcnCd(rsRepet.getString("ALDY"));
												tmpVO.setSalesNo(rsRepet.getString("SALES_NO"));
												tmpVO.setOrdYymm(rsRepet.getString("ORD_YYMM"));
												tmpVO.setOrdWeek(rsRepet.getString("ORD_WEEK"));
												tmpVO.setOrdSeq(rsRepet.getInt("ORD_SEQ"));
												tmpVO.setCarlineCd(rsRepet.getString("CARLINE_CD"));
												salesMonthDAO.saveDmsOrderTmp(tmpVO);
											}
										} catch (SQLException e) {
											e.printStackTrace();
										} finally {
											try {
												rs.close();
											} catch (SQLException e) {
												e.printStackTrace();
											}
										}

									} catch (SQLException e) {
										e.printStackTrace();
									} catch (Exception e) {
										e.printStackTrace();
										conn.rollback();
									} finally {
										try {
											conn.commit();
											stmt.close();
											conn.close();

										} catch (SQLException e) {
											e.printStackTrace();
										}
									}
								}
							}
						}
						// 子线程执行完毕，计数减1,等于0时子线程全部执行完成,执行主线程
						latch.countDown();
					} catch (Exception e) {
						e.printStackTrace();
					}
				};
			}.start();
		}
		System.out.println("等待子线程执行完毕...");
		try {
			// 当前线程挂起等待子线程全部执行完成,执行主线程
			latch.await();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("子线程执行完毕,继续主线程执行!!!...");
		// 查询连接失败的经销商信息
		List<DealerVO> listError = salesMonthDAO.selectConnectionError();
		if(listError.size()>0){
			for (int i = 0; i < listError.size(); i++) {
				errorStr+=listError.get(i).getDlrCd()+",";
			}
		}
		if (!"".equals(errorStr)) {
			return errorStr;
		} else {
			return "0";
		}
	}*/
    /**
     * 根据前台sql dlrCd执行修改
     */
    @Override
    public String updateDmsOrderBySql(String sql1, String month1, String sDlrCd) throws Exception{
    	return "停止使用该方法";
    	/*DealerSearchVO searchVO = new DealerSearchVO();
    	String errorStr = "";
    	final String month = month1;
    	final String sql = sql1;
    	//判断sDlrCd是一家经销商还是所有
    	if("ALL".equalsIgnoreCase(sDlrCd)){//查询所有经销商
    		searchVO.setsDlrCd("");
    	}else{//查询一家经销商
    		searchVO.setsDlrCd(sDlrCd);
    	}
        List<DealerVO> list = salesMonthDAO.selectDealerListByCondition(searchVO);
    	//分割list,均分数据到list中
    	List<List<DealerVO>> spiltList =spiltList(list,50);
		//多线程计数器,用于挂起线程等子线程执行完毕在执行主线程
		final CountDownLatch latch=new CountDownLatch(spiltList.size());
		System.out.println("主线程开始执行....");
		//先清空经销商地址链接失败临时表
		salesMonthDAO.deleteTmpConnectionError();
		for (int i = 0; i < spiltList.size(); i++) {
			final List<DealerVO> list2 = spiltList.get(i);
			new Thread() {
				public void run() {
					try {
						// 循环经销商list
						int temp = 0;
						for (int i = 0; i < list2.size(); i++) {
							DealerVO dealer = (DealerVO) list2.get(i);
							if (null != dealer.getDmsIpNm() && !dealer.getDmsIpNm().equals("")) {
								// 连接经销商数据库执行SQL
								Connection conn = null;
								try {
									conn = dbConnection(dealer.getDmsIpNm());
								} catch (Exception e) {
									if(temp == 5){
										temp = 0;
										// 经销商连接不成功放入表 dealer
										salesMonthDAO.saveConnectionErrorTmp(dealer);
									}else{
										temp++;
										i--;
										Thread.sleep(1000);
									}
									System.out.println("#" + e.getMessage());
									continue;
								}

								if (null != conn) {
									Statement stmt = null;
									try {
										stmt = conn.createStatement();
										stmt.execute(sql);
										HashMap<String, Object> deleteMap = new HashMap<String, Object>();
										deleteMap.put("dlrCd", dealer.getDlrCd());
										salesMonthDAO.deleteTmpDms(deleteMap);
										// 先删除该经销商仍存在差异数据临时表TMP_DMS_SA_0416T数据,重新对比差异数据放入TMP表展示到前台
										ResultSet rsRepet = null;

										StringBuffer sqlRepet = new StringBuffer();
										sqlRepet.append("SELECT * FROM SA_0416T T WHERE T.SALES_NO IN(\n");
										sqlRepet.append("         SELECT NVL(A.SALES_NO,B.SALES_NO) FROM (\n");
										sqlRepet.append(
												"         SELECT DLR_CD, SALES_NO ,CNDY, UPDT_DT,PRTY , ALDY , EMONT\n");
										sqlRepet.append("         FROM SA_0416T\n WHERE 1=1\n");
										sqlRepet.append(
												"              AND ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '")
												.append(month).append("')  OR PRTY = 'A')\n");
										sqlRepet.append("     ) A FULL JOIN (\n");
										sqlRepet.append("    "
												+ "     SELECT DLR_CD, SALES_NO ,CNDY,UPDT_DT,PRTY , ALDY , EMONT \n");
										sqlRepet.append("         FROM SA_0416T@").append(devOrPrd).append("\n");
										sqlRepet.append("         WHERE 1=1\n");
										sqlRepet.append(
												"          AND ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '")
												.append(month).append("')  OR PRTY = 'A')\n");
										sqlRepet.append("          AND DLR_CD = '").append(dealer.getDlrCd())
												.append("'\n");
										sqlRepet.append("     ) B    ON A.SALES_NO = B.SALES_NO\n");
										sqlRepet.append("     WHERE 1=1\n");
										sqlRepet.append(
												"          AND ( NVL(A.PRTY,'1') <> NVL(B.PRTY,'2') OR (NVL(A.ALDY,'1') <> NVL(B.ALDY,'2') AND NVL(A.PRTY,'1') <> 'A' )))");

										rsRepet = stmt.executeQuery(sqlRepet.toString());

										ResultSetMetaData meta = rsRepet.getMetaData();

										while (rsRepet.next()) {
											NotAssignedOrderVO tmpVO = new NotAssignedOrderVO();
											tmpVO.setCarlineNm(rsRepet.getString("DLR_CD"));
											tmpVO.setModelCd(rsRepet.getString("PRTY"));
											tmpVO.setOcnCd(rsRepet.getString("ALDY"));
											tmpVO.setSalesNo(rsRepet.getString("SALES_NO"));
											tmpVO.setOrdYymm(rsRepet.getString("ORD_YYMM"));
											tmpVO.setOrdWeek(rsRepet.getString("ORD_WEEK"));
											tmpVO.setOrdSeq(rsRepet.getInt("ORD_SEQ"));
											tmpVO.setCarlineCd(rsRepet.getString("CARLINE_CD"));
											salesMonthDAO.saveDmsOrderTmp(tmpVO);
										}
									} catch (Exception e) {
										e.printStackTrace();
										conn.rollback();
									} finally {
										try {
											conn.commit();
											stmt.close();
											conn.close();
										} catch (SQLException e) {
											e.printStackTrace();
										}
									}
								}
							}
						}
						// 子线程执行完毕，计数减1,等于0时子线程全部执行完成,执行主线程
						latch.countDown();
					} catch (Exception e) {
						e.printStackTrace();
					}
				};
			}.start();
		}
		System.out.println("等待子线程执行完毕...");
		try {
			// 当前线程挂起等待子线程全部执行完成,执行主线程
			latch.await();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//查询连接失败的经销商信息
		List<DealerVO> listError = salesMonthDAO.selectConnectionError();
		if(listError.size()>0){
			for (int i = 0; i < listError.size(); i++) {
				errorStr+=listError.get(i).getDlrCd();
			}
		}
		if (!"".equals(errorStr)) {
			return errorStr;
		} else {
			return "0";
		}*/
	}

    /**
     * 엑셀 다운로드
     * @param list
     * @throws Exception
     */
    /*@Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

    	NotAssignedOrderSearchVO searchVO = new NotAssignedOrderSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsModelCd("");
        List<NotAssignedOrderVO> list = new ArrayList<NotAssignedOrderVO>();
        	//获取下载类型
            String downloadType = (String)params.get("downloadType");
            String sDlrCd = (String)params.get("sDlrCd");
            String checkMonth = (String)params.get("checkMonth");
            String aldy = (String)params.get("aldy");
            if(sDlrCd!= null && !"".equals(sDlrCd)){//经销商cd
            	searchVO.setsDlrCd(sDlrCd);
            }
            if(aldy!= null && !"".equals(aldy)){ //日期
            	searchVO.setsModelCd(aldy);
            }
            if("DCS".equals(downloadType)){
            	list = salesMonthDAO.selectDcsSalesMonth(searchVO);
            	context.putVar("items", list);
            }else if("DMS".equals(downloadType)){
            	list = salesMonthDAO.selectDmsSalesMonth(searchVO);
            	context.putVar("items", list);
            }else if("NUMBER".equals(downloadType)){
            	NumberContrastVO numberContrastVO = new NumberContrastVO();
            	List<NumberContrastVO> listNum = salesMonthDAO.selectNumberContrast(numberContrastVO);
            	context.putVar("items", listNum);
            }else if("DmsOrderCheckResult".equals(downloadType)){
            	TmpDmsOrderCheckVO tmpDmsOrderCheckVO = new TmpDmsOrderCheckVO();
            	tmpDmsOrderCheckVO.setCheckMonth(checkMonth);
            	tmpDmsOrderCheckVO.setFirstIndex(-1);
            	tmpDmsOrderCheckVO.setLastIndex(-1);
            	List<TmpDmsOrderCheckVO> listNum = salesMonthDAO.selectDmsOrderDiff(tmpDmsOrderCheckVO);
            	context.putVar("items", listNum);
            }else{
            	String dlrCd = (String)params.get("sDlrCd");
            	String applStartDt = (String)params.get("applStartDt");
            	String applEndDt = (String)params.get("applEndDt");
            	AssignSearchVO assignVO = new AssignSearchVO();
            	assignVO.setsDlrCd(dlrCd);
            	assignVO.setsVinNo1(applStartDt);
            	assignVO.setsVinNo2(applEndDt);
            	List<AssignVO> selectDmsSalesCar = salesMonthDAO.selectDmsSalesCar(assignVO);
            	context.putVar("items", selectDmsSalesCar);
            }
    }*/
    
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String downloadType = (String)params.get("downloadType");
        //DCS订单差异数量
        if("selectDcsSalesOrderSearchMain".equals(downloadType)){
        	TmpDcsOrderCheckVO searchVO = new TmpDcsOrderCheckVO();
        	searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            String checkMonth = "";
            if(!StringUtils.isBlank(params.get("checkMonth").toString())){
                checkMonth = params.get("checkMonth").toString();
                searchVO.setCheckMonth(checkMonth);
            }
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        	List<TmpDcsOrderCheckVO> list = salesMonthDAO.selectDcsOrderDiffForDownload(searchVO);
        	context.putVar("items", list);
        }
        //DCS订单差异详情
        else if("selectDcsSalesOrderManageMain".equals(downloadType)){
        	TmpDcsOrderCheckVO searchVO = new TmpDcsOrderCheckVO();
        	searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            String checkMonth = (String)params.get("checkMonth");
            if(checkMonth!= null && !"".equals(checkMonth)){ //月份
            	searchVO.setCheckMonth(checkMonth);
            }
        	ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        	List<TmpDcsErpOrderDetailVO> list = salesMonthDAO.selectDcsErpOrdDetailForDownload(searchVO);
        	context.putVar("items", list);
        }
        //DMS订单差异数量
        else if("selectDmsSalesOrderSearchMain".equals(downloadType)){
        	TmpDmsOrderCheckVO searchVO = new TmpDmsOrderCheckVO();
        	searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            String checkMonth = "";
            if(!StringUtils.isBlank(params.get("checkMonth").toString())){
                checkMonth = params.get("checkMonth").toString();
                searchVO.setCheckMonth(checkMonth);
            }
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        	List<TmpDmsOrderCheckVO> list = salesMonthDAO.selectDmsOrderDiffForDownload(searchVO);
        	context.putVar("items", list);
        }
        //DMS订单差异详情
        else if("selectDmsSalesOrderManageMain".equals(downloadType)){
        	TmpDmsOrderCheckVO searchVO = new TmpDmsOrderCheckVO();
        	searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        	String checkMonth = (String)params.get("checkMonth");
            if(checkMonth!= null && !"".equals(checkMonth)){ //月份
            	searchVO.setCheckMonth(checkMonth);
            }
        	ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        	List<TmpDmsErpOrderDetailVO> list = salesMonthDAO.selectDmsErpOrdDetailForDownload(searchVO);
        	context.putVar("items", list);
        }
        //DCS车辆差异数量
        else if("selectDcsSalesCarSearchMain".equals(downloadType)){
        	TmpDcsCarCheckVO searchVO = new TmpDcsCarCheckVO();
        	searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            String checkMonth = (String)params.get("checkMonth");
            if(checkMonth!= null && !"".equals(checkMonth)){ //月份
            	searchVO.setCheckMonth(checkMonth);
            }
        	ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        	List<TmpDcsCarCheckVO> list = salesMonthDAO.selectDcsCarDiffForDownload(searchVO);
        	context.putVar("items", list);
        }
        //DCS车辆差异详情
        else if("selectDcsSalesCarManageMain".equals(downloadType)){
        	TmpDcsCarCheckVO searchVO = new TmpDcsCarCheckVO();
        	searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            String checkMonth = (String)params.get("checkMonth");
            if(checkMonth!= null && !"".equals(checkMonth)){ //月份
            	searchVO.setCheckMonth(checkMonth);
            }
        	ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        	List<TmpDcsErpCarDetailVO> list = salesMonthDAO.selectDcsErpCarDetailForDownload(searchVO);
        	context.putVar("items", list);
        }
        //DCS车辆差异数量
        else if("selectDmsSalesCarSearchMain".equals(downloadType)){
        	TmpDmsCarCheckVO searchVO = new TmpDmsCarCheckVO();
        	searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            String checkMonth = (String)params.get("checkMonth");
            if(checkMonth!= null && !"".equals(checkMonth)){ //月份
            	searchVO.setCheckMonth(checkMonth);
            }
        	ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        	List<TmpDmsCarCheckVO> list = salesMonthDAO.selectDmsCarDiffForDownload(searchVO);
        	context.putVar("items", list);
        }
        //DCS车辆差异详情
        else if("selectDmsSalesCarManageMain".equals(downloadType)){
        	TmpDmsCarCheckVO searchVO = new TmpDmsCarCheckVO();
        	searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            String checkMonth = (String)params.get("checkMonth");
            if(checkMonth!= null && !"".equals(checkMonth)){ //月份
            	searchVO.setCheckMonth(checkMonth);
            }
        	ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        	List<TmpDmsErpCarDetailVO> list = salesMonthDAO.selectDmsErpCarDetailForDownload(searchVO);
        	context.putVar("items", list);
        }
    }
    
 // DB 접속
    public Connection dbConnection(String dlrIP) throws Exception{
        Connection conn = null;

        String url = "jdbc:tibero:thin:@"+dlrIP+":8629:BHDMS";
        String user = "DMSDB";
        String password = "DMSDB_#01";

        // 1. Driver
        try {
            //Class.forName("oracle.jdbc.driver.OracleDriver");
            Class.forName("com.tmax.tibero.jdbc.TbDriver");

        // 2. Connection DB (URL, ID, P/W)
            conn = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            throw e;
        } catch (SQLException e) {
            throw e;
        }catch (Exception e) {
            throw e;
        }

        return conn;
    }
    
    /**
     * DMS车辆差异对
     * @param searchVO
     * @return
     */
	@Override
	public String updateDmsCar(AssignSearchVO vo) {
		return "停止使用该方法";
		/*DealerSearchVO searchVO = new DealerSearchVO();
		String errorStr = "";
		//获取开始时间和结束时间
    	final String startDate = vo.getsVinNo1();
    	final String endDate = vo.getsVinNo2();
    	//获得所有经销商
        List<DealerVO> list = salesMonthDAO.selectDealerListByCondition(searchVO);
    	//分割list,均分数据到list中
    	List<List<DealerVO>> spiltList =spiltList(list,50);
		//多线程计数器,用于挂起线程等子线程执行完毕在执行主线程
		final CountDownLatch latch=new CountDownLatch(spiltList.size());
		System.out.println("主线程开始执行....");
		//先清空经销商地址链接失败临时表
		salesMonthDAO.deleteTmpConnectionError();
		salesMonthDAO.deleteCarTmpAll();
		for (int i = 0; i < spiltList.size(); i++) {
			final List<DealerVO> list2 = spiltList.get(i);
			new Thread() {
				public void run() {
					try {
						System.out.println("子线程开始执行....");
						System.out.println("开启线程名称:"+Thread.currentThread().getName());
						int temp = 0;
						// 循环经销商list
						for (int i = 0; i < list2.size(); i++) {
							DealerVO dealer = (DealerVO) list2.get(i);
							if (null != dealer.getDmsIpNm() && !dealer.getDmsIpNm().equals("")) {
								// 连接经销商数据库执行SQL
								Connection conn = null;
								try {
									conn = dbConnection(dealer.getDmsIpNm());
								} catch (Exception e) {
									if(temp == 5){
										temp = 0;
										// 经销商连接不成功放入表 dealer
										salesMonthDAO.saveConnectionErrorTmp(dealer);
									}else{
										temp++;
										i--;
										Thread.sleep(1000);
									}
									System.out.println("#" + e.getMessage());
									continue;
								}

								if (null != conn) {
									Statement stmt = null;
									try {
										stmt = conn.createStatement();
										
										// 查询差异放入差异临时表
										ResultSet rsRepet = null;
										ResultSet repet = null;
										
										try {
											//先对比车辆状态都是零售的销售时间不同的数据,插入临时表
											StringBuffer sqlRepet = new StringBuffer();
											sqlRepet.append(" SELECT A.CAR_ID,A.VIN_NO,A.ORD_DLR_CD,A.CAR_STAT_CD,A.CUST_SALE_DT,A.REG_USR_ID,A.REG_DT FROM SA_0121T A FULL JOIN ( ");
											sqlRepet.append(" SELECT VIN_NO1 || VIN_NO2 AS VIN_NO,ORD_DLR_CD, ");
											sqlRepet.append(" CASE CAR_STAT_CD WHEN 'Q166' THEN '13' WHEN 'Q170' THEN '50' WHEN 'Q180' THEN '60' WHEN 'Q190' THEN '70' END CAR_STAT_CD, ");
											sqlRepet.append(" CUST_SALE_DT FROM SA_0121IR_MONTH@").append(devOrPrd).append(") B ");
											sqlRepet.append(" ON (A.VIN_NO = B.VIN_NO AND A.ORD_DLR_CD = B.ORD_DLR_CD) ");
											sqlRepet.append(" WHERE A.CAR_STAT_CD = '70' AND B.CAR_STAT_CD = '70' AND TO_CHAR(A.CUST_SALE_DT,'YYYYMMDD') != B.CUST_SALE_DT ");
											sqlRepet.append(" AND TO_CHAR(A.CUST_SALE_DT,'YYYYMMDD') BETWEEN '");
											sqlRepet.append(startDate + "' AND '" + endDate + "' ");
											sqlRepet.append(" AND A.ORD_DLR_CD = '" + dealer.getDlrCd() + "'");
											
											rsRepet = stmt.executeQuery(sqlRepet.toString());
											while (rsRepet.next()) {
												AssignVO tmpVO = new AssignVO();
												tmpVO.setCarlineCd(rsRepet.getString("CAR_ID"));
												tmpVO.setVinNo(rsRepet.getString("VIN_NO"));
												tmpVO.setDlrCd(rsRepet.getString("ORD_DLR_CD"));
												tmpVO.setStatCd(rsRepet.getString("CAR_STAT_CD"));
												tmpVO.setRegUsrId(rsRepet.getString("REG_USR_ID"));
												tmpVO.setUpdtDt(rsRepet.getDate("CUST_SALE_DT"));
												tmpVO.setRegDt(rsRepet.getDate("REG_DT"));
												salesMonthDAO.saveCarTmp(tmpVO);
											}
											
											//第二次对比车辆状态不同的数据,插入临时表
											StringBuffer sqlBuffer = new StringBuffer();
											sqlBuffer.append(" SELECT A.CAR_ID,A.VIN_NO,A.ORD_DLR_CD,A.CAR_STAT_CD,A.CUST_SALE_DT,A.REG_USR_ID,A.REG_DT FROM SA_0121T A FULL JOIN ( ");
											sqlBuffer.append(" SELECT VIN_NO1 || VIN_NO2 AS VIN_NO,ORD_DLR_CD, ");
											sqlBuffer.append(" CASE CAR_STAT_CD WHEN 'Q166' THEN '13' WHEN 'Q170' THEN '50' WHEN 'Q180' THEN '60' WHEN 'Q190' THEN '70' END CAR_STAT_CD, ");
											sqlBuffer.append(" CUST_SALE_DT FROM SA_0121IR_MONTH@").append(devOrPrd).append(") B ");
											sqlBuffer.append(" ON (A.VIN_NO = B.VIN_NO ) ");
											sqlBuffer.append(" WHERE A.CAR_STAT_CD != B.CAR_STAT_CD ");
											sqlBuffer.append(" AND B.ORD_DLR_CD = '" + dealer.getDlrCd() + "' ");
											sqlBuffer.append(" AND A.VIN_NO not in ( ");
											sqlBuffer.append(" SELECT DISTINCT KMVIN FROM (SELECT KMTRDY,KMTRTM,KMVIN ,KMOPT ,KMDELR ,RN FROM ( ");
											sqlBuffer.append(" SELECT KMTRDY,KMTRTM,KMVIN,KMOPT,KMDELR,ROW_NUMBER() OVER (PARTITION BY KMVIN ORDER BY TO_DATE(KMTRDY||KMTRTM, 'YYYYMMDD HH24MISS') DESC) AS RN from SA_0301T WHERE 1=1 ");
											sqlBuffer.append(" AND KMTRDY BETWEEN '");
											sqlBuffer.append(startDate + "' AND '" + endDate + "'  AND KMOPT IN ( 'I1','J1' , 'J2' , 'J3',  'J4' ,'J5'))");
											sqlBuffer.append(" WHERE 1=1 AND RN = 1 AND KMOPT IN ( 'J1' ,  'J3',  'J5') AND KMTRDY BETWEEN '");
											sqlBuffer.append( startDate + "' AND '" + endDate + "'))");
											
											repet = stmt.executeQuery(sqlBuffer.toString());
											while (repet.next()) {
												AssignVO tmpVO = new AssignVO();
												tmpVO.setCarlineCd(repet.getString("CAR_ID"));
												tmpVO.setVinNo(repet.getString("VIN_NO"));
												tmpVO.setDlrCd(repet.getString("ORD_DLR_CD"));
												tmpVO.setStatCd(repet.getString("CAR_STAT_CD"));
												tmpVO.setRegUsrId(repet.getString("REG_USR_ID"));
												tmpVO.setUpdtDt(repet.getDate("CUST_SALE_DT"));
												tmpVO.setRegDt(repet.getDate("REG_DT"));
												salesMonthDAO.saveCarTmp(tmpVO);
											}
											
										} catch (SQLException e) {
											e.printStackTrace();
										} 

									} catch (Exception e) {
										e.printStackTrace();
										conn.rollback();
									} finally {
										try {
											conn.commit();
											stmt.close();
											conn.close();

										} catch (SQLException e) {
											e.printStackTrace();
										}
									}
								}
							}
						}
						// 子线程执行完毕，计数减1,等于0时子线程全部执行完成,执行主线程
						latch.countDown();
					} catch (Exception e) {
						e.printStackTrace();
					}
				};
			}.start();
		}
		System.out.println("等待子线程执行完毕...");
		try {
			// 当前线程挂起等待子线程全部执行完成,执行主线程
			latch.await();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("子线程执行完毕,继续主线程执行!!!...");
		// 查询连接失败的经销商信息
		List<DealerVO> listError = salesMonthDAO.selectConnectionError();
		if(listError.size()>0){
			for (int i = 0; i < listError.size(); i++) {
				errorStr+=listError.get(i).getDlrCd()+",";
			}
		}
		if (!"".equals(errorStr)) {
			return errorStr;
		} else {
			return "0";
		}*/
	}

	 /**
     * DMS车辆执行sql
     * @param searchVO
     * @return
     */
	@Override
	public String updateDmsCarBySql(String dlrCd, String sql1) {
		return "停止使用该方法";
		/*DealerSearchVO searchVO = new DealerSearchVO();
    	String errorStr = "";
    	final String sql = sql1;
    	//判断dlrCd是一家经销商还是所有
    	if("ALL".equalsIgnoreCase(dlrCd)){//查询所有经销商
    		searchVO.setsDlrCd("");
    	}else{//查询一家经销商
    		searchVO.setsDlrCd(dlrCd);
    	}
    	
        List<DealerVO> list = salesMonthDAO.selectDealerListByCondition(searchVO);
    	//分割list,均分数据到list中
    	List<List<DealerVO>> spiltList =spiltList(list,50);
		//多线程计数器,用于挂起线程等子线程执行完毕在执行主线程
		final CountDownLatch latch=new CountDownLatch(spiltList.size());
		System.out.println("主线程开始执行....");
		//先清空经销商地址链接失败临时表
		salesMonthDAO.deleteTmpConnectionError();
		for (int i = 0; i < spiltList.size(); i++) {
			final List<DealerVO> list2 = spiltList.get(i);
			new Thread() {
				public void run() {
					try {
						int temp = 0;
						// 循环经销商list
						for (int i = 0; i < list2.size(); i++) {
							DealerVO dealer = (DealerVO) list2.get(i);
							if (null != dealer.getDmsIpNm() && !dealer.getDmsIpNm().equals("")) {
								// 连接经销商数据库执行SQL
								Connection conn = null;
								try {
									conn = dbConnection(dealer.getDmsIpNm());
								} catch (Exception e) {
									if(temp == 5){
										temp = 0;
										// 经销商连接不成功放入表 dealer
										salesMonthDAO.saveConnectionErrorTmp(dealer);
									}else{
										temp++;
										i--;
										Thread.sleep(1000);
									}
									System.out.println("#" + e.getMessage());
									continue;
								}

								if (null != conn) {
									Statement stmt = null;
									try {
										stmt = conn.createStatement();
										stmt.execute(sql);
										
									} catch (Exception e) {
										e.printStackTrace();
										conn.rollback();
									} finally {
										try {
											conn.commit();
											stmt.close();
											conn.close();
										} catch (SQLException e) {
											e.printStackTrace();
										}
									}
								}
							}
						}
						// 子线程执行完毕，计数减1,等于0时子线程全部执行完成,执行主线程
						latch.countDown();
					} catch (Exception e) {
						e.printStackTrace();
					}
				};
			}.start();
		}
		System.out.println("等待子线程执行完毕...");
		try {
			// 当前线程挂起等待子线程全部执行完成,执行主线程
			latch.await();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//查询连接失败的经销商信息
		List<DealerVO> listError = salesMonthDAO.selectConnectionError();
		if(listError.size()>0){
			for (int i = 0; i < listError.size(); i++) {
				errorStr+=listError.get(i).getDlrCd();
			}
		}
		if (!"".equals(errorStr)) {
			return errorStr;
		} else {
			return "0";
		}*/
	}

	/**
     * 查询差异车辆列表数量
     * @param searchVO
     * @return
     */
	@Override
	public long selectDmsSalesCarCnt(AssignSearchVO searchVO) {
		 return salesMonthDAO.selectDmsSalesCarCnt(searchVO);
	}

	/**
     * 查询差异车辆列表数据
     * @param searchVO
     * @return
     */
	@Override
	public List<AssignVO> selectDmsSalesCar(AssignSearchVO searchVO) {
		 return salesMonthDAO.selectDmsSalesCar(searchVO);
	}
	
	/** 
     * sap/dcs/dms 数量对比
     * @return SUCCESS OR errorStr
     */
	public String updateNumberContrast(String month1) {
		return "停止使用该方法";
		/*String errorStr = "";
		final String month = month1;
		//清空数量对比表数据
		salesMonthDAO.deleteNumber();
		//查询sap和dcs数量 
		List<NumberContrastVO> listSap = salesMonthDAO.selectSapNumber(month);
		List<NumberContrastVO> listDcs = salesMonthDAO.selectDcsNumber(month);
		for(int i = 0 ; i<listSap.size() ; i++){
			NumberContrastVO numberContrastVO = listSap.get(i);
			salesMonthDAO.insertNumberContrast(numberContrastVO);
			
		}
		//修改dcs数量差异
		for(int i = 0 ; i<listDcs.size() ; i++){
			NumberContrastVO numberContrastVO = listDcs.get(i);
			salesMonthDAO.updateDcsAllot(numberContrastVO);
		}
		
		//查询所有经销商
		DealerSearchVO searchVO = new DealerSearchVO();
		List<DealerVO> list = salesMonthDAO.selectDealerListByCondition(searchVO);
    	//分割list,均分数据到list中
    	List<List<DealerVO>> spiltList =spiltList(list,50);
		//多线程计数器,用于挂起线程等子线程执行完毕在执行主线程
		final CountDownLatch latch=new CountDownLatch(spiltList.size());
		System.out.println("主线程开始执行....");
		//先清空经销商地址链接失败临时表
		salesMonthDAO.deleteTmpConnectionError();
		//循环创建多个线程
		for (int i = 0; i < spiltList.size(); i++) {
			final List<DealerVO> list2 = spiltList.get(i);
			new Thread() {
				public void run() {
					try {
						int temp = 0;
						// 循环经销商list
						for (int i = 0; i < list2.size(); i++) {
							DealerVO dealer = (DealerVO) list2.get(i);
							if (null != dealer.getDmsIpNm() && !dealer.getDmsIpNm().equals("")) {
								// 连接经销商数据库执行SQL
								Connection conn = null;
								try {
									conn = dbConnection(dealer.getDmsIpNm());
								} catch (Exception e) {
									if(temp == 5){
										temp = 0;
										// 经销商连接不成功放入表 dealer
										salesMonthDAO.saveConnectionErrorTmp(dealer);
									}else{
										temp++;
										i--;
										Thread.sleep(1000);
									}
									System.out.println("#" + e.getMessage());
									continue;
								}

								if (null != conn) {
									Statement stmt = null;
									try {
										stmt = conn.createStatement();
										ResultSet rs = null;
											StringBuffer sSql = new StringBuffer();
											sSql.append("SELECT DLR_CD,COUNT (CASE  PRTY  WHEN  'A' THEN 'A' END) DMS_NO_ALLOT");
											sSql.append(",COUNT (CASE  WHEN  PRTY IN('C','D','E','F','M','N','P') AND SUBSTR(ALDY,0,6) ='").append(month).append("' THEN 'P' END) DMS_ALLOT ");
											sSql.append(" FROM SA_0416T WHERE 1=1 ");
											sSql.append(" AND DLR_CD= '").append(dealer.getDlrCd()).append("' GROUP BY DLR_CD ORDER BY DLR_CD");
											System.out.println(sSql.toString());
											rs = stmt.executeQuery(sSql.toString());
											ResultSetMetaData meta = rs.getMetaData();

											while (rs.next()) {
												NumberContrastVO numberContrastVO = new NumberContrastVO();
												numberContrastVO.setDlrCd(rs.getString("DLR_CD"));
												numberContrastVO.setDmsNoAllot(rs.getInt("DMS_NO_ALLOT"));
												numberContrastVO.setDmsAllot(rs.getInt("DMS_ALLOT"));
												//更新Dms数量信息
												salesMonthDAO.updateDmsAllot(numberContrastVO);
											}
										
									} catch (Exception e) {
										e.printStackTrace();
										conn.rollback();
									} finally {
										try {
											conn.commit();
											stmt.close();
											conn.close();
										} catch (SQLException e) {
											e.printStackTrace();
										}
									}
								}
							}
						}
						// 子线程执行完毕，计数减1,等于0时子线程全部执行完成,执行主线程
						latch.countDown();
					} catch (Exception e) {
						e.printStackTrace();
					}
				};
			}.start();
		}
		System.out.println("等待子线程执行完毕...");
		try {
			// 当前线程挂起等待子线程全部执行完成,执行主线程
			latch.await();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//查询连接失败的经销商信息
		List<DealerVO> listError = salesMonthDAO.selectConnectionError();
		if(listError.size()>0){
			for (int i = 0; i < listError.size(); i++) {
				errorStr+=listError.get(i).getDlrCd();
			}
		}
		if (!"".equals(errorStr)) {
			return errorStr;
		} else {
			return "0";
		}*/
		
	}
	
	/**
	 * 查询数量对比列表数量
	 */
	@Override
	public int selectNumberContrastCnt(NumberContrastVO numberContrastVO) {
		return salesMonthDAO.selectNumberContrastCnt(numberContrastVO);
	}
	/**
	 * 查询数量对比列表数据
	 */
	@Override
	public List<NumberContrastVO> selectNumberContrast(NumberContrastVO numberContrastVO) {
		return salesMonthDAO.selectNumberContrast(numberContrastVO);
	}
	
	
	//平均分配集合
	 public static List<List<DealerVO>> spiltList(List<DealerVO> historyList, int j) {
         int listSize = historyList.size();
         int toIndex = j;
         List<List<DealerVO>> result = new ArrayList<List<DealerVO>>();     //用List存起来新的分组后数据
         for (int i = 0; i < historyList.size(); i += toIndex) {
             if (i + toIndex > listSize) {        //作用为toIndex最后没有j条数据则剩余几条newList中就装几条
                 toIndex = listSize - i;
             }
             List<DealerVO> newList = historyList.subList(i, i + toIndex);
             result.add(newList);
         }
         return result;
     }
	 
	 /*--------------------------------------------------------------------DCS 订单处理 Start------------------------------------------------------------------*/
	 /**
	 * DCS订单对比存储过程
	 */
	 @Override
	 public int callDcsSalesOrderCheck(String month) throws Exception{
	     salesMonthDAO.callDcsSalesOrderCheck(month);
	     return 1;
	 }
	 
	 /**
	 * 查询DCS数量对比列表数据数量
	 */
	 @Override
	 public int selectDcsOrderDiffCnt(TmpDcsOrderCheckVO tmpDcsOrderCheckVO) {
		 return salesMonthDAO.selectDcsOrderDiffCnt(tmpDcsOrderCheckVO);
	 }

	 /**
	 * 查询DCS数量对比列表数据
	 */
	 @Override
	 public List<TmpDcsOrderCheckVO> selectDcsOrderDiff(TmpDcsOrderCheckVO tmpDcsOrderCheckVO) {
		 return salesMonthDAO.selectDcsOrderDiff(tmpDcsOrderCheckVO);
	 }
	 
	 /**
	  * 批量修复DCS订单差异数据
	  */
	 @Override
     public int updateOrderInfoErpToDcs(String month) throws Exception{
    	 salesMonthDAO.updateOrderInfoErpToDcs(month);
    	 System.out.println("DCS订单修复存储过程执行完成!!!");
         return 1;

     }
	 
	 @Override
     public int updateDcsBySql(String sql) throws Exception{
    	
    	salesMonthDAO.updateDcsBySql(sql);
    	System.out.println("DCS端修改SQL执行完成!!!");
    	return 1;
    	
     }
    
     /**
      * 查询DCS月结修改失败信息数量
      */
     @Override
     public int selectDcsErpOrdDetailCnt(TmpDcsOrderCheckVO searchVO)  throws Exception {
        return salesMonthDAO.selectDcsErpOrdDetailCnt(searchVO);
     }

     /**
      * 查询DCS月结修改失败信息
      */
     @Override
     public List<TmpDcsErpOrderDetailVO> selectDcsErpOrdDetail(TmpDcsOrderCheckVO searchVO) throws Exception {
        return salesMonthDAO.selectDcsErpOrdDetail(searchVO);
     }
	 /*--------------------------------------------------------------------DCS 订单处理 End------------------------------------------------------------------*/
	 
	 /*--------------------------------------------------------------------DMS 订单处理 Start------------------------------------------------------------------*/
	 /**
	 * DMS订单对比存储过程搜集要查询的SAP经销商数据
	 */
	 @Override
	 public int callDmsSalesOrderCheck(String month) throws Exception{
	     salesMonthDAO.callDmsSalesOrderCheck(month);
	     return 1;
	 }
	 
	 /**
     * 批量核对DMS与ERP的订单差异数量
     */
    @Override
    public String searchOrderInfoErpToDms(OrderSearchVO orderSearchVO) throws Exception{
    	String errorStr = "";
    	TmpDmsOrderCheckVO searchVO = new TmpDmsOrderCheckVO();
    	searchVO.setCheckMonth(orderSearchVO.getCheckMonth());
    	
   	    List<TmpDmsOrderCheckVO> list = new ArrayList();
   	 	if(null==orderSearchVO.getDlrCd()||"".equals(orderSearchVO.getDlrCd())||"all".equalsIgnoreCase(orderSearchVO.getDlrCd())){
   	 		list = salesMonthDAO.selectDealerListByOrderCheck(searchVO);
   	 	}else {
   	 		String dlrCds = orderSearchVO.getDlrCd();
   	 		if(dlrCds.length()<5||!(Double.valueOf(dlrCds.length())%5==0)){
   	 			errorStr = "dealer not correct";
   	 		}else{
   	 			if(dlrCds.length()==5){
   	 				searchVO.setDlrCd(dlrCds);
   	 				List list1 = salesMonthDAO.selectDealerListByOrderCheck(searchVO);
   	 				list.addAll(list1);
   	 			}
   	 			else if(dlrCds.length()>5){
   	 				for(int i=0;i<300;i++){
   	 					if(i==0){
   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
	   	 					List list1 = salesMonthDAO.selectDealerListByOrderCheck(searchVO);
	   	   	 				list.addAll(list1);
   	 						dlrCds=dlrCds.substring(5);
   	 					}else if(dlrCds.length()>5){
   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
	   	 					List list1 = salesMonthDAO.selectDealerListByOrderCheck(searchVO);
	   	   	 				list.addAll(list1);
   	 						dlrCds=dlrCds.substring(5);
   	 					}else if(dlrCds.length()==5){
   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
	   	 					List list1 = salesMonthDAO.selectDealerListByOrderCheck(searchVO);
	   	   	 				list.addAll(list1);
						 	break;
   	 					}
   	 				}
   	 			}
   	 		}
   	 	}
    	for(int i=0;i<list.size();i++){
    		TmpDmsOrderCheckVO tmpDmsOrderCheckVO = (TmpDmsOrderCheckVO)list.get(i);
    		
    		StringBuffer sqlnotmatch = new StringBuffer();
    		sqlnotmatch.append("MERGE INTO TMP_DMS_ORDER_CHECK@").append(devOrPrd).append(" A \n");
    		sqlnotmatch.append("    USING( \n");
    		sqlnotmatch.append("      SELECT T1.DLR_CD, COUNT(1) COUNT \n");
    		sqlnotmatch.append("        FROM SA_0416T T1 \n");
    		sqlnotmatch.append("       WHERE 1=1 \n");
    		sqlnotmatch.append("         AND T1.PRTY = 'A' \n");
    		sqlnotmatch.append("    GROUP BY T1.DLR_CD \n");
    		sqlnotmatch.append("    ) B \n");
    		sqlnotmatch.append("    ON (A.DLR_CD = B.DLR_CD) \n");
    		sqlnotmatch.append("    WHEN MATCHED THEN \n");
    		sqlnotmatch.append("      UPDATE SET A.DMS_ORDER_NOTMATCH = B.COUNT \n");

    		StringBuffer sqlmatch = new StringBuffer();
    		sqlmatch.append("MERGE INTO TMP_DMS_ORDER_CHECK@").append(devOrPrd).append(" A \n");
    		sqlmatch.append("    USING( \n");
    		sqlmatch.append("      SELECT T1.DLR_CD, COUNT(1) COUNT \n");
    		sqlmatch.append("        FROM SA_0416T T1 \n");
    		sqlmatch.append("       WHERE 1=1 \n");
    		sqlmatch.append("         AND T1.PRTY IN('P','M','N','C','F','D','E') \n");
    		sqlmatch.append("         AND SUBSTR(T1.ALDY,0,6) = '").append(searchVO.getCheckMonth()).append("' \n");
    		sqlmatch.append("    GROUP BY T1.DLR_CD \n");
    		sqlmatch.append("    ) B \n");
    		sqlmatch.append("    ON (A.DLR_CD = B.DLR_CD) \n");
    		sqlmatch.append("    WHEN MATCHED THEN \n");
    		sqlmatch.append("      UPDATE SET A.DMS_ORDER_MATCH = B.COUNT \n");
    	
    		StringBuffer sql = new StringBuffer();
        	sql.append("MERGE INTO TMP_DMS_ORDER_CHECK@").append(devOrPrd).append(" A \n");
        	sql.append("    USING( \n");
        	sql.append("      SELECT C.DLR_CD,COUNT(1) DIFF_COUNT FROM( \n");
        	sql.append("      SELECT NVL(A.DLR_CD,B.DLR_CD) DLR_CD,NVL(A.SALES_NO,B.SALES_NO) \n");
        	sql.append("               FROM (SELECT T1.DLR_CD, T1.SALES_NO ,T1.CNDY,(CASE   WHEN  T1.PRTY IN('P','M','N','C','F','D','E')  THEN 'P' ELSE 'A' END) AS PRTY , T1.ALDY , T1.EMONT \n");
        	sql.append("                     FROM SA_0416T T1 \n");
        	sql.append("                     WHERE 1=1 \n");
        	sql.append("                      AND ((T1.PRTY  IN('P','M','N','C','F','D','E')  AND SUBSTR(T1.ALDY,0,6) = '").append(searchVO.getCheckMonth()).append("')  OR T1.PRTY = 'A') \n");
//        	sql.append("                      AND T1.DLR_CD = '").append(tmpDmsOrderCheckVO.getDlrCd()).append("' \n");
        	sql.append("                   ) A FULL JOIN ( \n");
        	sql.append("                      SELECT T1.DLR_CD, T1.SALES_NO ,T1.CNDY,T1.PRTY , T1.ALDY , T1.EMONT \n");
        	sql.append("                      FROM SA_0416IR_ERP@").append(devOrPrd).append(" T1 \n");
        	sql.append("                     WHERE 1=1 \n");
        	sql.append("                      AND T1.PRTY  IN('A','P','M','N','C','F','D','E') \n");
        	sql.append("                      AND T1.DLR_CD = '").append(tmpDmsOrderCheckVO.getDlrCd()).append("' \n");
        	sql.append("                   ) B    ON A.SALES_NO = B.SALES_NO \n");
        	sql.append("               WHERE 1=1 \n");
        	sql.append("                    AND ( NVL(A.PRTY,'1') <> NVL(B.PRTY,'2') OR \n");
        	sql.append("                          (NVL(A.ALDY,'1') <> NVL(B.ALDY,'2') AND NVL(A.PRTY,'1') <> 'A')) \n");
        	sql.append("      ) C,TMP_DMS_ORDER_CHECK@").append(devOrPrd).append(" D \n");
        	sql.append("      WHERE C.DLR_CD  = D.DLR_CD \n");
        	sql.append("        AND D.CHECK_MONTH = '").append(searchVO.getCheckMonth()).append("' \n");
        	sql.append("        AND C.DLR_CD = '").append(tmpDmsOrderCheckVO.getDlrCd()).append("' \n");
        	sql.append("      GROUP BY C.DLR_CD \n");
        	sql.append("    ) B \n");
        	sql.append("    ON (A.DLR_CD = B.DLR_CD AND A.CHECK_MONTH = '").append(searchVO.getCheckMonth()).append("') \n");
        	sql.append("    WHEN MATCHED THEN \n");
        	sql.append("      UPDATE SET A.TOTAL_DIFF = B.DIFF_COUNT \n");
        	sql.append("      ,A.CHECK_RESULT = 'Z' \n");
        	sql.append("      ,A.CHECK_MESSAGE = 'SUCCESS' \n");
    		System.out.println(sql.toString());
    		
    		StringBuffer sqlDetail = new StringBuffer();
    		sqlDetail.append("INSERT INTO TMP_DMS_ERP_ORD_DETAIL@").append(devOrPrd).append(" \n");
    		sqlDetail.append("  (DLR_CD, \n");
    		sqlDetail.append("   SALES_NO, \n");
    		sqlDetail.append("   PRTY, \n");
    		sqlDetail.append("   ORTY, \n");
    		sqlDetail.append("   ALDY, \n");
    		sqlDetail.append("   ORD_YYMM, \n");
    		sqlDetail.append("   ORD_WEEK, \n");
    		sqlDetail.append("   ASDY, \n");
    		sqlDetail.append("   ACDY, \n");
    		sqlDetail.append("   OCDY, \n");
    		sqlDetail.append("   VIN_NO1, \n");
    		sqlDetail.append("   VIN_NO2, \n");
    		sqlDetail.append("   REG_USR_ID, \n");
    		sqlDetail.append("   REG_DT, \n");
    		sqlDetail.append("   ERP_DLR_CD, \n");
    		sqlDetail.append("   ERP_SALES_NO, \n");
    		sqlDetail.append("   ERP_PRTY, \n");
    		sqlDetail.append("   ERP_ORTY, \n");
    		sqlDetail.append("   ERP_ALDY, \n");
    		sqlDetail.append("   ERP_ORD_YYMM, \n");
    		sqlDetail.append("   ERP_ORD_WEEK, \n");
    		sqlDetail.append("   ERP_ASDY, \n");
    		sqlDetail.append("   ERP_ACDY, \n");
    		sqlDetail.append("   ERP_OCDY, \n");
    		sqlDetail.append("   ERP_VIN_NO1, \n");
    		sqlDetail.append("   ERP_VIN_NO2, \n");
    		sqlDetail.append("   ERP_REG_USR_ID, \n");
    		sqlDetail.append("   ERP_REG_DT) \n");
    		sqlDetail.append("  SELECT A.DLR_CD, \n");
    		sqlDetail.append("         A.SALES_NO, \n");
    		sqlDetail.append("         A.PRTY, \n");
    		sqlDetail.append("         A.ORTY, \n");
    		sqlDetail.append("         A.ALDY, \n");
    		sqlDetail.append("         A.ORD_YYMM, \n");
    		sqlDetail.append("         A.ORD_WEEK, \n");
    		sqlDetail.append("         A.ASDY, \n");
    		sqlDetail.append("         A.ACDY, \n");
    		sqlDetail.append("         A.OCDY, \n");
    		sqlDetail.append("         A.VIN_NO1, \n");
    		sqlDetail.append("         A.VIN_NO2, \n");
    		sqlDetail.append("         'admin' REG_USR_ID, \n");
    		sqlDetail.append("         SYSDATE REG_DT, \n");
    		sqlDetail.append("         B.DLR_CD ERP_DLR_CD, \n");
    		sqlDetail.append("         B.SALES_NO ERP_SALES_NO, \n");
    		sqlDetail.append("         B.PRTY ERP_PRTY, \n");
    		sqlDetail.append("         B.ORTY ERP_ORTY, \n");
    		sqlDetail.append("         B.ALDY ERP_ALDY, \n");
    		sqlDetail.append("         B.ORD_YYMM ERP_ORD_YYMM, \n");
    		sqlDetail.append("         B.ORD_WEEK ERP_ORD_WEEK, \n");
    		sqlDetail.append("         CASE WHEN B.ASDY IS NULL OR NVL(B.ASDY, '00000000') = '00000000' THEN NULL ELSE TO_DATE(B.ASDY, 'YYYYMMDD') END ERP_ASDY, \n");
    		sqlDetail.append("         CASE WHEN B.ACDY IS NULL OR NVL(B.ACDY, '00000000') = '00000000' THEN NULL ELSE TO_DATE(B.ACDY, 'YYYYMMDD') END ERP_ACDY, \n");
    		sqlDetail.append("         CASE WHEN B.OCDY IS NULL OR NVL(B.OCDY, '00000000') = '00000000' THEN NULL ELSE TO_DATE(B.OCDY, 'YYYYMMDD') END ERP_OCDY, \n");
    		sqlDetail.append("         B.VIN_NO1 ERP_VIN_NO1, \n");
    		sqlDetail.append("         B.VIN_NO2 ERP_VIN_NO2, \n");
    		sqlDetail.append("         'admin' ERP_REG_USR_ID, \n");
    		sqlDetail.append("         SYSDATE ERP_REG_DT \n");
    		sqlDetail.append("    FROM (SELECT T1.DLR_CD, \n");
    		sqlDetail.append("                 T1.SALES_NO, \n");
    		sqlDetail.append("                 T1.CNDY, \n");
    		sqlDetail.append("                 (CASE \n");
    		sqlDetail.append("                   WHEN T1.PRTY IN ('P', 'M', 'N', 'C', 'F', 'D', 'E') THEN \n");
    		sqlDetail.append("                    'P' \n");
    		sqlDetail.append("                   WHEN T1.PRTY = 'B' THEN \n");
    		sqlDetail.append("                    'B' \n");
    		sqlDetail.append("                   ELSE \n");
    		sqlDetail.append("                    'A' \n");
    		sqlDetail.append("                 END) AS PRTY, \n");
    		sqlDetail.append("                 T1.ORTY, \n");
    		sqlDetail.append("                 T1.ALDY, \n");
    		sqlDetail.append("                 T1.ORD_YYMM, \n");
    		sqlDetail.append("                 T1.ORD_WEEK, \n");
    		sqlDetail.append("                 T1.ASDY, \n");
    		sqlDetail.append("                 T1.ACDY, \n");
    		sqlDetail.append("                 T1.OCDY, \n");
    		sqlDetail.append("                 T1.VIN_NO1, \n");
    		sqlDetail.append("                 T1.VIN_NO2 \n");
    		sqlDetail.append("            FROM SA_0416T T1 \n");
    		sqlDetail.append("           WHERE 1 = 1 \n");
    		sqlDetail.append("             AND ((T1.PRTY IN ('P', 'M', 'N', 'C', 'F', 'D', 'E') AND \n");
    		sqlDetail.append("                 SUBSTR(T1.ALDY, 0, 6) = '").append(searchVO.getCheckMonth()).append("') OR T1.PRTY = 'A')) A \n");
    		sqlDetail.append("    FULL JOIN (SELECT T1.DLR_CD, \n");
    		sqlDetail.append("                      T1.SALES_NO, \n");
    		sqlDetail.append("                      T1.CNDY, \n");
    		sqlDetail.append("                      T1.PRTY, \n");
    		sqlDetail.append("                      T1.ORTY, \n");
    		sqlDetail.append("                      T1.ALDY, \n");
    		sqlDetail.append("                      T1.ORD_YYMM, \n");
    		sqlDetail.append("                      T1.ORD_WEEK, \n");
    		sqlDetail.append("                      T1.ASDY, \n");
    		sqlDetail.append("                      T1.ACDY, \n");
    		sqlDetail.append("                      T1.OCDY, \n");
    		sqlDetail.append("                      T1.VIN_NO1, \n");
    		sqlDetail.append("                      T1.VIN_NO2 \n");
    		sqlDetail.append("                 FROM SA_0416IR_ERP@").append(devOrPrd).append(" T1 \n");
    		sqlDetail.append("                WHERE 1 = 1 \n");
    		sqlDetail.append("                  AND T1.DLR_CD = '").append(tmpDmsOrderCheckVO.getDlrCd()).append("' \n");
    		sqlDetail.append("                  AND T1.PRTY IN ('A', 'P', 'M', 'N', 'C', 'F', 'D', 'E')) B \n");
    		sqlDetail.append("      ON A.SALES_NO = B.SALES_NO \n");
    		sqlDetail.append("   WHERE 1 = 1 \n");
    		sqlDetail.append("     AND (NVL(A.PRTY, '1') <> NVL(B.PRTY, '2') OR \n");
    		sqlDetail.append("         (NVL(A.ALDY, '1') <> NVL(B.ALDY, '2') AND NVL(A.PRTY, '1') <> 'A')) \n");
    		System.out.println(sqlDetail.toString());
    		
    		StringBuffer updateCheckResultSql = new StringBuffer();
    		updateCheckResultSql.append("UPDATE TMP_DMS_ORDER_CHECK@").append(devOrPrd).append(" A SET A.CHECK_RESULT = 'Z',A.CHECK_MESSAGE = 'SUCCESS' WHERE A.DLR_CD = '").append(tmpDmsOrderCheckVO.getDlrCd()).append("'");
    		
    		//在经销商数据库执行SQL
    		Connection conn = null;
            try{
                conn = dbConnection(tmpDmsOrderCheckVO.getDmsIpNm());
            }catch(Exception e){
                System.out.println("#"+e.getMessage());
                System.out.println(tmpDmsOrderCheckVO.getDlrCd()+" 网络不通");
                continue;
                /*tmpDmsOrderCheckVO.setCheckMonth(checkMonth);
                tmpDmsOrderCheckVO.setDlrCd(tmpDmsOrderCheckVO.getDlrCd());
                tmpDmsOrderCheckVO.setCheckResult("E");
                tmpDmsOrderCheckVO.setCheckMessage("网络不通");
                salesMonthDAO.updateTmpOrderCheckResult(tmpDmsOrderCheckVO);*/
            }
            if(null!=conn){
            	int rsnotmatch = -1;
            	int rsmatch = -1;
            	int rs = -1;
	            int rsDetail = -1;
	            int rsLast = -1;
	            Statement stmtnotmatch = null;
	            Statement stmtmatch = null;
	            Statement stmt = null;
	            Statement stmtDetail = null;
	            Statement stmtLast = null;
	            try {
	                stmtnotmatch = conn.createStatement();
	                rsnotmatch = stmtnotmatch.executeUpdate(sqlnotmatch.toString());
	                
	                stmtmatch = conn.createStatement();
	                rsmatch = stmtmatch.executeUpdate(sqlmatch.toString());
	                
	                stmt = conn.createStatement();
	                rs = stmt.executeUpdate(sql.toString());
	                
	                stmtDetail = conn.createStatement();
	                rsDetail = stmtDetail.executeUpdate(sqlDetail.toString());
	                
	                stmtLast = conn.createStatement();
	                rsLast = stmtLast.executeUpdate(updateCheckResultSql.toString());
	
	                /*tmpDmsOrderCheckVO.setCheckMonth(checkMonth);
	                tmpDmsOrderCheckVO.setDlrCd(tmpDmsOrderCheckVO.getDlrCd());
	                tmpDmsOrderCheckVO.setCheckResult("Z");
	                tmpDmsOrderCheckVO.setCheckMessage("SUCCESS");
	                salesMonthDAO.updateTmpOrderCheckResult(tmpDmsOrderCheckVO);*/
	            } catch (SQLException e) {
	                e.printStackTrace();
	                continue;
	                /*tmpDmsOrderCheckVO.setCheckMonth(checkMonth);
	                tmpDmsOrderCheckVO.setDlrCd(tmpDmsOrderCheckVO.getDlrCd());
	                tmpDmsOrderCheckVO.setCheckResult("E");
	                tmpDmsOrderCheckVO.setCheckMessage("SQL执行报错");
	                System.out.println(tmpDmsOrderCheckVO.getDlrCd()+" SQL执行报错");
	                salesMonthDAO.updateTmpOrderCheckResult(tmpDmsOrderCheckVO);*/
	            } catch (Exception e) {
	                e.printStackTrace();
	                continue;
	            } finally {
	                try {
	                    // Statement 종료
	                    stmt.close();
	                    stmtDetail.close();
	                    // Connection 종료
	                    conn.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                    continue;
	                }
	            }
	            
	            System.out.println("# UPDATE RESULT END : "+ rsLast);
            }
    	}
    	
    	return errorStr;
    }
    /**
	 * 查询当前已经搜集了多少家订单差异
	 */
	 @Override
	 public String checkOrderProcessShow(OrderSearchVO searchVO) throws Exception{
		 int hasCheckCount = salesMonthDAO.checkOrderProcessShow(searchVO);
		 int allCheckCount = salesMonthDAO.checkOrderProcessShowAll(searchVO);
	     JSONObject jb = new JSONObject();
	     jb.put("hasCheck", hasCheckCount+"");
	     jb.put("allCheck", allCheckCount+"");
	     return jb.toJSONString();
	 }
	 
    
    /**
     * 批量修改DMS月结信息
     */
    @Override
    public String updateOrderInfoErpToDms(OrderSearchVO orderSearchVO) throws Exception{
    	String errorStr = "";
    	TmpDmsOrderCheckVO searchVO = new TmpDmsOrderCheckVO();
    	searchVO.setCheckMonth(orderSearchVO.getCheckMonth());
//    	List<TmpDmsOrderCheckVO> list = salesMonthDAO.selectDealerListByOrderDiff(searchVO);
    	
    	List<TmpDmsOrderCheckVO> list = new ArrayList();
   	 	if(null==orderSearchVO.getDlrCd()||"".equals(orderSearchVO.getDlrCd())||"all".equalsIgnoreCase(orderSearchVO.getDlrCd())){
   	 		list = salesMonthDAO.selectDealerListByOrderDiff(searchVO);
   	 	}else {
   	 		String dlrCds = orderSearchVO.getDlrCd();
   	 		if(dlrCds.length()<5||!(Double.valueOf(dlrCds.length())%5==0)){
   	 			errorStr = "dealer not correct";
   	 		}else{
   	 			if(dlrCds.length()==5){
   	 				searchVO.setDlrCd(dlrCds);
   	 				List list1 = salesMonthDAO.selectDealerListByOrderDiff(searchVO);
   	 				list.addAll(list1);
   	 			}
   	 			else if(dlrCds.length()>5){
   	 				for(int i=0;i<300;i++){
   	 					if(i==0){
   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
	   	 					List list1 = salesMonthDAO.selectDealerListByOrderDiff(searchVO);
	   	   	 				list.addAll(list1);
   	 						dlrCds=dlrCds.substring(5);
   	 					}else if(dlrCds.length()>5){
   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
	   	 					List list1 = salesMonthDAO.selectDealerListByOrderDiff(searchVO);
	   	   	 				list.addAll(list1);
   	 						dlrCds=dlrCds.substring(5);
   	 					}else if(dlrCds.length()==5){
   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
	   	 					List list1 = salesMonthDAO.selectDealerListByOrderDiff(searchVO);
	   	   	 				list.addAll(list1);
						 	break;
   	 					}
   	 				}
   	 			}
   	 		}
   	 	}
    	/*Map<String,String> map = gDlrCdMap();
    	DealerVO dealer = new DealerVO();
    	for (Map.Entry<String, String> m : map.entrySet()) {
    		dealer = new DealerVO();
    		dealer.setDmsIpNm(m.getValue());
		    dealer.setDlrCd(m.getKey());
		    list.add(dealer);
	    }*/
    	for(int i=0;i<list.size();i++){
    		TmpDmsOrderCheckVO tmpDmsOrderCheckVO = (TmpDmsOrderCheckVO)list.get(i);
    		
    		StringBuffer sql = new StringBuffer();
    		sql.append("UPDATE SA_0416T A SET (A.PRTY,A.ALDY) = (SELECT B.PRTY,B.ALDY FROM SA_0416IR_ERP@").append(devOrPrd).append(" B WHERE B.SALES_NO = A.SALES_NO) \n");
    		sql.append("WHERE A.SALES_NO IN \n");
    		sql.append("( \n");
    		sql.append("SELECT NVL(A.SALES_NO,B.SALES_NO) FROM ( \n");
    		sql.append("         SELECT DLR_CD, SALES_NO ,CNDY, UPDT_DT,PRTY , ALDY , EMONT \n");
    		sql.append("         FROM SA_0416T \n");
    		sql.append("         WHERE 1=1 \n");
    		sql.append("          AND   ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '").append(orderSearchVO.getCheckMonth()).append("')  OR PRTY = 'A'  ) \n");
    		sql.append("          AND DLR_CD = '").append(tmpDmsOrderCheckVO.getDlrCd()).append("' \n");
    		sql.append("     ) A FULL JOIN ( \n");
    		sql.append("         SELECT DLR_CD, SALES_NO ,CNDY,UPDT_DT,PRTY , ALDY , EMONT \n");
    		sql.append("         FROM SA_0416IR_ERP@").append(devOrPrd).append(" \n");
    		sql.append("         WHERE 1=1 \n");
    		sql.append("          AND   ((PRTY  IN('P','M','N','C','F','D','E') AND SUBSTR(ALDY,0,6) = '").append(orderSearchVO.getCheckMonth()).append("')  OR PRTY = 'A'  ) \n");
    		sql.append("          AND DLR_CD = '").append(tmpDmsOrderCheckVO.getDlrCd()).append("' \n");
    		sql.append("     ) B    ON A.SALES_NO = B.SALES_NO \n");
    		sql.append("     WHERE 1=1 \n");
    		sql.append("          AND ( NVL(A.PRTY,'1') <> NVL(B.PRTY,'2') OR (NVL(A.ALDY,'1') <> NVL(B.ALDY,'2') AND NVL(A.PRTY,'1') <> 'A' )) \n");
    		sql.append(") \n");
    		
    		//在经销商数据库执行SQL
    		Connection conn = null;
            try{
                conn = dbConnection(tmpDmsOrderCheckVO.getDmsIpNm());
            }catch(Exception e){
                System.out.println("#网络异常"+e.getMessage());
                System.out.println(tmpDmsOrderCheckVO.getDlrCd()+" 网络不通");
                tmpDmsOrderCheckVO.setUpdateResult("E");
                tmpDmsOrderCheckVO.setUpdateMessage("网络不通");
                salesMonthDAO.updateTmpOrderUpdateResult(tmpDmsOrderCheckVO);
                continue;
            }
            if(null!=conn){
	            int rs = -1;
	            Statement stmt = null;
	
	            try {
	                stmt = conn.createStatement();
	
	                rs = stmt.executeUpdate(sql.toString());
	
	                tmpDmsOrderCheckVO.setUpdateResult("Z");
	                tmpDmsOrderCheckVO.setUpdateMessage("SUCCESS");
	                salesMonthDAO.updateTmpOrderUpdateResult(tmpDmsOrderCheckVO);
	            } catch (SQLException e) {
	                e.printStackTrace();
	                System.out.println("SQL出现异常"+e.getMessage());
	                tmpDmsOrderCheckVO.setUpdateResult("E");
	                tmpDmsOrderCheckVO.setUpdateMessage("SQL执行报错"+e.getErrorCode()+e.getMessage());
	                salesMonthDAO.updateTmpOrderUpdateResult(tmpDmsOrderCheckVO);
	                continue;
	            } catch (Exception e) {
	                e.printStackTrace();
	                System.out.println("程序出现异常"+e.getMessage());
	            } finally {
	                try {
	                    // Statement 종료
	                    stmt.close();
	                    // Connection 종료
	                    conn.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                    continue;
	                }
	            }
	            
	            System.out.println("# UPDATE RESULT END : "+ rs);
            }
    	}
    	return errorStr;
    }
    
    /**
     * 批量修改DMS月结信息
     */
    @Override
    public String updateOrderInfoErpToDmsByThread(OrderSearchVO orderSearchVO) throws Exception {
    	String errorStr = "";
    	TmpDmsOrderCheckVO searchVO = new TmpDmsOrderCheckVO();
    	searchVO.setCheckMonth(orderSearchVO.getCheckMonth());
//    	List<TmpDmsOrderCheckVO> list = salesMonthDAO.selectDealerListByOrderDiff(searchVO);
    	
    	List<TmpDmsOrderCheckVO> list = new ArrayList();
   	 	if(null==orderSearchVO.getDlrCd()||"".equals(orderSearchVO.getDlrCd())||"all".equalsIgnoreCase(orderSearchVO.getDlrCd())){
   	 		list = salesMonthDAO.selectDealerListByOrderDiff(searchVO);
   	 	}else {
   	 		String dlrCds = orderSearchVO.getDlrCd();
   	 		if(dlrCds.length()<5||!(Double.valueOf(dlrCds.length())%5==0)){
   	 			errorStr = "dealer not correct";
   	 		}else{
   	 			if(dlrCds.length()==5){
   	 				searchVO.setDlrCd(dlrCds);
   	 				List list1 = salesMonthDAO.selectDealerListByOrderDiff(searchVO);
   	 				list.addAll(list1);
   	 			}
   	 			else if(dlrCds.length()>5){
   	 				for(int i=0;i<300;i++){
   	 					if(i==0){
   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
	   	 					List list1 = salesMonthDAO.selectDealerListByOrderDiff(searchVO);
	   	   	 				list.addAll(list1);
   	 						dlrCds=dlrCds.substring(5);
   	 					}else if(dlrCds.length()>5){
   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
	   	 					List list1 = salesMonthDAO.selectDealerListByOrderDiff(searchVO);
	   	   	 				list.addAll(list1);
   	 						dlrCds=dlrCds.substring(5);
   	 					}else if(dlrCds.length()==5){
   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
	   	 					List list1 = salesMonthDAO.selectDealerListByOrderDiff(searchVO);
	   	   	 				list.addAll(list1);
						 	break;
   	 					}
   	 				}
   	 			}
   	 		}
   	 	}
    	//创建一个有10个线程的线程池
   	 	ExecutorService pool = Executors.newFixedThreadPool(MAX_QPS);
   	 	//组装任务
   	 	System.out.println("开始组装任务");
   	 	List missionList = new ArrayList();
   	 	for(int i=0;i<list.size();i++){
   	 		TmpDmsOrderCheckVO tmpDmsOrderCheckVO = (TmpDmsOrderCheckVO)list.get(i);
   	 		System.out.println("组装任务"+tmpDmsOrderCheckVO.getDlrCd());
   	 		ThreadSalesMonthOrdUpdate oneCheckThread = new ThreadSalesMonthOrdUpdate(tmpDmsOrderCheckVO,i,salesMonthDAO);
   	 		missionList.add(oneCheckThread);
   	 	}
   	 	System.out.println("结束组装任务"+list.size());
   	 	//循环执行任务
   	 	for(int i=0;i<missionList.size();i++){
   	 	ThreadSalesMonthOrdUpdate oneCheckThread = (ThreadSalesMonthOrdUpdate)missionList.get(i);
   	 		pool.submit(oneCheckThread);
   	 	}
   	 	
   	 	pool.shutdown();
    	
    	return errorStr;
    }
    
    /**
	 * 查询当前已经修复了多少家
	 */
	 @Override
	 public String updateOrderProcessShow(OrderSearchVO searchVO) throws Exception{
		 int hasUpdateCount = salesMonthDAO.updateOrderProcessShow(searchVO);
		 int allUpdateCount = salesMonthDAO.updateOrderProcessShowAll(searchVO);
	     JSONObject jb = new JSONObject();
	     jb.put("hasUpdate", hasUpdateCount+"");
	     jb.put("allUpdate", allUpdateCount+"");
	     return jb.toJSONString();
	 }
    
    
	 
	 /**
	 * 查询DMS订单数量对比列表数据数量
	 */
	 @Override
	 public int selectDmsOrderDiffCnt(TmpDmsOrderCheckVO tmpDmsOrderCheckVO) {
		 return salesMonthDAO.selectDmsOrderDiffCnt(tmpDmsOrderCheckVO);
	 }
	 /**
	 * 查询DMS订单数量对比列表数据
	 */
	 @Override
	 public List<TmpDmsOrderCheckVO> selectDmsOrderDiff(TmpDmsOrderCheckVO tmpDmsOrderCheckVO) {
		 return salesMonthDAO.selectDmsOrderDiff(tmpDmsOrderCheckVO);
	 }

	 /**
	 * 查询DMS订单详情信息
	 */
	 @Override
	 public int selectDmsErpOrdDetailCnt(TmpDmsOrderCheckVO searchVO) throws Exception {
		 return salesMonthDAO.selectDmsErpOrdDetailCnt(searchVO);
	 }

	 /**
	 * 查询DMS月结修改失败信息
	 */
	 @Override
	 public List<TmpDmsErpOrderDetailVO> selectDmsErpOrdDetail(TmpDmsOrderCheckVO searchVO) throws Exception {
		 return salesMonthDAO.selectDmsErpOrdDetail(searchVO);
	 }
	 
	 /*--------------------------------------------------------------------DMS 订单处理 End------------------------------------------------------------------*/
	 
	 /*--------------------------------------------------------------------DCS 车辆处理 Start------------------------------------------------------------------*/
	 /**
	 * DCS车辆对比存储过程
	 */
	 @Override
	 public int callDcsSalesCarCheck(String month) throws Exception{
	     salesMonthDAO.callDcsSalesCarCheck(month);
	     return 1;
	 }
	 
	 /**
	 * 查询DCS数量对比列表数据数量
	 */
	 @Override
	 public int selectDcsCarDiffCnt(TmpDcsCarCheckVO tmpDcsCarCheckVO) {
		 return salesMonthDAO.selectDcsCarDiffCnt(tmpDcsCarCheckVO);
	 }

	 /**
	 * 查询DCS数量对比列表数据
	 */
	 @Override
	 public List<TmpDcsCarCheckVO> selectDcsCarDiff(TmpDcsCarCheckVO tmpDcsCarCheckVO) {
		 return salesMonthDAO.selectDcsCarDiff(tmpDcsCarCheckVO);
	 }
	 
	 /**
	 * 查询DCS数量对比列表数据数量
	 */
	 @Override
	 public int selectDcsErpCarDetailCnt(TmpDcsCarCheckVO tmpDcsCarCheckVO) {
		 return salesMonthDAO.selectDcsErpCarDetailCnt(tmpDcsCarCheckVO);
	 }

	 /**
	 * 查询DCS数量对比列表数据
	 */
	 @Override
	 public List<TmpDcsErpCarDetailVO> selectDcsErpCarDetail(TmpDcsCarCheckVO tmpDcsCarCheckVO) {
		 return salesMonthDAO.selectDcsErpCarDetail(tmpDcsCarCheckVO);
	 }
	 
	 /**
		* 调用DCS批量修复车辆存储过程
		*/
	 @Override
	 public int updateCarInfoErpToDcs(String month) throws Exception {
		 salesMonthDAO.updateCarInfoErpToDcs(month);
	 	 System.out.println("DCS车辆修复存储过程执行完成!!!");
		 return 1;
	 }
	 
	 /*--------------------------------------------------------------------DCS 车辆处理 End------------------------------------------------------------------*/
	 
	 /*--------------------------------------------------------------------DMS 车辆处理 Start------------------------------------------------------------------*/
	 
	 /**
	 * DMS车辆对比存储过程搜集要查询的SAP经销商数据
	 */
	 @Override
	 public int callDmsSalesCarCheck(String month) throws Exception{
	     salesMonthDAO.callDmsSalesCarCheck(month);
	     return 1;
	 }
	 
	 /**
     * 批量核对DMS与ERP的车辆差异数量
     */
    @Override
    public String searchCarInfoErpToDms(CarSearchVO carSearchVO) throws Exception{
    	String errorStr = "";
    	TmpDmsCarCheckVO searchVO = new TmpDmsCarCheckVO();
    	searchVO.setCheckMonth(carSearchVO.getCheckMonth());
    	
    	List<TmpDmsCarCheckVO> list = new ArrayList();
   	 	if(null==carSearchVO.getDlrCd()||"".equals(carSearchVO.getDlrCd())||"all".equalsIgnoreCase(carSearchVO.getDlrCd())){
   	 		list = salesMonthDAO.selectDealerListByCarCheck(searchVO);
   	 	}else {
   	 		String dlrCds = carSearchVO.getDlrCd();
   	 		if(dlrCds.length()<5||!(Double.valueOf(dlrCds.length())%5==0)){
   	 			errorStr = "dealer not correct";
   	 		}else{
   	 			if(dlrCds.length()==5){
   	 				searchVO.setDlrCd(dlrCds);
   	 				List list1 = salesMonthDAO.selectDealerListByCarCheck(searchVO);
   	 				list.addAll(list1);
   	 			}
   	 			else if(dlrCds.length()>5){
   	 				for(int i=0;i<300;i++){
   	 					if(i==0){
   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
	   	 					List list1 = salesMonthDAO.selectDealerListByCarCheck(searchVO);
	   	   	 				list.addAll(list1);
   	 						dlrCds=dlrCds.substring(5);
   	 					}else if(dlrCds.length()>5){
   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
	   	 					List list1 = salesMonthDAO.selectDealerListByCarCheck(searchVO);
	   	   	 				list.addAll(list1);
   	 						dlrCds=dlrCds.substring(5);
   	 					}else if(dlrCds.length()==5){
   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
	   	 					List list1 = salesMonthDAO.selectDealerListByCarCheck(searchVO);
	   	   	 				list.addAll(list1);
						 	break;
   	 					}
   	 				}
   	 			}
   	 		}
   	 	}
   	 	
   	 /*List<TmpDmsCarCheckVO> list = new ArrayList();
    	List<String> fileDlrCd = new ArrayList<String>();
   	 	if(null==carSearchVO.getDlrCd()||"".equals(carSearchVO.getDlrCd())||"all".equalsIgnoreCase(carSearchVO.getDlrCd())){
	 		list = salesMonthDAO.selectDealerListByCarCheck(searchVO);
	 	}else {
	 		String dlrCds = carSearchVO.getDlrCd();
	 		if(dlrCds.length()<5||!(Double.valueOf(dlrCds.length())%5==0)){
	 			errorStr = "dealer not correct";
	 		}else{
	 			if(dlrCds.length()==5){
	 				fileDlrCd.add(dlrCds);
	 				searchVO.setDlrCdList(fileDlrCd);
	 				list = salesMonthDAO.selectDealerListByCarCheck(searchVO);
	 			}
	 			else if(dlrCds.length()>5){
	 				for(int i=0;i<300;i++){
	 					if(i==0){
	 						fileDlrCd.add(dlrCds.substring(0,5));
	 						dlrCds=dlrCds.substring(5);
	 					}else if(dlrCds.length()>5){
	 						fileDlrCd.add(dlrCds.substring(0,5));
	 						dlrCds=dlrCds.substring(5);
	 					}else if(dlrCds.length()==5){
	 						fileDlrCd.add(dlrCds.substring(0,5));
						 	break;
	 					}
	 				}
	 				searchVO.setDlrCdList(fileDlrCd);
	 				list = salesMonthDAO.selectDealerListByCarCheck(searchVO);
	 			}
	 		}
	 	}*/
    	
    	/*Map<String,String> map = gDlrCdMap();
    	DealerVO dealer = new DealerVO();
    	for (Map.Entry<String, String> m : map.entrySet()) {
    		dealer = new DealerVO();
    		dealer.setDmsIpNm(m.getValue());
		    dealer.setDlrCd(m.getKey());
		    list.add(dealer);
	    }*/
    	for(int i=0;i<list.size();i++){
    		TmpDmsCarCheckVO tmpDmsCarCheckVO = (TmpDmsCarCheckVO)list.get(i);
    		
    		StringBuffer sql = new StringBuffer();
    		sql.append("MERGE INTO TMP_DMS_CAR_CHECK@").append(devOrPrd).append(" A \n");
    		sql.append("USING ( \n");
    		sql.append("SELECT Q.DEALER,SUM(TRANSIT) TRANSIT,  SUM(STOCK)-SUM(STR) STOCK,  SUM(STR) STR,  SUM(RETAIL) RETAIL \n");
    		sql.append("FROM ( \n");
    		sql.append("      SELECT ORD_DLR_CD AS DEALER \n");
    		sql.append("          ,1 AS TRANSIT \n");
    		sql.append("          ,0 AS STOCK \n");
    		sql.append("          ,0 AS STR \n");
    		sql.append("          ,0 AS RETAIL \n");
    		sql.append("        from SA_0121t \n");
    		sql.append("        WHERE 1=1 \n");
    		sql.append("        AND NCAR_DSTIN_CD = 'N' \n");
    		sql.append("        AND ORD_DLR_CD = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
    		sql.append("        AND CAR_STAT_CD = '50' \n");
    		sql.append("UNION ALL \n");
    		sql.append("      SELECT ORD_DLR_CD AS DEALER \n");
    		sql.append("          ,0 AS TRANSIT \n");
    		sql.append("          ,1 AS STOCK \n");
    		sql.append("          ,0 AS STR \n");
    		sql.append("          ,0 AS RETAIL \n");
    		sql.append("        from SA_0121T \n");
    		sql.append("        WHERE 1=1 \n");
    		sql.append("        AND NCAR_DSTIN_CD = 'N' \n");
    		sql.append("        AND ORD_DLR_CD = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
    		sql.append("        AND CAR_STAT_CD = '60' \n");
    		sql.append("UNION ALL \n");
    		sql.append("      SELECT A1.DLR_CD AS DEALER \n");
    		sql.append("          ,0 AS TRANSIT \n");
    		sql.append("          ,0 AS STOCK \n");
    		sql.append("          ,1 AS STR \n");
    		sql.append("          ,0 AS RETAIL \n");
    		sql.append("                   FROM SA_0121T T1,SA_0256T A1 \n");
    		sql.append("                              INNER JOIN ( \n");
    		sql.append("                                     SELECT DLR_CD \n");
    		sql.append("                                          , CAR_ID \n");
    		sql.append("                                          , MAX(STR_NO) AS STR_NO \n");
    		sql.append("                                       FROM SA_0256T \n");
    		sql.append("                                      GROUP BY DLR_CD, CAR_ID \n");
    		sql.append("                                ) B1  ON A1.DLR_CD = B1.DLR_CD   AND A1.CAR_ID = B1.CAR_ID  AND A1.STR_NO = B1.STR_NO \n");
    		sql.append("                WHERE 1=1 \n");
    		sql.append("                  AND T1.CAR_ID = A1.CAR_ID \n");
    		sql.append("                  AND T1.CAR_STAT_CD = '60' \n");
    		sql.append("                  AND TRIM(A1.STR_STAT) =  'B' \n");
    		sql.append("UNION ALL \n");
    		sql.append("        SELECT   KMDELR AS DEALER \n");
    		sql.append("          ,0 AS TRANSIT \n");
    		sql.append("                 ,0 AS STOCK \n");
    		sql.append("                 ,0 AS STR \n");
    		sql.append("          ,1 AS RETAIL \n");
    		sql.append("         FROM \n");
    		sql.append("              ( \n");
    		sql.append("                  SELECT KMTRDY,KMTRTM,KMVIN ,KMOPT ,KMDELR ,RN \n");
    		sql.append("                  FROM (   SELECT \n");
    		sql.append("                              KMTRDY,KMTRTM,KMVIN ,KMOPT ,KMDELR , \n");
    		sql.append("                              ROW_NUMBER() OVER (PARTITION BY KMVIN ORDER BY TO_DATE(KMTRDY||KMTRTM, 'YYYYMMDD HH24MISS') DESC) AS RN \n");
    		sql.append("                              from SA_0301T \n");
    		sql.append("                              WHERE 1=1 \n");
    		sql.append("                         ) \n");
    		sql.append("                  WHERE 1=1 \n");
    		sql.append("                  AND RN = 1 \n");
    		sql.append("                  AND KMOPT IN ( 'J1' ,  'J3',  'J5') \n");
    		sql.append("                  AND SUBSTR(KMTRDY,0,6) = '").append(carSearchVO.getCheckMonth()).append("' \n");
    		sql.append("                  and KMDELR = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
    		sql.append("              ) A, \n");
    		sql.append("               ( \n");
    		sql.append("                 SELECT ORD_DLR_CD  , VIN_NO  , CAR_STAT_CD   , CUST_SALE_DT \n");
    		sql.append("                 FROM SA_0121T \n");
    		sql.append("                 WHERE 1=1 \n");
    		sql.append("                 AND NCAR_DSTIN_CD = 'N' \n");
    		sql.append("                ) D \n");
    		sql.append("               WHERE 1=1 \n");
    		sql.append("               AND A.KMVIN = D.VIN_NO(+) \n");
    		sql.append("             AND A.KMDELR = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
    		sql.append(" \n");
    		sql.append("    )AS Q \n");
    		sql.append("    GROUP BY DEALER \n");
    		sql.append(") B \n");
    		sql.append("ON(A.DLR_CD = B.DEALER) \n");
    		sql.append("WHEN MATCHED THEN \n");
    		sql.append("  UPDATE SET A.DMS_TRANS = B.TRANSIT, \n");
    		sql.append("             A.DMS_STOCK = B.STOCK, \n");
    		sql.append("             A.DMS_STRATEGY = B.STR, \n");
    		sql.append("             A.DMS_RETAIL = B.RETAIL, \n");
    		sql.append("             A.TOTAL_DIFF = ABS(NVL(A.ERP_TRANS,0)-NVL(B.TRANSIT,0))+ABS(NVL(A.ERP_STOCK,0)-NVL(B.STOCK,0))+ABS(NVL(A.ERP_STRATEGY,0)-NVL(B.STR,0))+ABS(NVL(A.ERP_RETAIL,0)-NVL(B.RETAIL,0)), \n");
    		sql.append("        	 A.CHECK_RESULT = 'Z', \n");
        	sql.append("             A.CHECK_MESSAGE = 'SUCCESS' \n");
    		System.out.println(sql.toString());
    		
    		StringBuffer sqlDetail = new StringBuffer();
    		/*sqlDetail.append("INSERT INTO TMP_DMS_ERP_CAR_DETAIL@").append(devOrPrd).append(" \n");
    		sqlDetail.append("                (DLR_CD, \n");
    		sqlDetail.append("                DMS_IP_NM, \n");
    		sqlDetail.append("                VIN_NO, \n");
    		sqlDetail.append("                VIN_NO1, \n");
    		sqlDetail.append("                VIN_NO2, \n");
    		sqlDetail.append("                CAR_STAT_CD, \n");
    		sqlDetail.append("                PLT_GI_DT, \n");
    		sqlDetail.append("                GR_DT, \n");
    		sqlDetail.append("                GRTE_START_DT, \n");
    		sqlDetail.append("                CUST_SALE_DT, \n");
    		sqlDetail.append("                STR_NO, \n");
    		sqlDetail.append("                STR_YN, \n");
    		sqlDetail.append("                ORD_NO, \n");
    		sqlDetail.append("                ERP_DLR_CD, \n");
    		sqlDetail.append("                ERP_VIN_NO, \n");
    		sqlDetail.append("                ERP_VIN_NO1, \n");
    		sqlDetail.append("                ERP_VIN_NO2, \n");
    		sqlDetail.append("                ERP_CAR_STAT_CD, \n");
    		sqlDetail.append("                ERP_PLT_GI_DT, \n");
    		sqlDetail.append("                ERP_GR_DT, \n");
    		sqlDetail.append("                ERP_GRTE_START_DT, \n");
    		sqlDetail.append("                ERP_CUST_SALE_DT, \n");
    		sqlDetail.append("                ERP_STR_NO, \n");
    		sqlDetail.append("                ERP_STR_YN, \n");
    		sqlDetail.append("                ERP_ORD_NO, \n");
    		sqlDetail.append("                CHECK_RESULT, \n");
    		sqlDetail.append("                CHECK_REASON \n");
    		sqlDetail.append("                ) \n");
    		sqlDetail.append("			SELECT NVL(B.ORD_DLR_CD,A.ORD_DLR_CD) DLR_CD, \n");
    		sqlDetail.append("                 '").append(tmpDmsCarCheckVO.getDmsIpNm()).append("' DMS_IP_NM, \n");
    		sqlDetail.append("                 NVL(A.VIN_NO1||A.VIN_NO2,B.VIN_NO) VIN_NO, \n");
    		sqlDetail.append("                 NVL(A.VIN_NO1,B.VIN_NO1) VIN_NO1, \n");
    		sqlDetail.append("                 NVL(A.VIN_NO2,B.VIN_NO2) VIN_NO2, \n");
    		sqlDetail.append("                 B.CAR_STAT_CD, \n");
    		sqlDetail.append("                 B.PLT_GI_DT, \n");
    		sqlDetail.append("                 B.GR_DT, \n");
    		sqlDetail.append("                 B.GRTE_START_DT, \n");
    		sqlDetail.append("                 B.CUST_SALE_DT, \n");
    		sqlDetail.append("                 B.STR_NO, \n");
    		sqlDetail.append("                 B.STR_YN, \n");
    		sqlDetail.append("                 B.ORD_NO, \n");
    		sqlDetail.append("                 A.ORD_DLR_CD ERP_DLR_CD, \n");
    		sqlDetail.append("                 A.VIN_NO1 || A.VIN_NO2 ERP_VIN_NO, \n");
    		sqlDetail.append("                 A.VIN_NO1 ERP_VIN_NO1, \n");
    		sqlDetail.append("                 A.VIN_NO2 ERP_VIN_NO2, \n");
    		sqlDetail.append("                 A.CAR_STAT_CD ERP_CAR_STAT_CD, \n");
    		sqlDetail.append("                 CASE WHEN A.PLT_GI_DT IS NULL OR NVL(A.PLT_GI_DT, '00000000') = '00000000' THEN NULL ELSE TO_DATE(A.PLT_GI_DT, 'YYYYMMDD') END ERP_PLT_GI_DT, \n");
    		sqlDetail.append("                 CASE WHEN A.GR_DT IS NULL OR NVL(A.GR_DT, '00000000') = '00000000' THEN NULL ELSE TO_DATE(A.GR_DT, 'YYYYMMDD') END ERP_GR_DT, \n");
    		sqlDetail.append("                 CASE WHEN A.GRTE_START_DT IS NULL OR NVL(A.GRTE_START_DT, '00000000') = '00000000' THEN NULL ELSE TO_DATE(A.GRTE_START_DT, 'YYYYMMDD') END ERP_GRTE_START_DT, \n");
    		sqlDetail.append("                 CASE WHEN A.CUST_SALE_DT IS NULL OR NVL(A.CUST_SALE_DT, '00000000') = '00000000' THEN NULL ELSE TO_DATE(A.CUST_SALE_DT, 'YYYYMMDD') END ERP_CUST_SALE_DT, \n");
    		sqlDetail.append("                 A.STR_NO ERP_STR_NO, \n");
    		sqlDetail.append("                 A.STR_YN ERP_STR_YN, \n");
    		sqlDetail.append("                 A.ORD_NO ERP_ORD_NO, \n");
    		sqlDetail.append("                 'N' CHECK_RESULT, \n");
    		sqlDetail.append("                 CASE \n");
    		sqlDetail.append("                   WHEN B.ORD_DLR_CD IS NULL THEN 'SAP存在DMS不存在' \n");
    		sqlDetail.append("                   WHEN B.ORD_DLR_CD IS NOT NULL AND NVL(A.ORD_DLR_CD, '1') <> NVL(B.ORD_DLR_CD, '2') THEN '店代码不一致' \n");
    		sqlDetail.append("                   WHEN A.CAR_STAT_CD = 'Q170' AND NVL(B.CAR_STAT_CD, '1') = '13' THEN 'SAP在途DMS分配' \n");
    		sqlDetail.append("                   WHEN A.CAR_STAT_CD = 'Q170' AND NVL(B.CAR_STAT_CD, '1') = '60' THEN 'SAP在途DMS库存' \n");
    		sqlDetail.append("                   WHEN A.CAR_STAT_CD = 'Q190' AND NVL(A.STR_YN,'N') = 'N' AND B.CAR_STAT_CD = '60' AND C.VIN_NO IS NULL THEN 'SAP零售DMS库存' \n");
    		sqlDetail.append("                   WHEN A.CAR_STAT_CD = 'Q190' AND NVL(A.STR_YN,'N') = 'N' AND B.CAR_STAT_CD = '50' THEN 'SAP零售DMS在途' \n");
    		sqlDetail.append("                   WHEN A.CAR_STAT_CD = 'Q190' AND NVL(A.STR_YN,'N') = 'X' AND B.CAR_STAT_CD = '50' THEN 'SAP战略出库DMS在途' \n");
    		sqlDetail.append("                   WHEN A.CAR_STAT_CD = 'Q190' AND NVL(A.STR_YN,'N') = 'X' AND B.CAR_STAT_CD = '70' THEN 'SAP战略出库DMS零售' \n");
    		sqlDetail.append("                   WHEN A.CAR_STAT_CD = 'Q190' AND NVL(A.STR_YN,'N') = 'X' AND B.CAR_STAT_CD = '60' AND C.VIN_NO IS NULL THEN 'SAP战略出库DMS缺少战略出库表记录' \n");
    		sqlDetail.append("                   WHEN A.CAR_STAT_CD = 'Q180' AND NVL(B.CAR_STAT_CD, '1') = '50' THEN 'SAP库存DMS在途' \n");
    		sqlDetail.append("                   WHEN A.CAR_STAT_CD = 'Q180' AND NVL(B.CAR_STAT_CD, '1') = '70' THEN 'SAP库存DMS零售' \n");
    		sqlDetail.append("                   WHEN A.CAR_STAT_CD = 'Q180' AND NVL(B.CAR_STAT_CD, '1') = '60' AND C.VIN_NO IS NOT NULL THEN 'SAP库存DMS战略出库' \n");
    		sqlDetail.append("                   WHEN A.CAR_STAT_CD = 'Q190' AND NVL(A.STR_YN,'N') = 'N' AND B.CAR_STAT_CD = '70' AND D.VIN_NO IS NULL THEN 'SAP零售DMS缺少SA_0301T零售记录' \n");
    		sqlDetail.append("                   WHEN A.CAR_STAT_CD = 'Q190' AND NVL(B.CAR_STAT_CD, '1') = '70' AND NVL(A.CUST_SALE_DT, '00000000') <> TO_CHAR(B.CUST_SALE_DT, 'YYYYMMDD') THEN '零售日期不一致' \n");
    		sqlDetail.append("                   WHEN A.CAR_STAT_CD = 'Q190' AND NVL(B.CAR_STAT_CD, '1') = '70' AND NVL(A.CUST_SALE_DT, '00000000') <> C.KMTRDY THEN '销售记录表零售日期不一致' \n");
    		sqlDetail.append("                 END CHECK_REASON \n");
    		sqlDetail.append("            FROM SA_0121IR_MONTH@").append(devOrPrd).append(" A \n");
    		sqlDetail.append("            LEFT JOIN SA_0121T B \n");
    		sqlDetail.append("              ON A.VIN_NO1 || A.VIN_NO2 = B.VIN_NO \n");
    		sqlDetail.append("            LEFT JOIN ( \n");
    		sqlDetail.append("            SELECT KMTRDY,KMTRTM,KMVIN VIN_NO,KMOPT ,KMDELR ,RN \n");
    		sqlDetail.append("                  FROM ( \n");
    		sqlDetail.append("                      SELECT \n");
    		sqlDetail.append("                              KMTRDY,KMTRTM,KMVIN ,KMOPT ,KMDELR , \n");
    		sqlDetail.append("                              ROW_NUMBER() OVER (PARTITION BY KMVIN ORDER BY TO_DATE(KMTRDY||KMTRTM, 'YYYYMMDD HH24MISS') DESC) AS RN \n");
    		sqlDetail.append("                            FROM SA_0301T \n");
    		sqlDetail.append("                            WHERE 1=1 \n");
    		sqlDetail.append("                        ) \n");
    		sqlDetail.append("                  WHERE 1=1 \n");
    		sqlDetail.append("                  AND RN = 1 \n");
    		sqlDetail.append("                  AND KMOPT = 'J3' \n");
    		sqlDetail.append("                  AND SUBSTR(KMTRDY,0,6) = '").append(carSearchVO.getCheckMonth()).append("' \n");
    		sqlDetail.append("                  and KMDELR = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
    		sqlDetail.append("                  ) C \n");
    		sqlDetail.append("              ON A.VIN_NO1 || A.VIN_NO2 = C.VIN_NO \n");
    		sqlDetail.append("            LEFT JOIN ( \n");
    		sqlDetail.append("              SELECT KMTRDY,KMTRTM,KMVIN VIN_NO,KMOPT ,KMDELR ,RN \n");
    		sqlDetail.append("                  FROM ( \n");
    		sqlDetail.append("                      SELECT \n");
    		sqlDetail.append("                              KMTRDY,KMTRTM,KMVIN ,KMOPT ,KMDELR , \n");
    		sqlDetail.append("                              ROW_NUMBER() OVER (PARTITION BY KMVIN ORDER BY TO_DATE(KMTRDY||KMTRTM, 'YYYYMMDD HH24MISS') DESC) AS RN \n");
    		sqlDetail.append("                            FROM SA_0301T \n");
    		sqlDetail.append("                            WHERE 1=1 \n");
    		sqlDetail.append("                        ) \n");
    		sqlDetail.append("                  WHERE 1=1 \n");
    		sqlDetail.append("                  AND RN = 1 \n");
    		sqlDetail.append("                  AND KMOPT IN ( 'J1' ,  'J5') \n");
    		sqlDetail.append("                  AND SUBSTR(KMTRDY,0,6) = '").append(carSearchVO.getCheckMonth()).append("' \n");
    		sqlDetail.append("                  and KMDELR = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
    		sqlDetail.append("            ) D ON (A.VIN_NO1||A.VIN_NO2 = D.VIN_NO) \n");
    		sqlDetail.append("           WHERE A.ORD_DLR_CD = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
    		sqlDetail.append("                AND (B.ORD_DLR_CD IS NULL OR \n");
    		sqlDetail.append("                 (B.ORD_DLR_CD IS NOT NULL AND NVL(A.ORD_DLR_CD, '1') <> NVL(B.ORD_DLR_CD, '2')) OR \n");
    		sqlDetail.append("                 (A.CAR_STAT_CD = 'Q170' AND NVL(B.CAR_STAT_CD, '1') = '13') OR \n");
    		sqlDetail.append("                 (A.CAR_STAT_CD = 'Q170' AND NVL(B.CAR_STAT_CD, '1') = '60') OR \n");
    		sqlDetail.append("                 (A.CAR_STAT_CD = 'Q190' AND NVL(A.STR_YN,'N') = 'N' AND B.CAR_STAT_CD = '60' AND C.VIN_NO IS NULL) OR \n");
    		sqlDetail.append("                 (A.CAR_STAT_CD = 'Q190' AND NVL(A.STR_YN,'N') = 'N' AND B.CAR_STAT_CD = '50') OR \n");
    		sqlDetail.append("                 (A.CAR_STAT_CD = 'Q190' AND NVL(A.STR_YN,'N') = 'X' AND (B.CAR_STAT_CD = '50')) OR \n");
    		sqlDetail.append("                 (A.CAR_STAT_CD = 'Q190' AND NVL(A.STR_YN,'N') = 'X' AND (B.CAR_STAT_CD = '70')) OR \n");
    		sqlDetail.append("                 (A.CAR_STAT_CD = 'Q190' AND NVL(A.STR_YN,'N') = 'X' AND (B.CAR_STAT_CD = '60' AND C.VIN_NO IS NULL)) OR \n");
    		sqlDetail.append("                 (A.CAR_STAT_CD = 'Q190' AND NVL(B.CAR_STAT_CD, '1') = '70' AND NVL(A.CUST_SALE_DT, '1') <> TO_CHAR(B.CUST_SALE_DT, 'YYYYMMDD')) OR \n");
    		sqlDetail.append("                 (A.CAR_STAT_CD = 'Q180' AND NVL(B.CAR_STAT_CD, '1') = '50') OR \n");
    		sqlDetail.append("                 (A.CAR_STAT_CD = 'Q180' AND NVL(B.CAR_STAT_CD, '1') = '70') OR \n");
    		sqlDetail.append("                 (A.CAR_STAT_CD = 'Q190' AND NVL(A.STR_YN,'N') = 'N' AND B.CAR_STAT_CD = '70' AND D.VIN_NO IS NULL) OR \n");
    		sqlDetail.append("                 (A.CAR_STAT_CD = 'Q180' AND NVL(B.CAR_STAT_CD, '1') = '60' AND C.VIN_NO IS NOT NULL) OR \n");
    		sqlDetail.append("                 (A.CAR_STAT_CD = 'Q190' AND NVL(B.CAR_STAT_CD, '1') = '70' AND NVL(A.CUST_SALE_DT, '00000000') <> C.KMTRDY) \n");
    		sqlDetail.append("                 ) \n");*/
    		sqlDetail.append("INSERT INTO TMP_DMS_ERP_CAR_DETAIL@").append(devOrPrd).append(" \n");
    		sqlDetail.append("    		                (DLR_CD, \n");
    		sqlDetail.append("    		                DMS_IP_NM, \n");
    		sqlDetail.append("    		                VIN_NO, \n");
    		sqlDetail.append("    		                VIN_NO1, \n");
    		sqlDetail.append("    		                VIN_NO2, \n");
    		sqlDetail.append("    		                CAR_STAT_CD, \n");
    		sqlDetail.append("    		                PLT_GI_DT, \n");
    		sqlDetail.append("    		                GR_DT, \n");
    		sqlDetail.append("    		                GRTE_START_DT, \n");
    		sqlDetail.append("    		                CUST_SALE_DT, \n");
    		sqlDetail.append("    		                STR_NO, \n");
    		sqlDetail.append("    		                STR_YN, \n");
    		sqlDetail.append("    		                ORD_NO, \n");
    		sqlDetail.append("    		                ERP_DLR_CD, \n");
    		sqlDetail.append("    		                ERP_VIN_NO, \n");
    		sqlDetail.append("    		                ERP_VIN_NO1, \n");
    		sqlDetail.append("    		                ERP_VIN_NO2, \n");
    		sqlDetail.append("    		                ERP_CAR_STAT_CD, \n");
    		sqlDetail.append("    		                ERP_PLT_GI_DT, \n");
    		sqlDetail.append("    		                ERP_GR_DT, \n");
    		sqlDetail.append("    		                ERP_GRTE_START_DT, \n");
    		sqlDetail.append("    		                ERP_CUST_SALE_DT, \n");
    		sqlDetail.append("    		                ERP_STR_NO, \n");
    		sqlDetail.append("    		                ERP_STR_YN, \n");
    		sqlDetail.append("    		                ERP_ORD_NO, \n");
    		sqlDetail.append("    		                CHECK_RESULT, \n");
    		sqlDetail.append("    		                CHECK_REASON \n");
    		sqlDetail.append("    		                ) \n");
    		sqlDetail.append("SELECT DISTINCT '").append(tmpDmsCarCheckVO.getDlrCd()).append("' DLR_CD, \n");
    		sqlDetail.append("        '").append(tmpDmsCarCheckVO.getDmsIpNm()).append("' DMS_IP_NM, \n");
    		sqlDetail.append("        J.KMVIN VIN_NO, \n");
    		sqlDetail.append("        J.VIN_NO1, \n");
    		sqlDetail.append("        J.VIN_NO2, \n");
    		sqlDetail.append("        J.CAR_STAT_CD, \n");
    		sqlDetail.append("        J.PLT_GI_DT, \n");
    		sqlDetail.append("        J.GR_DT, \n");
    		sqlDetail.append("        J.GRTE_START_DT, \n");
    		sqlDetail.append("        TO_DATE(J.CUST_SALE_DT,'YYYYMMDD') CUST_SALE_DT, \n");
    		sqlDetail.append("        J.STR_NO, \n");
    		sqlDetail.append("        J.STR_YN, \n");
    		sqlDetail.append("        J.ORD_NO, \n");
    		sqlDetail.append("        K.ORD_DLR_CD ERP_DLR_CD, \n");
    		sqlDetail.append("        K.VIN_NO ERP_VIN_NO, \n");
    		sqlDetail.append("        K.VIN_NO1 ERP_VIN_NO1, \n");
    		sqlDetail.append("        K.VIN_NO2 ERP_VIN_NO2, \n");
    		sqlDetail.append("        K.CAR_STAT_CD ERP_CAR_STAT_CD, \n");
    		sqlDetail.append("        K.PLT_GI_DT ERP_PLT_GI_DT, \n");
    		sqlDetail.append("        K.GR_DT ERP_GR_DT, \n");
    		sqlDetail.append("        K.GRTE_START_DT ERP_GRTE_START_DT, \n");
    		sqlDetail.append("        K.CUST_SALE_DT ERP_CUST_SALE_DT, \n");
    		sqlDetail.append("        K.STR_NO ERP_STR_NO, \n");
    		sqlDetail.append("        K.STR_YN ERP_STR_YN, \n");
    		sqlDetail.append("        K.ORD_NO ERP_ORD_NO, \n");
    		sqlDetail.append("        'N', \n");
    		sqlDetail.append("      CASE \n");
    		sqlDetail.append("	   WHEN J.ORD_DLR_CD IS NULL THEN 'SAP存在DMS不存在' \n");
    		sqlDetail.append("	   WHEN K.ORD_DLR_CD IS NULL THEN 'DMS存在SAP不存在' \n");
    		sqlDetail.append("	   WHEN J.ORD_DLR_CD IS NOT NULL AND K.ORD_DLR_CD IS NOT NULL AND NVL(K.ORD_DLR_CD, '1') <> NVL(J.ORD_DLR_CD, '1') THEN '店代码不一致' \n");
    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q170' AND J.CAR_STAT_CD = '13') THEN 'SAP在途DMS分配' \n");
    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q170' AND J.CAR_STAT_CD = '60') THEN 'SAP在途DMS库存' \n");
    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q170' AND J.CAR_STAT_CD = '70') THEN 'SAP在途DMS零售' \n");
    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q180' AND J.CAR_STAT_CD = '13') THEN 'SAP库存DMS分配' \n");
    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q180' AND J.CAR_STAT_CD = '50') THEN 'SAP库存DMS在途' \n");
    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q180' AND J.CAR_STAT_CD = '70') THEN 'SAP库存DMS零售' \n");
    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(K.STR_YN,'1') <> 'X' AND NVL(J.KMOPT ,'1') NOT IN ('J1','J5')) THEN 'SAP零售DMS非零售' \n");
    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(K.STR_YN,'1') = 'X' AND NVL(J.KMOPT ,'1') NOT IN ('J3')) THEN 'SAP战略出库DMS非战略出库' \n");
    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(J.KMOPT ,'1') IN ('J1','J3','J5') AND K.CUST_SALE_DT <> J.CUST_SALE_DT) THEN '零售日期不一致' \n");
    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(J.KMOPT ,'1') IN ('J1','J3','J5') AND K.CUST_SALE_DT <> J.KMTRDY) THEN '销售记录表零售日期不一致' \n");
    		sqlDetail.append("	 END CHECK_REASON \n");
    		sqlDetail.append("  FROM \n");
    		sqlDetail.append(" ( \n");
    		sqlDetail.append(" SELECT A.KMTRDY, \n");
    		sqlDetail.append("        A.KMTRTM, \n");
    		sqlDetail.append("        A.KMVIN, \n");
    		sqlDetail.append("        A.KMOPT, \n");
    		sqlDetail.append("        A.KMDELR, \n");
    		sqlDetail.append("        D.ORD_DLR_CD, \n");
    		sqlDetail.append("        D.VIN_NO, \n");
    		sqlDetail.append("        D.VIN_NO1, \n");
    		sqlDetail.append("        D.VIN_NO2, \n");
    		sqlDetail.append("        D.CAR_STAT_CD, \n");
    		sqlDetail.append("        D.PLT_GI_DT, \n");
    		sqlDetail.append("        D.GR_DT, \n");
    		sqlDetail.append("        D.GRTE_START_DT, \n");
    		sqlDetail.append("        D.CUST_SALE_DT, \n");
    		sqlDetail.append("        D.STR_NO, \n");
    		sqlDetail.append("        D.STR_YN, \n");
    		sqlDetail.append("        D.ORD_NO \n");
    		sqlDetail.append("   FROM ( SELECT KMTRDY, \n");
    		sqlDetail.append("                 KMTRTM, \n");
    		sqlDetail.append("                 KMVIN, \n");
    		sqlDetail.append("                 KMOPT, \n");
    		sqlDetail.append("                 KMDELR, \n");
    		sqlDetail.append("                 RN \n");
    		sqlDetail.append("            FROM ( SELECT KMTRDY, \n");
    		sqlDetail.append("                          KMTRTM, \n");
    		sqlDetail.append("                          KMVIN, \n");
    		sqlDetail.append("                          KMOPT, \n");
    		sqlDetail.append("                          KMDELR, \n");
    		sqlDetail.append("                          ROW_NUMBER( ) OVER (PARTITION BY KMVIN \n");
    		sqlDetail.append("                    ORDER BY TO_DATE(KMTRDY || KMTRTM, \n");
    		sqlDetail.append("                          'YYYYMMDD HH24MISS') DESC ) AS RN \n");
    		sqlDetail.append("                     from SA_0301T \n");
    		sqlDetail.append("                    WHERE 1=1 \n");
    		sqlDetail.append("                      AND SUBSTR(KMTRDY, \n");
    		sqlDetail.append("                          0, \n");
    		sqlDetail.append("                          6) = '").append(carSearchVO.getCheckMonth()).append("' \n");
    		sqlDetail.append("                      AND KMOPT IN('J1', \n");
    		sqlDetail.append("                          'J2', \n");
    		sqlDetail.append("                          'J3', \n");
    		sqlDetail.append("                          'J4', \n");
    		sqlDetail.append("                          'J5') ) \n");
    		sqlDetail.append("           WHERE 1=1 \n");
    		sqlDetail.append("             AND RN = 1 \n");
    		sqlDetail.append("             AND KMOPT IN('J1', \n");
    		sqlDetail.append("                 'J3', \n");
    		sqlDetail.append("                 'J5') \n");
    		sqlDetail.append("             AND SUBSTR(KMTRDY, \n");
    		sqlDetail.append("                 0, \n");
    		sqlDetail.append("                 6) = '").append(carSearchVO.getCheckMonth()).append("') A, \n");
    		sqlDetail.append("        ( SELECT ORD_DLR_CD, \n");
    		sqlDetail.append("                  CAR_STAT_CD, \n");
    		sqlDetail.append("                  VIN_NO, \n");
    		sqlDetail.append("                  VIN_NO1, \n");
    		sqlDetail.append("                  VIN_NO2, \n");
    		sqlDetail.append("                  PLT_GI_DT, \n");
    		sqlDetail.append("                  GR_DT, \n");
    		sqlDetail.append("                  GRTE_START_DT, \n");
    		sqlDetail.append("                  TO_CHAR(CUST_SALE_DT,'YYYYMMDD') CUST_SALE_DT, \n");
    		sqlDetail.append("                  STR_NO, \n");
    		sqlDetail.append("		          STR_YN, \n");
    		sqlDetail.append("		          ORD_NO \n");
    		sqlDetail.append("             FROM SA_0121T \n");
    		sqlDetail.append("            WHERE 1=1 \n");
    		sqlDetail.append("              AND NCAR_DSTIN_CD = 'N') D \n");
    		sqlDetail.append("  WHERE 1=1 \n");
    		sqlDetail.append("    AND KMVIN = D.VIN_NO (+ ) \n");
    		sqlDetail.append("    AND KMDELR = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
    		sqlDetail.append(" \n");
    		sqlDetail.append("    UNION ALL \n");
    		sqlDetail.append(" \n");
    		sqlDetail.append(" SELECT '' AS KMTRDY , '' AS KMTRTM , VIN_NO AS KMVIN , '' AS KMOPT , '' KMDELR, \n");
    		sqlDetail.append("        ORD_DLR_CD, \n");
    		sqlDetail.append("        VIN_NO, \n");
    		sqlDetail.append("        VIN_NO1, \n");
    		sqlDetail.append("        VIN_NO2, \n");
    		sqlDetail.append("        CAR_STAT_CD, \n");
    		sqlDetail.append("        PLT_GI_DT, \n");
    		sqlDetail.append("        GR_DT, \n");
    		sqlDetail.append("        GRTE_START_DT, \n");
    		sqlDetail.append("        TO_CHAR(CUST_SALE_DT,'YYYYMMDD') CUST_SALE_DT, \n");
    		sqlDetail.append("        STR_NO, \n");
    		sqlDetail.append("        STR_YN, \n");
    		sqlDetail.append("        ORD_NO \n");
    		sqlDetail.append(" from SA_0121t \n");
    		sqlDetail.append(" WHERE 1=1 \n");
    		sqlDetail.append(" AND ORD_DLR_CD = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
    		sqlDetail.append(" AND CAR_STAT_CD = '60' \n");
    		sqlDetail.append(" \n");
    		sqlDetail.append(" UNION ALL \n");
    		sqlDetail.append(" \n");
    		sqlDetail.append(" SELECT '' AS KMTRDY , '' AS KMTRTM , VIN_NO AS KMVIN , '' AS KMOPT , '' KMDELR, \n");
    		sqlDetail.append("        ORD_DLR_CD, \n");
    		sqlDetail.append("        VIN_NO, \n");
    		sqlDetail.append("        VIN_NO1, \n");
    		sqlDetail.append("        VIN_NO2, \n");
    		sqlDetail.append("        CAR_STAT_CD, \n");
    		sqlDetail.append("        PLT_GI_DT, \n");
    		sqlDetail.append("        GR_DT, \n");
    		sqlDetail.append("        GRTE_START_DT, \n");
    		sqlDetail.append("        TO_CHAR(CUST_SALE_DT,'YYYYMMDD') CUST_SALE_DT, \n");
    		sqlDetail.append("        STR_NO, \n");
    		sqlDetail.append("        STR_YN, \n");
    		sqlDetail.append("        ORD_NO \n");
    		sqlDetail.append(" from SA_0121t \n");
    		sqlDetail.append(" WHERE 1=1 \n");
    		sqlDetail.append(" AND ORD_DLR_CD = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
    		sqlDetail.append(" AND CAR_STAT_CD = '50' \n");
    		sqlDetail.append(" ) J \n");
    		sqlDetail.append("  FULL JOIN \n");
    		sqlDetail.append(" ( \n");
    		sqlDetail.append(" 	select ORD_DLR_CD, \n");
    		sqlDetail.append("			VIN_NO1||VIN_NO2 VIN_NO, \n");
    		sqlDetail.append("			CAR_STAT_CD, \n");
    		sqlDetail.append("			VIN_NO1, \n");
    		sqlDetail.append("			VIN_NO2, \n");
    		sqlDetail.append("			CASE WHEN PLT_GI_DT IS NULL OR NVL(PLT_GI_DT, '00000000') = '00000000' THEN NULL ELSE TO_DATE(PLT_GI_DT, 'YYYYMMDD') END PLT_GI_DT, \n");
    		sqlDetail.append("    		CASE WHEN GR_DT IS NULL OR NVL(GR_DT, '00000000') = '00000000' THEN NULL ELSE TO_DATE(GR_DT, 'YYYYMMDD') END GR_DT, \n");
    		sqlDetail.append("    		CASE WHEN GRTE_START_DT IS NULL OR NVL(GRTE_START_DT, '00000000') = '00000000' THEN NULL ELSE TO_DATE(GRTE_START_DT, 'YYYYMMDD') END GRTE_START_DT, \n");
    		sqlDetail.append("    		CASE WHEN CUST_SALE_DT IS NULL OR NVL(CUST_SALE_DT, '00000000') = '00000000' THEN NULL ELSE CUST_SALE_DT END CUST_SALE_DT, \n");
    		sqlDetail.append("        STR_NO, \n");
    		sqlDetail.append("        STR_YN, \n");
    		sqlDetail.append("        ORD_NO \n");
    		sqlDetail.append("      FROM SA_0121IR_MONTH@").append(devOrPrd).append(" \n");
    		sqlDetail.append("      WHERE 1=1 \n");
    		sqlDetail.append("      AND ( (CAR_STAT_CD = 'Q190' AND SUBSTR(CUST_SALE_DT,0,6) = '").append(carSearchVO.getCheckMonth()).append("' ) \n");
    		sqlDetail.append("          OR CAR_STAT_CD = 'Q180' \n");
    		sqlDetail.append("          OR CAR_STAT_CD = 'Q170') \n");
    		sqlDetail.append("      and ord_dlr_cd = '").append(tmpDmsCarCheckVO.getDlrCd()).append("' \n");
    		sqlDetail.append(" ) K \n");
    		sqlDetail.append("  ON J.KMVIN = K.VIN_NO \n");
    		sqlDetail.append(" WHERE 1=1 \n");
    		sqlDetail.append("   AND ( \n");
    		sqlDetail.append("          J.ORD_DLR_CD IS NULL--SAP存在DMS不存在，根据SAP表补录DMS主表SA_0121T数据，如果是在途，复制SA_0121T，不添加SA_0301T表；如果是库存，复制SA_0121T表，同时增加J1入库记录；如果是零售，复制SA_0121T表，增加J1零售记录；如果是战略出库，这里需要确认补录SA_0121T表中CAR_STAT_CD为60还是70，同时SA_0301T添加为J3的记录。 \n");
    		sqlDetail.append("       OR K.ORD_DLR_CD IS NULL--DMS存在SAP不存在，只记录不处理 \n");
    		sqlDetail.append("       OR (K.ORD_DLR_CD IS NOT NULL AND J.ORD_DLR_CD IS NOT NULL AND NVL(K.ORD_DLR_CD, '1') <> NVL(J.ORD_DLR_CD, '1'))--店代码不一致，更新为一致的店代码 \n");
    		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q170' AND J.CAR_STAT_CD = '13')--SAP是在途，DMS是分配，直接更新SA_0121T状态为在途 \n");
    		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q170' AND J.CAR_STAT_CD = '60')--SAP是在途，DMS是库存，直接更新SA_0121T状态为在途,删除SA_0301T表中为I1的入库记录 \n");
    		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q170' AND J.CAR_STAT_CD = '70')--SAP是在途，DMS是零售，直接更新SA_0121T状态为在途,删除SA_0301T表中为I1,J1,J2,J3,J4,J5的记录 \n");
    		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q180' AND J.CAR_STAT_CD = '13')--SAP是库存，DMS是分配，直接更新SA_0121T状态为在库,在SA_0301T表中添加I1的入库记录，日期为月结最后一天 \n");
    		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q180' AND J.CAR_STAT_CD = '50')--SAP是库存，DMS是在途，直接更新SA_0121T状态为在库,在SA_0301T表中添加I1的入库记录，日期为月结最后一天 \n");
    		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q180' AND J.CAR_STAT_CD = '70')--SAP是库存，DMS是零售，直接更新SA_0121T状态为在库,删除SA_0301T表中为除了I1的其他记录 \n");
    		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(K.STR_YN,'1') <> 'X' AND NVL(J.KMOPT ,'1') NOT IN ('J1','J5'))--SAP是零售，DMS不是零售，直接更新SA_0121T状态为零售,SA_0301T表中，最后状态如果是J3就添加J5战略出库，如果是其他添加为J1的出库记录，日期为月结最后一天 \n");
    		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(K.STR_YN,'1') = 'X' AND NVL(J.KMOPT ,'1') NOT IN ('J3'))--SAP是战略出库，DMS不是战略出库，（这里的处理方式待确认，想法是SA_0121的CAR_STAT_CD应该改成60，SA_0301T表添加J3的数据，日期为月结最后一天） \n");
    		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(J.KMOPT ,'1') IN ('J1','J3','J5') AND K.CUST_SALE_DT <> J.CUST_SALE_DT)--主表零售日期不一致,修改SA_0121T零售日期 \n");
    		sqlDetail.append("        OR (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(J.KMOPT ,'1') IN ('J1','J3','J5') AND K.CUST_SALE_DT <> J.KMTRDY)--销售记录表零售日期不一致,修改SA_0301T零售日期 \n");
    		sqlDetail.append("        ) \n");
    		sqlDetail.append(" ORDER BY CHECK_REASON \n");

    		System.out.println(sqlDetail.toString());
    		
    		//在经销商数据库执行SQL
    		Connection conn = null;
            try{
                conn = dbConnection(tmpDmsCarCheckVO.getDmsIpNm());
            }catch(Exception e){
                System.out.println("#"+e.getMessage());
                System.out.println(tmpDmsCarCheckVO.getDlrCd()+" 网络不通");
                continue;
                /*tmpDmsCarCheckVO.setCheckMonth(checkMonth);
                tmpDmsCarCheckVO.setDlrCd(tmpDmsCarCheckVO.getDlrCd());
                tmpDmsCarCheckVO.setCheckResult("E");
                tmpDmsCarCheckVO.setCheckMessage("网络不通");
                
                salesMonthDAO.updateTmpCarCheckResult(tmpDmsCarCheckVO);*/
            }
            if(null!=conn){
	            int rs = -1;
	            int rsDetail = -1;
	            int rsUpdate = -1;
	            Statement stmt = null;
	            Statement stmtDetail = null;
	            
	            try {
	                stmt = conn.createStatement();
	                stmtDetail = conn.createStatement();
	
	                rs = stmt.executeUpdate(sql.toString());
	                rsDetail = stmtDetail.executeUpdate(sqlDetail.toString());
	                
	                if(rs == 0){
		                StringBuffer updateCheckResultSql = new StringBuffer();
		        		updateCheckResultSql.append("UPDATE TMP_DMS_CAR_CHECK@").append(devOrPrd).append(" A SET A.CHECK_RESULT = 'Z',A.CHECK_MESSAGE = 'SUCCESS' WHERE A.DLR_CD = '").append(tmpDmsCarCheckVO.getDlrCd()).append("'");
		        		Statement stmtUpdate = conn.createStatement();
		        		rsUpdate = stmtUpdate.executeUpdate(updateCheckResultSql.toString());
	                }
	                
	                /*tmpDmsCarCheckVO.setCheckMonth(checkMonth);
	                tmpDmsCarCheckVO.setDlrCd(tmpDmsCarCheckVO.getDlrCd());
	                tmpDmsCarCheckVO.setCheckResult("Z");
	                tmpDmsCarCheckVO.setCheckMessage("SUCCESS");
	                salesMonthDAO.updateTmpCarCheckResult(tmpDmsCarCheckVO);*/
	
	            } catch (SQLException e) {
	                e.printStackTrace();
	                continue;
	                /*tmpDmsCarCheckVO.setCheckMonth(checkMonth);
	                tmpDmsCarCheckVO.setDlrCd(tmpDmsCarCheckVO.getDlrCd());
	                tmpDmsCarCheckVO.setCheckResult("E");
	                tmpDmsCarCheckVO.setCheckMessage("SQL执行报错");
	                salesMonthDAO.updateTmpCarCheckResult(tmpDmsCarCheckVO);*/
	            } catch (Exception e) {
	                e.printStackTrace();
	                continue;
	            } finally {
	                try {
	                    // Statement 종료
	                    stmt.close();
	                    stmtDetail.close();
	                    // Connection 종료
	                    conn.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                    continue;
	                }
	            }
	            
	            System.out.println("# UPDATE RESULT END : "+ rs);
	            System.out.println("# UPDATE RESULT END : "+ rsUpdate);
            }
    	}
    	
    	return errorStr;
    }
    
    /**
	 * 查询当前已经搜集了多少家车辆差异
	 */
	 @Override
	 public String checkCarProcessShow(CarSearchVO searchVO) throws Exception{
		 int hasCheckCount = salesMonthDAO.checkCarProcessShow(searchVO);
		 int allCheckCount = salesMonthDAO.checkCarProcessShowAll(searchVO);
	     JSONObject jb = new JSONObject();
	     jb.put("hasCheck", hasCheckCount+"");
	     jb.put("allCheck", allCheckCount+"");
	     return jb.toJSONString();
	 }
	 
    
    /**
     * 批量修改DMS车辆信息
     */
    @Override
    public String updateCarInfoErpToDms(String checkMonth) throws Exception{
    	String errorStr = "";
    	TmpDmsCarCheckVO searchVO = new TmpDmsCarCheckVO();
    	searchVO.setCheckMonth(checkMonth);
//    	List<TmpDmsCarCheckVO> list = salesMonthDAO.selectDealerListByCarDiff(searchVO);
    	List<TmpDmsErpCarDetailVO> listCar = salesMonthDAO.selectDmsErpCarDetailForUpdate(searchVO);
    	/*Map<String,String> map = gDlrCdMap();
    	DealerVO dealer = new DealerVO();
    	for (Map.Entry<String, String> m : map.entrySet()) {
    		dealer = new DealerVO();
    		dealer.setDmsIpNm(m.getValue());
		    dealer.setDlrCd(m.getKey());
		    list.add(dealer);
	    }*/
    	String dlrCd = "";
    	String dmsIpNm = "";
    	StringBuffer sql = new StringBuffer();
    	StringBuffer sql301 = new StringBuffer("");
    	//连接空对象创建放到循环外面
		Connection conn = null;
    	for(int i=0;i<listCar.size();i++){
    		TmpDmsErpCarDetailVO tmpDmsCarDetailVO = (TmpDmsErpCarDetailVO)listCar.get(i);
    		if(null!=tmpDmsCarDetailVO){
    			if(null!=tmpDmsCarDetailVO.getDlrCd()&&null!=tmpDmsCarDetailVO.getDmsIpNm()){
	    			
    				//如果经销商为空，或者经销商换了下一家，重新连接
    				//if(dlrCd.equals("")||!dlrCd.endsWith(tmpDmsCarDetailVO.getDlrCd())){
    					dlrCd = tmpDmsCarDetailVO.getDlrCd();
	    				dmsIpNm = tmpDmsCarDetailVO.getDmsIpNm();
	    				
	    				try{
	    	                conn = dbConnection(dmsIpNm);
	    	            }catch(Exception e){
	    	                System.out.println("#"+e.getMessage());
	    	                System.out.println(dlrCd+" 网络不通");
	    	                continue;
	    	                /*tmpDmsCarDetailVO = new TmpDmsErpCarDetailVO();
	    	                tmpDmsCarDetailVO.setUpdateResult("E");
	    	                tmpDmsCarDetailVO.setUpdateReason("网络不通");
	    	                
	    	                salesMonthDAO.updateTmpDmsCarUpdateResult(tmpDmsCarDetailVO);*/
	    	            }
    				//}
    				sql = new StringBuffer();
					sql.append("MERGE INTO SA_0121T A \n");
					sql.append("USING( \n");
					sql.append("SELECT VIN_NO1,VIN_NO2,VIN_NO1||VIN_NO2 VIN_NO, \n");
					sql.append("CASE WHEN CAR_STAT_CD = 'Q170' THEN '50' \n");
					sql.append("     WHEN CAR_STAT_CD = 'Q190' AND STR_YN IS NULL THEN '70' \n");
					sql.append("     WHEN CAR_STAT_CD = 'Q190' AND STR_YN = 'X' THEN '60' \n");
					sql.append("     WHEN CAR_STAT_CD = 'Q180' THEN '60' END CAR_STAT_CD, \n");
					sql.append("CAR_VIN_ALLOC_DT,ORD_DLR_CD,ORD_DLR_YY_MM_DT,ORD_TP,PLT_GI_DT,ERP_ORD_NO,CUST_SALE_DT,CUST_SALE_CANC_DT,DLR_GR_DT,GR_RETURN_DT,VINM_BKTX,CAR_ORD_ALLOC_DT,CAR_ORD_EMONTH \n");
					sql.append("FROM SA_0121IR_MONTH@").append(devOrPrd).append(" \n");
					sql.append("WHERE VIN_NO1||VIN_NO2='").append(tmpDmsCarDetailVO.getVinNo()).append("' \n");
					sql.append(") B \n");
					sql.append("ON (A.VIN_NO = B.VIN_NO1||B.VIN_NO2) \n");
					sql.append("WHEN MATCHED THEN \n");
					sql.append("  UPDATE SET \n");
					sql.append("     A.CAR_STAT_CD = B.CAR_STAT_CD, \n");
					sql.append("     A.CAR_VIN_ALLOC_DT = CASE WHEN B.CAR_VIN_ALLOC_DT IS NULL OR NVL(B.CAR_VIN_ALLOC_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.CAR_VIN_ALLOC_DT,'YYYYMMDD') END, \n");
					sql.append("     A.ORD_DLR_CD = B.ORD_DLR_CD, \n");
					sql.append("     A.ORD_DLR_YY_MM_DT = SUBSTR(B.ORD_DLR_YY_MM_DT,0,6), \n");
					sql.append("     A.PLT_GI_DT = CASE WHEN B.PLT_GI_DT IS NULL OR NVL(B.PLT_GI_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.PLT_GI_DT,'YYYYMMDD') END, \n");
					sql.append("     A.ERP_ORD_NO = B.ERP_ORD_NO, \n");
					sql.append("     A.CUST_SALE_DT = CASE WHEN B.CUST_SALE_DT IS NULL OR NVL(B.CUST_SALE_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.CUST_SALE_DT,'YYYYMMDD') END, \n");
					sql.append("     A.CUST_SALE_CANC_DT = CASE WHEN B.CUST_SALE_CANC_DT IS NULL OR NVL(B.CUST_SALE_CANC_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.CUST_SALE_CANC_DT,'YYYYMMDD') END, \n");
					sql.append("     A.DLR_GR_DT = CASE WHEN B.DLR_GR_DT IS NULL OR NVL(B.DLR_GR_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.DLR_GR_DT,'YYYYMMDD') END, \n");
					sql.append("     A.GR_RETURN_DT = CASE WHEN B.GR_RETURN_DT IS NULL OR NVL(B.GR_RETURN_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.GR_RETURN_DT,'YYYYMMDD') END \n");
    				
//					sqlDetail.append("	   WHEN J.ORD_DLR_CD IS NULL THEN 'SAP存在DMS不存在' \n");
//		    		sqlDetail.append("	   WHEN K.ORD_DLR_CD IS NULL THEN 'DMS存在SAP不存在' \n");
//		    		sqlDetail.append("	   WHEN J.ORD_DLR_CD IS NOT NULL AND K.ORD_DLR_CD IS NOT NULL AND NVL(K.ORD_DLR_CD, '1') <> NVL(J.ORD_DLR_CD, '1') THEN '店代码不一致' \n");
//		    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q170' AND J.CAR_STAT_CD = '13') THEN 'SAP在途DMS分配' \n");
//		    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q170' AND J.CAR_STAT_CD = '60') THEN 'SAP在途DMS库存' \n");
//		    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q170' AND J.CAR_STAT_CD = '70') THEN 'SAP在途DMS零售' \n");
//		    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q180' AND J.CAR_STAT_CD = '13') THEN 'SAP库存DMS分配' \n");
//		    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q180' AND J.CAR_STAT_CD = '50') THEN 'SAP库存DMS在途' \n");
//		    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q180' AND J.CAR_STAT_CD = '70') THEN 'SAP库存DMS零售' \n");
//		    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(K.STR_YN,'1') <> 'X' AND NVL(J.KMOPT ,'1') NOT IN ('J1','J5')) THEN 'SAP零售DMS非零售' \n");
//		    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(K.STR_YN,'1') = 'X' AND NVL(J.KMOPT ,'1') NOT IN ('J3')) THEN 'SAP战略出库DMS非战略出库' \n");
//		    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(J.KMOPT ,'1') IN ('J1','J3','J5') AND K.CUST_SALE_DT <> J.CUST_SALE_DT) THEN '零售日期不一致' \n");
//		    		sqlDetail.append("	   WHEN (NVL(K.CAR_STAT_CD ,'1') = 'Q190' AND NVL(J.KMOPT ,'1') IN ('J1','J3','J5') AND K.CUST_SALE_DT <> J.KMTRDY) THEN '销售记录表零售日期不一致' \n");
					
					if(null!=tmpDmsCarDetailVO.getCheckReason()){
    					if("店代码不一致".endsWith(tmpDmsCarDetailVO.getCheckReason())||"SAP在途DMS分配".endsWith(tmpDmsCarDetailVO.getCheckReason())){
    						//修改主表的店代码  						
    					}else if("SAP在途DMS库存".endsWith(tmpDmsCarDetailVO.getCheckReason())){
    						//修改主表的车辆状态，并删除入库记录
    						sql301 = new StringBuffer();
    						sql301.append("DELETE FROM SA_0301T T WHERE T.KMVIN = '").append(tmpDmsCarDetailVO.getVinNo()).append("' \n");
    					}else if("SAP在途DMS零售".endsWith(tmpDmsCarDetailVO.getCheckReason())){
    						//修改主表的车辆状态，并删除入库记录
    						sql301 = new StringBuffer();
    						sql301.append("DELETE FROM SA_0301T T WHERE T.KMVIN = '").append(tmpDmsCarDetailVO.getVinNo()).append("' \n");
    					}else if("SAP库存DMS分配".endsWith(tmpDmsCarDetailVO.getCheckReason())){
    						//修改主表，增加入库记录
    						sql301 = new StringBuffer();
    						sql301.append("INSERT INTO SA_0301T \n");
    						sql301.append("        (KMTRDY, \n");
    						sql301.append("         KMTRTM, \n");
    						sql301.append("         KMSEQ, \n");
    						sql301.append("         KMOPT, \n");
    						sql301.append("         KMDATE, \n");
    						sql301.append("         KMVIN, \n");
    						sql301.append("         KMDELR, \n");
    						sql301.append("         KMRGNO, \n");
    						sql301.append("         KMOTIT, \n");
    						sql301.append("         KMUSER) \n");
    						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'YYYYMMDD'), \n");
    						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'HH24MISS'), \n");
    						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
    						sql301.append("              FROM SA_0301T \n");
    						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'YYYYMMDD') \n");
    						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
    						sql301.append("               'I1', \n");
    						sql301.append("               GR_RETURN_DT, \n");
    						sql301.append("               VIN_NO, \n");
    						sql301.append("               ORD_DLR_CD, \n");
    						sql301.append("               LV2_DLR_ORG_CD, \n");
    						sql301.append("               CAR_DSTIN_CD, \n");
    						sql301.append("               ORD_DLR_CD \n");
    						sql301.append("          FROM SA_0121T \n");
    						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
    					}else if("SAP库存DMS在途".endsWith(tmpDmsCarDetailVO.getCheckReason())){
    						//修改主表，增加入库记录
    						sql301 = new StringBuffer();
    						sql301.append("INSERT INTO SA_0301T \n");
    						sql301.append("        (KMTRDY, \n");
    						sql301.append("         KMTRTM, \n");
    						sql301.append("         KMSEQ, \n");
    						sql301.append("         KMOPT, \n");
    						sql301.append("         KMDATE, \n");
    						sql301.append("         KMVIN, \n");
    						sql301.append("         KMDELR, \n");
    						sql301.append("         KMRGNO, \n");
    						sql301.append("         KMOTIT, \n");
    						sql301.append("         KMUSER) \n");
    						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'YYYYMMDD'), \n");
    						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'HH24MISS'), \n");
    						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
    						sql301.append("              FROM SA_0301T \n");
    						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'YYYYMMDD') \n");
    						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
    						sql301.append("               'I1', \n");
    						sql301.append("               GR_RETURN_DT, \n");
    						sql301.append("               VIN_NO, \n");
    						sql301.append("               ORD_DLR_CD, \n");
    						sql301.append("               LV2_DLR_ORG_CD, \n");
    						sql301.append("               CAR_DSTIN_CD, \n");
    						sql301.append("               ORD_DLR_CD \n");
    						sql301.append("          FROM SA_0121T \n");
    						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
    					}else if("SAP库存DMS零售".endsWith(tmpDmsCarDetailVO.getCheckReason())){
    						sql = new StringBuffer();
    						sql.append("MERGE INTO SA_0121T A \n");
    						sql.append("USING( \n");
    						sql.append("SELECT VIN_NO1,VIN_NO2,VIN_NO1||VIN_NO2 VIN_NO, \n");
    						sql.append("CASE WHEN CAR_STAT_CD = 'Q170' THEN '50' \n");
    						sql.append("     WHEN CAR_STAT_CD = 'Q190' AND STR_YN IS NULL THEN '70' \n");
    						sql.append("     WHEN CAR_STAT_CD = 'Q190' AND STR_YN = 'X' THEN '60' \n");
    						sql.append("     WHEN CAR_STAT_CD = 'Q180' THEN '60' END CAR_STAT_CD, \n");
    						sql.append("CAR_VIN_ALLOC_DT,ORD_DLR_CD,ORD_DLR_YY_MM_DT,ORD_TP,PLT_GI_DT,ERP_ORD_NO,CUST_SALE_DT,CUST_SALE_CANC_DT,DLR_GR_DT,GR_RETURN_DT,VINM_BKTX,CAR_ORD_ALLOC_DT,CAR_ORD_EMONTH \n");
    						sql.append("FROM SA_0121IR_MONTH@").append(devOrPrd).append(" \n");
    						sql.append("WHERE VIN_NO1||VIN_NO2='").append(tmpDmsCarDetailVO.getVinNo()).append("' \n");
    						sql.append(") B \n");
    						sql.append("ON (A.VIN_NO = B.VIN_NO1||B.VIN_NO2) \n");
    						sql.append("WHEN MATCHED THEN \n");
    						sql.append("  UPDATE SET \n");
    						sql.append("     A.CAR_STAT_CD = B.CAR_STAT_CD, \n");
    						sql.append("     A.CAR_VIN_ALLOC_DT = CASE WHEN B.CAR_VIN_ALLOC_DT IS NULL OR NVL(B.CAR_VIN_ALLOC_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.CAR_VIN_ALLOC_DT,'YYYYMMDD') END, \n");
    						sql.append("     A.ORD_DLR_CD = B.ORD_DLR_CD, \n");
    						sql.append("     A.ORD_DLR_YY_MM_DT = SUBSTR(B.ORD_DLR_YY_MM_DT,0,6), \n");
    						sql.append("     A.PLT_GI_DT = CASE WHEN B.PLT_GI_DT IS NULL OR NVL(B.PLT_GI_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.PLT_GI_DT,'YYYYMMDD') END, \n");
    						sql.append("     A.ERP_ORD_NO = B.ERP_ORD_NO, \n");
    						sql.append("     A.CUST_SALE_DT = CASE WHEN B.CUST_SALE_DT IS NULL OR NVL(B.CUST_SALE_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.CUST_SALE_DT,'YYYYMMDD') END, \n");
    						sql.append("     A.CUST_SALE_CANC_DT = CASE WHEN B.CUST_SALE_CANC_DT IS NULL OR NVL(B.CUST_SALE_CANC_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.CUST_SALE_CANC_DT,'YYYYMMDD') END, \n");
    						sql.append("     A.DLR_GR_DT = CASE WHEN B.DLR_GR_DT IS NULL OR NVL(B.DLR_GR_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.DLR_GR_DT,'YYYYMMDD') END, \n");
    						sql.append("     A.GR_RETURN_DT = CASE WHEN B.GR_RETURN_DT IS NULL OR NVL(B.GR_RETURN_DT,'00000000') = '00000000' THEN NULL ELSE TO_DATE(B.GR_RETURN_DT,'YYYYMMDD') END \n");
    						sql.append("     A.SALE_TP = '', \n");
    						sql.append("     A.STAT_CD = 'F', \n");
    						sql.append("     A.CONTRACT_NO = NULL, \n");
    						sql.append("     A.INVC_PUBL_DT = '', \n");
    						sql.append("     A.PRE_GI_YN = 'N', \n");
    						sql.append("     A.SALE_EMP_NO = '', \n");
    						sql.append("     A.BLOCK_SALE_ADV_NO = '', \n");
    						sql.append("     A.UPDT_USR_ID = 'admin', \n");
    						sql.append("     A.UPDT_DT = SYSDATE \n");

    						
    						//修改主表，增加退库记录（此处需要核对逻辑）
    						sql301 = new StringBuffer();
    						sql301.append("INSERT INTO SA_0301T \n");
    						sql301.append("        (KMTRDY, \n");
    						sql301.append("         KMTRTM, \n");
    						sql301.append("         KMSEQ, \n");
    						sql301.append("         KMOPT, \n");
    						sql301.append("         KMDATE, \n");
    						sql301.append("         KMVIN, \n");
    						sql301.append("         KMDELR, \n");
    						sql301.append("         KMRGNO, \n");
    						sql301.append("         KMOTIT, \n");
    						sql301.append("         KMUSER) \n");
    						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'YYYYMMDD'), \n");
    						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'HH24MISS'), \n");
    						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
    						sql301.append("              FROM SA_0301T \n");
    						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'YYYYMMDD') \n");
    						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
    						sql301.append("               'J2', \n");
    						sql301.append("               GR_RETURN_DT, \n");
    						sql301.append("               VIN_NO, \n");
    						sql301.append("               ORD_DLR_CD, \n");
    						sql301.append("               LV2_DLR_ORG_CD, \n");
    						sql301.append("               CAR_DSTIN_CD, \n");
    						sql301.append("               ORD_DLR_CD \n");
    						sql301.append("          FROM SA_0121T \n");
    						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
    					}else if("SAP零售DMS非零售".endsWith(tmpDmsCarDetailVO.getCheckReason())){
    						//修改主表，增加零售出库记录
    						sql301 = new StringBuffer();
    						sql301.append("INSERT INTO SA_0301T \n");
    						sql301.append("        (KMTRDY, \n");
    						sql301.append("         KMTRTM, \n");
    						sql301.append("         KMSEQ, \n");
    						sql301.append("         KMOPT, \n");
    						sql301.append("         KMDATE, \n");
    						sql301.append("         KMVIN, \n");
    						sql301.append("         KMDELR, \n");
    						sql301.append("         KMRGNO, \n");
    						sql301.append("         KMOTIT, \n");
    						sql301.append("         KMUSER) \n");
    						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'YYYYMMDD'), \n");
    						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'HH24MISS'), \n");
    						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
    						sql301.append("              FROM SA_0301T \n");
    						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'YYYYMMDD') \n");
    						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
    						sql301.append("               'J1', \n");
    						sql301.append("               GR_RETURN_DT, \n");
    						sql301.append("               VIN_NO, \n");
    						sql301.append("               ORD_DLR_CD, \n");
    						sql301.append("               LV2_DLR_ORG_CD, \n");
    						sql301.append("               CAR_DSTIN_CD, \n");
    						sql301.append("               ORD_DLR_CD \n");
    						sql301.append("          FROM SA_0121T \n");
    						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
    					}else if("SAP战略出库DMS非战略出库".endsWith(tmpDmsCarDetailVO.getCheckReason())){
    						//修改主表，增加零售出库记录
    						sql301 = new StringBuffer();
    						sql301.append("INSERT INTO SA_0301T \n");
    						sql301.append("        (KMTRDY, \n");
    						sql301.append("         KMTRTM, \n");
    						sql301.append("         KMSEQ, \n");
    						sql301.append("         KMOPT, \n");
    						sql301.append("         KMDATE, \n");
    						sql301.append("         KMVIN, \n");
    						sql301.append("         KMDELR, \n");
    						sql301.append("         KMRGNO, \n");
    						sql301.append("         KMOTIT, \n");
    						sql301.append("         KMUSER) \n");
    						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'YYYYMMDD'), \n");
    						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'HH24MISS'), \n");
    						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
    						sql301.append("              FROM SA_0301T \n");
    						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'YYYYMMDD') \n");
    						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
    						sql301.append("               'J3', \n");
    						sql301.append("               GR_RETURN_DT, \n");
    						sql301.append("               VIN_NO, \n");
    						sql301.append("               ORD_DLR_CD, \n");
    						sql301.append("               LV2_DLR_ORG_CD, \n");
    						sql301.append("               CAR_DSTIN_CD, \n");
    						sql301.append("               ORD_DLR_CD \n");
    						sql301.append("          FROM SA_0121T \n");
    						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
    					}else if("SAP战略出库DMS缺少战略出库表记录".endsWith(tmpDmsCarDetailVO.getCheckReason())){
    						//补录战略出库记录
    						sql301 = new StringBuffer();
    						sql301.append("INSERT INTO SA_0301T \n");
    						sql301.append("        (KMTRDY, \n");
    						sql301.append("         KMTRTM, \n");
    						sql301.append("         KMSEQ, \n");
    						sql301.append("         KMOPT, \n");
    						sql301.append("         KMDATE, \n");
    						sql301.append("         KMVIN, \n");
    						sql301.append("         KMDELR, \n");
    						sql301.append("         KMRGNO, \n");
    						sql301.append("         KMOTIT, \n");
    						sql301.append("         KMUSER) \n");
    						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'YYYYMMDD'), \n");
    						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'HH24MISS'), \n");
    						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
    						sql301.append("              FROM SA_0301T \n");
    						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'YYYYMMDD') \n");
    						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
    						sql301.append("               'J3', \n");
    						sql301.append("               GR_RETURN_DT, \n");
    						sql301.append("               VIN_NO, \n");
    						sql301.append("               ORD_DLR_CD, \n");
    						sql301.append("               LV2_DLR_ORG_CD, \n");
    						sql301.append("               CAR_DSTIN_CD, \n");
    						sql301.append("               ORD_DLR_CD \n");
    						sql301.append("          FROM SA_0121T \n");
    						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
    					}else if("SAP库存DMS战略出库".endsWith(tmpDmsCarDetailVO.getCheckReason())){
    						//增加战略出库取消（此处需要核对逻辑）
    						sql301 = new StringBuffer();
    						sql301.append("INSERT INTO SA_0301T \n");
    						sql301.append("        (KMTRDY, \n");
    						sql301.append("         KMTRTM, \n");
    						sql301.append("         KMSEQ, \n");
    						sql301.append("         KMOPT, \n");
    						sql301.append("         KMDATE, \n");
    						sql301.append("         KMVIN, \n");
    						sql301.append("         KMDELR, \n");
    						sql301.append("         KMRGNO, \n");
    						sql301.append("         KMOTIT, \n");
    						sql301.append("         KMUSER) \n");
    						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'YYYYMMDD'), \n");
    						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'HH24MISS'), \n");
    						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
    						sql301.append("              FROM SA_0301T \n");
    						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'YYYYMMDD') \n");
    						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
    						sql301.append("               'J4', \n");
    						sql301.append("               GR_RETURN_DT, \n");
    						sql301.append("               VIN_NO, \n");
    						sql301.append("               ORD_DLR_CD, \n");
    						sql301.append("               LV2_DLR_ORG_CD, \n");
    						sql301.append("               CAR_DSTIN_CD, \n");
    						sql301.append("               ORD_DLR_CD \n");
    						sql301.append("          FROM SA_0121T \n");
    						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
    					}else if("SAP零售DMS缺少SA_0301T零售记录".endsWith(tmpDmsCarDetailVO.getCheckReason())){
    						//补录零售记录
    						sql301 = new StringBuffer();
    						sql301.append("INSERT INTO SA_0301T \n");
    						sql301.append("        (KMTRDY, \n");
    						sql301.append("         KMTRTM, \n");
    						sql301.append("         KMSEQ, \n");
    						sql301.append("         KMOPT, \n");
    						sql301.append("         KMDATE, \n");
    						sql301.append("         KMVIN, \n");
    						sql301.append("         KMDELR, \n");
    						sql301.append("         KMRGNO, \n");
    						sql301.append("         KMOTIT, \n");
    						sql301.append("         KMUSER) \n");
    						sql301.append("        SELECT TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'YYYYMMDD'), \n");
    						sql301.append("               TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'HH24MISS'), \n");
    						sql301.append("               (SELECT NVL(MAX(KMSEQ), 0) + 1 AS kmseq \n");
    						sql301.append("              FROM SA_0301T \n");
    						sql301.append("                WHERE KMTRDY = TO_CHAR(LAST_DAY(TO_DATE('").append(checkMonth).append("','YYYYMM')), 'YYYYMMDD') \n");
    						sql301.append("                 AND KMDELR = '").append(tmpDmsCarDetailVO.getDlrCd()).append("'), \n");
    						sql301.append("               'J1', \n");
    						sql301.append("               GR_RETURN_DT, \n");
    						sql301.append("               VIN_NO, \n");
    						sql301.append("               ORD_DLR_CD, \n");
    						sql301.append("               LV2_DLR_ORG_CD, \n");
    						sql301.append("               CAR_DSTIN_CD, \n");
    						sql301.append("               ORD_DLR_CD \n");
    						sql301.append("          FROM SA_0121T \n");
    						sql301.append("         WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("'\n");
    					}else if("零售日期不一致".endsWith(tmpDmsCarDetailVO.getCheckReason())){
    						//修改主表零售日期
    						
    					}else if("销售记录表零售日期不一致".endsWith(tmpDmsCarDetailVO.getCheckReason())){
    						//修改子表零售日期
    						sql301 = new StringBuffer();
    						sql301.append("UPDATE SA_0301T T SET T.KMTRDY = TO_CHAR(SYSDATE-1,'YYYYMMDD') WHERE T.KMTRDY||T.KMTRTM||T.KMVIN = ( \n");
    						sql301.append("SELECT KMTRDY||KMTRTM||KMVIN FROM ( \n");
    						sql301.append("SELECT \n");
    						sql301.append("       KMTRDY,KMTRTM,KMVIN ,KMOPT ,KMDELR , \n");
    						sql301.append("       ROW_NUMBER() OVER (PARTITION BY KMVIN ORDER BY TO_DATE(KMTRDY||KMTRTM, 'YYYYMMDD HH24MISS') DESC) AS RN \n");
    						sql301.append("       FROM SA_0301T \n");
    						sql301.append("       WHERE KMVIN = '").append(tmpDmsCarDetailVO.getVinNo()).append("' \n");
    						sql301.append(") \n");
    						sql301.append("WHERE RN = 1 \n");
    						sql301.append(") \n");
    					}
	    				
	    			}
    			}
    		}
    		
            if(null!=conn){
	            int rs = -1;
	            int rs301 = -1;
	            int rsUpdateDetail = -1;
	            Statement stmt = null;
	            Statement stmt301 = null;
	            Statement stmtUpdateDetail = null;
	
	            try {
	                stmt = conn.createStatement();
	                stmt301 = conn.createStatement();
	                stmtUpdateDetail = conn.createStatement();
	
	                rs = stmt.executeUpdate(sql.toString());
	                if(null!=sql301&&!"".endsWith(sql301.toString())){
	                	rs301 = stmt301.executeUpdate(sql301.toString());
	                }
	                
	                StringBuffer sqlUpdateDetail = new StringBuffer();
	                sqlUpdateDetail.append("UPDATE TMP_DMS_ERP_CAR_DETAIL@").append(devOrPrd).append(" SET \n");
	                sqlUpdateDetail.append("			UPDATE_RESULT = 'Z', \n");
	                sqlUpdateDetail.append("	 		UPDATE_REASON = 'SUCCESS' \n");
	                sqlUpdateDetail.append(" 		WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("' \n");
	                sqlUpdateDetail.append(" 		  AND CHECK_REASON = '").append(tmpDmsCarDetailVO.getCheckReason()).append("' \n");
	                sqlUpdateDetail.append(" 		  AND (UPDATE_RESULT IS NULL OR UPDATE_RESULT = 'N') \n");

	                rsUpdateDetail = stmtUpdateDetail.executeUpdate(sqlUpdateDetail.toString());
	
	                /*tmpDmsCarDetailVO = new TmpDmsErpCarDetailVO();
	                tmpDmsCarDetailVO.setUpdateResult("Z");
	                tmpDmsCarDetailVO.setUpdateReason("SUCCESS");
	                salesMonthDAO.updateTmpDmsCarUpdateResult(tmpDmsCarDetailVO);*/
	            } catch (SQLException e) {
	                e.printStackTrace();
	                continue;
	                /*tmpDmsCarDetailVO = new TmpDmsErpCarDetailVO();
	                tmpDmsCarDetailVO.setUpdateResult("E");
	                tmpDmsCarDetailVO.setUpdateReason("SQL执行报错"+e.getErrorCode()+e.getMessage());
	                salesMonthDAO.updateTmpDmsCarUpdateResult(tmpDmsCarDetailVO);*/
	                /*StringBuffer sqlUpdateDetail = new StringBuffer();
	                sqlUpdateDetail.append("UPDATE TMP_DMS_ERP_CAR_DETAIL@").append(devOrPrd).append(" SET \n");
	                sqlUpdateDetail.append("			UPDATE_RESULT = 'E', \n");
	                sqlUpdateDetail.append("	 		UPDATE_REASON = '").append(e.getMessage()).append("' \n");
	                sqlUpdateDetail.append(" 		WHERE VIN_NO = '").append(tmpDmsCarDetailVO.getVinNo()).append("' \n");
	                sqlUpdateDetail.append(" 		  AND CHECK_REASON = '").append(tmpDmsCarDetailVO.getCheckReason()).append("' \n");
	                sqlUpdateDetail.append(" 		  AND (UPDATE_RESULT IS NULL OR UPDATE_RESULT = 'N') \n");
	                stmtUpdateDetail = conn.createStatement();
	                rsUpdateDetail = stmtUpdateDetail.executeUpdate(sqlUpdateDetail.toString());*/
	            } catch (Exception e) {
	                e.printStackTrace();
	                continue;
	            } finally {
	                try {
	                    // Statement 종료
	                    stmt.close();
	                    stmt301.close();
	                    stmtUpdateDetail.close();
	                    // Connection 종료
	                    conn.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                    continue;
	                }
	            }
            }
    	}
    	return errorStr;
    }
    
    /**
     * 批量修改DMS车辆信息
     */
    @Override
    public String updateCarInfoErpToDmsByThread(String checkMonth) throws Exception{
    	String errorStr = "";
    	TmpDmsCarCheckVO searchVO = new TmpDmsCarCheckVO();
    	searchVO.setCheckMonth(checkMonth);
    	List<TmpDmsErpCarDetailVO> list = salesMonthDAO.selectDmsErpCarDetailForUpdate(searchVO);
    	
    	//创建一个有10个线程的线程池
   	 	ExecutorService pool = Executors.newFixedThreadPool(MAX_QPS);
   	 	//组装任务
   	 	System.out.println("开始组装任务");
   	 	List missionList = new ArrayList();
   	 	for(int i=0;i<list.size();i++){
   	 		TmpDmsErpCarDetailVO tmpDmsErpCarDetailVO = (TmpDmsErpCarDetailVO)list.get(i);
   	 		System.out.println("组装任务"+tmpDmsErpCarDetailVO.getDlrCd());
   	 		tmpDmsErpCarDetailVO.setCheckMonth(checkMonth);
   	 		ThreadSalesMonthCarUpdate oneCheckThread = new ThreadSalesMonthCarUpdate(tmpDmsErpCarDetailVO,i,salesMonthDAO);
   	 		missionList.add(oneCheckThread);
   	 	}
   	 	System.out.println("结束组装任务"+list.size());
   	 	//循环执行任务
   	 	for(int i=0;i<missionList.size();i++){
   	 	ThreadSalesMonthCarUpdate oneCheckThread = (ThreadSalesMonthCarUpdate)missionList.get(i);
   	 		System.out.println("准备执行任务"+i);
   	 		pool.submit(oneCheckThread);
   	 		System.out.println("任务开始执行"+i);
   	 	}
   	 	
    	System.out.println("任务执行完毕，关闭连接池");
   	 	pool.shutdown();
   	 	
    	return errorStr;
    }
    
    /**
	 * 查询当前已经修复了多少台
	 */
	 @Override
	 public String updateCarProcessShow(CarSearchVO searchVO) throws Exception{
		 int hasUpdateCount = salesMonthDAO.updateCarProcessShow(searchVO);
		 int allUpdateCount = salesMonthDAO.updateCarProcessShowAll(searchVO);
	     JSONObject jb = new JSONObject();
	     jb.put("hasUpdate", hasUpdateCount+"");
	     jb.put("allUpdate", allUpdateCount+"");
	     return jb.toJSONString();
	 }
	 
	 /**
	 * 查询DMS数量对比列表数据数量
	 */
	 @Override
	 public int selectDmsCarDiffCnt(TmpDmsCarCheckVO tmpDmsCarCheckVO) {
		 return salesMonthDAO.selectDmsCarDiffCnt(tmpDmsCarCheckVO);
	 }
	 /**
	 * 查询DMS数量对比列表数据
	 */
	 @Override
	 public List<TmpDmsCarCheckVO> selectDmsCarDiff(TmpDmsCarCheckVO tmpDmsCarCheckVO) {
		 return salesMonthDAO.selectDmsCarDiff(tmpDmsCarCheckVO);
	 }
	 
	 /**
	 * 查询DMS数量对比列表数据数量
	 */
	 @Override
	 public int selectDmsErpCarDetailCnt(TmpDmsCarCheckVO tmpDmsCarCheckVO) {
		 return salesMonthDAO.selectDmsErpCarDetailCnt(tmpDmsCarCheckVO);
	 }
	 /**
	 * 查询DMS数量对比列表数据
	 */
	 @Override
	 public List<TmpDmsErpCarDetailVO> selectDmsErpCarDetail(TmpDmsCarCheckVO tmpDmsCarCheckVO) {
		 return salesMonthDAO.selectDmsErpCarDetail(tmpDmsCarCheckVO);
	 }
	 
	 /*--------------------------------------------------------------------DMS 车辆处理 End------------------------------------------------------------------*/
	 
	 
	 /**
	  * 通过经销商的IP地址和要执行的sql查询数据并返回
	  * @param dlrCd
	  * @param dbIP
	  * @param sSql
	  * @return
	  */
	 public ArrayList<HashMap<String,String>> selectDmsOrderDiffBySql(String dlrCd, String dbIP, String sSql){
        Connection conn = null;
        try{
            conn = dbConnection(dbIP);
        }catch(Exception e){
            System.out.println("#"+e.getMessage());
            return null;
        }

        Statement stmt = null;

        ArrayList<HashMap<String, String>> orderDiffList = new ArrayList<HashMap<String, String>>();
        try {
            stmt = conn.createStatement();

            ResultSet rs = null;
            try {
                rs = stmt.executeQuery(sSql);

                HashMap<String, String> map = null;
                while (rs.next()) {
                    map = new HashMap<String, String>();
                    map.put("DLR_CD", rs.getString("DLR_CD"));
                    map.put("DLR_NM", rs.getString("DLR_NM"));
                    orderDiffList.add(map);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally{
                try {
                    // resultset 종료
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // resultset 종료
                //rs.close();

                // Statement 종료
                stmt.close();
                // Connection 종료
                conn.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return orderDiffList;
     }
	 
	 /**
	 * 初始化待执行SQL的经销商
	 */
	 @Override
	 public String batchInsertDealerForUpdate(TmpDmsUpdateSqlVO tmpDmsUpdateSqlVO) throws Exception{
		 salesMonthDAO.deleteTmpDmsForUpdate();
		 String errorStr = "SUCCESS";
		 String dlrCds = tmpDmsUpdateSqlVO.getDlrCd();
    	 if (!(dlrCds == null ||dlrCds.equalsIgnoreCase("")||dlrCds.equalsIgnoreCase("null")))
		 {
			 if(dlrCds.length()<5||!(Double.valueOf(dlrCds.length())%5==0)){
				 errorStr = "dealer not correct";
			 }else{
				 if(dlrCds.length()==5){
					 tmpDmsUpdateSqlVO.setDlrCd(dlrCds);
					 salesMonthDAO.batchInsertDealerForUpdate(tmpDmsUpdateSqlVO);
				 }
				 else if(dlrCds.length()>5){
					 for(int i=0;i<300;i++){
						 if(i==0){
							 tmpDmsUpdateSqlVO.setDlrCd(dlrCds.substring(0,5));
							 salesMonthDAO.batchInsertDealerForUpdate(tmpDmsUpdateSqlVO);
							 dlrCds=dlrCds.substring(5);
						 }else if(dlrCds.length()>5){
							 tmpDmsUpdateSqlVO.setDlrCd(dlrCds.substring(0,5));
							 salesMonthDAO.batchInsertDealerForUpdate(tmpDmsUpdateSqlVO);
							 dlrCds=dlrCds.substring(5);
						 }else if(dlrCds.length()==5){
							 tmpDmsUpdateSqlVO.setDlrCd(dlrCds.substring(0,5));
							 salesMonthDAO.batchInsertDealerForUpdate(tmpDmsUpdateSqlVO);
							 break;
						 }
					 }
				 }
			 }
		 }else if(dlrCds.equalsIgnoreCase("all")||dlrCds.equalsIgnoreCase("")){
			 salesMonthDAO.batchInsertDealerForUpdate(tmpDmsUpdateSqlVO);
		 }
    	 
	     return errorStr;
	 }
	 
	 /**
	 * 查询DMS订单数量对比列表数据数量
	 */
	 @Override
	 public int selectDmsUpdateResultCnt(TmpDmsUpdateSqlVO tmpDmsUpdateSqlVO) {
		 return salesMonthDAO.selectDmsUpdateResultCnt(tmpDmsUpdateSqlVO);
	 }
	 /**
	 * 查询DMS订单数量对比列表数据
	 */
	 @Override
	 public List<TmpDmsUpdateSqlVO> selectDmsUpdateResult(TmpDmsUpdateSqlVO tmpDmsUpdateSqlVO) {
		 return salesMonthDAO.selectDmsUpdateResult(tmpDmsUpdateSqlVO);
	 }
	 
	 
	 /**
     * 根据传入的经销商、sql执行修改
     */
    @Override
    public String updateBySql(String dlrCds, String sql) throws Exception{
    	String errorStr = "";
    	TmpDmsUpdateSqlVO searchVO = new TmpDmsUpdateSqlVO();
    	List<TmpDmsUpdateSqlVO> list = salesMonthDAO.selectDealerByDlrCds(searchVO);
    	for(int i=0;i<list.size();i++){
    		TmpDmsUpdateSqlVO tmpDmsUpdateSqlVO = (TmpDmsUpdateSqlVO)list.get(i);
    		
    		//在经销商数据库执行SQL
    		Connection conn = null;
            try{
                conn = dbConnection(tmpDmsUpdateSqlVO.getDmsIpNm());
            }catch(Exception e){
                e.printStackTrace();
            	System.out.println("#"+e.getMessage());
                continue;
                /*tmpDmsUpdateSqlVO.setUpdateResult("E");
                tmpDmsUpdateSqlVO.setUpdateMessage("网络不通");
                System.out.println(tmpDmsUpdateSqlVO.getDlrCd()+" 网络不通");
                salesMonthDAO.updateTmpDmsSqlResult(tmpDmsUpdateSqlVO);*/
            }
            if(null!=conn){
	            int rs = -1;
	            Statement stmt = null;
	
	            try {
	                stmt = conn.createStatement();
	                sql = sql.replaceAll("THISDLR", tmpDmsUpdateSqlVO.getDlrCd());
	                rs = stmt.executeUpdate(sql);
	                
	                tmpDmsUpdateSqlVO.setUpdateResult("Z");
	                tmpDmsUpdateSqlVO.setUpdateMessage("SUCCESS");
	                salesMonthDAO.updateTmpDmsSqlResult(tmpDmsUpdateSqlVO);
	
	            } catch (SQLException e) {
	                e.printStackTrace();
	                continue;
	                /*tmpDmsUpdateSqlVO.setUpdateResult("E");
	                tmpDmsUpdateSqlVO.setUpdateMessage("SQL执行报错"+e.getErrorCode()+e.getMessage());
	                salesMonthDAO.updateTmpDmsSqlResult(tmpDmsUpdateSqlVO);*/
	            } catch (Exception e) {
	                e.printStackTrace();
	                continue;
	                /*tmpDmsUpdateSqlVO.setUpdateResult("E");
	                tmpDmsUpdateSqlVO.setUpdateMessage("SQL执行报错"+e.getMessage());
	                salesMonthDAO.updateTmpDmsSqlResult(tmpDmsUpdateSqlVO);*/
	            } finally {
	                try {
	                    // Statement 종료
	                    stmt.close();
	                    // Connection 종료
	                    conn.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                    continue;
	                }
	            }
	            
	            System.out.println("# UPDATE RESULT END : "+ rs);
            }
    	}
    	return errorStr;
    }
	 
    
    /**
     * 根据传入的经销商、sql执行多线程修改
     */
    @Override
    public String updateBySqlByThread(String dlrCds, String sql) throws Exception{
    	String errorStr = "";
    	TmpDmsUpdateSqlVO searchVO = new TmpDmsUpdateSqlVO();
    	List<TmpDmsUpdateSqlVO> list = salesMonthDAO.selectDealerByDlrCds(searchVO);
    	
    	//创建一个有10个线程的线程池
   	 	ExecutorService pool = Executors.newFixedThreadPool(MAX_QPS);
   	 	//组装任务
   	 	System.out.println("开始组装任务");
   	 	List missionList = new ArrayList();
   	 	for(int i=0;i<list.size();i++){
   	 	TmpDmsUpdateSqlVO tmpDmsUpdateSqlVO = (TmpDmsUpdateSqlVO)list.get(i);
   	 		System.out.println("组装任务"+tmpDmsUpdateSqlVO.getDlrCd());
   	 	ThreadSalesMonthSqlUpdate oneCheckThread = new ThreadSalesMonthSqlUpdate(tmpDmsUpdateSqlVO,i,salesMonthDAO,sql);
   	 		missionList.add(oneCheckThread);
   	 	}
   	 	System.out.println("结束组装任务"+list.size());
   	 	//循环执行任务
   	 	for(int i=0;i<missionList.size();i++){
   	 	ThreadSalesMonthSqlUpdate oneCheckThread = (ThreadSalesMonthSqlUpdate)missionList.get(i);
   	 		pool.submit(oneCheckThread);
   	 	}
   	 	
   	 	pool.shutdown();
    	
    	return errorStr;
    }
	 
	 /**
	  * 动态列头查询，暂未完成，后续完善
	  * @param dlrCd
	  * @param dbIP
	  * @param sSql
	  * @param columnList
	  * @return
	  */
	 /*public ArrayList<HashMap<String,String>> runSQL(String dlrCd, String dbIP, String sSql, ArrayList<String> columnList){
        Connection conn = null;
        try{
            conn = dbConnection(dbIP);
        }catch(Exception e){
            System.out.println("#"+e.getMessage());
            return null;
        }

        Statement stmt = null;

        ArrayList<HashMap<String, String>> ownList = null;
        ArrayList<HashMap<String,String>> MultisResultList = new ArrayList<HashMap<String,String>>();
        try {
            stmt = conn.createStatement();

            ArrayList<HashMap<String,String>> dlrList = new ArrayList<HashMap<String,String>>();

            ArrayList<HashMap<String,String>> List = null;
            ResultSet rs = null;

            try {
                rs = stmt.executeQuery(sSql.replace("$DLR_CD", dlrCd));

                ResultSetMetaData meta = rs.getMetaData();
                int cLength = meta.getColumnCount();  // 컬럼수

                String[] cols = new String[cLength];
                for(int i=0; i<cLength; i++){
                    //cols[i] = meta.getColumnClassName(i+1);       //컬럼 형체크
                    cols[i] = meta.getColumnName(i+1);              //컬럼명

                    if(columnList != null){
                        columnList.add(cols[i]);
                    }
                }

                HashMap<String, String> row = null;
                List = new ArrayList<HashMap<String,String>>();

                while (rs.next()) {
                    row = new HashMap<String, String>();
                    for (int i=0; i<cLength; i++) {
                        row.put(cols[i], rs.getString(i+1));

                    }

                    row.put("DLR_CD", dlrCd);

                    List.add(row);
                }


            } catch (SQLException e) {
                e.printStackTrace();
            } finally{
                try {
                    // resultset 종료
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            
            if(List != null && List.size() > 0){
                MultisResultList.addAll(List);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // resultset 종료
                //rs.close();

                // Statement 종료
                stmt.close();
                // Connection 종료
                conn.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return MultisResultList;
     }*/
	 
	 private ArrayList<HashMap<String,String>> selectSQL(Statement stmt, String dlrCd, String sSql, ArrayList<String> columnList){
        ArrayList<HashMap<String,String>> List = null;
        ResultSet rs = null;

        try {
            rs = stmt.executeQuery(sSql.replace("THISDLR", dlrCd));

            ResultSetMetaData meta = rs.getMetaData();
            int cLength = meta.getColumnCount();  // 컬럼수

            String[] cols = new String[cLength];
            for(int i=0; i<cLength; i++){
                //cols[i] = meta.getColumnClassName(i+1);       //컬럼 형체크
                cols[i] = meta.getColumnName(i+1);              //컬럼명

                if(columnList != null){
                    columnList.add(cols[i]);
                }
            }

            HashMap<String, String> row = null;
            List = new ArrayList<HashMap<String,String>>();

            while (rs.next()) {
                row = new HashMap<String, String>();
                for (int i=0; i<cLength; i++) {
                    row.put(cols[i], rs.getString(i+1));

                }

                row.put("DLR_CD", dlrCd);

                List.add(row);
            }


        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            try {
                // resultset 종료
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return List;
     }
	 
	 public String runUpdateSQL(String dbIP, String sSql){
        Connection conn = null;
        try{
            conn = dbConnection(dbIP);
        }catch(Exception e){
            System.out.println("#"+e.getMessage());
            return null;
        }

        int rs = -1;
        Statement stmt = null;

        try {
            stmt = conn.createStatement();

            rs = stmt.executeUpdate(sSql);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // Statement 종료
                stmt.close();
                // Connection 종료
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        System.out.println("# UPDATE RESULT END : "+ rs);


        return String.valueOf(rs);
    }
	 
	 
	 /**
	     * 批量核对DMS与ERP的订单差异数量
	     */
	    @Override
	    public String searchOrderInfoErpToDmsByThread(OrderSearchVO orderSearchVO) throws Exception{
	    	String errorStr = "";
	    	TmpDmsOrderCheckVO searchVO = new TmpDmsOrderCheckVO();
	    	searchVO.setCheckMonth(orderSearchVO.getCheckMonth());
	    	
	   	    List<TmpDmsOrderCheckVO> list = new ArrayList();
	   	 	if(null==orderSearchVO.getDlrCd()||"".equals(orderSearchVO.getDlrCd())||"all".equalsIgnoreCase(orderSearchVO.getDlrCd())){
	   	 		list = salesMonthDAO.selectDealerListByOrderCheck(searchVO);
	   	 	}else {
	   	 		String dlrCds = orderSearchVO.getDlrCd();
	   	 		if(dlrCds.length()<5||!(Double.valueOf(dlrCds.length())%5==0)){
	   	 			errorStr = "dealer not correct";
	   	 		}else{
	   	 			if(dlrCds.length()==5){
	   	 				searchVO.setDlrCd(dlrCds);
	   	 				List list1 = salesMonthDAO.selectDealerListByOrderCheck(searchVO);
	   	 				list.addAll(list1);
	   	 			}
	   	 			else if(dlrCds.length()>5){
	   	 				for(int i=0;i<300;i++){
	   	 					if(i==0){
	   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
		   	 					List list1 = salesMonthDAO.selectDealerListByOrderCheck(searchVO);
		   	   	 				list.addAll(list1);
	   	 						dlrCds=dlrCds.substring(5);
	   	 					}else if(dlrCds.length()>5){
	   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
		   	 					List list1 = salesMonthDAO.selectDealerListByOrderCheck(searchVO);
		   	   	 				list.addAll(list1);
	   	 						dlrCds=dlrCds.substring(5);
	   	 					}else if(dlrCds.length()==5){
	   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
		   	 					List list1 = salesMonthDAO.selectDealerListByOrderCheck(searchVO);
		   	   	 				list.addAll(list1);
							 	break;
	   	 					}
	   	 				}
	   	 			}
	   	 		}
	   	 	}
	   	 	
	   	 	//创建一个有10个线程的线程池
	   	 	ExecutorService pool = Executors.newFixedThreadPool(MAX_QPS);
	   	 	//组装任务
	   	 	System.out.println("开始组装任务");
	   	 	List missionList = new ArrayList();
	   	 	for(int i=0;i<list.size();i++){
	   	 		TmpDmsOrderCheckVO tmpDmsOrderCheckVO = (TmpDmsOrderCheckVO)list.get(i);
	   	 		System.out.println("组装任务"+tmpDmsOrderCheckVO.getDlrCd());
	   	 		ThreadSalesMonthOrdServiceImpl oneCheckThread = new ThreadSalesMonthOrdServiceImpl(tmpDmsOrderCheckVO,i,salesMonthDAO);
	   	 		missionList.add(oneCheckThread);
	   	 	}
	   	 	System.out.println("结束组装任务"+list.size());
	   	 	//循环执行任务
	   	 	for(int i=0;i<missionList.size();i++){
	   	 		ThreadSalesMonthOrdServiceImpl oneCheckThread = (ThreadSalesMonthOrdServiceImpl)missionList.get(i);
	   	 		pool.submit(oneCheckThread);
	   	 	}
	   	 	//循环执行任务
	   	 	/*for(int i=0;i<missionList.size();i++){
	   	 		ThreadSalesMonthOrdServiceImpl oneCheckThread = (ThreadSalesMonthOrdServiceImpl)missionList.get(i);
	   	 		Future<?> task = pool.submit(oneCheckThread);
		   	 	try {
	                //限定60秒时间获取结果
	                task.get(60, TimeUnit.SECONDS);
	            } catch (TimeoutException e) {
	                //超时触发线程中止
	                System.out.println("thread over time_"+oneCheckThread.getName());
	            } catch (ExecutionException e) {
	                throw e;
	            } finally {
	                boolean mayInterruptIfRunning = true;
	                task.cancel(mayInterruptIfRunning);
	            }
	   	 	}*/
	   	 	
	   	 	//正常关闭
	   	 	pool.shutdown();
	   	 	//60秒没关闭自动关闭
//			pool.awaitTermination(60, TimeUnit.SECONDS);
			System.out.println("DONE");
	    	/*for(int i=0;i<list.size();i++){
	    		TmpDmsOrderCheckVO tmpDmsOrderCheckVO = (TmpDmsOrderCheckVO)list.get(i);
	    		
	    		ExecutorService es = Executors.newSingleThreadExecutor();
	            Future<?> task = es.submit(new ThreadSalesMonthOrdServiceImpl(tmpDmsOrderCheckVO));

	            try {
	                //限定60秒时间获取结果
	                task.get(60, TimeUnit.SECONDS);
	            } catch (TimeoutException e) {
	                //超时触发线程中止
	                System.out.println("thread over time");
	            } catch (ExecutionException e) {
	                throw e;
	            } finally {
	                boolean mayInterruptIfRunning = true;
	                task.cancel(mayInterruptIfRunning);
	            }
	    	}*/
	    	
	    	return errorStr;
	    }
	
	/**
	 * 查询当前已经修复了多少家
	 */
	 @Override
	 public String batchUpdateBySqlProcessShow(CarSearchVO searchVO) throws Exception{
		 int hasUpdateCount = salesMonthDAO.batchUpdateBySqlProcessShow(searchVO);
		 int allUpdateCount = salesMonthDAO.batchUpdateBySqlProcessShowAll(searchVO);
	     JSONObject jb = new JSONObject();
	     jb.put("hasUpdate", hasUpdateCount+"");
	     jb.put("allUpdate", allUpdateCount+"");
	     return jb.toJSONString();
	 }
	 
	 /**
	     * 批量核对DMS与ERP的车辆差异数量
	     */
	    @Override
	    public String searchCarInfoErpToDmsByThread(CarSearchVO carSearchVO) throws Exception{
	    	String errorStr = "";
	    	TmpDmsCarCheckVO searchVO = new TmpDmsCarCheckVO();
	    	searchVO.setCheckMonth(carSearchVO.getCheckMonth());
	    	
	    	List<TmpDmsCarCheckVO> list = new ArrayList();
	   	 	if(null==carSearchVO.getDlrCd()||"".equals(carSearchVO.getDlrCd())||"all".equalsIgnoreCase(carSearchVO.getDlrCd())){
	   	 		list = salesMonthDAO.selectDealerListByCarCheck(searchVO);
	   	 	}else {
	   	 		String dlrCds = carSearchVO.getDlrCd();
	   	 		if(dlrCds.length()<5||!(Double.valueOf(dlrCds.length())%5==0)){
	   	 			errorStr = "dealer not correct";
	   	 		}else{
	   	 			if(dlrCds.length()==5){
	   	 				searchVO.setDlrCd(dlrCds);
	   	 				List list1 = salesMonthDAO.selectDealerListByCarCheck(searchVO);
	   	 				list.addAll(list1);
	   	 			}
	   	 			else if(dlrCds.length()>5){
	   	 				for(int i=0;i<300;i++){
	   	 					if(i==0){
	   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
		   	 					List list1 = salesMonthDAO.selectDealerListByCarCheck(searchVO);
		   	   	 				list.addAll(list1);
	   	 						dlrCds=dlrCds.substring(5);
	   	 					}else if(dlrCds.length()>5){
	   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
		   	 					List list1 = salesMonthDAO.selectDealerListByCarCheck(searchVO);
		   	   	 				list.addAll(list1);
	   	 						dlrCds=dlrCds.substring(5);
	   	 					}else if(dlrCds.length()==5){
	   	 						searchVO.setDlrCd(dlrCds.substring(0,5));
		   	 					List list1 = salesMonthDAO.selectDealerListByCarCheck(searchVO);
		   	   	 				list.addAll(list1);
							 	break;
	   	 					}
	   	 				}
	   	 			}
	   	 		}
	   	 	}
	   	 	
	   	 	//创建一个有10个线程的线程池
	   	 	ExecutorService pool = Executors.newFixedThreadPool(MAX_QPS);
	   	 	//组装任务
	   	 	System.out.println("开始组装任务");
	   	 	List missionList = new ArrayList();
	   	 	for(int i=0;i<list.size();i++){
	   	 		TmpDmsCarCheckVO tmpDmsCarCheckVO = (TmpDmsCarCheckVO)list.get(i);
	   	 		System.out.println("组装任务"+tmpDmsCarCheckVO.getDlrCd());
	   	 		ThreadSalesMonthCarServiceImpl oneCheckThread = new ThreadSalesMonthCarServiceImpl(tmpDmsCarCheckVO,i,salesMonthDAO);
	   	 		missionList.add(oneCheckThread);
	   	 	}
	   	 	System.out.println("结束组装任务"+list.size());
	   	 	//循环执行任务
	   	 	for(int i=0;i<missionList.size();i++){
	   	 		ThreadSalesMonthCarServiceImpl oneCheckThread = (ThreadSalesMonthCarServiceImpl)missionList.get(i);
	   	 		pool.submit(oneCheckThread);
	   	 	}
	   	 	
	   	    pool.shutdown();
	    	
	    	return errorStr;
	    }
	    
}
