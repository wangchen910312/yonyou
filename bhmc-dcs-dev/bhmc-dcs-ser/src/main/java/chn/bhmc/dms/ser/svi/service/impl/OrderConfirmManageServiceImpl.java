package chn.bhmc.dms.ser.svi.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.OrderConfirmManageService;
import chn.bhmc.dms.ser.svi.service.dao.OrderConfirmManageDAO;
import chn.bhmc.dms.ser.svi.vo.FindAllCarlineAndPcDstinSaveVO;
import chn.bhmc.dms.ser.svi.vo.FindAllCarlineAndPcDstinVO;
import chn.bhmc.dms.ser.svi.vo.FindAllDlrSearchVO;
import chn.bhmc.dms.ser.svi.vo.FindAllDlrVO;
import chn.bhmc.dms.ser.svi.vo.OfficeTableVO;
import chn.bhmc.dms.ser.svi.vo.RegionTableVO;

/**
 * <pre>
 * 工单确认条件设置Service层实现类
 * </pre>
 *
 * @ClassName   : OrderConfirmManageServiceImpl.java
 * @Description : 
 * @author chen shengan
 * @since 2021. 04. 01
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 01   chen shengan       工单确认条件设置Service层实现类
 * </pre>
 */
@Service("orderConfirmManageService")
public class OrderConfirmManageServiceImpl extends HService implements OrderConfirmManageService, JxlsSupport {

	@Resource(name = "orderConfirmManageDAO")
	OrderConfirmManageDAO orderConfirmManageDAO;
	
	@Resource(name = "commonCodeService")
	CommonCodeService commonCodeService;
	
	
	@Override
	public void initJxlsContext(Context context, HMap params) throws Exception {
		// TODO Auto-generated method stub
		
	}

	/**
     * 查询所有区域信息
     *
     * @param offCd 
     * @return RegionTableVO 
     */
	@Override
	public List<RegionTableVO> findRegion(String offCd) throws Exception {
		return orderConfirmManageDAO.findRegion(offCd);
	}

	/**
     * 查询所有办事处信息
     *
     * @param diviCd 
     * @return OfficeTableVO 
     */
	@Override
	public List<OfficeTableVO> findOffice(String diviCd) throws Exception {
		return orderConfirmManageDAO.findOffice(diviCd);
	}

	/**
     * 查询所有经销商信息
     *
     * @param findAllDlrSearchVO 
     * @return FindAllDlrVO 
     */
	@Override
	public List<FindAllDlrVO> findAllDlr(FindAllDlrSearchVO findAllDlrSearchVO) throws Exception {
		return orderConfirmManageDAO.findAllDlr(findAllDlrSearchVO);
	}

	/**
     * 查询所有经销商数量
     *
     * @param findAllDlrSearchVO 
     * @return int 
     */
	@Override
	public int findAllDlrCnt(FindAllDlrSearchVO findAllDlrSearchVO) throws Exception {
		return orderConfirmManageDAO.findAllDlrCnt(findAllDlrSearchVO);
	}

