package chn.bhmc.dms.ser.ro.service;

import java.util.List;

import chn.bhmc.dms.ser.ro.vo.CarCheckDetailVO;
import chn.bhmc.dms.ser.ro.vo.CarCheckSaveVO;
import chn.bhmc.dms.ser.ro.vo.CarCheckSearchVO;
import chn.bhmc.dms.ser.ro.vo.CarCheckVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarCheckService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 29.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface CarCheckService {

    /**
     * 차량점검 내역 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public CarCheckVO selectCarCheckByKey(CarCheckSearchVO searchVO)throws Exception;

    /**
     * 차량점검 내역 리스트 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<CarCheckVO> selectCarCheckListByCondition(CarCheckSearchVO searchVO)throws Exception;

    /**
     * 차량점검 내역 리스트 건수조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCarCheckListByConditionCnt(CarCheckSearchVO searchVO)throws Exception;

    /**
     * 차량점검 상세 내역 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<CarCheckDetailVO> selectCarCheckDetails(CarCheckSearchVO searchVO)throws Exception;

    /**
    *
    * 차량점검 항목 정보를 등록한다.
    *
    * @param saveVO - 차량점검 항목 등록/수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public String multiCarChecks(CarCheckSaveVO saveVO) throws Exception;

    /**
    *
    * 차량점검 항목 정보를 삭제한다.
    *
    * @param saveVO - 차량점검 항목 삭제 정보를 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int deleteCarCheck(CarCheckVO carCheckVO) throws Exception;


    /**
    *
    * 차량점검 항목 인도 체크 정보를 수정한다.
    *
    * @param saveVO - 차량점검 항목 인도 체크 정보를 수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int updateCarCheck(CarCheckVO carCheckVO)throws Exception;

    /**
    *
    * 차량점검 항목을 취소한다.
    *
    * @param carCheckVO
    * @throws Exception
    */
    public int updateCarCheckCancel(CarCheckVO carCheckVO)throws Exception;

    /**
    *
    * 차량점검 인쇄일자 수정
    *
    * @param carCheckVO
    * @throws Exception
    */
    public int updateCarCheckPrint(CarCheckVO carCheckVO)throws Exception;


}
