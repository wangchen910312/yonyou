package chn.bhmc.dms.sal.inv.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.inv.service.StockOpenService;
import chn.bhmc.dms.sal.inv.service.dao.StockOpenDAO;
import chn.bhmc.dms.sal.inv.vo.StockMntVO;
import chn.bhmc.dms.sal.inv.vo.StockOpenIFVO;
import chn.bhmc.dms.sal.inv.vo.StockOpenSaveVO;
import chn.bhmc.dms.sal.inv.vo.StockOpenSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockOpenVO;

/**
 * @ClassName   : stockOpenServiceImpl
 * @Description : 공개재고관리
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.11.24          최초 생성
 * </pre>
 */

@Service("stockOpenService")
public class StockOpenServiceImpl extends HService implements StockOpenService {

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 공개재고관리 DAO 선언
     */
    @Resource(name="stockOpenDAO")
    StockOpenDAO stockOpenDAO;

    /**
     * 공개재고설정 팝업 딜러 목록 갯수 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockOpenSearchVO
     * @return 조회 목록
     */
    @Override
    public int selectStockOpenDlrsByConditionCnt(StockOpenSearchVO searchVO) throws Exception{
        return stockOpenDAO.selectStockOpenDlrsByConditionCnt(searchVO);
    }

    /**
     * 공개재고설정 팝업 딜러 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockOpenSearchVO
     * @return 조회 목록
     */
    @Override
    public List<StockOpenVO> selectStockOpenDlrsByCondition(StockOpenSearchVO searchVO) throws Exception{
        return stockOpenDAO.selectStockOpenDlrsByCondition(searchVO);
    }

    /**
     * 공개재고설정 한다.
     * @param searchVO - 조회 조건을 포함하는 StockOpenSearchVO
     * @return 조회 목록
     */
    @Override
    public int insertStockOpenDlr(StockOpenSaveVO saveVO) throws Exception{

        for(StockMntVO carVO : saveVO.getInsertCarList() ){

            for(StockOpenVO dlrVO : saveVO.getInsertList()){
                dlrVO.setCarId(carVO.getCarId());
                dlrVO.setVinNo(carVO.getVinNo());
                dlrVO.setOpenYn("Y");
                dlrVO.setRegUsrId( LoginUtil.getUserId() );
                dlrVO.setUpdtUsrId( LoginUtil.getUserId() );

                if( stockOpenDAO.selectStockOpenDlrCnt(dlrVO) > 0 ){
                    stockOpenDAO.updateStockOpen(dlrVO);
                }else{
                    stockOpenDAO.insertStockOpen(dlrVO);
                }
                callStockOpen(dlrVO);
            }

            carVO.setUpdtUsrId(LoginUtil.getUserId());
            carVO.setOpenYn("Y");
            stockOpenDAO.updateCarOpen(carVO);

        }
        return 1;
    }

    /**
     * 공개재고관리 조회
     */
    @Override
    public int selectStockOpensByConditionCnt(StockOpenSearchVO searchVO) throws Exception{
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return stockOpenDAO.selectStockOpensByConditionCnt(searchVO);
    }
    @Override
    public List<StockOpenVO> selectStockOpensByCondition(StockOpenSearchVO searchVO) throws Exception{
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return stockOpenDAO.selectStockOpensByCondition(searchVO);
    }

    /**
     * 공개재고 취소
     */
    @Override
    public int cancelStockOpenDlr(StockOpenSaveVO saveVO) throws Exception{
        StockMntVO mntVO = null;
        String sCarId = "";

        if("ALL".equals(saveVO.getChked())){
            for(StockOpenVO deleteVO : saveVO.getDeleteList()){
                deleteVO.setDlrCd("");
                stockOpenDAO.deleteStockOpen(deleteVO);

                // 차량마스터 공개재고 여부 N 변경
                mntVO = new StockMntVO();
                mntVO.setCarId(deleteVO.getCarId());
                mntVO.setOpenYn("N");
                stockOpenDAO.updateCarOpen(mntVO);
                
                // I/F DCS로 딜러별 공개여부 전송
                StockOpenSearchVO searchVO = new StockOpenSearchVO();
                searchVO.setsCarId(deleteVO.getCarId());
                for(StockOpenVO closeVO : stockOpenDAO.selectDeleteStockOpenDlrSearch(searchVO)){
                    closeVO.setOpenYn("N");
                    closeVO.setRegUsrId(LoginUtil.getUserId());
                    closeVO.setUpdtUsrId(LoginUtil.getUserId());
                    callStockOpen(closeVO);
                }
            }
        }else{
            // 공개재고 딜러별 삭제.
            for(StockOpenVO deleteVO : saveVO.getDeleteList()){
                deleteVO.setUpdtUsrId(LoginUtil.getUserId());
                sCarId = deleteVO.getCarId();
                stockOpenDAO.deleteStockOpen(deleteVO);
                
                deleteVO.setOpenYn("N");
                deleteVO.setRegUsrId(LoginUtil.getUserId());
                callStockOpen(deleteVO);
            }

            // 차량마스터 공개재고 여부 N 변경
            StockOpenVO searchVO = new StockOpenVO();
            searchVO.setCarId(sCarId);
            if(stockOpenDAO.selectStockOpenDlrCnt(searchVO) == 0){
                mntVO = new StockMntVO();
                mntVO.setCarId(sCarId);
                mntVO.setOpenYn("N");
                stockOpenDAO.updateCarOpen(mntVO);
            }
        }
        
        return 1;
    }

