package chn.bhmc.dms.ser.cmm.service;

import java.util.List;

import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoSearchVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfReseveInfoSearchVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfReseveInfoVO;
import chn.bhmc.dms.ser.svi.vo.LtsModelMappingVO;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;
/**
 * <pre>
 * 서비스 공통용 고객및차량정보 Service
 * </pre>
 *
 * @ClassName   : VehOfCustInfoService.java
 * @Description : 서비스 공통용 고객및차량정보 Service
 * @author Yin Xueyuan
 * @since 2016. 03. 07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 03. 07.   Yin Xueyuan      최초 생성
 * </pre>
 */

public interface VehOfCustInfoService {


    /**
     * 조회 조건에 해당하는 서비스 공통용 고객및차량 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
     * @return 조회 목록
     */
    public List<VehOfCustInfoVO> selectVehOfCustInfoByCondition(VehOfCustInfoSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 서비스 공통용 고객및차량 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
     * @return
     */
    public int selectVehOfCustInfoByConditionCnt(VehOfCustInfoSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 서비스 공통용 고객및차량 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
     * @return 조회 목록
     */
    public List<VehOfCustInfoVO> selectVehInfoByCondition(VehOfCustInfoSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 서비스 공통용 고객및차량 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
     * @return
     */
    public int selectVehInfoByConditionCnt(VehOfCustInfoSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 서비스 공통용 삼포 고객및차량 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
     * @return 조회 목록
     */
    public List<VehOfCustInfoVO> selectSanbaoVehOfCustInfoByCondition(VehOfCustInfoSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 서비스 공통용 삼포 고객및차량 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
     * @return
     */
    public int selectSanbaoVehOfCustInfoByConditionCnt(VehOfCustInfoSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 서비스 공통용 고객및차량정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
     * @return
     */
    public List<VehOfCustInfoVO> selectVehOfCustInfoByKey(VehOfCustInfoSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 서비스 공통용 삼포 고객및차량정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
     * @return
     */
    public List<VehOfCustInfoVO> selectSanbaoVehOfCustInfoByKey(VehOfCustInfoSearchVO searchVO) throws Exception;


    /**
    *  LTS MODEL 정보데이터 조회한다.
    * Statements
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
    public LtsModelMappingVO selectLtsModelInfosByCondition(LtsModelSearchVO searchVO) throws Exception;

    /**
     * 서비스 공통용 : 다건의 당일 예약 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreCheckSearchVO
     * @return 당일 예약 정보 목록 데이터
     */
    public List<VehOfReseveInfoVO> selectVehOfReseveInfoByCondition(VehOfReseveInfoSearchVO searchVO) throws Exception;

    public void multiVehOfCustInfo(VehOfCustInfoVO vehOfCustInfoVO) throws Exception;


}
