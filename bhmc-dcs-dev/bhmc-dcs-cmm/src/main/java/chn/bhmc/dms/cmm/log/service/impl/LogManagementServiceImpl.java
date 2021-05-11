package chn.bhmc.dms.cmm.log.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.cmm.log.service.LogManagementService;
import chn.bhmc.dms.cmm.log.service.dao.LogManagementDAO;
import chn.bhmc.dms.cmm.log.vo.ReceiveInterfaceLogSearchVO;
import chn.bhmc.dms.cmm.log.vo.SelectAllReceiveInterfaceLogVO;
import chn.bhmc.dms.cmm.log.vo.SelectAllSendInterfaceLogVO;

/**
 * <pre>
 * 日志管理Service层实现类
 * </pre>
 *
 * @ClassName   : LogManagementServiceImpl.java
 * @Description : 
 * @author chen shengan
 * @since 2021. 04. 28
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 28   chen shengan       日志管理Service层实现类
 * </pre>
 */
@Service("logManagementService")
public class LogManagementServiceImpl extends HService implements LogManagementService {

	@Resource(name = "logManagementDAO")
	LogManagementDAO logManagementDAO;
	
	/**
     * 查询接收接口日志信息
     *
     * @param ReceiveInterfaceLogSearchVO 
     * @return SelectAllReceiveInterfaceLogVO 
     */
	@Override
	public List<SelectAllReceiveInterfaceLogVO> selectReceiveInterfaceLog(
			ReceiveInterfaceLogSearchVO receiveInterfaceLogSearchVO) throws Exception {
		List<SelectAllReceiveInterfaceLogVO> list = logManagementDAO.selectReceiveInterfaceLog(receiveInterfaceLogSearchVO);
		return list;
	}

	/**
     * 查询接收接口日志信息条数
     *
     * @param ReceiveInterfaceLogSearchVO 
     * @return int 
     */
	@Override
	public int selectReceiveInterfaceLogCnt(ReceiveInterfaceLogSearchVO receiveInterfaceLogSearchVO) throws Exception {
		int count = logManagementDAO.selectReceiveInterfaceLogCnt(receiveInterfaceLogSearchVO);
		return count;
	}

	/**
     * 根据接收接口日志id查询日志详细信息
     *
     * @param ReceiveInterfaceLogSearchVO 
     * @return SelectAllReceiveInterfaceLogVO 
     */
	@Override
	public List<SelectAllReceiveInterfaceLogVO> selectReceiveInterfaceLogById(
			ReceiveInterfaceLogSearchVO receiveInterfaceLogSearchVO) throws Exception {
		List<SelectAllReceiveInterfaceLogVO> list = logManagementDAO.selectReceiveInterfaceLogById(receiveInterfaceLogSearchVO);
		return list;
	}
	
	/**
     * 查询发送接口日志信息
     *
     * @param ReceiveInterfaceLogSearchVO 
     * @return SelectAllSendInterfaceLogVO 
     */
	@Override
	public List<SelectAllSendInterfaceLogVO> selectSendInterfaceLog(
			ReceiveInterfaceLogSearchVO receiveInterfaceLogSearchVO) throws Exception {
		List<SelectAllSendInterfaceLogVO> list = logManagementDAO.selectSendInterfaceLog(receiveInterfaceLogSearchVO);
		return list;
	}

	/**
     * 查询发送接口日志信息条数
     *
     * @param ReceiveInterfaceLogSearchVO 
     * @return int 
     */
	@Override
	public int selectSendInterfaceLogCnt(ReceiveInterfaceLogSearchVO receiveInterfaceLogSearchVO) throws Exception {
		int count = logManagementDAO.selectSendInterfaceLogCnt(receiveInterfaceLogSearchVO);
		return count;
	}

	/**
     * 根据发送接口日志id查询日志详细信息
     *
     * @param ReceiveInterfaceLogSearchVO 
     * @return SelectAllSendInterfaceLogVO 
     */
	@Override
	public List<SelectAllSendInterfaceLogVO> selectSendInterfaceLogById(
			ReceiveInterfaceLogSearchVO receiveInterfaceLogSearchVO) throws Exception {
		List<SelectAllSendInterfaceLogVO> list = logManagementDAO.selectSendInterfaceLogById(receiveInterfaceLogSearchVO);
		return list;
	}

}
