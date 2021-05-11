package chn.bhmc.dms.dply.cmm.service;

import java.util.HashMap;
import java.util.List;

import chn.bhmc.dms.dply.cmm.vo.CmmPrtySaveVO;
import chn.bhmc.dms.dply.cmm.vo.CmmPrtyVO;
import chn.bhmc.dms.dply.cmm.vo.DplyCmmSearchVO;
import chn.bhmc.dms.dply.cmm.vo.SimulationServerSaveVO;
import chn.bhmc.dms.dply.cmm.vo.SimulationServerVO;
import chn.bhmc.dms.dply.cmm.vo.SyncCommandSearchVO;
import chn.bhmc.dms.dply.cmm.vo.SyncCommandSendReceiveHistorySearchVO;
import chn.bhmc.dms.dply.cmm.vo.SyncCommandSendReceiveHistoryVO;
import chn.bhmc.dms.dply.cmm.vo.SyncMessageTemplateSaveVO;
import chn.bhmc.dms.dply.cmm.vo.SyncMessageTemplateVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DplyCmmService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 6.     Kang Seok Han     최초 생성
 * </pre>
 */

public interface DplyCmmService {

    /**
     * PROPERTY 정보 전체 LIST를 조회한다.
     * @param dplyCmmSearchVO - 조회 조건을 포함하는 VO
     * @return 조회 목록
     */
    public List<CmmPrtyVO> selectCmmPrtyList(DplyCmmSearchVO dplyCmmSearchVO) throws Exception;

    /**
     * PROPERTY 신규 등록, 수정, 삭제
     */
    public String multiCmmPrty(CmmPrtySaveVO saveVO) throws Exception;


    /**
     * 조회 조건에 해당하는 SyncCommandSendReceive History 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SyncCommandSendReceiveHistorySearchVO
     * @return 조회 목록
     */
    public List<SyncCommandSendReceiveHistoryVO> selectSyncCommandSendReceiveHistoryByCondition(SyncCommandSendReceiveHistorySearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 SyncCommandSendReceive History 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SyncCommandSendReceiveHistorySearchVO
     * @return
     */
    public int selectSyncCommandSendReceiveHistoryByConditionCnt(SyncCommandSendReceiveHistorySearchVO searchVO) throws Exception;

/*
    SYNC TEST
*/
    public String multiSyncCommand(SyncCommandSearchVO searchVO) throws Exception;


    /**
     * 조건을 만족하는 Message Template를 조회한다.
     * @param map - 조회 조건을 포함하는 map
     * @return 조회 목록
     */
    public List<SyncMessageTemplateVO> selectMessageTemplateByCondition(HashMap<String, String> map);

    /**
     * Message Template 신규 등록, 수정, 삭제
     */
    public String multiMessageTemplate(SyncMessageTemplateSaveVO saveVO) throws Exception;


    /**
     * Virtual DMS Profile 목록을 조회한다.
     * @param map - 조회 조건을 포함하는 map
     * @return 조회 목록
     */
    public List<SimulationServerVO> selectSimulationServer(HashMap<String, String> map);

    /**
     * Virtual DMS Profile 신규 등록, 수정, 삭제
     */
    public String multiSimulationServer(SimulationServerSaveVO saveVO) throws Exception;


}
