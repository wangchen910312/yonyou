package chn.bhmc.dms.sal.sti.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.TestDriveCarService;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarVO;
import chn.bhmc.dms.sal.sti.service.ConfirmWearingVehicleService;
import chn.bhmc.dms.sal.sti.service.dao.ConfirmWearingVehicleDAO;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehiclePopupVO;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehicleSaveVO;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehicleSearchVO;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehicleVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ConfirmWearingVehicleServiceImpl
 * @Description : 완성차 입고확정
 * @author Bong
 * @since 2016. 3. 14.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.14         Bong            최초 생성
 * </pre>
 */

@Service("confirmWearingVehicleService")
public class ConfirmWearingVehicleServiceImpl extends HService implements ConfirmWearingVehicleService {

    /**
     * 완성차 입고확정 DAO 선언
     */
    @Resource(name="confirmWearingVehicleDAO")
    ConfirmWearingVehicleDAO confirmWearingVehicleDAO;

    /**
     * 시승 차량 관리 서비스
     */
    @Resource(name="testDriveCarService")
    TestDriveCarService testDriveCarService;

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<ConfirmWearingVehicleVO> selectConfirmWearingVehicleByCondition(ConfirmWearingVehicleSearchVO searchVO) throws Exception {
        return confirmWearingVehicleDAO.selectConfirmWearingVehicleByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectConfirmWearingVehicleByConditionCnt(ConfirmWearingVehicleSearchVO searchVO)  throws Exception {
        return confirmWearingVehicleDAO.selectConfirmWearingVehicleByConditionCnt(searchVO);
    }

    @Override
    public void updateConfirmWearingVehicle(ConfirmWearingVehicleSaveVO obj) throws Exception {

        for(ConfirmWearingVehicleVO confirmWearingVehicleVO : obj.getUpdateList()){

            if( obj.getPopupVO() != null){

                ConfirmWearingVehicleSearchVO searchVO = new ConfirmWearingVehicleSearchVO();
                searchVO.setsVinNo(confirmWearingVehicleVO.getVinNo());

                if( confirmWearingVehicleDAO.selectConfirmWearingVehiclePopup(searchVO).size() < 1 ){
                    obj.getPopupVO().setVinNo(confirmWearingVehicleVO.getVinNo());
                    obj.getPopupVO().setRegUsrId(LoginUtil.getUserId());
                    obj.getPopupVO().setUpdtUsrId(LoginUtil.getUserId());

                    confirmWearingVehicleDAO.insertConfirmWearingVehicle(obj.getPopupVO());   // insert SA_0426T

                    //프로시저 추가
                    confirmWearingVehicleDAO.procDlrEvalResult(obj.getPopupVO());              // 딜러평가결과수신 IF
                }
            }

            confirmWearingVehicleVO.setUpdtUsrId(LoginUtil.getUserId());    //사용자
            confirmWearingVehicleVO.setCarStatCd(obj.getCarStatCd());       //입고 확정 및 확정 취소 값
            confirmWearingVehicleVO.setPrty(obj.getPrty());

            confirmWearingVehicleDAO.updateConfirmWearingVehicle(confirmWearingVehicleVO);    // update SA_0121T
            confirmWearingVehicleDAO.updateConfirmWearingVehicle2(confirmWearingVehicleVO);   // update SA_0416T

            /**
             * 시승차 (N7:주문유형) CRM 연동
             * 60 : 입고확정, 50 : 입고취소
             */
            if( "N7".equals(confirmWearingVehicleVO.getOrdTp()) ){
                if("60".equals(confirmWearingVehicleVO.getCarStatCd())){
                    TestDriveCarVO tCarVO = new TestDriveCarVO();
                    tCarVO.setDlrCd( LoginUtil.getDlrCd() );
                    tCarVO.setPltCd( LoginUtil.getPltCd());
                    tCarVO.setTdrvVinNo( confirmWearingVehicleVO.getVinNo() );
                    tCarVO.setRegUsrId(LoginUtil.getUserId());
                    tCarVO.setUseYn("Y");
                    testDriveCarService.insertTdrvCar(tCarVO);
                }
                else if("50".equals(confirmWearingVehicleVO.getCarStatCd())){
                    TestDriveCarSearchVO tSearchVO = new TestDriveCarSearchVO();
                    tSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                    tSearchVO.setsPltCd(LoginUtil.getPltCd());
                    tSearchVO.setsTdrvVinNo(confirmWearingVehicleVO.getVinNo());

                    if(!testDriveCarService.selectTdrvCarByKeyCnt(tSearchVO)){

                        // [예약] 된 [시승정보]가 있습니다.
                        throw processException("global.info.stInfo"
                                , new String[]{
                                        messageSource.getMessage("global.lbl.resv", null, LocaleContextHolder.getLocale())
                                        ,messageSource.getMessage("global.lbl.tdrvInfo", null, LocaleContextHolder.getLocale())
                                    }
                                );
                    }

                    // crm에서 시승차 사용중인지 확인 후 삭제
                    /*testDriveCarService.deleteTestDriveCar(tSearchVO);*/
                }
            }

            //프로시저 추가
            confirmWearingVehicleDAO.procDlrArrival(confirmWearingVehicleVO);                 // 딜러입고정보수신 IF
            confirmWearingVehicleDAO.procDlrArrival2(confirmWearingVehicleVO);                // 딜러인수보고수신 IF
       }
    }

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<ConfirmWearingVehiclePopupVO> selectConfirmWearingVehiclePopup(ConfirmWearingVehicleSearchVO searchVO) throws Exception {
        return confirmWearingVehicleDAO.selectConfirmWearingVehiclePopup(searchVO);
    }



    /**
     * 완성차 입고 - 모바일에서 바코드정보를 넘겨주면, 해당하는 차량정보를 반환해준다.
     */
    @Override
    public List<ConfirmWearingVehicleVO> retVehicleInfo(ConfirmWearingVehicleSaveVO obj) throws Exception {


        List<String> barcodeList = new ArrayList<String>();

        for(ConfirmWearingVehicleVO confirmWearingVehicleVO : obj.getInsertList()){
            String barcode = confirmWearingVehicleVO.getBarcodeNo();
            barcodeList.add(barcode.substring(barcode.length()-6, barcode.length()));
        }

        ConfirmWearingVehicleSearchVO searchVO = new ConfirmWearingVehicleSearchVO();
        searchVO.setBarcodeList(barcodeList);

        List<ConfirmWearingVehicleVO> retObj = confirmWearingVehicleDAO.retVehicleInfo(searchVO);

        return retObj;
    }



}
