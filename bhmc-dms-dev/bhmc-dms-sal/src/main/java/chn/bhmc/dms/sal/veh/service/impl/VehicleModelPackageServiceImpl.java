package chn.bhmc.dms.sal.veh.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.veh.service.VehicleModelPackageService;
import chn.bhmc.dms.sal.veh.service.dao.VehicleModelPackageDAO;
import chn.bhmc.dms.sal.veh.vo.VehicleModelPackageSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleModelPackageVO;
import chn.bhmc.dms.sal.veh.vo.VehicleOcnSubInfoIfVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleModelPackageServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18.      Bong               최초 생성
 * </pre>
 */

@Service("vehicleModelPackageService")
public class VehicleModelPackageServiceImpl extends HService implements VehicleModelPackageService {

    /**
     * 차량 OCN DAO 선언
     */
    @Resource(name="vehicleModelPackageDAO")
    VehicleModelPackageDAO vehicleModelPackageDAO;

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;


    /**
     * 조회 조건에 해당하는 차량 OCN 구성 정보를 조회한다.
     */
    @Override
    public List<VehicleModelPackageVO> selectVehicleOcn(VehicleModelPackageSearchVO searchVO) throws Exception {
        return vehicleModelPackageDAO.selectVehicleOcn(searchVO);
    }

    /**
     * 조회 조건에 해당하는 차량 OCN 옵션 정보를 조회한다.
     */
    @Override
    public List<VehicleModelPackageVO> selectVehicleOcnOption(VehicleModelPackageSearchVO searchVO) throws Exception {
        //return vehicleModelPackageDAO.selectVehicleOcnOption(searchVO);


        Map<String, Object> message = new HashMap<String, Object>();

        message.put("MODEL_CD", searchVO.getsModelCd());
        message.put("OCN_CD", searchVO.getsOcnCd());

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL047");           // service id
        camelClient.setSender(LoginUtil.getDlrCd());
        camelClient.addSendMessage(message);

        Data receiveData = camelClient.sendRequest();

        List<VehicleOcnSubInfoIfVO> ifList = null;
        List<VehicleModelPackageVO> resultList = null;
        VehicleModelPackageVO resultVo = null;
        if (!receiveData.getFooter().getIfResult().equals("E")) {
            ifList = receiveData.readMessages(VehicleOcnSubInfoIfVO.class);

            resultList = new ArrayList<VehicleModelPackageVO>();
            for( VehicleOcnSubInfoIfVO ifVo : ifList){
                resultVo = new VehicleModelPackageVO();
                resultVo.setCarlineCd(ifVo.getCarlineCd());
                resultVo.setCarlineNm(ifVo.getCarlineNm());
                resultVo.setModelNm(ifVo.getFscNm());
                resultVo.setOcnCd(ifVo.getOcnCd());
                resultVo.setOptionCd(ifVo.getOptionCd());
                resultVo.setOptionNm(ifVo.getOptionNm());
                resultList.add(resultVo);
            }

        }else{
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
            //result.setErrorMsg(receiveData.getFooter().getIfFailMsg());
        }
        return resultList;
    }

}
