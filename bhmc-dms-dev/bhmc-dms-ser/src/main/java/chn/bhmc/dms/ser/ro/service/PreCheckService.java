package chn.bhmc.dms.ser.ro.service;

import java.util.List;

import chn.bhmc.dms.ser.ro.vo.PreCheckDetailVO;
import chn.bhmc.dms.ser.ro.vo.PreCheckSaveVO;
import chn.bhmc.dms.ser.ro.vo.PreCheckSearchVO;
import chn.bhmc.dms.ser.ro.vo.PreCheckVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PreCheckService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 29.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface PreCheckService {

    /**
     * 사전점검 내역 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public PreCheckVO selectPreCheckByKey(PreCheckSearchVO searchVO) throws Exception;

    /**
     * 사전점검 내역 리스트 수 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectPreCheckListByConditionCnt(PreCheckSearchVO searchVO) throws Exception;

    /**
     * 사전점검 내역 리스트 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<PreCheckVO> selectPreCheckListByCondition(PreCheckSearchVO searchVO) throws Exception;

    /**
     * 사전점검 상세 내역 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<PreCheckDetailVO> selectReserveDetailInfoByKey(PreCheckSearchVO searchVO) throws Exception;

    /**
    *
    * 사전점검 항목 정보를 등록한다.
    *
    * @param saveVO - 사전점검 항목 등록/수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public String multiPreChecks(PreCheckSaveVO saveVO,String userEqui) throws Exception;

    /**
    *
    * 사전점검 항목 정보를 삭제한다.
    *
    * @param saveVO - 사전점검 항목 삭제 정보를 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int deletePreCheck(PreCheckVO preCheckVO) throws Exception;


    /**
    *
    * 사전점검 항목 인도 체크 정보를 수정한다.
    *
    * @param saveVO - 사전점검 항목 인도 체크 정보를 수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int updatePreCheck(PreCheckVO preCheckVO) throws Exception;


    /**
    *
    * 사전점검 간반보드 정보 조회
    *
    * @param searchVO - 사전점검 간반보드 정보 조회
    * @return
    * @throws Exception
    */
    public List<PreCheckVO> selectPreChkKanbanByCondition(PreCheckSearchVO searchVO) throws Exception;

    /**
     * 서비스 공통용 : 다건의 당일 차량점검 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreCheckSearchVO
     * @return 당일 예약 정보 목록 데이터
     */
    public List<PreCheckVO> selectVehOfPreCheckInfoByCondition(PreCheckSearchVO searchVO) throws Exception;

    /**
     * 칸반 사전점검 컬럼 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<PreCheckVO> selectPreChkKanbanRowsByCondition(PreCheckSearchVO searchVO) throws Exception;



}
