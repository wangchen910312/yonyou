package chn.bhmc.dms.ser.ro.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.ro.vo.CarCheckDetailVO;
import chn.bhmc.dms.ser.ro.vo.CarCheckSearchVO;
import chn.bhmc.dms.ser.ro.vo.CarCheckVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarCheckDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyung Mok Kim
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.   Kyung Mok Kim     최초 생성
 * </pre>
 */
@Mapper("carCheckDAO")
public interface CarCheckDAO {

    /**
     *
     * 차량점검 항목을 등록한다.
     *
     * @param carCheckVO
     * @throws Exception
     */
    public int insertCarCheck(CarCheckVO carCheckVO) throws Exception;

    /**
     *
     * 차량점검 항목을 수정한다.
     *
     * @param carCheckVO
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

    /**
     *
     * 차량점검 항목을 삭제한다.
     *
     * @param carCheckVO
     * @throws Exception
     */
    public int deleteCarCheck(CarCheckVO carCheckVO)throws Exception;

    /**
     *
     * 차량점검 상세 항목을 등록한다.
     *
     * @param carCheckDetailVO
     * @return
     * @throws Exception
     */
    public int insertCarCheckDetail(CarCheckDetailVO carCheckDetailVO)throws Exception;


    /**
     *
     * 차량점검 상세 항목을 삭제한다.
     *
     * @param carCheckDetailVO
     * @return
     * @throws Exception
     */
    public int deleteCarCheckDetail(CarCheckVO carCheckVO)throws Exception;

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
     * 차량점검 상세 내역 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<CarCheckDetailVO> selectCarCheckDetails(CarCheckSearchVO searchVO)throws Exception;

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

}