	/**
     * 查询所有车辆用途信息
     *
     * @param sLangCd 
     * @return FindAllCarlineAndPcDstinVO 
     */
	@Override
	public List<FindAllCarlineAndPcDstinVO> findAllPcDstin() throws Exception {
		String sLangCd = LocaleContextHolder.getLocale().getLanguage();
		String userId = LoginUtil.getUserId();
		List<FindAllCarlineAndPcDstinVO> findAllCarlineAndPcDstinVOList = orderConfirmManageDAO.findAllPcDstinConditionSetting(sLangCd); // 查询全网车辆用途确认条件设置表数据
		List<CommonCodeVO> commonCodeVOList = commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, sLangCd); // 查询所有车辆用途
		Boolean bool = false;
		for (CommonCodeVO codeVo : commonCodeVOList){ // 循环车辆用途
			bool = true;
			if (findAllCarlineAndPcDstinVOList.size() != 0){ // 判断全网车辆用途确认条件设置表数据是否为空
				for (FindAllCarlineAndPcDstinVO pcDstinVo : findAllCarlineAndPcDstinVOList){ // 循环全网车辆用途确认条件设置表数据
					if (codeVo.getCmmCd().equals(pcDstinVo.getPcDstinCd())){ // 判断全网车辆用途确认条件设置表数据是否包含所有车辆用途
						bool = false;
						break;
					}
				}
			}else{
				bool = true;
			}
			if (bool){ // 新增车辆用途确认条件设置表数据
				Map<String, String> map = new HashMap<>();
				map.put("pcDstinCd", codeVo.getCmmCd());
				map.put("useYn", "N");
				map.put("userId", userId);
				orderConfirmManageDAO.addAllPcDstinConditionSetting(map);
			}
		}
		return orderConfirmManageDAO.findAllPcDstinConditionSetting(sLangCd);
	}

	/**
     * 查询所有车种信息
     *
     * @param findAllDlrSearchVO 
     * @return FindAllCarlineAndPcDstinVO 
     */
	@Override
	public List<FindAllCarlineAndPcDstinVO> findAllCarline(FindAllDlrSearchVO findAllDlrSearchVO) throws Exception {
		Boolean bool = false;
		String userId = LoginUtil.getUserId();
		List<FindAllCarlineAndPcDstinVO> allCarlineList = orderConfirmManageDAO.findAllCarline(findAllDlrSearchVO); // 查询所有车种信息
		List<FindAllCarlineAndPcDstinVO> findAllCarlineAndPcDstinVOList = orderConfirmManageDAO.findAllCarlineConditionSetting(findAllDlrSearchVO); // 查询全网车种确认条件设置信息
		for (FindAllCarlineAndPcDstinVO carline : allCarlineList){ // 循环车种信息
			bool = true;
			if (findAllCarlineAndPcDstinVOList.size() != 0){ // 判断全网车种确认条件设置表数据是否为空
				for (FindAllCarlineAndPcDstinVO carlineConditionSetting : findAllCarlineAndPcDstinVOList){ // 循环全网车种确认条件设置表数据
					if (carline.getCarlineCd().equals(carlineConditionSetting.getCarlineCd())){ // 判断全网车种确认条件设置数据是否包含所有车种
						bool = false;
						break;
					}
				}
			}else {
				bool = true;
			}
			
			if (bool){ // 新增全网车种确认条件设置数据
				Map<String, String> map = new HashMap<>();
				map.put("carlineCd", carline.getCarlineCd());
				map.put("useYn", "N");
				map.put("userId", userId);
				orderConfirmManageDAO.addAllCarlineConditionSetting(map);
			}
		}
		return orderConfirmManageDAO.findAllCarlineConditionSetting(findAllDlrSearchVO);
	}
	
	/**
     * 根据经销商代码查询所有车辆用途信息
     *
     * @param sLangCd 
     * @return FindAllCarlineAndPcDstinVO 
     */
	@Override
	public List<FindAllCarlineAndPcDstinVO> findPcDstinByDlr(FindAllDlrSearchVO findAllDlrSearchVO) throws Exception {
		String sLangCd = LocaleContextHolder.getLocale().getLanguage();
		String userId = LoginUtil.getUserId();
		findAllDlrSearchVO.setsLangCd(sLangCd);
		List<FindAllCarlineAndPcDstinVO> findAllCarlineAndPcDstinVOList = orderConfirmManageDAO.findPcDstinConditionSettingByDlr(findAllDlrSearchVO); // 根据经销商代码查询车辆用途确认条件设置
		List<CommonCodeVO> commonCodeVOList = commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, sLangCd); // 查询所有车辆用途
		Boolean bool = false;
		for (CommonCodeVO codeVo : commonCodeVOList){ // 循环所有车辆用途
			bool = true;
			if (findAllCarlineAndPcDstinVOList.size() != 0){ // 判断该经销商的车辆用途确认条件设置表数据是否为空
				for (FindAllCarlineAndPcDstinVO pcDstinVo : findAllCarlineAndPcDstinVOList){
					if (codeVo.getCmmCd().equals(pcDstinVo.getPcDstinCd())){ // 判断该经销商车辆用途确认条件设置是否包含所有车辆用途
						bool = false;
						break;
					}
				}
			}else{
				bool = true;
			}
			if (bool){ // 新增该经销商车辆用途确认条件设置
				Map<String, String> map = new HashMap<>();
				map.put("dlrCd", findAllDlrSearchVO.getDlrCd());
				map.put("pcDstinCd", codeVo.getCmmCd());
				map.put("useYn", "N");
				map.put("userId", userId);
				orderConfirmManageDAO.addDlrPcDstinConditionSetting(map);
			}
		}
		return orderConfirmManageDAO.findPcDstinConditionSettingByDlr(findAllDlrSearchVO);
	}

	/**
     * 根据经销商代码查询所有车种信息
     *
     * @param findAllDlrSearchVO 
     * @return FindAllCarlineAndPcDstinVO 
     */
	@Override
	public List<FindAllCarlineAndPcDstinVO> findCarlineByDlr(FindAllDlrSearchVO findAllDlrSearchVO) throws Exception {
		String userId = LoginUtil.getUserId();
		List<FindAllCarlineAndPcDstinVO> allCarlineList = orderConfirmManageDAO.findAllCarline(findAllDlrSearchVO); // 查询所有车种信息
		List<FindAllCarlineAndPcDstinVO> allCarlineConditionSettingList = orderConfirmManageDAO.findCarlineConditionSettingByDlr(findAllDlrSearchVO); // 根据经销商代码查询车种确认条件设置
		Boolean bool = false;
		for (FindAllCarlineAndPcDstinVO carline : allCarlineList){ // 循环所有车种信息
			bool = true;
			if (allCarlineConditionSettingList.size() != 0){ // 判断该经销商车种确认条件设置表数据是否为空
				for (FindAllCarlineAndPcDstinVO carlineConditionSetting : allCarlineConditionSettingList){
					if (carline.getCarlineCd().equals(carlineConditionSetting.getCarlineCd())){ // 判断该经销商车种确认条件设置是否包含所有车种
						bool = false;
						break;
					}
				}
			}else {
				bool = true;
			}
			
			if (bool){ // 新增该经销商车种确认条件设置信息
				Map<String, String> map = new HashMap<>();
				map.put("dlrCd", findAllDlrSearchVO.getDlrCd());
				map.put("carlineCd", carline.getCarlineCd());
				map.put("useYn", "N");
				map.put("userId", userId);
				orderConfirmManageDAO.addDlrCarlineConditionSetting(map);
			}
		}
		return orderConfirmManageDAO.findCarlineConditionSettingByDlr(findAllDlrSearchVO);
	}

	/**
     * 根据经销商代码修改工单确认条件
     * @param 
     * @return Boolean
     */
	@Override
	public Boolean updateOrderConfirmByDlr(FindAllCarlineAndPcDstinSaveVO saveVo) throws Exception {
		List<FindAllCarlineAndPcDstinVO> findAllCarlineAndPcDstinVOList = saveVo.getUpdateList(); 
		String dlrCd = saveVo.getDlrCd();
		String userId = LoginUtil.getUserId();
		List<FindAllCarlineAndPcDstinVO> updateToYesList = new ArrayList<>();
		List<FindAllCarlineAndPcDstinVO> updateToNoList = new ArrayList<>();
		for (FindAllCarlineAndPcDstinVO findAllCarlineAndPcDstinVO : findAllCarlineAndPcDstinVOList){
			if (findAllCarlineAndPcDstinVO.getUseYn().equals("Y")){
				updateToYesList.add(findAllCarlineAndPcDstinVO);
			}else{
				updateToNoList.add(findAllCarlineAndPcDstinVO);
			}
		}
		if (updateToYesList.size() > 0 && saveVo.getUpdateType().equals("pcDstin")){
			// 根据经销商车辆用途修改工单确认条件为是（Y）
			orderConfirmManageDAO.updateDlrPcDstinConditionSetting(updateToYesList, dlrCd, "Y", userId);
		}
		if (updateToNoList.size() > 0 && saveVo.getUpdateType().equals("pcDstin")){
			// 根据经销商车辆用途修改工单确认条件为否（N）
			orderConfirmManageDAO.updateDlrPcDstinConditionSetting(updateToNoList, dlrCd, "N", userId);
		}
		if (updateToYesList.size() > 0 && saveVo.getUpdateType().equals("carline")){
			// 根据经销商车种信息修改工单确认条件为是（Y）
			orderConfirmManageDAO.updateDlrCarlineConditionSetting(updateToYesList, dlrCd, "Y", userId);
		}
		if (updateToNoList.size() > 0 && saveVo.getUpdateType().equals("carline")){
			// 根据经销商车种信息修改工单确认条件为否（N）
			orderConfirmManageDAO.updateDlrCarlineConditionSetting(updateToNoList, dlrCd, "N", userId);
		}
		return null;
	}

	/**
     * 修改全网工单确认条件设置
     * @param 
     * @return Boolean
     */
	@Override
	public Boolean updateAllOrderConfirm(FindAllCarlineAndPcDstinSaveVO saveVo) throws Exception {
		String sLangCd = LocaleContextHolder.getLocale().getLanguage();
		String updateType = saveVo.getUpdateType(); // 修改类型 pcDtin：车辆用途，carline：车种
		String userId = LoginUtil.getUserId();
		List<FindAllCarlineAndPcDstinVO> findAllCarlineAndPcDstinVOList = new ArrayList<>();
		List<FindAllCarlineAndPcDstinVO> updateList = saveVo.getUpdateList();
		List<FindAllCarlineAndPcDstinVO> updateToYesList = new ArrayList<>();
		List<FindAllCarlineAndPcDstinVO> updateToNoList = new ArrayList<>();
		List<FindAllCarlineAndPcDstinVO> deleteList = new ArrayList<>();
		Boolean bool = false;
		if (updateType.equals("pcDstin")){ // 查询全网车辆用途确认条件设置表数据
			findAllCarlineAndPcDstinVOList = orderConfirmManageDAO.findAllPcDstinConditionSetting(sLangCd);
		}
		if (updateType.equals("carline")){ // 查询全网车种确认条件设置表数据
			findAllCarlineAndPcDstinVOList = orderConfirmManageDAO.findAllCarlineConditionSetting(null);
		}
		for (FindAllCarlineAndPcDstinVO updateVo : updateList){ // 循环前端页面上选中的工单确认条件设置
			bool = false;
			for (FindAllCarlineAndPcDstinVO findAllCarlineAndPcDstinVO : findAllCarlineAndPcDstinVOList){
				// 判断全网车种确认条件设置是否修改过
				if (updateType.equals("carline") && updateVo.getCarlineCd().equals(findAllCarlineAndPcDstinVO.getCarlineCd()) 
						&& !updateVo.getUseYn().equals(findAllCarlineAndPcDstinVO.getUseYn())){
					bool = true;
					break;
				}
				// 判断全网车辆用途确认条件设置是否修改过
				if (updateType.equals("pcDstin") && updateVo.getPcDstinCd().equals(findAllCarlineAndPcDstinVO.getPcDstinCd()) 
						&& !updateVo.getUseYn().equals(findAllCarlineAndPcDstinVO.getUseYn())){
					bool = true;
					break;
				}
			}
			if (bool){
				if (updateVo.getUseYn().equals("Y")){ // 将修改为是（Y）工单确认条件设置加入集合
					updateToYesList.add(updateVo);
				}else if (updateVo.getUseYn().equals("N")){ // 将修改为是（N）工单确认条件设置加入集合
					updateToNoList.add(updateVo);
				}
				deleteList.add(updateVo); // 将所有修改过的工单确认条件设置加入集合
			}
		}
		if (deleteList.size() == 0){ // 判断全网工单确认设置是否有修改
			return false;
		}
		if (updateToYesList.size() > 0 && updateType.equals("pcDstin")){
			// 根据车辆用途修改全网工单确认条件为是（Y）
			orderConfirmManageDAO.updateAllPcDstinConditionSetting(updateToYesList, "Y", userId);
		}
		if (updateToNoList.size() > 0 && updateType.equals("pcDstin")){
			// 根据车辆用途修改全网工单确认条件为否（N）
			orderConfirmManageDAO.updateAllPcDstinConditionSetting(updateToNoList, "N", userId);
		}
		if (updateToYesList.size() > 0 && updateType.equals("carline")){
			// 根据车种信息修改全网工单确认条件为是（Y）
			orderConfirmManageDAO.updateAllCarlineConditionSetting(updateToYesList, "Y", userId);
		}
		if (updateToNoList.size() > 0 && updateType.equals("carline")){
			// 根据车种信息修改全网工单确认条件为否（N）
			orderConfirmManageDAO.updateAllCarlineConditionSetting(updateToNoList, "N", userId);
		}
		if (updateType.equals("carline")){
			// 根据全网车种确认条件信息删除经销商确认条件设置信息
			orderConfirmManageDAO.deleteDlrCarlineConditionSettingByAll(deleteList);
		}
		if (updateType.equals("pcDstin")){
			// 根据全网车辆用途确认条件信息删除经销商确认条件设置信息
			orderConfirmManageDAO.deleteDlrPcDstinConditionSettingByAll(deleteList);
		}
		
		List<FindAllDlrVO> findAllDlrVOList = orderConfirmManageDAO.findAllDlr(new FindAllDlrSearchVO()); // 查询所有经销商信息
		FindAllCarlineAndPcDstinVO addVo = new FindAllCarlineAndPcDstinVO();
		List<FindAllCarlineAndPcDstinVO> addVoList = new ArrayList<>();
		for (FindAllDlrVO dlrVo : findAllDlrVOList){
			for (FindAllCarlineAndPcDstinVO vo : deleteList){ // 循环所有修改过的工单确认条件设置信息
				if (updateType.equals("carline")){
					// 将全网车种确认设置信息加入集合
					addVo = new FindAllCarlineAndPcDstinVO();
					addVo.setDlrCd(dlrVo.getDlrCd());
					addVo.setCarlineCd(vo.getCarlineCd());
					addVo.setUseYn(vo.getUseYn());
					addVo.setUserId(userId);
					addVoList.add(addVo);
				}
				if (updateType.equals("pcDstin")){
					// 将全网车辆用途确认设置信息加入集合
					addVo = new FindAllCarlineAndPcDstinVO();
					addVo.setDlrCd(dlrVo.getDlrCd());
					addVo.setPcDstinCd(vo.getPcDstinCd());
					addVo.setUseYn(vo.getUseYn());
					addVo.setUserId(userId);
					addVoList.add(addVo);
				}
			}
		}
		if (updateType.equals("carline")){
			// 根据全网车种确认设置信息更新所有经销商
			orderConfirmManageDAO.addAllDlrCarlineConditionSetting(addVoList);
		}
		if (updateType.equals("pcDstin")){
			// 根据全网车辆用途确认设置信息更新所有经销商
			orderConfirmManageDAO.addAllDlrPcDstinConditionSetting(addVoList);
		}
		return true;
	}

	/**
     * 查询所有车种信息数量
     *
     * @param findAllDlrSearchVO 
     * @return 
     */
	@Override
	public int findAllCarlineCnt(FindAllDlrSearchVO findAllDlrSearchVO) throws Exception {
		return orderConfirmManageDAO.findAllCarlineConditionSettingCnt(findAllDlrSearchVO);
	}

	/**
     * 根据经销商代码查询所有车种信息数量
     *
     * @param findAllDlrSearchVO 
     * @return 
     */
	@Override
	public int findCarlineCntByDlr(FindAllDlrSearchVO findAllDlrSearchVO) throws Exception {
		return orderConfirmManageDAO.findCarlineConditionSettingCntByDlr(findAllDlrSearchVO);
	}


}
