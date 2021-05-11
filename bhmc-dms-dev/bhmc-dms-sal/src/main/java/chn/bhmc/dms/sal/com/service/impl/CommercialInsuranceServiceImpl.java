package chn.bhmc.dms.sal.com.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.jxls.common.Context;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.DBMessageSourceService;
import chn.bhmc.dms.cmm.sci.vo.DBMessageSourceSearchVO;
import chn.bhmc.dms.cmm.sci.vo.DBMessageSourceVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.com.model.RenewalBizSelection;
import chn.bhmc.dms.sal.com.model.RenewalRelation;
import chn.bhmc.dms.sal.com.model.Response;
import chn.bhmc.dms.sal.com.service.CommercialInsuranceService;
import chn.bhmc.dms.sal.com.service.dao.CommercialInsuranceDAO;
import chn.bhmc.dms.sal.com.util.Code;
import chn.bhmc.dms.sal.com.util.HttpUtil;
import chn.bhmc.dms.sal.com.vo.CommercialInsuranceVO;
import chn.bhmc.dms.sal.com.vo.RspBody;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : CommercialInsuranceServiceImpl
 * @Description : u车商续保查询
 * @author wushibin
 * @since 2019. 7. 4.
 * @version 1.0
 * @see
 * @Modification Information
 */

@Service("commercialInsuranceService")
public class CommercialInsuranceServiceImpl extends HService implements CommercialInsuranceService, JxlsSupport {

	@Resource(name = "commercialInsuranceDAO")
	CommercialInsuranceDAO commercialInsuranceDAO;

	@Resource(name = "dbMessageSourceService")
	DBMessageSourceService dbMessageSourceService;

	public int selectcontByCarNo(CommercialInsuranceVO commercialInsuranceVO) throws Exception {
		return commercialInsuranceDAO.selectcontByCarNo(commercialInsuranceVO);
	}

