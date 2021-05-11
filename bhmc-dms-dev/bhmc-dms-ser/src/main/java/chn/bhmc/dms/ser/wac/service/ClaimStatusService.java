package chn.bhmc.dms.ser.wac.service;

import java.util.List;

import chn.bhmc.dms.ser.wac.vo.ClaimStatusSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimStatusVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimStatusService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface ClaimStatusService {

    /**
    *
    * 클레임 현황 목록수를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimStatusSearchVO
    * @return 클레임 요청 목록수 데이터
    * @throws Exception
    */
    public int selectClaimStatusByConditionCnt(ClaimStatusSearchVO searchVO)throws Exception;


    /**
    *
    * 클레임 현황을 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimStatusSearchVO
    * @return 클레임 요청 목록 데이터
    * @throws Exception
    */
    public List<ClaimStatusVO> selectClaimStatusByCondition(ClaimStatusSearchVO searchVO)throws Exception;

}