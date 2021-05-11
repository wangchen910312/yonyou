package chn.bhmc.dms.sal.ass.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.ass.service.AssignMngService;
import chn.bhmc.dms.sal.ass.service.dao.AssignMngDAO;
import chn.bhmc.dms.sal.ass.vo.AssignSearchVO;
import chn.bhmc.dms.sal.ass.vo.AssignVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AssignMngServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 3. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 3.      Kim yewon              최초 생성
 * </pre>
 */

@Service("assignMngService")
public class AssignMngServiceImpl extends HService implements AssignMngService, JxlsSupport {

    /**
     * 배정관리 DAO 선언
     */
    @Resource(name="assignMngDAO")
    AssignMngDAO assignMngDAO;

    /**
     * 조회 조건에 해당하는 배정 정보를 조회한다.
     */
    @Override
    public List<AssignVO> selectAssignByCondition(AssignSearchVO searchVO) throws Exception {
        return assignMngDAO.selectAssignByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 배정목록 총 갯수를 조회한다.
     */
    @Override
    public int selectAssignByConditionCnt(AssignSearchVO searchVO) throws Exception {
        return assignMngDAO.selectAssignByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 배정팝업 정보를 조회한다.
     */
    @Override
    public List<AssignVO> selectAssignPopupListByCondition(AssignSearchVO searchVO) throws Exception {
        return assignMngDAO.selectAssignPopupListByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 배정팝업 목록 총 갯수를 조회한다.
     */
    @Override
    public int selectAssignPopupListByConditionCnt(AssignSearchVO searchVO) throws Exception {
        return assignMngDAO.selectAssignPopupListByConditionCnt(searchVO);
    }


    /**
     * 배정관리 - 배정이벤트
     */
    @Override
    public boolean insertVehicleAssign(AssignVO assignVO) throws Exception {

        //int contractNoCnt = assignMngDAO.selectContractNo(assignVO.getContractNo());

        //if(contractNoCnt == 0){
            //배정처리 테이블에 insert
            assignVO.setStatCd("01");
            assignMngDAO.insertVehicleAssign(assignVO);

        //}else {
            //배정처리 테이블에 기존계약번호에 update
            //assignVO.setStatCd("01");
            //assignMngDAO.updateVehicleAssign(assignVO);

        //}

        String allocQueNo = assignMngDAO.selectContractNo(assignVO.getContractNo());
        assignVO.setAllocQueNo(allocQueNo);
        //배정처리 히스토리테이블에 insert
        assignVO.setStatCd("01");
        assignMngDAO.insertVehicleAssignH(assignVO);

        //계약정보 테이블 update
        assignVO.setContractStatCd("30");
        assignMngDAO.updateAssignOrder(assignVO);

        //차량정보 테이블 update
        assignVO.setOwnStatCd("A");
        assignVO.setVinNo(assignVO.getVinNo());
        assignMngDAO.updateAssignVehicle(assignVO);

        return true;
    }



    /**
     * 배정관리 - 배정취소 이벤트
     */
    @Override
    public boolean cancelVehicleAssign(AssignVO assignVO) throws Exception {

        String allocQueNo = assignMngDAO.selectContractNo(assignVO.getContractNo());
        assignVO.setAllocQueNo(allocQueNo);
        
        //배정히스토리 테이블 정보 변경
        assignVO.setStatCd("02");
        assignMngDAO.insertVehicleAssignH(assignVO);

        //배정테이블 정보 변경 (STS - '02')
        assignMngDAO.deleteVehicleAssign(assignVO);

        //계약정보 테이블 update(contract_stat_cd = '21',alloc_que_no,alloc_dt 초기화)
        assignVO.setContractStatCd("21");
        assignVO.setAllocQueNo("");
        assignMngDAO.updateAssignOrder(assignVO);

        //차량정보 테이블 update (own_stat_cd = 'O')
        assignVO.setOwnStatCd("O");
        assignVO.setContractNo("");
        assignMngDAO.updateAssignVehicle(assignVO);

        return true;
    }


    /**
     * 배정관리 - 차량교환 이벤트
     */
    @Override
    public boolean vehicleExchange(AssignVO assignVO) throws Exception {

        //배정처리 테이블에 기존계약번호에 update
        assignVO.setStatCd("03");
        assignMngDAO.updateVehicleExchangeO(assignVO);
        assignVO.setVinNo(assignVO.getVinNo2());
        assignMngDAO.insertExchangeH(assignVO);
        assignMngDAO.updateVehicleExchangeT(assignVO);
        assignVO.setVinNo(assignVO.getVinNo1());
        assignMngDAO.insertExchangeH(assignVO);

        //차량정보 테이블 update (vin no 교체)
        assignVO.setOwnStatCd("O");
        assignVO.setContractNo(assignVO.getContractNo2());
        assignVO.setVinNo(assignVO.getVinNo1());
        assignMngDAO.updateAssignVehicle(assignVO);

        assignVO.setOwnStatCd("O");
        assignVO.setContractNo(assignVO.getContractNo1());
        assignVO.setVinNo(assignVO.getVinNo2());
        assignMngDAO.updateAssignVehicle(assignVO);

        return true;
    }



    /**
     * 조회 조건에 해당하는 배정계약현황을 조회한다.
     */
    @Override
    public List<AssignVO> selectAssignStsByCondition(AssignSearchVO searchVO) throws Exception {
        return assignMngDAO.selectAssignStsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 배정계약현황목록 총 갯수를 조회한다.
     */
    @Override
    public int selectAssignStsByConditionCnt(AssignSearchVO searchVO) throws Exception {
        return assignMngDAO.selectAssignStsByConditionCnt(searchVO);
    }


    /**
     * 조회 조건에 해당하는 배정취소이력현황을 조회한다.
     */
    @Override
    public List<AssignVO> selectAssignCancelStsByCondition(AssignSearchVO searchVO) throws Exception {
        return assignMngDAO.selectAssignCancelStsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 배정취소이력목록 총 갯수를 조회한다.
     */
    @Override
    public int selectAssignCancelStsByConditionCnt(AssignSearchVO searchVO) throws Exception {
        return assignMngDAO.selectAssignCancelStsByConditionCnt(searchVO);
    }


    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     * Excel Export
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        AssignSearchVO searchVO = new AssignSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<AssignVO> list = null ;
        //배정계약현황
        if(searchVO.getsTabId().equals("assignContractStsT")){
             list = selectAssignStsByCondition(searchVO);
        }
        //미배정계약현황
        else if(searchVO.getsTabId().equals("unAssignContractStsT")){
            list = selectAssignByCondition(searchVO);
        }
        context.putVar("items", list);
    }

}
