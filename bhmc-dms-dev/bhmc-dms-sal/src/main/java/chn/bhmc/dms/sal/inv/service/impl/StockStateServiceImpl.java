package chn.bhmc.dms.sal.inv.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.TestDriveCarService;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarVO;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterVO;
import chn.bhmc.dms.sal.inv.service.StockStateService;
import chn.bhmc.dms.sal.inv.service.dao.StockStateDAO;
import chn.bhmc.dms.sal.inv.vo.StockStateSaveVO;
import chn.bhmc.dms.sal.inv.vo.StockStateSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockStateVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockStateServiceServiceImpl
 * @Description : 재고상태관리
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.24          최초 생성
 * </pre>
 */

@Service("stockStateService")
public class StockStateServiceImpl extends HService implements StockStateService {

    /**
     * 재고상태관리 DAO 선언
     */
    @Resource(name="stockStateDAO")
    StockStateDAO stockStateDAO;

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
     * 위치 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    /**
     * CRM 시승 차량 관리 서비스
     */
    @Resource(name="testDriveCarService")
    TestDriveCarService testDriveCarService;
    
    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return
     */
    @Override
    public int selectStockStatesByConditionCnt(StockStateSearchVO searchVO) throws Exception{
        return stockStateDAO.selectStockStatesByConditionCnt(searchVO);
    }
    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return 조회 목록
     */
    @Override
    public List<StockStateVO> selectStockStatesByCondition(StockStateSearchVO searchVO) throws Exception{
        return stockStateDAO.selectStockStatesByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return
     */
    @Override
    public int selectStockStateSubsByConditionCnt(StockStateSearchVO searchVO) throws Exception{
        return stockStateDAO.selectStockStateSubsByConditionCnt(searchVO);
    }
    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return 조회 목록
     */
    @Override
    public List<StockStateVO> selectStockStateSubsByCondition(StockStateSearchVO searchVO) throws Exception{
        return stockStateDAO.selectStockStateSubsByCondition(searchVO);
    }

    /**
     * 재무상태관리 상세 유형들을 저장
     */
    @Override
    public int multiStockStates(StockStateSaveVO saveVO) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String stockTp = "";           // 재고유형
        String cmpCarYn = "";          // 회사차여부
        String cmpCarDstinCd = "";     // 회사차구분
        String strgeCd = "";           // 창고
        String locCd = "";             // 위치

        String bfStockTp = "";         // 재고유형(변경전)
        String bfCmpCarYn = "";        // 회사차여부(변경전)
        String bfCmpCarDstinCd = "";   // 회사차구분(변경전)
        String bfStrgeCd = "";         // 창고(변경전)
        String bfLocCd = "";           // 위치(변경전)


        // 재고유형 SAL074
        HashMap<String, String> stockTpMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL074", null, langCd)){
            stockTpMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }
        // 회사차구분 SAL053
        HashMap<String, String> cmpCarDstinCdMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL053", null, langCd)){
            cmpCarDstinCdMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }
        // 창고
        HashMap<String, String> storageMap = new HashMap<String, String>();
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        for(StorageVO vo : storageService.selectStoragesByCondition(storageSearchVO)){
            storageMap.put(vo.getStrgeCd(), vo.getStrgeNm());
        }
        // 위치
        HashMap<String, String> locMap = new HashMap<String, String>();
        BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();
        locSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        for(BinLocationMasterVO vo : binLocationMasterService.selectBinLocationMastersByCondition(locSearchVO)){
            locMap.put(vo.getLocCd(), vo.getLocNm());
        }

        for(StockStateVO updateVO : saveVO.getUpdateList()){
            updateVO.setRegUsrId( LoginUtil.getUserId() );
            updateVO.setUpdtUsrId( LoginUtil.getUserId() );

            stockStateDAO.updateStockStates(updateVO);      // SA_0121T : 차량마스터 update

            stockTp = updateVO.getStockTp() == null ? "" :  updateVO.getStockTp().trim();
            cmpCarYn = updateVO.getCmpCarYn() == null ? "" : updateVO.getCmpCarYn().trim();
            cmpCarDstinCd = updateVO.getCmpCarDstinCd() == null ? "" : updateVO.getCmpCarDstinCd().trim();
            strgeCd = updateVO.getStrgeCd() == null ? "" : updateVO.getStrgeCd().trim();
            locCd = updateVO.getLocCd() == null ? "" : updateVO.getLocCd().trim();

            bfStockTp = updateVO.getBfStockTp() == null ? "" : updateVO.getBfStockTp().trim();
            bfCmpCarYn = updateVO.getBfCmpCarYn() == null ? "" : updateVO.getBfCmpCarYn().trim();
            bfCmpCarDstinCd = updateVO.getBfCmpCarDstinCd() == null ? "" : updateVO.getBfCmpCarDstinCd().trim();
            bfStrgeCd = updateVO.getBfStrgeCd() == null ? "" : updateVO.getBfStrgeCd().trim();
            bfLocCd = updateVO.getBfLocCd() == null ? "" : updateVO.getBfLocCd().trim();

            // 재고 유형 : SA_0208T 변경 이력 저장
            if( !stockTp.equals(bfStockTp) ){
                updateVO.setStatChgCd("52");            // 상태변경코드(SAL009) : 재고유형 - 52
                //updateVO.setStatChgBefCont(bfStockTp);                    // 재고유형 변경전 코드
                //updateVO.setStatChgAftCont(stockTp);                      // 재고유형 변경후 코드
                updateVO.setStatChgBefCont(stockTpMap.get(bfStockTp) == null ? "" : stockTpMap.get(bfStockTp));    // 재고유형 변경전 명칭
                updateVO.setStatChgAftCont(stockTpMap.get(stockTp) == null ? "" : stockTpMap.get(stockTp));        // 재고유형 변경후 명칭
                stockStateDAO.insertStockStateHis(updateVO);
            }

            // 회사차여부 : SA_0208T 변경 이력 저장
            if(!cmpCarYn.equals(bfCmpCarYn) ){
                updateVO.setStatChgCd("53");            // 상태변경코드(SAL009) : 회사차여부 - 53
                updateVO.setStatChgBefCont(bfCmpCarYn);
                updateVO.setStatChgAftCont(cmpCarYn);
                stockStateDAO.insertStockStateHis(updateVO);
            }

            // 회사차구분 : SA_0208T 변경 이력 저장
            if(!cmpCarDstinCd.equals(bfCmpCarDstinCd) ){
                updateVO.setStatChgCd("54");            // 상태변경코드(SAL009) : 회사차구분 - 54
                //updateVO.setStatChgBefCont(bfCmpCarDstinCd);
                //updateVO.setStatChgAftCont(cmpCarDstinCd);
                updateVO.setStatChgBefCont(cmpCarDstinCdMap.get(bfCmpCarDstinCd) == null ? "" : cmpCarDstinCdMap.get(bfCmpCarDstinCd));    // 회사차 변경전 명칭
                updateVO.setStatChgAftCont(cmpCarDstinCdMap.get(cmpCarDstinCd) == null ? "" : cmpCarDstinCdMap.get(cmpCarDstinCd));        // 회사차 변경후 명칭
                stockStateDAO.insertStockStateHis(updateVO);
            }

            // 창고 : SA_0208T 변경 이력 저장
            if(!strgeCd.equals(bfStrgeCd) ){
                updateVO.setStatChgCd("50");            // 상태변경코드(SAL009) : 창고 - 50
                //updateVO.setStatChgBefCont(bfStrgeCd);
                //updateVO.setStatChgAftCont(strgeCd);
                updateVO.setStatChgBefCont(storageMap.get(bfStrgeCd) == null ? "" : storageMap.get(bfStrgeCd));    // 창고 변경전 명칭
                updateVO.setStatChgAftCont(storageMap.get(strgeCd) == null ? "" : storageMap.get(strgeCd));        // 창고 변경후 명칭
                stockStateDAO.insertStockStateHis(updateVO);
            }

            // 위치 : SA_0208T 변경 이력 저장
            if(!locCd.equals(bfLocCd) ){
                updateVO.setStatChgCd("51");            // 상태변경코드(SAL009) : 위치 - 51
                //updateVO.setStatChgBefCont(bfLocCd);
                //updateVO.setStatChgAftCont(locCd);
                updateVO.setStatChgBefCont(locMap.get(bfLocCd) == null ? "" : locMap.get(bfLocCd));   // 위치 변경전 명칭
                updateVO.setStatChgAftCont(locMap.get(locCd) == null ? "" : locMap.get(locCd));       // 위치 변경후 명칭
                stockStateDAO.insertStockStateHis(updateVO);
            }
            
            
            // 회사차를 시승차로 변경하거나, 시승차를 다른 구분으로 변경했을 경우.
            if(!bfCmpCarDstinCd.equals( updateVO.getCmpCarDstinCd() )){
                TestDriveCarVO tCarVO = new TestDriveCarVO();
                tCarVO.setDlrCd( LoginUtil.getDlrCd() );
                tCarVO.setPltCd( LoginUtil.getPltCd());
                tCarVO.setRegUsrId(LoginUtil.getUserId());
                
                // 시승차 입고
                if("01".equals(updateVO.getCmpCarDstinCd())){
                    tCarVO.setTdrvVinNo( updateVO.getVinNo() );
                    tCarVO.setUseYn("Y");
                    testDriveCarService.insertTdrvCar(tCarVO);
                }
                
                if("01".equals(bfCmpCarDstinCd) ){
                    TestDriveCarSearchVO tSearchVO = new TestDriveCarSearchVO();
                    tSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                    tSearchVO.setsPltCd(LoginUtil.getPltCd());
                    tSearchVO.setsTdrvVinNo(updateVO.getVinNo());
                    
                    // crm에서 시승차 사용중인지 확인 후 삭제
                    if(!testDriveCarService.selectTdrvCarByKeyCnt(tSearchVO)){
                        
                        // [예약] 된 [시승정보]가 있습니다.
                        throw processException("global.info.stInfo"
                                , new String[]{
                                        messageSource.getMessage("global.lbl.resv", null, LocaleContextHolder.getLocale())
                                        ,messageSource.getMessage("global.lbl.tdrvInfo", null, LocaleContextHolder.getLocale())
                                    }
                                );
                    }
                    testDriveCarService.deleteTestDriveCar(tSearchVO);
                }
            }
            
        }

        return 1;
    }
}
