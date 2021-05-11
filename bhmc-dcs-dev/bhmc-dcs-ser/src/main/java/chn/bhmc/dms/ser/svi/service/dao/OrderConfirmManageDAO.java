package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.ser.svi.vo.FindAllCarlineAndPcDstinVO;
import chn.bhmc.dms.ser.svi.vo.FindAllDlrSearchVO;
import chn.bhmc.dms.ser.svi.vo.FindAllDlrVO;
import chn.bhmc.dms.ser.svi.vo.OfficeTableVO;
import chn.bhmc.dms.ser.svi.vo.RegionTableVO;

/**
 * <pre>
 * 工单确认条件设置DAO层
 * </pre>
 *
 * @ClassName   : OrderConfirmManageDAO.java
 * @Description : OrderConfirmManage  DAO
 * @author chen shengan
 * @since 2021. 04. 01
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 01   chen shengan       工单确认条件设置DAO层
 * </pre>
 */
@Mapper("orderConfirmManageDAO")
public interface OrderConfirmManageDAO {

	/**
     * 查询所有区域信息
     *
     * @param offCd 办事处代码，可为空
     * @return RegionTableVO 区域信息
     */
	public List<RegionTableVO> findRegion(String offCd) throws Exception;
	
	/**
     * 查询所有办事处信息
     *
     * @param diviCd 区域代码，可为空
     * @return OfficeTableVO 办事处信息
     */
	public List<OfficeTableVO> findOffice(String diviCd) throws Exception;
	
	/**
     * 查询所有经销商信息
     *
     * @param findAllDlrSearchVO 
     * @return FindAllDlrVO 经销商信息
     */
	public List<FindAllDlrVO> findAllDlr(FindAllDlrSearchVO findAllDlrSearchVO) throws Exception;
	
	/**
     * 查询所有经销商数量
     *
     * @param findAllDlrSearchVO 
     * @return int 所有经销商数量
     */
	public int findAllDlrCnt(FindAllDlrSearchVO findAllDlrSearchVO) throws Exception;
	
	/**
     * 查询所有车种
     *
     * @param findAllDlrSearchVO 
     * @return FindAllCarlineAndPcDstinVO 所有车种信息
     */
	public List<FindAllCarlineAndPcDstinVO> findAllCarline(FindAllDlrSearchVO findAllDlrSearchVO) throws Exception;
	
	/**
     * 新增经销商车种条件设置信息
     *
     * @param 
     * @return 
     */
	public int addDlrCarlineConditionSetting(Map<String, String> map) throws Exception;
	
	/**
     * 新增经销商车辆用途条件设置信息
     *
     * @param 
     * @return 
     */
	public int addDlrPcDstinConditionSetting(Map<String, String> map) throws Exception;
	
	/**
     * 新增全网经销商车种条件设置信息
     *
     * @param 
     * @return 
     */
	public int addAllDlrCarlineConditionSetting(@Param("list")List<FindAllCarlineAndPcDstinVO> list) throws Exception;
	
	/**
     * 新增全网经销商车辆用途条件设置信息
     *
     * @param 
     * @return 
     */
	public int addAllDlrPcDstinConditionSetting(@Param("list")List<FindAllCarlineAndPcDstinVO> list) throws Exception;
	
	/**
     * 新增全网车种条件设置信息
     *
     * @param 
     * @return 
     */
	public int addAllCarlineConditionSetting(Map<String, String> map) throws Exception;
	
	/**
     * 新增全网车辆用途条件设置信息
     *
     * @param 
     * @return 
     */
	public int addAllPcDstinConditionSetting(Map<String, String> map) throws Exception;
	
	/**
     * 根据全网车辆用途确认条件信息删除经销商确认条件设置信息
     *
     * @param 
     * @return 
     */
	public int deleteDlrPcDstinConditionSettingByAll(@Param("list")List<FindAllCarlineAndPcDstinVO> list) throws Exception;
	
	/**
     * 根据全网车种确认条件信息删除经销商确认条件设置信息
     *
     * @param 
     * @return 
     */
	public int deleteDlrCarlineConditionSettingByAll(@Param("list")List<FindAllCarlineAndPcDstinVO> list) throws Exception;
	
	/**
     * 查询所有车辆用途条件设置信息
     *
     * @param sLangCd 
     * @return FindAllCarlineAndPcDstinVO 所有车辆用途信息
     */
	public List<FindAllCarlineAndPcDstinVO> findAllPcDstinConditionSetting(String sLangCd) throws Exception;
	
	/**
     * 查询所有车种条件设置信息
     *
     * @param findAllDlrSearchVO 
     * @return FindAllCarlineAndPcDstinVO 所有车种信息
     */
	public List<FindAllCarlineAndPcDstinVO> findAllCarlineConditionSetting(FindAllDlrSearchVO findAllDlrSearchVO) throws Exception;
	
	/**
     * 查询所有车种条件设置信息数量
     *
     * @param findAllDlrSearchVO 
     * @return FindAllCarlineAndPcDstinVO 所有车种信息
     */
	public int findAllCarlineConditionSettingCnt(FindAllDlrSearchVO findAllDlrSearchVO) throws Exception;
	
	/**
     * 根据经销商代码查询所有车辆用途条件设置信息
     *
     * @param sLangCd 
     * @return FindAllCarlineAndPcDstinVO 所有车辆用途信息
     */
	public List<FindAllCarlineAndPcDstinVO> findPcDstinConditionSettingByDlr(FindAllDlrSearchVO findAllDlrSearchVO) throws Exception;
	
	/**
     * 根据经销商代码查询所有车种条件设置信息
     *
     * @param findAllDlrSearchVO 
     * @return FindAllCarlineAndPcDstinVO 所有车种信息
     */
	public List<FindAllCarlineAndPcDstinVO> findCarlineConditionSettingByDlr(FindAllDlrSearchVO findAllDlrSearchVO) throws Exception;
	
	/**
     * 根据经销商代码查询所有车种条件设置信息数量
     *
     * @param findAllDlrSearchVO 
     * @return 
     */
	public int findCarlineConditionSettingCntByDlr(FindAllDlrSearchVO findAllDlrSearchVO) throws Exception;
	
	/**
     * 根据经销商车辆用途修改工单确认条件
     * @param 
     * @return Boolean
     */
	public int updateDlrPcDstinConditionSetting (@Param("list")List<FindAllCarlineAndPcDstinVO> list, @Param("dlrCd")String dlrCd, @Param("useYn")String useYn, @Param("userId")String userId) throws Exception;
	
	/**
     * 根据经销商车种信息修改工单确认条件
     * @param 
     * @return Boolean
     */
	public int updateDlrCarlineConditionSetting (@Param("list")List<FindAllCarlineAndPcDstinVO> list, @Param("dlrCd")String dlrCd, @Param("useYn")String useYn, @Param("userId")String userId) throws Exception;
	
	/**
     * 根据车辆用途修改全网工单确认条件
     * @param 
     * @return Boolean
     */
	public int updateAllPcDstinConditionSetting (@Param("list")List<FindAllCarlineAndPcDstinVO> list, @Param("useYn")String useYn, @Param("userId")String userId) throws Exception;
	
	/**
     * 根据车种信息修改全网工单确认条件为是（Y）
     * @param 
     * @return Boolean
     */
	public int updateAllCarlineConditionSetting (@Param("list")List<FindAllCarlineAndPcDstinVO> list, @Param("useYn")String useYn, @Param("userId")String userId) throws Exception;
	
}
