package chn.bhmc.dms.ser.cmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoSearchVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfReseveInfoSearchVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfReseveInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehOfCustInfoDAO.java
 * @Description : 서비스 공통용 고객및차량정보 DAO.
 * @author Yin Xueyuan
 * @since 2016. 3. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 7.     Yin Xueyuan     최초 생성
 * </pre>
 */
@Mapper("vehOfCustInfoDAO")
public interface VehOfCustInfoDAO {

    /**
     * 서비스 공통용 고객및차량정보 관리 목록 데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포함된 VehOfCustInfoSearchVO
     * @return 관리 목록 데이터
     * @throws Exception
     */
    public List<VehOfCustInfoVO> selectVehOfCustInfoByCondition(VehOfCustInfoSearchVO searchVO)  throws Exception;

     /**
     * 조회 조건에 해당하는 서비스 공통용  고객및차량정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
     * @return
     */
    public int selectVehOfCustInfoByConditionCnt(VehOfCustInfoSearchVO searchVO)  throws Exception;


    /**
     * 서비스 공통용 삼포 고객및차량정보 관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
     * @return
     */
    public List<VehOfCustInfoVO> selectSanbaoVehOfCustInfoByCondition(VehOfCustInfoSearchVO searchVO)  throws Exception;


    /**
     * 조회 조건에 해당하는 서비스 공통용  고객및차량정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
     * @return
     */
    public int selectSanbaoVehOfCustInfoByConditionCnt(VehOfCustInfoSearchVO searchVO)  throws Exception;


    public List<VehOfCustInfoVO> selectVehOfCustInfoByKey(VehOfCustInfoSearchVO searchVO)  throws Exception;

    public List<VehOfCustInfoVO> selectSanbaoVehOfCustInfoByKey(VehOfCustInfoSearchVO searchVO)  throws Exception;

    /**
     * 예약고객 VIN 정보 조회
     *
     * @param searchVO
     * @return
     */
    //public List<ReservationReceiptVO> selectReserveInfosByKey(ReservationReceiptSearchVO searchVO) throws Exception;

    /**
     * 서비스 공통용 : 다건의 당일 예약 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 당일 예약 정보 목록 데이터
     */
    public List<VehOfReseveInfoVO> selectVehOfReseveInfoByCondition(VehOfReseveInfoSearchVO searchVO)throws Exception;

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
}
