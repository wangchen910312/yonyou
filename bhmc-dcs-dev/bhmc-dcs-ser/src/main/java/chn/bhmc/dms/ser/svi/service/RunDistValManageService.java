package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.ser.svi.vo.RunDistValManageVO;
import chn.bhmc.dms.ser.svi.vo.RunDistValSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RunDistValManageService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 3. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 12.     Ki hyun Kwon     최초 생성
 * </pre>
 */

public interface RunDistValManageService {

    /**
    *
    * 주행거리 목록수
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   public int selectRunDistValManagesByConditionCnt(RunDistValSearchVO searchVO) throws Exception;

   /**
    *
    * 주행거리 목록
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   public List<RunDistValManageVO> selectRunDistValManagesByCondition(RunDistValSearchVO searchVO) throws Exception;

   /**
    *
    * VIN 마스터 주행거리 업데이트
    *
    * @param runDistValManageVO
    * @return
    * @throws Exception
    */
   public int updateVinRunDistVal(RunDistValManageVO runDistValManageVO)throws Exception;

}
