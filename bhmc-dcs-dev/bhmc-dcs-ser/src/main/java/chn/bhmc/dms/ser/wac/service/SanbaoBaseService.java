package chn.bhmc.dms.ser.wac.service;

import java.util.List;

import chn.bhmc.dms.ser.wac.vo.SanbaoBasePartVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoBaseSaveVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoBaseSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoBaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoBaseService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface SanbaoBaseService {

    /**
    * 
    * 삼보 정책기준 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 삼보 정책기준 목록 데이터
    * @throws Exception 
    */
    public List<SanbaoBaseVO> selectSanbaoBaseByCondition(SanbaoBaseSearchVO searchVO)throws Exception;

    /**
    * 
    * 삼보 정책기준 RO 작업시간 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 삼보 정책기준 RO 작업시간 목록 데이터
    * @throws Exception 
    */
    public List<SanbaoBaseVO> selectSanbaoBaseRoWorkTimeByCondition(SanbaoBaseSearchVO searchVO)throws Exception;

    /**
    * 
    * 삼보 정책기준 감각상각률 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 삼보 정책기준 감각상각률 목록 데이터
    * @throws Exception 
    */
    public List<SanbaoBaseVO> selectSanbaoBaseDepreRateByCondition(SanbaoBaseSearchVO searchVO)throws Exception;

    /**
    * 
    * 등록된 부품 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 등록된 부품 목록 데이터
    * @throws Exception 
    */
    public List<SanbaoBasePartVO> selectSanbaoBasePartGrpByCondition(SanbaoBaseSearchVO searchVO)throws Exception;
    
    /**
     * 
     * 등록된 부품 목록 데이터 목록수를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
     * @return 등록된 부품 목록수
     * @throws Exception 
     */
    public int selectSanbaoBasePartGrpByConditionCnt(SanbaoBaseSearchVO searchVO)throws Exception;

    /**
    * 
    * 미등록 부품 그룹 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 미등록 부품 그룹 목록 데이터
    * @throws Exception 
    */
    public List<SanbaoBasePartVO> selectSanbaoBaseUnregItemGrpByCondition(SanbaoBaseSearchVO searchVO)throws Exception;
    
    /**
     * 
     * 미등록 부품 그룹 목록수 를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
     * @return 미등록 부품 그룹 목록수
     * @throws Exception 
     */
    public int selectSanbaoBaseUnregItemGrpByConditionCnt(SanbaoBaseSearchVO searchVO)throws Exception;
    
    /**
    * 
    * 삼보 정책기준 적용기준별 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 삼보 정책기준 적용기준별  데이터
    * @throws Exception 
    */
    public List<SanbaoBaseVO> selectSanbaoBaseByKey(String sApplyDstinCd)throws Exception;

    /**
    * 
    * 삼보 기준정책 그리드 목록 데이터를 등록/수정한다.
    *
    * @param searchVO - 등록/수정을 포함하는 SanbaoBaseSaveVO
    * @return 삼보 기준정책 목록 데이터를 등록/수정
    * @throws Exception 
    */
    public void multiSabaoBases(SanbaoBaseSaveVO saveVO)throws Exception;

    /**
    * 
    * 미등록 부품 그룹 목록 데이터를 등록한다.
    *
    * @param searchVO - 등록/수정을 포함하는 SanbaoBaseSaveVO
    * @return 미등록 부품 그룹 목록 데이터를 등록
    * @throws Exception 
    */
    public void insertSabaoBaseItemsGrps(SanbaoBaseSaveVO saveVO)throws Exception;

    /**
    * 
    * 미등록 부품 그룹 목록 데이터를 수정한다.
    *
    * @param searchVO - 수정을 포함하는 SanbaoBaseSaveVO
    * @return 미등록 부품 그룹 목록 데이터를 수정
    * @throws Exception 
    */
    public void updateSabaoBaseItemsGrps(SanbaoBaseSaveVO saveVO)throws Exception;
    
    /**
     * 
     * 삼보 기준정책 I/F 등록
     *
     * @param saveVO
     * @return
     * @throws Exception
     */
    public void spSerSanbaoBaseInfoHead()throws Exception;
    
    /**
     * 
     * 삼보 기준정책 I/F 등록
     *
     * @param saveVO
     * @return
     * @throws Exception
     */
    public void spSerSanbaoBaseInfoPart()throws Exception;

    

}
