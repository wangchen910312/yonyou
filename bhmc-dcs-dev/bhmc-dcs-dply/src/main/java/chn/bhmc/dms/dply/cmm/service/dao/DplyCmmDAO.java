package chn.bhmc.dms.dply.cmm.service.dao;

import java.util.HashMap;
import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.dply.cmm.vo.CmmPrtyVO;
import chn.bhmc.dms.dply.cmm.vo.DplyCmmSearchVO;
import chn.bhmc.dms.dply.cmm.vo.SimulationServerVO;
import chn.bhmc.dms.dply.cmm.vo.SyncCommandSendReceiveHistorySearchVO;
import chn.bhmc.dms.dply.cmm.vo.SyncCommandSendReceiveHistoryVO;
import chn.bhmc.dms.dply.cmm.vo.SyncMessageTemplateVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DplyCmmDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 4. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 6.     Cheol Man Oh     최초 생성
 * </pre>
 */

@Mapper("dplyCmmDAO")
public interface DplyCmmDAO {


    /**
     * PROPERTY 정보 전체 LIST를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public List<CmmPrtyVO> selectCmmPrtyList(DplyCmmSearchVO dplyCmmSearchVO);

    /**
     * PROPERTY 정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertCmmPrty(CmmPrtyVO saveVO) throws Exception;

    /**
     * PROPERTY 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateCmmPrty(CmmPrtyVO saveVO) throws Exception;

    /**
     * PROPERTY 정보 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteCmmPrty(CmmPrtyVO saveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 SyncCommandSendReceive History 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SyncCommandSendReceiveHistorySearchVO
     * @return 조회 목록
     */
    public List<SyncCommandSendReceiveHistoryVO> selectSyncCommandSendReceiveHistoryByCondition(SyncCommandSendReceiveHistorySearchVO searchVO);

    /**
     * 조회 조건에 해당하는 SyncCommandSendReceive History 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SyncCommandSendReceiveHistorySearchVO
     * @return
     */
    public int selectSyncCommandSendReceiveHistoryByConditionCnt(SyncCommandSendReceiveHistorySearchVO searchVO);

    /**
     * 조건을 만족하는 Message Template를 조회한다.
     * @param map - 조회 조건을 포함하는 map
     * @return 조회 목록
     */
    public List<SyncMessageTemplateVO> selectMessageTemplateByCondition(HashMap<String, String> map);

    /**
     * Message Template 정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertMessageTemplate(SyncMessageTemplateVO saveVO) throws Exception;

    /**
     * Message Template 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateMessageTemplate(SyncMessageTemplateVO saveVO) throws Exception;

    /**
     * Message Template 정보 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteMessageTemplate(SyncMessageTemplateVO saveVO) throws Exception;

    /**
     * Virtual DMS Profile 목록을 조회한다.
     * @param map - 조회 조건을 포함하는 map
     * @return 조회 목록
     */
    public List<SimulationServerVO> selectSimulationServer(HashMap<String, String> map);
    /**
     * Virtual DMS Profile 정보 생성한다.
     * @param saveVO
     * @return
     */
    public int insertSimulationServer(SimulationServerVO saveVO) throws Exception;

    /**
     * Virtual DMS Profile 정보 수정한다.
     * @param saveVO
     * @return
     */
    public int updateSimulationServer(SimulationServerVO saveVO) throws Exception;

    /**
     * Virtual DMS Profile 정보 삭제한다.
     * @param saveVO
     * @return
     */
    public int deleteSimulationServer(SimulationServerVO saveVO) throws Exception;


}