	/**
	 * 商业保险查询（selectCommercialInsuranceMain.jsp） 2019-07-09 确认 只传车牌号和license_type字段
	 * （license_type字段 用车牌号查SA_0121T表获取再判断传值 ） 查询SA_0121T表无数据的话不发送请求给U车商
	 * -----》20190814 需求变更 （查询不到数据满足新能源条件的发请求） 汉字+AD+字母/数字 5位 类型传52 其余02 20190826
	 * 查询历史表数据 查询类型为2的今日数据 是否有数据 有返回续保数据无判断今日是否发过请求（类型1） 没有的话发有的话不发请求。有续保信息插入类型2
	 * 没有插入类型1 20190827 插入历史数据进行判断 没有新增，有的话更新同步日期和数据（数据可能与之前同步的不一样）
	 */
	@Override
	public List<CommercialInsuranceVO> selectInfoByCarRegNo(CommercialInsuranceVO commercialInsuranceVO)
			throws Exception {
		CommercialInsuranceVO findHistory = new CommercialInsuranceVO();
		findHistory.setCarRegNo(commercialInsuranceVO.getLicenseNo());
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		findHistory.setSynchronizationDtStartStr(sdf1.parse(DateFormatUtils.format(new Date(), "yyyy-MM-dd 00:00:00")));
		findHistory.setSynchronizationDtEndStr(sdf1.parse(DateFormatUtils.format(new Date(), "yyyy-MM-dd 00:00:00")));
		findHistory.setNote3("2");
		List<CommercialInsuranceVO> selectInfoByParams = commercialInsuranceDAO.selectInfoByParams(findHistory);
		if (selectInfoByParams.size() > 0) {
			return selectInfoByParams;
		} else {
			findHistory.setNote3("1");
			List<CommercialInsuranceVO> commercialInsuranceVOs = commercialInsuranceDAO.selectInfoByParams(findHistory);
			if (commercialInsuranceVOs.size() > 0) {
				return null;
			} else {
				// 20190910 续保查询业务场景
				commercialInsuranceVO.setMesgTxt("商业保险查询");
				// post请求
				List<CommercialInsuranceVO> selectInfoBy = commercialInsuranceDAO
						.selectInfoByLicenseNo(commercialInsuranceVO);
				// 20190823 添加参数店代码 区别续保服务的渠道信息
				commercialInsuranceVO.setDlrCd(LoginUtil.getDlrCd());
				HttpUtil httpUtil = new HttpUtil();
				if (selectInfoBy.size() > 0) {
					if (selectInfoBy.get(0).getZfnewsub() != null) {
						commercialInsuranceVO.setLicenseType("52");
					} else {
						commercialInsuranceVO.setLicenseType("02");
					}
				} else {
					// 系统中没查到车牌号数据但是新能源车号的发送请求并返还数据
					String carNo = commercialInsuranceVO.getLicenseNo();
					char[] charArray = carNo.toCharArray();
					if (charArray.length == 8 && charArray[1] == 'A' && charArray[2] == 'D') {
						commercialInsuranceVO.setLicenseType("52");
					} else if (charArray.length == 7 || charArray.length == 8) {
						commercialInsuranceVO.setLicenseType("02");
					} else {
						return null;
					}
				}
				net.sf.json.JSONObject jsonArray = net.sf.json.JSONObject.fromObject(commercialInsuranceVO);
				String param = jsonArray.toString();
				Properties ret = PropertiesLoaderUtils
						.loadProperties(new ClassPathResource("/config/common.properties"));
				System.out.println("uCheshangForwordUrl" + ret.getProperty("uCheshangForwordUrl")+"车牌号为"+commercialInsuranceVO.getLicenseNo());
				Map<String, Object> map = httpUtil.sendPost(ret.getProperty("uCheshangForwordUrl"), param, false);
				if (map.get("status").equals("200")) {
					Object object = map.get("response");
					net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(object);
					Response response = (Response) net.sf.json.JSONObject.toBean(jsonObject, Response.class);
					// 20200325 by wushibin 判断response的resultCode为000000 业务执行成功
					if (response.getRetCode() != null) {
						if (response.getRetCode().equals("000000")) {
							RspBody rspBody = com.alibaba.fastjson.JSONObject.parseObject(response.getRspBody(),
									RspBody.class);
							if (rspBody != null) {
								if (rspBody.getResultCode() != null) {
									if (rspBody.getResultCode().equals("200")) {
										List<CommercialInsuranceVO> reCommercialInsuranceVOs = this
												.reCommercialInsuranceVOs(rspBody);
										return reCommercialInsuranceVOs;
									} else {
										//20200326   resultCode":"300","errorMsg":"未取到上年续保信息，请确认到期时间和险种"  "resultCode":"250","errorMsg":"需要完善行驶证信息（车辆信息和险种都没有获取到）"
										CommercialInsuranceVO cInsuranceVO = new CommercialInsuranceVO();
										cInsuranceVO.setCarRegNo(commercialInsuranceVO.getLicenseNo());
										cInsuranceVO.setNote3("1");
										int selectcontByCarNo1 = commercialInsuranceDAO.selectcontByCarNo(cInsuranceVO);
										if (selectcontByCarNo1 > 0) {
											// 更新note3 为1的时间
											commercialInsuranceDAO.updateData(cInsuranceVO);
										} else {
											commercialInsuranceDAO.insertInsInfo(cInsuranceVO);
										}
										return null;
									}
								} else {
									return null;
								}
							} else {
								// 没有返回续保信息或者商户未开通
								System.out.println("rspBody实体为null");
								CommercialInsuranceVO cInsuranceVO = new CommercialInsuranceVO();
								cInsuranceVO.setCarRegNo(commercialInsuranceVO.getLicenseNo());
								cInsuranceVO.setNote3("1");
								int selectcontByCarNo1 = commercialInsuranceDAO.selectcontByCarNo(cInsuranceVO);
								if (selectcontByCarNo1 > 0) {
									// 更新note3 为1的时间
									commercialInsuranceDAO.updateData(cInsuranceVO);
								} else {
									commercialInsuranceDAO.insertInsInfo(cInsuranceVO);
								}
								return null;
							}
						} else {
							return null;
						}
					} else {
						return null;
					}

				} else {
					// 发送请求网络出错
					return null;
				}
			}
		}
	}

