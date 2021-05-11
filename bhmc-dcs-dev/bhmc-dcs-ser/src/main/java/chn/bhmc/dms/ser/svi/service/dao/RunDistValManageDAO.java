package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.svi.vo.RunDistValManageVO;
import chn.bhmc.dms.ser.svi.vo.RunDistValSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RunDistValManageDAO.java
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
@Mapper("runDistValManageDAO")
public interface RunDistValManageDAO {


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
     * VIN 마스터 주행거리이력 저장
     *
     * @param runDistValManageVO
     * @return
     * @throws Exception
     */
    public int insertVinRunDistVal(RunDistValManageVO runDistValManageVO)throws Exception;

    /**
     *
     * VIN 마스터 주행거리 업데이트
     *
     * @param runDistValManageVO
     * @return
     * @throws Exception
     */
    public int updateVinRunDistVal(RunDistValManageVO runDistValManageVO)throws Exception;

    /**
     *
     * 주행거리 업데이트
     *
     * @param runDistValManageVO
     * @return
     * @throws Exception
     */
    public void updateRunDistVal(RunDistValManageVO runDistValManageVO)throws Exception;

    /**
    *
    * 대상딜러 목록
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   public List<RunDistValManageVO> selectTargetDealerList(RunDistValManageVO runDistValManageVO) throws Exception;

}
