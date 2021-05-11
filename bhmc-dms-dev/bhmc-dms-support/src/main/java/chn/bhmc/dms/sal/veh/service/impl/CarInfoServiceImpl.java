package chn.bhmc.dms.sal.veh.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.dao.CarInfoDAO;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.CarInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarInfoServiceImpl
 * @Description : 차종, 모델, 옵션 정보를 리스트로 받아온다.
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.          최초 생성
 * </pre>
 */

@Service("carInfoService")
public class CarInfoServiceImpl extends HService implements CarInfoService {

    /**
     * 차종, 모델, 옵션 리스트 DAO 선언
     */
    @Resource(name="carInfoDAO")
    CarInfoDAO carInfoDAO;


    /**
     * 차종 정보를 조회한다. (코드형 리스트)
     */
    @Override
    public int selectCarListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectCarListsByConditionCnt(searchVO);
    }
    @Override
    public List<CarInfoVO> selectCarListsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectCarListsByCondition(searchVO);
    }

    /**
     * 모델 정보를 조회한다. (코드형 리스트)
     */
    @Override
    public int selectModelListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectModelListsByConditionCnt(searchVO);
    }
    @Override
    public List<CarInfoVO> selectModelListsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectModelListsByCondition(searchVO);
    }

    @Override
    public List<CarInfoVO> selectModelListsByCondition2(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectModelListsByCondition2(searchVO);
    }

    /**
     * OCN 정보를 조회한다. (코드형 리스트)
     */
    @Override
    public int selectOcnListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectOcnListsByConditionCnt(searchVO);
    }
    @Override
    public List<CarInfoVO> selectOcnListsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectOcnListsByCondition(searchVO);
    }
    @Override
    public List<CarInfoVO> selectOcnListsByCondition2(CarInfoSearchVO searchVO) throws Exception{


        List<CarInfoVO> returnList = new ArrayList<CarInfoVO>();

        //ArrayList<CarInfoVO> returnArray = new ArrayList();
        List<CarInfoVO> modelCodeList = carInfoDAO.selectModelCdToOcnLists(searchVO);

        CarInfoSearchVO tempVO = new CarInfoSearchVO();
        //List<CarInfoVO> returnList = modelCodeList;

        for (int idx=0; idx < modelCodeList.size(); idx++){
            //log.info("ph6-------" + modelCodeList.get(idx).getModelCd());

            tempVO.setModelCd(modelCodeList.get(idx).getModelCd());

            returnList.addAll(carInfoDAO.selectOcnListsByCondition(tempVO));

        }

        return returnList;

    }

    @Override
    public List<CarInfoVO> selectModelCdToOcnLists(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectModelCdToOcnLists(searchVO);
    }


    /**
     * 외장색 정보를 조회한다. (코드형 리스트)
     */
    @Override
    public int selectExtColorListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectExtColorListsByConditionCnt(searchVO);
    }
    @Override
    public List<CarInfoVO> selectExtColorListsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectExtColorListsByCondition(searchVO);
    }

    @Override
    public String selectModelCdByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectModelCdByCondition(searchVO);
    }

    /**
     * 내장색 정보를 조회한다. (코드형 리스트)
     */
    @Override
    public int selectIntColorListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectIntColorListsByConditionCnt(searchVO);
    }
    @Override
    public List<CarInfoVO> selectIntColorListsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectIntColorListsByCondition(searchVO);
    }

    /**
     * 로컬옵션 정보를 조회한다. (코드형 리스트)
     */
    @Override
    public List<CarInfoVO> selectOptionListsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectOptionListsByCondition(searchVO);
    }

    /**
     * 로컬옵션의 모델과 맵핑된 차종의 리스트 정보를 조회한다. (코드형 리스트)
     */
    @Override
    public List<CarInfoVO> selectLocalMappingCarListsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectLocalMappingCarListsByCondition(searchVO);
    }



    /**
     * 모델별 로컬옵션 맵핑 Table의 등록된 차종들의 모델 목록 데이터를 조회한다.
     */
    @Override
    public int selectLocalMappingModelListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectLocalMappingModelListsByConditionCnt(searchVO);
    }
    @Override
    public List<CarInfoVO> selectLocalMappingModelListsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectLocalMappingModelListsByCondition(searchVO);
    }



    /**
     * 모델별 로컬옵션 맵핑 Table의 등록된 모델들의 옵션 목록 데이터를 조회한다.
     */
    @Override
    public int selectLocalMappingOptionListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectLocalMappingOptionListsByConditionCnt(searchVO);
    }
    @Override
    public List<CarInfoVO> selectLocalMappingOptionListsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectLocalMappingOptionListsByCondition(searchVO);
    }

    /**
     * 모델과 OCN으로 옵션 리스트를 조회한다.
     */
    @Override
    public int selectMapOptionListsByConditionCnt(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectMapOptionListsByConditionCnt(searchVO);
    }
    @Override
    public List<CarInfoVO>selectMapOptionListsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectMapOptionListsByCondition(searchVO);
    }

    /**
     * 바코드-VIN_NO을 조회한다
     */
    @Override
    public int selectBarcodeCarVinsByConditionCnt(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectBarcodeCarVinsByConditionCnt(searchVO);
    }
    @Override
    public List<CarInfoVO> selectBarcodeCarVinsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectBarcodeCarVinsByCondition(searchVO);
    }

    /**
     * 바코드로 차량코드와 차량명 조회
     */
    @Override
    public List<CarInfoVO> selectBarcodeCarNmByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectBarcodeCarNmByCondition(searchVO);
    }
    
    /**
     * 바코드별 차종리스트 조회 
     */
    @Override
    public List<CarInfoVO> selectBarCodeCarListsByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectBarCodeCarListsByCondition(searchVO);
    }
    

    /*조회용 - 신규차관작업1 FSC명가져오기*/
    @Override
    public List<CarInfoVO> selectNewCarLooksFscListByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectNewCarLooksFscListByCondition(searchVO);
    }

    /*조회용 - 신규차관작업2 OCN가져오기*/
    @Override
    public List<CarInfoVO> selectNewCarLooksOcnListByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectNewCarLooksOcnListByCondition(searchVO);
    }

    /*조회용 - 신규차관작업3 외색가져오기*/
    @Override
    public List<CarInfoVO> selectNewCarLooksExtClrListByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectNewCarLooksExtClrListByCondition(searchVO);
    }

    /*조회용 - 신규차관작업4 내색가져오기*/
    @Override
    public List<CarInfoVO> selectNewCarLooksIntClrListByCondition(CarInfoSearchVO searchVO) throws Exception{
        return carInfoDAO.selectNewCarLooksIntClrListByCondition(searchVO);
    }
}