	/**
	 * 发送post请求成功之后组装数据给前台并插入数据库 数据库字段note3 为2 的为续保数据
	 * 
	 * @throws Exception
	 */
	public List<CommercialInsuranceVO> reCommercialInsuranceVOs(RspBody rspBody) throws Exception {
		List<CommercialInsuranceVO> commercialInsuranceVOs = new ArrayList<>();
		// 根据U车商提供文档 返回数据说明 实体类 中RenewalBiz为 商业险信息 RenewalForce为 交强险信息
		Map<String, String> map2 = new HashMap<>();
		if (rspBody.getRelationList() != null) {
			if (rspBody.getRelationList().size() > 0) {
				for (RenewalRelation relation : rspBody.getRelationList()) {
					if (relation.getType() == 1) {
						map2.put("name", relation.getName());
						map2.put("phone", relation.getPhone());
					}
				}
			}
		}
		String frameNo = rspBody.getVehicleInfo().getFrameNo();
		String licenseNo = rspBody.getVehicleInfo().getLicenseNo();
		String icCode = rspBody.getIcCode();
		String icName = rspBody.getIcName();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 交强险数据组装 20191014 续保api变更
		CommercialInsuranceVO commercialInsuranceVO2 = new CommercialInsuranceVO();
		if (rspBody.getForceInfo() != null) {
			// VIN （ U车商api中车架号） frameNo;
			commercialInsuranceVO2.setVinNo(frameNo);
			// 车牌号
			commercialInsuranceVO2.setCarRegNo(licenseNo);
			// 保单号 policyNo;
			commercialInsuranceVO2.setPolicyNo(rspBody.getForceInfo().getPolicyNo());
			// 保险公司代码 icCode;
			commercialInsuranceVO2.setIcCode(icCode);
			// 保险公司名称 icName;
			commercialInsuranceVO2.setIcName(icName);
			// 险种（目前取的是险种代码） code;
			commercialInsuranceVO2.setCode(Code.getKeyByIndex("force"));
			// 保险开始日期
			if (rspBody.getForceInfo().getStartDate() != null) {
				commercialInsuranceVO2.setInsuranceStartDate(sdf.parse(rspBody.getForceInfo().getStartDate()));
			}
			// 保险结束日期
			if (rspBody.getForceInfo().getEndDate() != null) {
				commercialInsuranceVO2.setInsuranceEndDate(sdf.parse(rspBody.getForceInfo().getEndDate()));
			}
			if (map2.size() > 0) {
				// 车主 owner;
				commercialInsuranceVO2.setNote4(map2.get("name"));
				// 手机 phone;
				commercialInsuranceVO2.setNote5(map2.get("phone"));
			}
			// 保险金额 premium(交强险保费)
			commercialInsuranceVO2.setNote1(rspBody.getForceInfo().getPremium());
			// 保额（万元） tax（车船税金额）
			commercialInsuranceVO2.setNote2(rspBody.getForceInfo().getTax());
			commercialInsuranceVOs.add(commercialInsuranceVO2);
		}
		// 商业险数据组装
		List<CommercialInsuranceVO> bizList = new ArrayList<>();
		if (rspBody.getBizInfo() != null) {
			if (rspBody.getBizInfo().getSelectionList().size() > 0) {
				for (RenewalBizSelection renewalBizSelection : rspBody.getBizInfo().getSelectionList()) {
					CommercialInsuranceVO commercialInsuranceVO1 = new CommercialInsuranceVO();
					// VIN （ U车商api中车架号） frameNo;
					commercialInsuranceVO1.setVinNo(frameNo);
					// 车牌号
					commercialInsuranceVO1.setCarRegNo(licenseNo);
					// 保单号 policyNo;
					commercialInsuranceVO1.setPolicyNo(rspBody.getBizInfo().getPolicyNo());
					// 保险公司代码 icCode;
					commercialInsuranceVO1.setIcCode(icCode);
					// 保险公司名称 icName;
					commercialInsuranceVO1.setIcName(icName);
					// 险种（目前取的是险种代码） code;
					commercialInsuranceVO1.setCode(Code.getKeyByIndex(renewalBizSelection.getCode()));
					// 保险开始日期
					if (rspBody.getBizInfo().getStartDate()!=null) {
						commercialInsuranceVO1.setInsuranceStartDate(sdf.parse(rspBody.getBizInfo().getStartDate()));
					}
					// 保险结束日期
					if (rspBody.getBizInfo().getEndDate()!=null) {
						commercialInsuranceVO1.setInsuranceEndDate(sdf.parse(rspBody.getBizInfo().getEndDate()));
					}
					if (map2.size() > 0) {
						// 车主 owner;
						commercialInsuranceVO1.setNote4(map2.get("name"));
						// 手机 phone;
						commercialInsuranceVO1.setNote5(map2.get("phone"));
					}
					// 保险金额 premium(保费)
					commercialInsuranceVO1.setNote1(renewalBizSelection.getPremium());
					// 保额（万元） amount(保额)
					commercialInsuranceVO1.setNote2(renewalBizSelection.getAmount());
					commercialInsuranceVOs.add(commercialInsuranceVO1);
					bizList.add(commercialInsuranceVO1);
				}
			}
		}
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = sdf1.parse(DateFormatUtils.format(new Date(), "yyyy-MM-dd 00:00:00"));
		// 查询交强险保单
		if (rspBody.getForceInfo() != null) {
			CommercialInsuranceVO findCI2 = new CommercialInsuranceVO();
			findCI2.setCarRegNo(licenseNo);
			findCI2.setPolicyNo(rspBody.getForceInfo().getPolicyNo());
			findCI2.setNote3("2");
			int selectcontByCarNo1 = commercialInsuranceDAO.selectcontByCarNo(findCI2);
			if (selectcontByCarNo1 > 0) {
				// 更新数据
				commercialInsuranceVO2.setNote3("2");
				commercialInsuranceDAO.updateData(commercialInsuranceVO2);
			} else {
				commercialInsuranceVO2.setNote3("2");
				commercialInsuranceDAO.insertInsInfo(commercialInsuranceVO2);
			}
		}
		// 查询商业险保单数据
		if (bizList.size() > 0) {
			for (CommercialInsuranceVO commercialInsuranceVO : bizList) {
				int selectcontByCarNo = commercialInsuranceDAO.selectcontByCarNo(commercialInsuranceVO);
				if (selectcontByCarNo > 0) {
					commercialInsuranceVO.setNote3("2");
					commercialInsuranceDAO.updateData(commercialInsuranceVO);
				} else {
					commercialInsuranceVO.setNote3("2");
					commercialInsuranceDAO.insertInsInfo(commercialInsuranceVO);
				}
			}
		}
		return commercialInsuranceVOs;
	}

