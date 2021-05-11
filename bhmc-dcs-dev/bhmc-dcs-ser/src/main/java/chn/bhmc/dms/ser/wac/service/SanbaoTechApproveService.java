package chn.bhmc.dms.ser.wac.service;

import java.util.List;

import chn.bhmc.dms.ser.wac.vo.SanbaoTechSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoTechVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoTechApproveService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 10.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface SanbaoTechApproveService {


    /**
    *
    * 삼보 기술처리 목록수 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoTechSearchVO
    * @return 삼보 기술처리 목록 데이터
    * @throws Exception
    */
    public int selectSanbaoTechApproveByConditionCnt(SanbaoTechSearchVO searchVO)throws Exception;

    /**
    *
    * 삼보 기술처리 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoTechSearchVO
    * @return 삼보 기술처리 목록 데이터
    * @throws Exception
    */
    public List<SanbaoTechVO> selectSanbaoTechApproveByCondition(SanbaoTechSearchVO searchVO)throws Exception;

    /**
    *
    * 삼보 기술처리  상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoTechSearchVO
    * @return 삼보 기술처리 상세 정보 데이터
    * @throws Exception
    */
    public SanbaoTechVO selectSanbaoTechRequestByKey(SanbaoTechSearchVO searchVO)throws Exception;

    /**
    *
    * 삼보 기술처리 정보를 수정 한다.
    *
    * @param saveVO - 삼보 기술처리 수정 목록을 포함하는 SanbaoTechVO
    * @return bindingResult
    * @throws Exception
    */
    public String updateSanbaoTechApprove(SanbaoTechVO sanbaoTechVO)throws Exception;

    /**
    *
    * 삼보 기술처리 사용여부 수정
    *
    * @param saveVO - 삼보 기술처리 사용여부 수정 목록을 포함하는 SanbaoTechVO
    * @return bindingResult
    * @throws Exception
    */
   public int updateSanbaoTechApproveUseYn(SanbaoTechVO sanbaoTechVO)throws Exception;

}
