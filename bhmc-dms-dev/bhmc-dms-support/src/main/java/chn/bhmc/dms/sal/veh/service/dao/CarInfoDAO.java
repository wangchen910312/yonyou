package chn.bhmc.dms.sal.veh.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.CarInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarInfoDAO.java
 * @Description : 차종, 모델, 옵션 정보를 리스트로 받아온다.
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("carInfoDAO")
public interface CarInfoDAO {

    /**
     * 차종 정보를 조회한다. (코드형 리스트)
     */
    public int selectCarListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception;
    public List<CarInfoVO> selectCarListsByCondition(CarInfoSearchVO searchVO) throws Exception;

    /**
     * 모델 정보를 조회한다. (코드형 리스트)
     */
    public int selectModelListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception;
    public List<CarInfoVO> selectModelListsByCondition(CarInfoSearchVO searchVO) throws Exception;
    public List<CarInfoVO> selectModelListsByCondition2(CarInfoSearchVO searchVO) throws Exception;

    /**
     * OCN 정보를 조회한다. (코드형 리스트)
     */
    public int selectOcnListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception;
    public List<CarInfoVO> selectOcnListsByCondition(CarInfoSearchVO searchVO) throws Exception;
    public List<CarInfoVO> selectOcnListsByCondition2(CarInfoSearchVO searchVO) throws Exception;

    public List<CarInfoVO> selectModelCdToOcnLists(CarInfoSearchVO searchVO) throws Exception;


    /**
     * 외장색 정보를 조회한다. (코드형 리스트)
     */
    public int selectExtColorListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception;
    public List<CarInfoVO> selectExtColorListsByCondition(CarInfoSearchVO searchVO) throws Exception;
    public String selectModelCdByCondition(CarInfoSearchVO searchVO) throws Exception;

    /**
     * 내장색 정보를 조회한다. (코드형 리스트)
     */
    public int selectIntColorListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception;
    public List<CarInfoVO> selectIntColorListsByCondition(CarInfoSearchVO searchVO) throws Exception;

    /**
     * 로컬옵션 정보를 조회한다. (코드형 리스트)
     */
    public List<CarInfoVO> selectOptionListsByCondition(CarInfoSearchVO searchVO) throws Exception;

    /**
     * 로컬옵션의 모델과 맵핑된 차종의 리스트 정보를 조회한다. (코드형 리스트)
     * */
    public List<CarInfoVO> selectLocalMappingCarListsByCondition(CarInfoSearchVO searchVO) throws Exception;

    /**
     * 모델별 로컬옵션 맵핑 Table의 등록된 차종들의 모델 목록 데이터를 조회한다.
     * @param searchVO
     * @return
     */
    public int selectLocalMappingModelListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception;
    public List<CarInfoVO> selectLocalMappingModelListsByCondition(CarInfoSearchVO searchVO) throws Exception;

    /**
     * 모델별 로컬옵션 맵핑 Table의 등록된 모델들의 옵션 목록 데이터를 조회한다.
     * @param searchVO
     * @return
     */
    public int selectLocalMappingOptionListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception;
    public List<CarInfoVO> selectLocalMappingOptionListsByCondition(CarInfoSearchVO searchVO) throws Exception;

    /**
     * 모델과 OCN으로 옵션 리스트를 조회한다.
     */
    public int selectMapOptionListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception;
    public List<CarInfoVO> selectMapOptionListsByCondition(CarInfoSearchVO searchVO) throws Exception;

    /**
     * 바코드-VIN_NO을 조회한다
     */
    public int selectBarcodeCarVinsByConditionCnt(CarInfoSearchVO searchVO) throws Exception;
    public List<CarInfoVO> selectBarcodeCarVinsByCondition(CarInfoSearchVO searchVO) throws Exception;

    /**
     * 바코드로 차량코드와 차량명 조회
     */
    public List<CarInfoVO> selectBarcodeCarNmByCondition(CarInfoSearchVO searchVO) throws Exception;

    /**
     * 바코드별 차종리스트 조회 
     */
    public List<CarInfoVO> selectBarCodeCarListsByCondition(CarInfoSearchVO searchVO) throws Exception;

    /*조회용 - 신규차관작업1 FSC명가져오기*/
    public List<CarInfoVO> selectNewCarLooksFscListByCondition(CarInfoSearchVO searchVO) throws Exception;

    /*조회용 - 신규차관작업2 OCN가져오기*/
    public List<CarInfoVO> selectNewCarLooksOcnListByCondition(CarInfoSearchVO searchVO) throws Exception;

    /*조회용 - 신규차관작업3 외색가져오기*/
    public List<CarInfoVO> selectNewCarLooksExtClrListByCondition(CarInfoSearchVO searchVO) throws Exception;

    /*조회용 - 신규차관작업4 내색가져오기*/
    public List<CarInfoVO> selectNewCarLooksIntClrListByCondition(CarInfoSearchVO searchVO) throws Exception;

}
