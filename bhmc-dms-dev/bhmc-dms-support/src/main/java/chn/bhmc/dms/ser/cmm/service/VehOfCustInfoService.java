package chn.bhmc.dms.ser.cmm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;
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

    public Map<String, String> multiVehOfCustInfo(VehOfCustInfoVO vehOfCustInfoVO) throws Exception;

    /**
     * 삼포 대상 빈 등록
     */
    public void insertSanbaoVinInfo(HashMap<String, Object> map)throws Exception;

    /**
     * 차량마스터 수정후 호출 프로시져
     */
    public void vinMasterChangeCall(VehOfCustInfoVO vehOfCustInfoVO)throws Exception;


    /**
     * PDI 여부 체크
     */
    public String selectVehOfPdiChkByKey(VehOfCustInfoSearchVO vehOfCustInfoSearchVO)throws Exception;

    /**
     *
     * 보증만료일자
     *
     * @param vehOfCustInfoSearchVO
     * @return
     * @throws Exception
     */
    public VehOfCustInfoVO selectVehOfWartEndDtByKey(VehOfCustInfoSearchVO vehOfCustInfoSearchVO)throws Exception;

    /**
     *
     * 차량검증(DCS)
     *
     * @param vehOfCustInfoSearchVO
     * @return
     * @throws Exception
     */
    public List<VehicleMasterVO> verifyDcsVinMasterInfo(VehOfCustInfoSearchVO vehOfCustInfoSearchVO)throws Exception;

    /**
     * 车辆销售日期查询
     * @param vehOfCustInfoSearchVO
     * @return
     */
	public VehOfCustInfoSearchVO selectCustSaleDt(VehOfCustInfoSearchVO vehOfCustInfoSearchVO);

}