	/**
	 * 保险历史查询 数据库字段note3 为2 的为续保数据
	 * 
	 * @throws Exception
	 */
	@Override
	public List<CommercialInsuranceVO> sendPostReq(CommercialInsuranceVO commercialInsuranceVO) throws Exception {
		// 20190730 新需求 查询数据库表COMMERCIAL_INSURANCE
		return commercialInsuranceDAO.selectInfoByParams(commercialInsuranceVO);
	}

	/**
	 * 保险提醒（selectCustCarInfoMain.jsp页面） 数据库字段note3 为2 的为续保数据
	 * 20190826查询数据库是否有今日数据，没有发送post请求并新增今日数据，有数据的话使用历史表的数据返回。
	 * 
	 * @throws Exception
	 */
	@Override
	public List<CommercialInsuranceVO> insuranceExpires(CommercialInsuranceVO commercialInsuranceVO) throws Exception {
		DBMessageSourceSearchVO dbMessageSourceSearchVO = new DBMessageSourceSearchVO();
		dbMessageSourceSearchVO.setsMesgTxt(commercialInsuranceVO.getMesgTxt());
		List<DBMessageSourceVO> selectDBMessageSourcesByCondition = dbMessageSourceService
				.selectDBMessageSourcesByCondition(dbMessageSourceSearchVO);
		HashMap<String, String> typeMap = new HashMap<String, String>();
		if (selectDBMessageSourcesByCondition.size() > 0) {
			for (DBMessageSourceVO dbMessageSourceVO : selectDBMessageSourcesByCondition) {
				typeMap.put(dbMessageSourceVO.getLangCd(), dbMessageSourceVO.getMesgTxt());
			}
		}else {
			return null;
		}
		if (typeMap.size() > 0 && typeMap.get("zh") != null) {
			if (typeMap.get("zh").equals("维修委托")) {
				List<CommercialInsuranceVO> selectInfoBy = commercialInsuranceDAO.selectTypeByLicenseNo(commercialInsuranceVO);
				if (selectInfoBy.size() > 0) {
					if (selectInfoBy.get(0).getCarRegNo() != null) {
						commercialInsuranceVO.setLicenseNo(selectInfoBy.get(0).getCarRegNo());
						CommercialInsuranceVO findHistory = new CommercialInsuranceVO();
						findHistory.setCarRegNo(commercialInsuranceVO.getLicenseNo());
						SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						Date date = sdf1.parse(DateFormatUtils.format(new Date(), "yyyy-MM-dd 00:00:00"));
						findHistory.setSynchronizationDtStartStr(date);
						findHistory.setSynchronizationDtEndStr(date);
						findHistory.setNote3("2");
						List<CommercialInsuranceVO> selectInfoByParams = commercialInsuranceDAO.selectInfoByParams(findHistory);
						if (selectInfoByParams.size() > 0) {
							// 保险结束日期大于今日日期
							CommercialInsuranceVO returnVo = new CommercialInsuranceVO();
							returnVo.setNote3("2");
							returnVo.setCarRegNo(commercialInsuranceVO.getLicenseNo());
							//returnVo.setEndDateEndStr(date);20200409
							List<CommercialInsuranceVO> returnList = commercialInsuranceDAO.selectInfoByParams(returnVo);
							return returnList;
						} else {
							findHistory.setNote3("1");
							List<CommercialInsuranceVO> commercialInsuranceVOs = commercialInsuranceDAO
									.selectInfoByParams(findHistory);
							if (commercialInsuranceVOs.size() > 0) {
								return null;
							} else {

								// 20190910 续保查询业务场景
								if (typeMap.size() > 0 && typeMap.get("zh") != null) {
									commercialInsuranceVO.setMesgTxt(typeMap.get("zh"));
								}
								// post请求
								if (selectInfoBy.get(0).getZfnewsub() != null) {
									commercialInsuranceVO.setLicenseType("52");
								} else {
									commercialInsuranceVO.setLicenseType("02");
								}
								// 20190823 添加参数店代码 区别续保服务的渠道信息
								commercialInsuranceVO.setDlrCd(LoginUtil.getDlrCd());
								// 发送请求给微服务 微服务给U车商发请求返回数据
								HttpUtil httpUtil = new HttpUtil();
								net.sf.json.JSONObject jsonArray = net.sf.json.JSONObject.fromObject(commercialInsuranceVO);
								String param = jsonArray.toString();
								Properties ret = PropertiesLoaderUtils
										.loadProperties(new ClassPathResource("/config/common.properties"));
								System.out.println("uCheshangForwordUrl" + ret.getProperty("uCheshangForwordUrl")+"车牌号为"+commercialInsuranceVO.getLicenseNo());
								Map<String, Object> map = httpUtil.sendPost(ret.getProperty("uCheshangForwordUrl"), param,
										false);
								if (map.get("status").equals("200")) {
									List<CommercialInsuranceVO> commercialInsuranceVOs2 = new ArrayList<>();
									Object object = map.get("response");
									net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(object);
									Response response = (Response) net.sf.json.JSONObject.toBean(jsonObject, Response.class);
									if (response != null) {
										if (response.getRetCode().equals("000000")) {
											RspBody rspBody = com.alibaba.fastjson.JSONObject.parseObject(response.getRspBody(),
													RspBody.class);
											if (rspBody != null) {
												if (rspBody.getResultCode() != null) {
													if (rspBody.getResultCode().equals("200")) {
														// 根据U车商提供文档 返回数据说明 实体类 中RenewalBiz为 商业险信息 RenewalForce为 交强险信息
														Map<String, String> map2 = new HashMap<>();
														if (rspBody.getRelationList() != null) {
															if (rspBody.getRelationList().size() > 0) {
																for (RenewalRelation relation : rspBody.getRelationList()) {
																	if (relation.getType() == 1) {
																		map2.put("name", relation.getName());
																		map2.put("phone", relation.getPhone());
																	}
																}
															}
														}
														String frameNo = rspBody.getVehicleInfo().getFrameNo();
														String licenseNo = rspBody.getVehicleInfo().getLicenseNo();
														String icCode = rspBody.getIcCode();
														String icName = rspBody.getIcName();
														SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
														// 交强险数据组装
														if (rspBody.getForceInfo() != null) {
															// 判断保险结束日期是否大于今日日期
															//20200402 修改bug（因为壁虎会返回空的生产日期结束日期）
															if(rspBody.getForceInfo().getEndDate()!=null) {
																//if (date.after(sdf.parse(rspBody.getForceInfo().getEndDate()))) {
																	// 20200402 今日日期在保险结束日期后面
																	//System.out.println("交强险当前日期"+date+"保险结束日期:"+rspBody.getForceInfo().getEndDate());
																	CommercialInsuranceVO commercialInsuranceVO2 = new CommercialInsuranceVO();
																	commercialInsuranceVO2.setVinNo(frameNo);
																	commercialInsuranceVO2.setCarRegNo(licenseNo);
																	commercialInsuranceVO2.setCode(Code.getKeyByIndex("force"));
																	commercialInsuranceVO2
																			.setIcCode(rspBody.getForceInfo().getIcCode());
																	commercialInsuranceVO2
																			.setIcName(rspBody.getForceInfo().getIcName());
																	commercialInsuranceVO2
																			.setPolicyNo(rspBody.getForceInfo().getPolicyNo());
																	if (rspBody.getForceInfo().getStartDate() != null) {
																		commercialInsuranceVO2.setInsuranceStartDate(
																				sdf.parse(rspBody.getForceInfo().getStartDate()));
																	}
																	if (rspBody.getForceInfo().getEndDate() != null) {
																		commercialInsuranceVO2.setInsuranceEndDate(
																				sdf.parse(rspBody.getForceInfo().getEndDate()));
																	}
																	if (map2.size() > 0) {
																		// 车主 owner;
																		commercialInsuranceVO2.setNote4(map2.get("name"));
																		// 手机 phone;
																		commercialInsuranceVO2.setNote5(map2.get("phone"));
																	}
																	// 保险金额 premium(交强险保费)
																	commercialInsuranceVO2
																			.setNote1(rspBody.getForceInfo().getPremium());
																	// 保额（万元） tax（车船税金额）
																	commercialInsuranceVO2
																			.setNote2(rspBody.getForceInfo().getTax());
																	commercialInsuranceVOs2.add(commercialInsuranceVO2);
																//}
															}else {
																//保险结束日期和开始日期为null 20200409 不返回数据
															}
														}
														// 商业险数据组装
														if (rspBody.getBizInfo() != null) {
															if (rspBody.getBizInfo().getSelectionList().size() > 0) {
																if (rspBody.getBizInfo().getEndDate()!=null) {
																	//if (date.after(sdf.parse(rspBody.getBizInfo().getEndDate()))) {
																		// 今日日期在保险结束日期后面
																		//System.out.println("商业险当前日期"+date+"保险结束日期:"+rspBody.getBizInfo().getEndDate());
																		for (RenewalBizSelection relation : rspBody.getBizInfo()
																				.getSelectionList()) {
																			CommercialInsuranceVO commercialInsuranceVO1 = new CommercialInsuranceVO();
																			// VIN （ U车商api中车架号） frameNo;
																			commercialInsuranceVO1.setVinNo(frameNo);
																			// 车牌号
																			commercialInsuranceVO1.setCarRegNo(licenseNo);
																			// 保单号 policyNo;
																			commercialInsuranceVO1.setPolicyNo(
																					rspBody.getBizInfo().getPolicyNo());
																			// 保险公司代码 icCode;
																			commercialInsuranceVO1.setIcCode(icCode);
																			// 保险公司名称 icName;
																			commercialInsuranceVO1.setIcName(icName);
																			// 险种（目前取的是险种代码） code;
																			commercialInsuranceVO1.setCode(
																					Code.getKeyByIndex(relation.getCode()));
																			// 保险开始日期
																			if (rspBody.getBizInfo().getStartDate() != null) {
																				commercialInsuranceVO1
																						.setInsuranceStartDate(sdf.parse(rspBody
																								.getBizInfo().getStartDate()));
																			}
																			// 保险结束日期
																			if (rspBody.getBizInfo().getEndDate() != null) {
																				commercialInsuranceVO1.setInsuranceEndDate(sdf
																						.parse(rspBody.getBizInfo().getEndDate()));
																			}
																			if (map2.size() > 0) {
																				// 车主 owner;
																				commercialInsuranceVO1.setNote4(map2.get("name"));
																				// 手机 phone;
																				commercialInsuranceVO1.setNote5(map2.get("phone"));
																			}
																			// 保险金额 premium(保费)
																			commercialInsuranceVO1.setNote1(relation.getPremium());
																			// 保额（万元） amount(保额)
																			commercialInsuranceVO1.setNote2(relation.getAmount());
																			commercialInsuranceVOs2.add(commercialInsuranceVO1);
																		}
																	//}
																}
																
															}
														}

														// 执行插入或更新数据
														List<CommercialInsuranceVO> reCommercialInsuranceVOs = this
																.reCommercialInsuranceVOs(rspBody);
														return commercialInsuranceVOs2;
													} else {
														//20200326   resultCode":"300","errorMsg":"未取到上年续保信息，请确认到期时间和险种"  "resultCode":"250","errorMsg":"需要完善行驶证信息（车辆信息和险种都没有获取到）"
														CommercialInsuranceVO cInsuranceVO = new CommercialInsuranceVO();
														cInsuranceVO.setCarRegNo(commercialInsuranceVO.getLicenseNo());
														cInsuranceVO.setNote3("1");
														int selectcontByCarNo1 = commercialInsuranceDAO.selectcontByCarNo(cInsuranceVO);
														if (selectcontByCarNo1 > 0) {
															// 更新note3 为1的时间
															commercialInsuranceDAO.updateData(cInsuranceVO);
														} else {
															commercialInsuranceDAO.insertInsInfo(cInsuranceVO);
														}
														return null;
													}
												} else {
													return null;
												}
											} else {
												// 没有返回续保信息或者商户未开通
												System.out.println("rspBody实体为null");
												commercialInsuranceDAO.insertInsInfo(findHistory);
												return null;
											}
										} else {
											return null;
										}
									} else {
										return null;
									}
								} else {
									// 发送请求网络出错
									return null;
								}
							}
						}
					} else {
						// 车牌号为null 不发送请求
						return null;
					}
				} else {
					// 根据vin号查询不到数据
					return null;
				}
			}else {
				return null;
			}
		}else {
			return null;
		}
	}

