package chn.bhmc.dms.ser.wac.service;

import java.util.List;

import chn.bhmc.dms.ser.wac.vo.PwaStatTableSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaStatTableVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaStatTableService.java
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

public interface PwaStatTableService {

    /**
    *
    * PWA 통계표 목록수를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaStatTableSearchVO
    * @return PWA 통계표 목록수 데이터
    * @throws Exception
    */
    public int selectPwaStatTableByConditionCnt(PwaStatTableSearchVO searchVO)throws Exception;


    /**
    *
    * PWA 통계표을 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaStatTableSearchVO
    * @return PWA 통계표 목록 데이터
    * @throws Exception
    */
    public List<PwaStatTableVO> selectPwaStatTableByCondition(PwaStatTableSearchVO searchVO)throws Exception;

}