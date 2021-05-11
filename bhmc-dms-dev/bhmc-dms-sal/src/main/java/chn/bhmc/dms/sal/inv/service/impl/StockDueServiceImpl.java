package chn.bhmc.dms.sal.inv.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.inv.service.StockDueService;
import chn.bhmc.dms.sal.inv.service.dao.StockDueDAO;
import chn.bhmc.dms.sal.inv.vo.StockDueSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockDueVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.CarInfoVO;

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

@Service("stockDueService")
public class StockDueServiceImpl extends HService implements StockDueService, JxlsSupport {

    /**
     * 재고실사 DAO 선언
     */
    @Resource(name="stockDueDAO")
    StockDueDAO stockDueDAO;

    /**
     * 차량정보
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 재고실사 자료 생성
     */
    public int CreateStockDueInfo(StockDueVO saveVO) throws Exception{

        if(stockDueDAO.selectStockDueInfoCnt(saveVO) == 0){
            saveVO.setRegUsrId(LoginUtil.getUserId());
            stockDueDAO.insertStockDueInfo(saveVO);
        }else{
            // msg : 재고실사 정보는 하루에 1번씩만 생성이 가능합니다.
            throw processException("sal.info.StockDueCreateInfo");
        }
        return 1;
    }

    /**
     * 재고실사 헤더 갯수 조회
     */
    public int selectStockDueListsByConditionCnt(StockDueSearchVO searchVO) throws Exception{
        return stockDueDAO.selectStockDueListsByConditionCnt(searchVO);
    }

    /**
     * 재고실사 헤더 조회
     */
    public List<StockDueVO> selectStockDueListsByCondition(StockDueSearchVO searchVO) throws Exception{
        return stockDueDAO.selectStockDueListsByCondition(searchVO);
    }

    /**
     * 재고실사 내역 갯수 조회
     */
    public int selectStockDueDetailListsByConditionCnt(StockDueSearchVO searchVO) throws Exception{
        return stockDueDAO.selectStockDueDetailListsByConditionCnt(searchVO);
    }

    /**
     * 재고실사 내역 조회
     */
    public List<StockDueVO> selectStockDueDetailListsByCondition(StockDueSearchVO searchVO) throws Exception{
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return stockDueDAO.selectStockDueDetailListsByCondition(searchVO);
    }

    /**
     * 재고실사 일괄저장
     */
    public int saveAllStockDue(StockDueVO saveVO) throws Exception{
        if(StringUtils.isBlank(saveVO.getDlrCd())){
            saveVO.setDlrCd(LoginUtil.getDlrCd());
        }
        return stockDueDAO.saveAllStockDue(saveVO);
    }

    /**
     * 재고실사 선택저장
     */
    public int saveSelectStockDue(List<StockDueVO> saveList) throws Exception{
        
        for(StockDueVO saveVO : saveList){
            if(StringUtils.isBlank(saveVO.getDlrCd())){
                saveVO.setDlrCd(LoginUtil.getDlrCd());
            }
            
            stockDueDAO.saveSelectStockDue(saveVO);
            
        }
        
        
        return 1;
    }

    
    
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
            carList = carInfoService.selectBarcodeCarVinsByCondition(carSearchVO);
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
        return stockDueDAO.selectStockDueDetailListsByConditionCnt(searchVO);
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
            carList = carInfoService.selectBarcodeCarVinsByCondition(carSearchVO);
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
        List<StockDueVO> resultList = stockDueDAO.selectStockDueDetailListsByCondition(searchVO);

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
     * 재고실사 내역 갯수 조회
     */
    public int multiStockDue(BaseSaveVO<StockDueVO> saveVO) throws Exception{

        for(StockDueVO sVO : saveVO.getUpdateList()){
            sVO.setRegUsrId(LoginUtil.getUserId() );
            sVO.setUpdtUsrId(LoginUtil.getUserId() );
            sVO.setDlrCd(LoginUtil.getDlrCd());
            stockDueDAO.updateStockDue(sVO);
        }
        return 1;
    }

    /**
     * 모바일-재고실사 내역 갯수 조회
     */
    public int multiMobStockDue(BaseSaveVO<StockDueVO> saveVO) throws Exception{

        for(StockDueVO sVO : saveVO.getUpdateList()){
            sVO.setRegUsrId(LoginUtil.getUserId() );
            sVO.setUpdtUsrId(LoginUtil.getUserId() );
            sVO.setDlrCd(LoginUtil.getDlrCd());
            stockDueDAO.updateMobStockDue(sVO);
        }
        return 1;
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     * Excel Export
     */
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