	// 保险历史界面下载excel
	@Override
	public void initJxlsContext(Context context, HMap params) throws Exception {
		// TODO Auto-generated method stub
		CommercialInsuranceVO commercialInsuranceVO = new CommercialInsuranceVO();
		if (!StringUtils.isBlank(params.get("startDateStartStr").toString())) {
			String startDateStartStr = params.get("startDateStartStr").toString();
			Date date = DateUtil.convertToDate(startDateStartStr);
			commercialInsuranceVO.setStartDateStartStr(date);
		}

		if (!StringUtils.isBlank(params.get("startDateEndStr").toString())) {
			String startDateEndStr = params.get("startDateEndStr").toString();
			Date date = DateUtil.convertToDate(startDateEndStr);
			commercialInsuranceVO.setStartDateEndStr(date);
		}

		if (!StringUtils.isBlank(params.get("synchronizationDtStartStr").toString())) {
			String synchronizationDtStartStr = params.get("synchronizationDtStartStr").toString();
			Date date = DateUtil.convertToDate(synchronizationDtStartStr);
			commercialInsuranceVO.setSynchronizationDtStartStr(date);
		}

		if (!StringUtils.isBlank(params.get("synchronizationDtEndStr").toString())) {
			String synchronizationDtEndStr = params.get("synchronizationDtEndStr").toString();
			Date date = DateUtil.convertToDate(synchronizationDtEndStr);
			commercialInsuranceVO.setSynchronizationDtEndStr(date);
		}

		// 20190904 bug excel下载没有过滤无效数据
		commercialInsuranceVO.setNote3("2");
		ObjectUtil.convertMapToObject(params, commercialInsuranceVO, "beanName", "templateFile", "fileName");
		List<CommercialInsuranceVO> selectInfoByParams = commercialInsuranceDAO
				.selectInfoByParams(commercialInsuranceVO);
		context.putVar("items", selectInfoByParams);
	}

}
