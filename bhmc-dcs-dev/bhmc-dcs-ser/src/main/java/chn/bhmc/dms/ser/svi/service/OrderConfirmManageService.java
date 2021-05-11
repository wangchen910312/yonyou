package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.ser.svi.vo.FindAllCarlineAndPcDstinSaveVO;
import chn.bhmc.dms.ser.svi.vo.FindAllCarlineAndPcDstinVO;
import chn.bhmc.dms.ser.svi.vo.FindAllDlrSearchVO;
import chn.bhmc.dms.ser.svi.vo.FindAllDlrVO;
import chn.bhmc.dms.ser.svi.vo.OfficeTableVO;
import chn.bhmc.dms.ser.svi.vo.RegionTableVO;

/**
 * <pre>
 * 工单确认条件设置Service层
 * </pre>
 *
 * @ClassName   : OrderConfirmManageService.java
 * @Description : OrderConfirmManage  Service
 * @author chen shengan
 * @since 2021. 04. 01
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 01   chen shengan       工单确认条件设置Service层
 * </pre>
 */
public interface OrderConfirmManageService {

	/**
     * 查询所有区域信息
     *
     * @param offCd 
     * @return RegionTableVO 
     */
	public List<RegionTableVO> findRegion (String offCd) throws Exception;
	
	/**
     * 查询所有办事处信息
     *
     * @param diviCd 
     * @return OfficeTableVO 
     */
	public List<OfficeTableVO> findOffice (String diviCd) throws Exception;
	
	/**
     * 查询所有经销商信息
     *
     * @param findAllDlrSearchVO 
     * @return FindAllDlrVO 
     */
	public List<FindAllDlrVO> findAllDlr (FindAllDlrSearchVO findAllDlrSearchVO) throws Exception;
	
	/**
     * 查询所有经销商数量
     *
     * @param findAllDlrSearchVO 
     * @return int 
     */
	public int findAllDlrCnt (FindAllDlrSearchVO findAllDlrSearchVO) throws Exception;
	
	/**
     * 查询所有车辆用途信息
     *
     * @param sLangCd 
     * @return FindAllCarlineAndPcDstinVO 
     */
	public List<FindAllCarlineAndPcDstinVO> findAllPcDstin () throws Exception;
	
	/**
     * 查询所有车种信息
     *
     * @param findAllDlrSearchVO 
     * @return FindAllCarlineAndPcDstinVO 
     */
	public List<FindAllCarlineAndPcDstinVO> findAllCarline (FindAllDlrSearchVO findAllDlrSearchVO) throws Exception;
	
	/**
     * 查询所有车种信息数量
     *
     * @param findAllDlrSearchVO 
     * @return 
     */
	public int findAllCarlineCnt (FindAllDlrSearchVO findAllDlrSearchVO) throws Exception;
	
	/**
     * 根据经销商代码查询所有车辆用途信息
     *
     * @param sLangCd 
     * @return FindAllCarlineAndPcDstinVO 
     */
	public List<FindAllCarlineAndPcDstinVO> findPcDstinByDlr (FindAllDlrSearchVO findAllDlrSearchVO) throws Exception;
	
	/**
     * 根据经销商代码查询所有车种信息
     *
     * @param findAllDlrSearchVO 
     * @return FindAllCarlineAndPcDstinVO 
     */
	public List<FindAllCarlineAndPcDstinVO> findCarlineByDlr (FindAllDlrSearchVO findAllDlrSearchVO) throws Exception;
	
	/**
     * 根据经销商代码查询所有车种信息数量
     *
     * @param findAllDlrSearchVO 
     * @return 
     */
	public int findCarlineCntByDlr (FindAllDlrSearchVO findAllDlrSearchVO) throws Exception;
	
	/**
     * 根据经销商代码修改工单确认条件
     * @param 
     * @return Boolean
     */
	public Boolean updateOrderConfirmByDlr (FindAllCarlineAndPcDstinSaveVO saveVo) throws Exception;
	
	/**
     * 修改全网工单确认条件
     * @param 
     * @return Boolean
     */
	public Boolean updateAllOrderConfirm (FindAllCarlineAndPcDstinSaveVO saveVo) throws Exception;

	
}
