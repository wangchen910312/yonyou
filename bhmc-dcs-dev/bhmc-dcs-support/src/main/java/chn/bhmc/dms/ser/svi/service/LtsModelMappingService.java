package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.ser.svi.vo.LtsModelMappingVO;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LtsModelMappingService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki Hyun Kwon
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

public interface LtsModelMappingService {


    /**
     * 전체 VIN별 LTS Model 코드를 가져온다.
     * Statements
     *
     * @param ltsModel
     * @return
     * @throws Exception
     */
    public List<LtsModelMappingVO> selectLtsModelByKey(String vinNo)throws Exception;

    /**
     *
     * VIN에 해당하는  LTS Model 코드를 가져온다.
     *
     * @param vinNo
     * @return
     * @throws Exception
     */
    public String selectLtsModelMapping(String vinNo)throws Exception;

    /**
     *
     * LTS MODEL 코드를 조회한다.
     *
     * @return
     * @throws Exception
     */
    public LtsModelMappingVO selectLtsModelInfosByCondition(LtsModelSearchVO searchVO)throws Exception;
    /**
     *
     * LTS MODEL 코드 LIST 를 조회한다.
     *
     * @return
     * @throws Exception
     */
    public List<LtsModelMappingVO> selectLtsModelsByCondition(LtsModelSearchVO searchVO)throws Exception;

    /**
    *
    * LTS MODEL CD 정보 를 가져온다.
    *
    * @param searchVO - lts model code
    * @return
    * @throws Exception
    */
   public LtsModelMappingVO selectMappingLtsModelCdByKey(LtsModelSearchVO searchVO) throws Exception;


}