    /**
     * 공개재고 딜러별 팝업 조회
     */
    @Override
    public int selectStockOpenDlrPopupsByConditionCnt(StockOpenSearchVO searchVO) throws Exception{
        return stockOpenDAO.selectStockOpenDlrPopupsByConditionCnt(searchVO);
    }
    @Override
    public List<StockOpenVO> selectStockOpenDlrPopupsByCondition(StockOpenSearchVO searchVO) throws Exception{
        return stockOpenDAO.selectStockOpenDlrPopupsByCondition(searchVO);
    }

    // DMS -> DCS 공개재고 처리
    private boolean callStockOpen(StockOpenVO dlrVO) throws Exception{
        Map<String, Object> message = new HashMap<String, Object>();

        String toDay = DateUtil.getDate("yyyy-MM-dd HH:mm:ss");

        message.put("DLR_CD", dlrVO.getDlrCd());
        message.put("CAR_ID", dlrVO.getCarId());
        message.put("VIN_NO", dlrVO.getVinNo());
        message.put("OPEN_YN", dlrVO.getOpenYn());
        message.put("REG_USR_ID", dlrVO.getRegUsrId());
        message.put("REG_DT", toDay);
        message.put("UPDT_USR_ID", dlrVO.getUpdtUsrId());
        message.put("UPDT_DT", toDay);
        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL143");           // service id
        camelClient.setSender(dlrVO.getDlrCd());
        camelClient.addSendMessage(message);
        Data receiveData = camelClient.sendRequest();

        if (receiveData.getFooter().getIfResult().equals("E")) {
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
        }

        return true;
    }

    /**
     * 타딜러 재고조회
     */
    @Override
    public ArrayList<StockOpenVO> selectStockEtcOpensByCondition(StockOpenSearchVO searchVO) throws Exception{
        Map<String, Object> message = new HashMap<String, Object>();
        message.put("I_CARLINE_CD", searchVO.getsCarlineCd());
        message.put("I_MODEL_CD", searchVO.getsModelCd());
        message.put("I_OCN_CD", searchVO.getsOcnCd());
        message.put("I_EXT_COLOR_CD", searchVO.getsExtColorCd());
        message.put("I_INT_COLOR_CD", searchVO.getsIntColorCd());
        message.put("I_VIN_NO", searchVO.getsVinNo());
        message.put("I_SALE_DLR_SUNG_CD", searchVO.getsSungCd());
        message.put("I_SALE_DLR_CITY_CD", searchVO.getsCityCd());
        message.put("I_UPDT_START_DT", DateUtil.convertToDateString(searchVO.getsUpdtStartDt())); // EAI작업 이후 주석 해제
        message.put("I_UPDT_END_DT", DateUtil.convertToDateString(searchVO.getsUpdtEndDt()));   // EAI작업 이후 주석 해제
        message.put("I_DLR_CD", LoginUtil.getDlrCd());

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL144");           // service id
        camelClient.setSender(LoginUtil.getDlrCd());
        camelClient.addSendMessage(message);
        Data receiveData = camelClient.sendRequest();

        ArrayList<StockOpenVO> rs = null;
        List<StockOpenIFVO> resultIFList = null;
        if (!receiveData.getFooter().getIfResult().equals("E")) {
            resultIFList = receiveData.readMessages(StockOpenIFVO.class);

            rs = new ArrayList<StockOpenVO>();
            StockOpenVO sopenVO = null;
            for( StockOpenIFVO ifVo : resultIFList){
                sopenVO = new StockOpenVO();
                sopenVO.setDlrCd(ifVo.getDlrCd());
                sopenVO.setDlrNm(ifVo.getDlrNm());
                sopenVO.setCarlineCd(ifVo.getCarlineCd());
                sopenVO.setCarlineNm(ifVo.getCarlineNm());
                sopenVO.setModelCd(ifVo.getModelCd());
                sopenVO.setModelNm(ifVo.getModelNm());
                sopenVO.setOcnCd(ifVo.getOcnCd());
                sopenVO.setOcnNm(ifVo.getOcnNm());
                sopenVO.setExtColorCd(ifVo.getExtColorCd());
                sopenVO.setExtColorNm(ifVo.getExtColorNm());
                sopenVO.setIntColorCd(ifVo.getIntColorCd());
                sopenVO.setIntColorNm(ifVo.getIntColorNm());
                sopenVO.setCarId(ifVo.getCarId());
                sopenVO.setVinNo(ifVo.getVinNo());
                sopenVO.setDlrCd(ifVo.getDlrCd());
                sopenVO.setDlrNm(ifVo.getDlrNm());
                sopenVO.setSungCd(ifVo.getSungCd());
                sopenVO.setSungNm(ifVo.getSungNm());
                sopenVO.setCityCd(ifVo.getCityCd());
                sopenVO.setCityNm(ifVo.getCityNm());
                sopenVO.setOrdTp(ifVo.getOrdTp());
                sopenVO.setOrdTpNm(ifVo.getOrdTpNm());
                sopenVO.setSaleEmpNo(ifVo.getSaleEmpNo());
                sopenVO.setSaleEmpNm(ifVo.getSaleEmpNm());
                sopenVO.setSaleEmpTel(ifVo.getSaleEmpTel());
                sopenVO.setSaleEmpHp(ifVo.getSaleEmpHp());
                sopenVO.setUpdtUsrId(ifVo.getUpdtUsrId());
                sopenVO.setUpdtDt(DateUtil.convertToDate(ifVo.getUpdtStrDt()));
                rs.add(sopenVO);
            }
        }else{
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
            //result.setErrorMsg(receiveData.getFooter().getIfFailMsg());
        }

        return rs;
    }

}