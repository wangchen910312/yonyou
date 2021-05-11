package chn.bhmc.dms.par.pmm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.pmm.service.ComItemMasterService;
import chn.bhmc.dms.par.pmm.service.ComItemMasterStatusService;
import chn.bhmc.dms.par.pmm.vo.ComItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ComItemMasterVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.CarInfoVO;


/**
 * <pre>
 * 공용품목현황 서비스 구현 클래스
 * </pre>
 *
 * @ClassName   : ComItemMasterStatusServiceImpl.java
 * @author In Bo Shim
 * @since 2016. 9. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 26.     In Bo Shim     최초 생성
 * </pre>
 */

@Service("comItemMasterStatusService")
public class ComItemMasterStatusServiceImpl extends HService implements ComItemMasterStatusService, JxlsSupport {

    /**
     * 공용품목마스터 관리 서비스
     */
    @Resource(name="comItemMasterService")
    private ComItemMasterService comItemMasterService;


    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /*
     * @see chn.bhmc.dms.par.pmm.service.ComItemMasterStatusService#comItemMasterStatusByCondition(chn.bhmc.dms.par.pmm.vo.ComItemMasterSearchVO)
     */
    @Override
    public List<ComItemMasterVO> selectComItemMasterStatusByCondition(ComItemMasterSearchVO searchVO) throws Exception {
        return comItemMasterService.comItemMasterByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ComItemMasterStatusService#comItemMasterStatusByConditionCnt(chn.bhmc.dms.par.pmm.vo.ComItemMasterSearchVO)
     */
    @Override
    public int selectComItemMasterStatusByConditionCnt(ComItemMasterSearchVO searchVO) throws Exception {
        return comItemMasterService.comItemMasterByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        ComItemMasterSearchVO searchVO = new ComItemMasterSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsItemCd(params.get("sItemCd").toString());
        searchVO.setsItemNm(params.get("sItemNm").toString());
        searchVO.setsBpTp(params.get("sBpTp").toString());
        searchVO.setsBpNm(params.get("sBpNm").toString());
        searchVO.setsBrandCd(params.get("sBrandCd").toString());
        searchVO.setsCarlineCd(params.get("sCarlineCd").toString());
        searchVO.setsAbcInd(params.get("sAbcInd").toString());
        searchVO.setsItemDstinCd(params.get("sItemDstinCd").toString());

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        List<CarInfoVO> carInfoList = new ArrayList<CarInfoVO>();
        carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());
        carInfoSearchVO.setUseYn("Y");
        carInfoList = carInfoService.selectCarListsByCondition(carInfoSearchVO);

        HashMap<String, String> carInfoMap = new HashMap<String, String>();
        for( CarInfoVO carInfoVO : carInfoList ){
            carInfoMap.put(carInfoVO.getCarlineCd(), carInfoVO.getCarlineNm());
        }

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        List<CommonCodeVO> bpTpList        = new ArrayList<CommonCodeVO>();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//구매처
        bpTpList = commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO);

        HashMap<String, String> bpTpMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : bpTpList ){
            bpTpMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        List<CommonCodeVO> itemDstinCdList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd);
        HashMap<String, String> itemDstinCdMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : itemDstinCdList ){
            itemDstinCdMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        List<CommonCodeVO> brandCdList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd);
        HashMap<String, String> brandCdMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : brandCdList ){
            brandCdMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        List<CommonCodeVO> abcIndList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR108", null, langCd);
        HashMap<String, String> abcIndMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : abcIndList ){
            abcIndMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        List<CommonCodeVO> useYnList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd);
        HashMap<String, String> useYnMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : useYnList ){
            useYnMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }


        List<ComItemMasterVO> list = comItemMasterService.comItemMasterByCondition(searchVO);
        ArrayList<ComItemMasterVO> rsltList = new ArrayList<ComItemMasterVO>();

        for( ComItemMasterVO sResultVO : list ){
            sResultVO.setItemDstinCd( itemDstinCdMap.get(String.valueOf(sResultVO.getItemDstinCd())));
            sResultVO.setBrandCd( brandCdMap.get(String.valueOf(sResultVO.getBrandCd())));
            sResultVO.setAbcInd( abcIndMap.get(String.valueOf(sResultVO.getAbcInd())));
            sResultVO.setEndYn( useYnMap.get(String.valueOf(sResultVO.getEndYn())));
            sResultVO.setBpTp( bpTpMap.get(String.valueOf(sResultVO.getBpTp())));
            sResultVO.setCarlineCd( carInfoMap.get(String.valueOf(sResultVO.getCarlineCd())));

            rsltList.add(sResultVO);
        }
        context.putVar("items", rsltList);
    }

}
