package chn.bhmc.dms.ser.wac.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.wac.vo.SanbaoBasePartVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoBaseSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoBaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoBaseDAO.java
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
@Mapper("sanbaoBaseDAO")
public interface SanbaoBaseDAO {

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
     * 등록된 부품 목록 데이터 목록수를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
     * @return 등록된 부품 목록수
     * @throws Exception 
     */
    public int selectSanbaoBasePartGrpByConditionCnt(SanbaoBaseSearchVO searchVO)throws Exception;

    
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
     * 미등록 부품 그룹 목록수 를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
     * @return 미등록 부품 그룹 목록수
     * @throws Exception 
     */
    public int selectSanbaoBaseUnregItemGrpByConditionCnt(SanbaoBaseSearchVO searchVO)throws Exception;
    
    
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
    * 삼보 정책기준 적용기준별 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoBaseSearchVO
    * @return 삼보 정책기준 적용기준별  데이터
    * @throws Exception 
    */
    public List<SanbaoBaseVO> selectSanbaoBaseByKey(SanbaoBaseSearchVO searchVO)throws Exception;


    /**
     * 
     * 삼보 기준정책 등록
     *
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertSabaoBase(SanbaoBaseVO sabaoBaseVO)throws Exception;


    /**
     * 
     * 삼보 기준정책 수정
     *
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateSabaoBase(SanbaoBaseVO sabaoBaseVO)throws Exception;


    /**
     * 
     * 삼보 기준정책 삭제
     *
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteSabaoBase(SanbaoBaseVO sabaoBaseVO)throws Exception;

    /**
     * 
     * 삼보 부품그룹 등록
     *
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertSabaoBaseItemsGrps(SanbaoBasePartVO sanbaoBasePartVO)throws Exception;

    /**
     * 
     * 삼보 부품그룹 수정
     *
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateSabaoBaseItemsGrps(SanbaoBasePartVO sanbaoBasePartVO)throws Exception;

     
}
