package chn.bhmc.dms.par.stm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.stm.service.StockDdlnService;
import chn.bhmc.dms.par.stm.service.dao.StockDdlnDAO;
import chn.bhmc.dms.par.stm.vo.StockDdlnItemVO;
import chn.bhmc.dms.par.stm.vo.StockDdlnSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.CarInfoVO;



/**
 * 월마감 구현 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Ju Won Lee      최초 생성
 * </pre>
 */
@Service("stockDdlnService")
public class StockDdlnServiceImpl extends HService implements StockDdlnService, JxlsSupport {

    @Resource(name="stockDdlnDAO")
    private StockDdlnDAO stockDdlnDAO;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * @see chn.bhmc.dms.par.stm.service.StockDdlnService#selectStockDdlnByCondition(chn.bhmc.dms.par.stm.vo.StockDdlnSearchVO)
     */
    @Override
    public List<StockDdlnItemVO> selectStockDdlnByCondition(StockDdlnSearchVO searchVO) throws Exception {
        return stockDdlnDAO.selectStockDdlnByCondition(searchVO);
    }

    /**
     * @see chn.bhmc.dms.par.stm.service.StockDdlnService#selectStockDdlnByConditionCnt(chn.bhmc.dms.par.stm.vo.StockDdlnSearchVO)
     */
    @Override
    public int selectStockDdlnByConditionCnt(StockDdlnSearchVO searchVO) throws Exception {
        return stockDdlnDAO.selectStockDdlnByConditionCnt(searchVO);
    }

    /**
     * @see chn.bhmc.dms.par.stm.service.StockDdlnService#selectStockDdlnByCondition(chn.bhmc.dms.par.stm.vo.StockDdlnSearchVO)
     */
    @Override
    public List<StockDdlnItemVO> selectStockDdlnByConditionByItemDistCd(StockDdlnSearchVO searchVO) throws Exception {
        return stockDdlnDAO.selectStockDdlnByConditionByItemDistCd(searchVO);
    }

    /**
     * @see chn.bhmc.dms.par.stm.service.StockDdlnService#selectStockDdlnByConditionCnt(chn.bhmc.dms.par.stm.vo.StockDdlnSearchVO)
     */
    @Override
    public int selectStockDdlnByConditionByItemDistCdCnt(StockDdlnSearchVO searchVO) throws Exception {
        return stockDdlnDAO.selectStockDdlnByConditionByItemDistCdCnt(searchVO);
    }

    /**
     * @see chn.bhmc.dms.par.stm.service.StockDdlnService#selectStockDdlnGrGiByCondition(chn.bhmc.dms.par.stm.vo.StockDdlnSearchVO)
     */
    @Override
    public List<StockDdlnItemVO> selectStockDdlnGrGiByCondition(StockDdlnSearchVO searchVO) throws Exception {
        return stockDdlnDAO.selectStockDdlnGrGiByCondition(searchVO);
    }

    /**
     * @see chn.bhmc.dms.par.stm.service.StockDdlnService#selectStockDdlnGrGiByConditionCnt(chn.bhmc.dms.par.stm.vo.StockDdlnSearchVO)
     */
    @Override
    public int selectStockDdlnGrGiByConditionCnt(StockDdlnSearchVO searchVO) throws Exception {
        return stockDdlnDAO.selectStockDdlnGrGiByConditionCnt(searchVO);
    }

    /**
     * @see chn.bhmc.dms.par.stm.service.StockDdlnService#executeManualParMmDdlnLoopDlrCdProcedure(chn.bhmc.dms.par.stm.vo.StockDdlnSearchVO)
     */
    @Override
    public int executeManualParMmDdlnLoopDlrCdProcedure(StockDdlnSearchVO searchVO) throws Exception {
        stockDdlnDAO.executeManualParMmDdlnLoopDlrCdProcedure(searchVO);
        return 1;
    }

    /**
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        StockDdlnSearchVO searchVO = new StockDdlnSearchVO();
        ArrayList<StockDdlnItemVO> rsltList = new ArrayList<StockDdlnItemVO>();

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        String sListType = params.get("sListType").toString();

        searchVO.setsLangCd(langCd);
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        List<CarInfoVO> carInfoList = new ArrayList<CarInfoVO>();
        carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());
        carInfoSearchVO.setUseYn("Y");
        carInfoList = carInfoService.selectCarListsByCondition(carInfoSearchVO);

        HashMap<String, String> storageMap = new HashMap<String, String>();
        for( StorageVO storageVO : storageList ){
            storageMap.put(storageVO.getStrgeCd(), storageVO.getStrgeNm());
        }

        HashMap<String, String> carInfoMap = new HashMap<String, String>();
        for( CarInfoVO carInfoVO : carInfoList ){
            carInfoMap.put(carInfoVO.getCarlineCd(), carInfoVO.getCarlineNm());
        }

        List<CommonCodeVO> itemDstinList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd);
        HashMap<String, String> itemDstinMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : itemDstinList ){
            itemDstinMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        if(!StringUtils.isBlank(params.get("sAccYyMmFr").toString())){
            String sAccYyMmFr = params.get("sAccYyMmFr").toString();
            searchVO.setsAccYyMmFr(sAccYyMmFr);
        }

        if(!StringUtils.isBlank(params.get("sAccYyMmTo").toString())){
            String sAccYyMmTo = params.get("sAccYyMmTo").toString();
            searchVO.setsAccYyMmTo(sAccYyMmTo);
        }


        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        if(StringUtil.nullConvert(sListType).equals("stockDdlnHd")){                  // 부품반품집계(Header)
            List<StockDdlnItemVO> list = stockDdlnDAO.selectStockDdlnByCondition(searchVO);

            for( StockDdlnItemVO sResultVO : list ){

                sResultVO.setStrgeCd( storageMap.get(String.valueOf(sResultVO.getStrgeCd())));
                sResultVO.setCarlineCd( carInfoMap.get(String.valueOf(sResultVO.getCarlineCd())));

                rsltList.add(sResultVO);
            }

            context.putVar("items", rsltList);
        } else if(StringUtil.nullConvert(sListType).equals("stockDdlnDtl")){           // 부품반품집계(Detail)
            List<StockDdlnItemVO> list = stockDdlnDAO.selectStockDdlnByConditionByItemDistCd(searchVO);
            for( StockDdlnItemVO sResultVO : list ){

                sResultVO.setStrgeCd( storageMap.get(String.valueOf(sResultVO.getStrgeCd())));
                sResultVO.setCarlineCd( carInfoMap.get(String.valueOf(sResultVO.getCarlineCd())));
                sResultVO.setItemDstinCd( itemDstinMap.get(String.valueOf(sResultVO.getItemDstinCd())));

                rsltList.add(sResultVO);
            }

            context.putVar("items", rsltList);
        } else if(StringUtil.nullConvert(sListType).equals("grGiStatus")){
            List<StockDdlnItemVO> list = stockDdlnDAO.selectStockDdlnGrGiByCondition(searchVO);
            for( StockDdlnItemVO sResultVO : list ){

                sResultVO.setStrgeCd( storageMap.get(String.valueOf(sResultVO.getStrgeCd())));
                sResultVO.setCarlineCd( carInfoMap.get(String.valueOf(sResultVO.getCarlineCd())));
                sResultVO.setItemDstinCd( itemDstinMap.get(String.valueOf(sResultVO.getItemDstinCd())));

                rsltList.add(sResultVO);
            }
            context.putVar("items", rsltList);
        }
    }
}
