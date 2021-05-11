package chn.bhmc.dms.ser.wac.service;

import java.util.List;

import chn.bhmc.dms.ser.wac.vo.SanbaoPartVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoApproveService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 6.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface SanbaoApproveService {

    
    /**
     * 
     * 삼보승인  목록수 정보 데이터를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
     * @return 삼보승인 정보 데이터
     * @throws Exception
     */
    public int selectSanbaoApproveByConditionCnt(SanbaoSearchVO searchVO)throws Exception;
    
    /**
    * 
    * 삼보승인  목록 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return 삼보승인 정보 데이터
    * @throws Exception
    */
    public List<SanbaoVO> selectSanbaoApproveByCondition(SanbaoSearchVO searchVO)throws Exception;

    /**
    * 
    * 삼보승인  상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return 삼보승인 상세 정보 데이터
    * @throws Exception
    */
    public SanbaoVO selectSanbaoApproveByKey(SanbaoSearchVO searchVO)throws Exception;

    /**
    * 
    * 삼보승인 부품 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return 삼보승인 부품  정보 데이터
    * @throws Exception
    */
    public List<SanbaoPartVO> selectSanbaoApprovePartsByCondition(SanbaoSearchVO searchVO)throws Exception;

    /**
    * 
    * 삼보승인 정보를 등록/수정/삭제 한다.
    *
    * @param saveVO - 삼보승인 등록/수정/삭제 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public String updateSanbaoApprove(SanbaoVO sanbaoVO)throws Exception;

}
