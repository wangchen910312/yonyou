package chn.bhmc.dms.sal.exc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.exc.service.VehicleDlrExcService;
import chn.bhmc.dms.sal.exc.service.dao.VehicleDlrExcDAO;
import chn.bhmc.dms.sal.exc.vo.VehicleDlrExcSearchVO;
import chn.bhmc.dms.sal.exc.vo.VehicleDlrExcVO;
import chn.bhmc.dms.sal.inv.service.dao.StockStateDAO;
import chn.bhmc.dms.sal.inv.vo.StockStateVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleDlrExcImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 4. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 27.      Kim yewon              최초 생성
 * </pre>
 */

@Service("vehicleDlrExcService")
public class VehicleDlrExcServiceImpl extends HService implements VehicleDlrExcService{


    /**
     * 재고상태관리 DAO 선언
     */
    @Resource(name="stockStateDAO")
    StockStateDAO stockStateDAO;


    /**
     * 딜러간차량교환 DAO 선언
     */
    @Resource(name="vehicleDlrExcDAO")
    VehicleDlrExcDAO vehicleDlrExcDAO;

    /**
     * 조회 조건에 해당하는 딜러간차량교환 정보를 조회한다.
     */
    @Override
    public List<VehicleDlrExcVO> selectVehicleDlrExcByCondition(VehicleDlrExcSearchVO searchVO) throws Exception {
        return vehicleDlrExcDAO.selectVehicleDlrExcByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 차량조달신청관리 목록 총 갯수를 조회한다.
     */
    @Override
    public int selectVehicleDlrExcByConditionCnt(VehicleDlrExcSearchVO searchVO) throws Exception {
        return vehicleDlrExcDAO.selectVehicleDlrExcByConditionCnt(searchVO);
    }


    /**
     * 차량조달신청관리 정보를 저장한다.
     */
    @Override
    public int saveVehicleDlrExc(VehicleDlrExcVO saveVO) throws Exception{

        //신규등록
        if(saveVO.getExchNo().equals("")){
            saveVO.setRegUsrId(LoginUtil.getUserId());          // 등록자
            vehicleDlrExcDAO.insertVehicleDlrExc(saveVO);

            //프로시저추가 (딜러간차량교환심사요청정보수신)
            //vehicleDlrExcDAO.procExchangeReq(saveVO);
        }else {
            saveVO.setUpdtUsrId(LoginUtil.getUserId());         // 수정자
            //조달신청
            if(saveVO.getGb().equals("R")){
                saveVO.setReqStatCd("B");
                saveVO.setEvalRsltYn("");
            //조달확정
            }else if(saveVO.getGb().equals("C")){
                //승인
                if(saveVO.getEvalRsltYn().equals("Y")){
                    saveVO.setReqStatCd("C");

                    StockStateVO updateVO = new StockStateVO();

                    updateVO.setStatChgCd("55");            // 상태변경코드 : 딜러간차량교환 - 55
                    updateVO.setDlrCd(saveVO.getDlrCd());
                    updateVO.setVinNo(saveVO.getVinNo());
                    updateVO.setStatChgBefCont(saveVO.getDlrCd());
                    updateVO.setStatChgAftCont(saveVO.getObtDlrCd());
                    updateVO.setRegUsrId(LoginUtil.getUserId());

                    stockStateDAO.insertStockStateHis(updateVO);

                    //딜러간차량교환심사완료시 sa_0121t.dlr_cd 변경
                    saveVO.setDlrCd(saveVO.getDlrCd());
                    vehicleDlrExcDAO.updateVehicleDlrExcConf(saveVO);

                //불승인
                }else if(saveVO.getEvalRsltYn().equals("N")){
                    saveVO.setReqStatCd("D");
                }
            //조달입력 - 정보수정
            }else{
                saveVO.setEvalRsltYn("");
                saveVO.setReqStatCd("A");
            }
            vehicleDlrExcDAO.updateVehicleDlrExc(saveVO);

            //프로시저추가 (딜러간차량교환심사요청정보수신)
            vehicleDlrExcDAO.procExchangeReq(saveVO);
        }

        return 1;
    }


    /**
     * 차량조달신청관리 정보를 삭제한다.
     */
    @Override
    public int deleteVehicleDlrExc(VehicleDlrExcVO saveVO) throws Exception{

        vehicleDlrExcDAO.deleteVehicleDlrExc(saveVO);

        //프로시저추가 (딜러간차량교환심사요청정보수신)
        vehicleDlrExcDAO.procExchangeReq(saveVO);

        return 1;
    }



}
