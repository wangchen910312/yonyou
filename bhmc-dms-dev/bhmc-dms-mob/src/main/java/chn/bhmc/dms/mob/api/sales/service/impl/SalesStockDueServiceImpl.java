package chn.bhmc.dms.mob.api.sales.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mob.api.sales.dao.SalesStockDueDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesCarInfoService;
import chn.bhmc.dms.mob.api.sales.service.SalesStockDueService;
import chn.bhmc.dms.mob.api.sales.vo.CarInfoSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.CarInfoVO;
import chn.bhmc.dms.mob.api.sales.vo.StockDueSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.StockDueVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockStateServiceServiceImpl
 * @Description : 재고실사
 * @author Jin Suk Kim
 * @since 2016. 08. 04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.08.04.     Jin Suk Kim        최초 생성
 * </pre>
 */

@Service("SalesStockDueService")
public class SalesStockDueServiceImpl extends HService implements SalesStockDueService, JxlsSupport {

    /**
     * 재고실사 DAO 선언
     */
    @Resource(name="SalesStockDueDAO")
    SalesStockDueDAO SalesStockDueDAO;

    /**
     * 차량정보
     */
    @Resource(name="SalesCarInfoService")
    SalesCarInfoService SalesCarInfoService;

   
    
    
    /**
     * 재고실사 모바일 상세내역 갯수 조회
     */
    public int selectStockDueDetailMobsByConditionCnt(StockDueSearchVO objVO) throws Exception{
        if(StringUtils.isBlank(objVO.getsDlrCd())){
            objVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        
        StockDueSearchVO searchVO = new StockDueSearchVO();
        CarInfoSearchVO carSearchVO = new CarInfoSearchVO();
        List<CarInfoVO> carList = null;
        for(String code : objVO.getBarcodeList()){
            carSearchVO.setDlrCd(objVO.getsDlrCd());
            carSearchVO.setBarCode(code);
            carList = SalesCarInfoService.selectBarcodeCarVinsByCondition(carSearchVO);
            if(carList != null && carList.size() > 0){
                for(CarInfoVO carVinVO : carList){
                    searchVO.getBarcodeList().add( carVinVO.getVinNo() );
                }
            }
        }

        if(searchVO.getBarcodeList().size() == 0){
            // msg : 바코드가 없습니다.
            //throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("mob.lbl.barcode", null, LocaleContextHolder.getLocale())});
            throw processException("mob.sal.error.notDealerCar");

        }

        searchVO.setsIsBarCode("B");
        if(searchVO.getsDlrCd() == null || "".equals( searchVO.getsDlrCd() )){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return SalesStockDueDAO.selectStockDueDetailListsByConditionCnt(searchVO);
    }

    /**
     * 재고실사 모바일 상세내역 조회
     */
    public List<StockDueVO> selectStockDueDetailMobsByCondition(StockDueSearchVO objVO) throws Exception{
        if(StringUtils.isBlank(objVO.getsDlrCd())){
            objVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        
        StockDueSearchVO searchVO = new StockDueSearchVO();
        CarInfoSearchVO carSearchVO = new CarInfoSearchVO();
        List<CarInfoVO> carList = null;

        // 바코드 - Vin NO 맵핑 List 정의
        ArrayList<HashMap<String, String>> vinBarCodeList = new ArrayList<HashMap<String, String>>();
        HashMap<String, String> vinMap = null;

        for(String code : objVO.getBarcodeList()){
            carSearchVO.setDlrCd(objVO.getsDlrCd());
            carSearchVO.setBarCode(code);
            carList = SalesCarInfoService.selectBarcodeCarVinsByCondition(carSearchVO);
            if(carList != null && carList.size() > 0){
                for(CarInfoVO carVinVO : carList){
                    vinMap = new HashMap<String, String>();
                    vinMap.put(carVinVO.getVinNo(), code);              //  vin_no : 바코드

                    searchVO.getBarcodeList().add( carVinVO.getVinNo() );
                    vinBarCodeList.add(vinMap);
                }
            }
        }

        if(searchVO.getBarcodeList().size() == 0){
            // msg : 바코드가 없습니다.
            //throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("mob.lbl.barcode", null, LocaleContextHolder.getLocale())});
            throw processException("mob.sal.error.notDealerCar");
        }

        searchVO.setsIsBarCode("B");
        if(searchVO.getsDlrCd() == null || "".equals( searchVO.getsDlrCd() )){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        List<StockDueVO> resultList = SalesStockDueDAO.selectStockDueDetailListsByCondition(searchVO);

        for(int i=0; i<resultList.size(); i++){
            String vinNo = resultList.get(i).getVinNo() != null ? resultList.get(i).getVinNo() : "";
            for(HashMap<String,String> obj : vinBarCodeList){
                if(obj.containsKey(vinNo)){
                    resultList.get(i).setBarcodeNo( (String)obj.get(vinNo) );
                }
            }
        }

        return resultList;
    }
    
    /**
     * 재고실사 내역 조회
     */
    public List<StockDueVO> selectStockDueDetailListsByCondition(StockDueSearchVO searchVO) throws Exception{
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return SalesStockDueDAO.selectStockDueDetailListsByCondition(searchVO);
    }
    
    
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        StockDueSearchVO searchVO = new StockDueSearchVO();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<StockDueVO> list = null ;
             list = selectStockDueDetailListsByCondition(searchVO);

        context.putVar("items", list);
    }
   
}
