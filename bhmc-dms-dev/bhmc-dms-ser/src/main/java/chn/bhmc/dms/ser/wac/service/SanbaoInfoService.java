package chn.bhmc.dms.ser.wac.service;

import java.util.List;

import chn.bhmc.dms.ser.wac.vo.SanbaoAlarmVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoClaimInfoVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoCustVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoSamePartVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoWorkInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoInfoService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 7. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 25.     Kwon ki hyun     최초 생성
 * </pre>
 */

public interface SanbaoInfoService {

    /**
     * 삼보 알람 정보
     *
     * @param searchVO
     * @return 삼보알람 정보
     */
    public SanbaoAlarmVO selectSanbaoAlarmInfoByKey(SanbaoSearchVO searchVO) throws Exception;

    /**
     * 동일하자 리스트 정보
     *
     * @param searchVO
     * @return 동일하자 리스트 정보
     */
    public List<SanbaoSamePartVO> selectSanbaoItemsByCondition(SanbaoSearchVO searchVO) throws Exception;

    /**
     * 삼포 작업  리스트 정보
     *
     * @param searchVO
     * @return 삼포 작업  리스트 정보
     */
    public List<SanbaoWorkInfoVO> selectSanbaoWorkInfoByCondition(SanbaoSearchVO searchVO)throws Exception;


    /**
    *
    * 삼포 고객 조회
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
    public List<SanbaoCustVO> selectSanbaoCustInfoByCondition(SanbaoSearchVO searchVO)throws Exception;

    /**
     * 삼포 클레임  리스트 정보
     *
     * @param searchVO
     * @return 삼포 클레임  리스트 정보
     */
    public List<SanbaoClaimInfoVO> selectSanbaoClaimInfoByCondition(SanbaoSearchVO searchVO)throws Exception;



}
