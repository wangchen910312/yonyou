package chn.bhmc.dms.sal.obt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.obt.service.VehicleObtainReqService;
import chn.bhmc.dms.sal.obt.service.dao.VehicleObtainReqDAO;
import chn.bhmc.dms.sal.obt.vo.VehicleObtainReqSearchVO;
import chn.bhmc.dms.sal.obt.vo.VehicleObtainReqVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AapMngServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 4. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 22.      Kim yewon              최초 생성
 * </pre>
 */

@Service("vehicleObtainReqService")
public class VehicleObtainReqServiceImpl extends HService implements VehicleObtainReqService{

    /**
     * 차량조달신청관리 DAO 선언
     */
    @Resource(name="vehicleObtainReqDAO")
    VehicleObtainReqDAO vehicleObtainReqDAO;

    /**
     * 조회 조건에 해당하는 차량조달신청관리 정보를 조회한다.
     */
    @Override
    public List<VehicleObtainReqVO> selectVehicleObtainReqByCondition(VehicleObtainReqSearchVO searchVO) throws Exception {
        return vehicleObtainReqDAO.selectVehicleObtainReqByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 차량조달신청관리 목록 총 갯수를 조회한다.
     */
    @Override
    public int selectVehicleObtainReqByConditionCnt(VehicleObtainReqSearchVO searchVO) throws Exception {
        return vehicleObtainReqDAO.selectVehicleObtainReqByConditionCnt(searchVO);
    }


    /**
     * 대행업무를 저장한다.
     */
    @Override
    public int saveVehicleObtainReq(VehicleObtainReqVO saveVO) throws Exception{

        //신규등록
        if(saveVO.getObtNo().equals("")){
            saveVO.setRegUsrId(LoginUtil.getUserId());          // 등록자
            vehicleObtainReqDAO.insertVehicleObtainReq(saveVO);

            //프로시저추가 (차량조달심사요청정보수신)
            vehicleObtainReqDAO.procObtainReq(saveVO);
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

                    vehicleObtainReqDAO.updateVehicleObtainReqConf(saveVO);

                //불승인
                }else if(saveVO.getEvalRsltYn().equals("N")){
                    saveVO.setReqStatCd("D");
                }
            //조달입력 - 정보수정
            }else{
                saveVO.setEvalRsltYn("");
                saveVO.setReqStatCd("A");
            }
            vehicleObtainReqDAO.updateVehicleObtainReq(saveVO);

            //프로시저추가 (차량조달심사요청정보수신)
            vehicleObtainReqDAO.procObtainReq(saveVO);
        }

        return 1;
    }


    /**
     * 대행업무를 삭제한다.
     */
    @Override
    public int deleteVehicleObtainReq(VehicleObtainReqVO saveVO) throws Exception{

        vehicleObtainReqDAO.deleteVehicleObtainReq(saveVO);

        //프로시저추가 (차량조달심사요청정보수신)
        vehicleObtainReqDAO.procObtainReq(saveVO);

        return 1;
    }



}
