package chn.bhmc.dms.sal.svo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.svo.service.ReqTestDriveVehicleService;
import chn.bhmc.dms.sal.svo.service.dao.ReqTestDriveVehicleDAO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehiclePopupCarVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehiclePopupEvlVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleSaveVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleSearchVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReqTestDriveVehicleServiceImpl
 * @Description : 시승차신청
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.02.23          최초 생성
 * </pre>
 */

@Service("reqTestDriveVehicleService")
public class ReqTestDriveVehicleServiceImpl extends HService implements ReqTestDriveVehicleService {

    /**
     * 시승차량 신청 DAO 선언
     */
    @Resource(name="reqTestDriveVehicleDAO")
    ReqTestDriveVehicleDAO reqTestDriveVehicleDAO;


    // id Gen 서비스
    @Resource(name="salHelpCarNoIdGenService")
    EgovIdGnrService salHelpCarNoIdGenService;



    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReqTestDriveVehicleSearchVO
     * @return 조회 목록
     */
    @Override
    public List<ReqTestDriveVehicleVO> selectReqTestDriveVehicleByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception{
        return reqTestDriveVehicleDAO.selectReqTestDriveVehicleByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectReqTestDriveVehicleByConditionCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception{
        return reqTestDriveVehicleDAO.selectReqTestDriveVehicleByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 시승차량 세부정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReqTestDriveVehicleSearchVO
     * @return 조회 목록
     */
    @Override
    public int selectReqTestDriveVehiclePopupContainCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception{
        return reqTestDriveVehicleDAO.selectReqTestDriveVehiclePopupContainCnt(searchVO);
    }
    @Override
    public List<ReqTestDriveVehicleVO> selectReqTestDriveVehiclePopupContain(ReqTestDriveVehicleSearchVO searchVO) throws Exception{
        return reqTestDriveVehicleDAO.selectReqTestDriveVehiclePopupContain(searchVO);
    }


    /**
     * 시승차량 신청 팝업 차량유형설명 정보 조회
     */
    @Override
    public int selectReqTestDriveVehiclePopupContsByConditionCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception{
        return reqTestDriveVehicleDAO.selectReqTestDriveVehiclePopupContsByConditionCnt(searchVO);
    }
    @Override
    public List<ReqTestDriveVehiclePopupCarVO> selectReqTestDriveVehiclePopupContsByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception{
        return reqTestDriveVehicleDAO.selectReqTestDriveVehiclePopupContsByCondition(searchVO);
    }

    /**
     * 시승차량 신청 팝업 차량내역 조회
     */
    @Override
    public int selectReqTestDriveVehiclePopupCarsByConditionCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception{
        return reqTestDriveVehicleDAO.selectReqTestDriveVehiclePopupCarsByConditionCnt(searchVO);
    }
    @Override
    public List<ReqTestDriveVehiclePopupCarVO> selectReqTestDriveVehiclePopupCarsByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception{
        return reqTestDriveVehicleDAO.selectReqTestDriveVehiclePopupCarsByCondition(searchVO);
    }


    /**
     * 시승차량신청 팝업 심사내역 조회
     */
    @Override
    public int selectReqTestDriveVehiclePopupEvlsByConditionCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception{
        return reqTestDriveVehicleDAO.selectReqTestDriveVehiclePopupEvlsByConditionCnt(searchVO);
    }
    @Override
    public List<ReqTestDriveVehiclePopupEvlVO> selectReqTestDriveVehiclePopupEvlsByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception{
        return reqTestDriveVehicleDAO.selectReqTestDriveVehiclePopupEvlsByCondition(searchVO);
    }

    /**
     * 시승차 이전내역 조회
     */
    @Override
    public List<ReqTestDriveVehicleVO> selectTestDriveBeforDtContain(ReqTestDriveVehicleSearchVO searchVO) throws Exception{
        return reqTestDriveVehicleDAO.selectTestDriveBeforDtContain(searchVO);
    }

    /**
     * 시승차량 신청팝업 저장
     */
    @Override
    public int multiReqTestDriveVehiclePopups(ReqTestDriveVehicleSaveVO saveVO) throws Exception{

        ReqTestDriveVehicleVO contVO = saveVO.getReqTestDriveVehicleVO();
        int reqNo = 0;

        if(!(contVO.getReqNo() > 0)){
            // id gen 키생성
            reqNo = salHelpCarNoIdGenService.getNextIntegerId() ;
        }else{
            reqNo = contVO.getReqNo();
        }

        // SA_0422T 특수차판매신청 detail
        for(ReqTestDriveVehiclePopupCarVO insertVO : saveVO.getInsertTestDriveVehicleList()){
            insertVO.setDlrCd( LoginUtil.getDlrCd() );
            insertVO.setRegUsrId( LoginUtil.getUserId() );
            insertVO.setUpdtUsrId( LoginUtil.getUserId() );
            insertVO.setReqNo(reqNo);

            reqTestDriveVehicleDAO.insertReqTestDriveVehiclePopupCars(insertVO);

            //프로시저 추가[시승차주문정보수신1]
            reqTestDriveVehicleDAO.procDemoCarReq1(insertVO);
        }

        for(ReqTestDriveVehiclePopupCarVO updateVO : saveVO.getUpdateTestDriveVehicleList()){
            updateVO.setUpdtUsrId( LoginUtil.getUserId() );
            reqTestDriveVehicleDAO.updateReqTestDriveVehiclePopupCars(updateVO);

            //프로시저 추가[시승차주문정보수신1]
            reqTestDriveVehicleDAO.procDemoCarReq1(updateVO);
        }

        for(ReqTestDriveVehiclePopupCarVO deleteVO : saveVO.getDeleteTestDriveVehicleList()){
            reqTestDriveVehicleDAO.deleteReqTestDriveVehiclePopupCars(deleteVO);

            //프로시저 추가[시승차주문정보수신1]
            reqTestDriveVehicleDAO.procDemoCarReq1(deleteVO);
        }

        // SA_0424T 특수차 header
        // 수정
        if(contVO.getReqNo() > 0){
            contVO.setRegUsrId( LoginUtil.getUserId() );
            reqTestDriveVehicleDAO.updateReqTestDriveVehicle(contVO);

            //프로시저 추가[시승차주문정보수신2
            reqTestDriveVehicleDAO.procDemoCarReq2(contVO);
        }else{
            contVO.setDlrCd( LoginUtil.getDlrCd() );
            contVO.setRegUsrId( LoginUtil.getUserId() );
            contVO.setUpdtUsrId( LoginUtil.getUserId() );
            contVO.setReqNo(reqNo);

            reqTestDriveVehicleDAO.insertReqTestDriveVehicle(contVO);

            //프로시저 추가[시승차주문정보수신2
            reqTestDriveVehicleDAO.procDemoCarReq2(contVO);
        }

        return reqNo;
    }

    /**
     * 시승차량신청 2차심사요청 저장
     */
    @Override
    public int secondSaveReqTestDriveVehiclePopup(ReqTestDriveVehicleVO saveVO) throws Exception{
         reqTestDriveVehicleDAO.secondSaveReqTestDriveVehiclePopup(saveVO);

         reqTestDriveVehicleDAO.procDemoCarReq2(saveVO);
         return saveVO.getReqNo();
    }

    /**
     * 시승차량신청팝업 삭제
     */
    @Override
    public int deleteReqTestDriveVehicle(ReqTestDriveVehicleSearchVO deleteVO) throws Exception{
        reqTestDriveVehicleDAO.deleteReqTestDriveVehicle(deleteVO);
        return 0;
    }

    /**
     * 시승차량 신청팝업 확정
     */
    @Override
    public int confirmReqTestDriveVehicle(ReqTestDriveVehicleSearchVO saveVO) throws Exception{
        reqTestDriveVehicleDAO.confirmReqTestDriveVehicle(saveVO);

        ReqTestDriveVehiclePopupCarVO contVO = new ReqTestDriveVehiclePopupCarVO();
        contVO.setDlrCd(saveVO.getsDlrCd());
        contVO.setUsrId(saveVO.getsUsrId());
        contVO.setReqNo(saveVO.getsReqNo());

        //프로시저 추가[시승차주문정보수신2
        reqTestDriveVehicleDAO.procDemoCarReq2(contVO);
        return 0;
    }



}
