package chn.bhmc.dms.cmm.log.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.cmm.log.vo.ReceiveInterfaceLogSearchVO;
import chn.bhmc.dms.cmm.log.vo.SelectAllReceiveInterfaceLogVO;
import chn.bhmc.dms.cmm.log.vo.SelectAllSendInterfaceLogVO;

/**
 * <pre>
 * 日志管理DAO层
 * </pre>
 *
 * @ClassName   : LogManagementDAO.java
 * @Description : LogManagement  DAO
 * @author chen shengan
 * @since 2021. 04. 28
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 04. 28   chen shengan       日志管理DAO层
 * </pre>
 */
@Mapper("logManagementDAO")
public interface LogManagementDAO {
	
	/**
     * 查询接收接口日志信息
     *
     * @param ReceiveInterfaceLogSearchVO 
     * @return SelectAllReceiveInterfaceLogVO 
     */
	public List<SelectAllReceiveInterfaceLogVO> selectReceiveInterfaceLog (ReceiveInterfaceLogSearchVO receiveInterfaceLogSearchVO) throws Exception;

	/**
     * 查询接收接口日志信息条数
     *
     * @param ReceiveInterfaceLogSearchVO 
     * @return int 
     */
	public int selectReceiveInterfaceLogCnt (ReceiveInterfaceLogSearchVO receiveInterfaceLogSearchVO) throws Exception;
	
	/**
     * 根据接收接口日志id查询日志详细信息
     *
     * @param ReceiveInterfaceLogSearchVO 
     * @return SelectAllReceiveInterfaceLogVO 
     */
	public List<SelectAllReceiveInterfaceLogVO> selectReceiveInterfaceLogById (ReceiveInterfaceLogSearchVO receiveInterfaceLogSearchVO) throws Exception;

	/**
     * 查询发送接口日志信息
     *
     * @param ReceiveInterfaceLogSearchVO 
     * @return SelectAllSendInterfaceLogVO 
     */
	public List<SelectAllSendInterfaceLogVO> selectSendInterfaceLog (ReceiveInterfaceLogSearchVO receiveInterfaceLogSearchVO) throws Exception;

	/**
     * 查询发送接口日志信息条数
     *
     * @param ReceiveInterfaceLogSearchVO 
     * @return int 
     */
	public int selectSendInterfaceLogCnt (ReceiveInterfaceLogSearchVO receiveInterfaceLogSearchVO) throws Exception;
	
	/**
     * 根据接收接口日志id查询日志详细信息
     *
     * @param ReceiveInterfaceLogSearchVO 
     * @return SelectAllSendInterfaceLogVO 
     */
	public List<SelectAllSendInterfaceLogVO> selectSendInterfaceLogById (ReceiveInterfaceLogSearchVO receiveInterfaceLogSearchVO) throws Exception;

}
