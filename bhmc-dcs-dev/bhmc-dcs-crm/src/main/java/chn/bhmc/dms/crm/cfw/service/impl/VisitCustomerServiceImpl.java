package chn.bhmc.dms.crm.cfw.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.ass.service.AssignService;
import chn.bhmc.dms.crm.ass.vo.CustomerInfoAssignSaveVO;
import chn.bhmc.dms.crm.cfw.service.VisitCustomerService;
import chn.bhmc.dms.crm.cfw.service.dao.VisitCustomerDAO;
import chn.bhmc.dms.crm.cfw.vo.VisitCustomerSaveVO;
import chn.bhmc.dms.crm.cfw.vo.VisitCustomerSearchVO;
import chn.bhmc.dms.crm.cfw.vo.VisitCustomerVO;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cmm.service.CarLineInfoService;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoVO;

/**
 * 내방 예약 관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         in moon lee            최초 생성
 * </pre>
 */

@Service("visitCustomerService")
public class VisitCustomerServiceImpl extends HService implements VisitCustomerService {

    /**
     * 내방 예약 관리 DAO
     */
	@Resource(name="visitCustomerDAO")
	VisitCustomerDAO visitCustomerDAO;

    /**
     * 고객상세 Service
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 배정 Service
     */
    @Resource(name="assignService")
    AssignService assignService;

    /**
     * 차량 공통 관리 Service
     */
    @Resource(name="carLineInfoService")
    CarLineInfoService carLineInfoService;


    /**
     * 내방 예약 목록 수량 조회
     */
    @Override
    public int selectVisitCustomersByConditionCnt(VisitCustomerSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return visitCustomerDAO.selectVisitCustomersByConditionCnt(searchVO);
    }

    /**
     * 내방 예약 목록 조회
     */
    @Override
    public List<VisitCustomerVO> selectVisitCustomersByCondition(VisitCustomerSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return visitCustomerDAO.selectVisitCustomersByCondition(searchVO);
    }

    /**
     * 내방 예약 저장
     */
    @Override
    public String multiVisitCustomer(VisitCustomerVO visitCustomerVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        String pltCd = LoginUtil.getPltCd();

        visitCustomerVO.setDlrCd(dlrCd);
        visitCustomerVO.setPltCd(pltCd);
        visitCustomerVO.setRegUsrId(userId);
        visitCustomerVO.setUpdtUsrId(userId);

        int resultCnt = 0;
        String vsitNo = visitCustomerVO.getVsitNo();

        // 내방 예약 수정
        if(StringUtils.isNotEmpty(vsitNo)){
            resultCnt = visitCustomerDAO.updateVisitCustomer(visitCustomerVO);
        } else {

            // 내방 예약 등록 ( 내방 예약 서비스 호출 )
            resultCnt = visitCustomerDAO.insertVisitCustomer(visitCustomerVO);
            vsitNo = visitCustomerVO.getVsitNo();        // selectKey 로 seq 받아온다

            /**
             * 내방 예약 후 리드번호가 있을때.. 리드번호로 관심차 조회후 해당 내방건에 관심차 저장
             * 신규등록일때 최초 한번만 관심차 저장.
             * 리드번호 기준으로 관심차를 저장하면 관심차 테이블이랑 outer join 이기 때문에 한개의 내방에 대해 두개 이상이 조회됨.
             */
            if(resultCnt == 1 ){

                if( StringUtils.isNotEmpty(visitCustomerVO.getLeadNo()) ){

                    CarLineInfoSearchVO searchVO = new CarLineInfoSearchVO();
                    searchVO.setsRefTableNm("CR_0202T");
                    searchVO.setsRefKeyNm(visitCustomerVO.getLeadNo());
                    List<CarLineInfoVO> carLineInfoList = carLineInfoService.selectCarLineInfoByCondition(searchVO);

                    if( carLineInfoList.size() > 0 ){

                        // 관심차 저장
                        for(CarLineInfoVO carLineInfoVO : carLineInfoList){
                            carLineInfoVO.setRefTableNm("CR_0206T");                             // 판매 기회 번호 설정
                            carLineInfoVO.setRefKeyNm(vsitNo);                              // 판매 기회 번호 설정
                            carLineInfoVO.setRegUsrId(userId);
                            carLineInfoVO.setDlrCd(dlrCd);
                            carLineInfoVO.setRegUsrId(userId);
                            carLineInfoService.insertCarLine(carLineInfoVO);
                        }

                    }

                }
            }


        }

        return vsitNo;

    }

    /**
     * 전시장 유동량 관리 / 결과 정보 저장
     */
    @Override
    public int updateVisitCustomerMgmt(VisitCustomerVO visitCustomerVO) throws Exception {

        // 내방일이 있는경우는 상태를 내방으로 변경
//        if(visitCustomerVO.getVsitDt() != null){
//            visitCustomerVO.setVsitStatCd("03");
//        }
//

        return visitCustomerDAO.updateVisitCustomerMgmt(visitCustomerVO);
    }

    /**
     * 전시장 유동량 관리 / 결과 정보를 저장 한다.
     */
    @Override
    public String multiVisitCustomerMgmt(VisitCustomerSaveVO saveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        String pltCd = LoginUtil.getPltCd();

        saveVO.getVisitCustomerVO().setDlrCd(dlrCd);
        saveVO.getVisitCustomerVO().setPltCd(pltCd);
        saveVO.getVisitCustomerVO().setRegUsrId(userId);
        saveVO.getVisitCustomerVO().setUpdtUsrId(userId);

        int resultCnt = 0;
        String vsitNo = saveVO.getVisitCustomerVO().getVsitNo();

        // 전시장 유동량 관리 / 결과 정보를 저장
        if(StringUtils.isNotEmpty(vsitNo)){
            resultCnt = updateVisitCustomerMgmt(saveVO.getVisitCustomerVO());
        } else {

            // 내방 예약 등록 ( 내방 예약 서비스 호출 )
            resultCnt = visitCustomerDAO.insertVisitCustomer(saveVO.getVisitCustomerVO());
            vsitNo = saveVO.getVisitCustomerVO().getVsitNo();        // selectKey 로 seq 받아온다

        }

        /********************************************************************************************************
         * 고객 배정 시작
         * 내방고객에 대해서 담당자를 지정했는데
         * 지정한 담당자와 기존 담당자가 다를경우
         *******************************************************************************************************/
        // 고객 번호가 있는경우에만 고객 배정
        if (saveVO.getVisitCustomerVO().getCustNo() != null ) {

            // 고객 상세 조회 시작 / 고객상세조회후 배정 목록에 고객정보를 담아서 넘겨준다.
            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();
            searchVO.setsCustNo(saveVO.getVisitCustomerVO().getCustNo());

            if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

            List<CustomerInfoVO> list = customerInfoService.selectCustomerInfoByCondition(searchVO);

            // 기존담당자 검색후 기존담당자와 현재 담당자가 다르면 고객 배정 처리
            if ( list.size() == 1  ) {

                String mngScID = saveVO.getVisitCustomerVO().getScId();     // 현재 담당자 ( 내방관리에서 변경된 담당자 )
                String befScID = list.get(0).getMngScId();                          // 기존 담당자

                // 현재담당자 != 기존 담당자 인경우 고객배정 서비스 호출
                if(!mngScID.equals(befScID)){

                    CustomerInfoAssignSaveVO assignSaveVO = new CustomerInfoAssignSaveVO();

                    List<UserVO> userList = new ArrayList<UserVO>();                        // 배정 담당자 목록
                    UserVO userVO = new UserVO();
                    userVO.setUsrId(mngScID);                                               // 현재 배정 담당자 아이디 설정
                    userList.add(userVO);                                                   // 현재 배정 담당자 목록에 추가

                    assignSaveVO.setUserList(userList);
                    assignSaveVO.setAssignList(list);
                    assignService.updateCustomerInfoAssign(assignSaveVO);

                }

            }
        }
        /*******************************************************************************************************
         * 고객 배정 종료
         *******************************************************************************************************/

        /*******************************************************************************************************
         * 관심차 저장 시작 ( 필수 아님 )
         *******************************************************************************************************/
        for(CarLineInfoVO carLineInfoVO : saveVO.getInsertList()){
            carLineInfoVO.setRefKeyNm(vsitNo);                              // 내방 번호 설정
            carLineInfoVO.setRegUsrId(userId);
            carLineInfoVO.setDlrCd(dlrCd);
            carLineInfoVO.setPltCd(pltCd);
            carLineInfoService.insertCarLine(carLineInfoVO);
        }
        for(CarLineInfoVO carLineInfoVO : saveVO.getUpdateList()){
            carLineInfoVO.setUpdtUsrId(userId);
            carLineInfoVO.setDlrCd(dlrCd);
            carLineInfoVO.setPltCd(pltCd);
            carLineInfoService.updateCarLine(carLineInfoVO);
        }
        for(CarLineInfoVO carLineInfoVO : saveVO.getDeleteList()){
            carLineInfoVO.setDlrCd(dlrCd);
            carLineInfoVO.setPltCd(pltCd);
            carLineInfoService.deleteCarLine(carLineInfoVO);
        }
        if(resultCnt < 1){
            // 내방정보 등록 실패되었습니다.
            throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("global.lbl.visitInfo", null, LocaleContextHolder.getLocale())});
        }
        /*******************************************************************************************************
         * 관심차 저장 종료 ( 필수 아님 )
         *******************************************************************************************************/

        return vsitNo;

    }
//
//    /**
//     * 전시장 유동량 관리 정보를 저장 한다.
//     * 기존고객 뿐만 아니라
//     */
//    @Override
//    public String multiVisitCustomerMgmt(VisitCustomerSaveVO saveVO) throws Exception {
//
//        String userId = LoginUtil.getUserId();
//        String dlrCd = LoginUtil.getDlrCd();
//        String pltCd = LoginUtil.getPltCd();
//
//        saveVO.getVisitCustomerVO().setDlrCd(dlrCd);
//        saveVO.getVisitCustomerVO().setPltCd(pltCd);
//        saveVO.getVisitCustomerVO().setRegUsrId(userId);
//        saveVO.getVisitCustomerVO().setUpdtUsrId(userId);
//
//        String vsitNo = saveVO.getVisitCustomerVO().getVsitNo();
//
//        if(StringUtils.isNotEmpty(vsitNo)){
//            updateVisitCustomerMgmt(saveVO.getVisitCustomerVO());
//        } else {
//
//            // 내방 예약 등록 ( 내방 예약 서비스 호출 )
//            visitCustomerDAO.insertVisitCustomer(saveVO.getVisitCustomerVO());
//            vsitNo = saveVO.getVisitCustomerVO().getVsitNo();        // selectKey 로 seq 받아온다
//
//        }
//
//        return vsitNo;
//
//    }


    /**
     * 내방 상세 조회
     */
    @Override
    public VisitCustomerVO selectVisitCustomerMgmtByKey(VisitCustomerSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        VisitCustomerVO visitCustomerVO = visitCustomerDAO.selectVisitCustomerMgmtByKey(searchVO);

        if(visitCustomerVO == null){
            // 내방 상세정보 / 이(가) 올바르지 않습니다.        TODO 2건 나오는건 어떻게 처리???
            throw processException("global.err.invalid", new String[]{messageSource.getMessage("crm.lbl.visitDetlInfo", null, LocaleContextHolder.getLocale())});

        }

        return visitCustomerVO;
    }

    /**
     * 내방 -> 판매기회 이동시 고객 자동등록 프로세스.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @Override
    public String customerInfoReg(String vsitNo) throws Exception {

        String custNo = "";

        String dlrCd = LoginUtil.getDlrCd();
        String pltCd = LoginUtil.getPltCd();

        if ( StringUtils.isEmpty(vsitNo)  ) {
            // {내방번호}을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.visitSeq", null, LocaleContextHolder.getLocale())});
        } else {

            VisitCustomerSearchVO searchVO = new VisitCustomerSearchVO();

            if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(dlrCd);}
            if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(pltCd);}

            searchVO.setsVsitNo(vsitNo);

            VisitCustomerVO visitCustomerVO = new VisitCustomerVO();
            visitCustomerVO = selectVisitCustomerMgmtByKey(searchVO);

            // 내방번호 있고.. 고객번호 없는경우는 어떻게 처리하나???? -> 고객 자동 등록.
            if(visitCustomerVO != null ){

                CustomerInfoVO customerInfoVO = new CustomerInfoVO();

                customerInfoVO.setDlrCd(dlrCd);
                customerInfoVO.setCustNm(visitCustomerVO.getCustNm());
                customerInfoVO.setHpNo(visitCustomerVO.getHpNo());
                customerInfoVO.setPrefCommMthCd("01");
                customerInfoVO.setPrefCommNo(visitCustomerVO.getHpNo());
                customerInfoVO.setOfficeTelNo(visitCustomerVO.getHpNo());

                // 기본 셋팅 사항
                customerInfoVO.setCustTp("01");     // 개인/법인
                customerInfoVO.setCustCd("01");     // 가망고객
                customerInfoVO.setMathDocTp("");    // 증거유형
                customerInfoVO.setSsnCrnNo("");     // 증거번호

                customerInfoVO = customerInfoService.insertCustomer(customerInfoVO);

                if (customerInfoVO != null) {

                    // 해당 내방번호 -> 고객번호 업데이트
                    custNo = customerInfoVO.getCustNo();
                    VisitCustomerVO saveVO = new VisitCustomerVO();
                    saveVO.setVsitNo(vsitNo);
                    saveVO.setCustNo(custNo);
                    saveVO.setDlrCd(dlrCd);
                    saveVO.setPltCd(pltCd);

                    visitCustomerDAO.updateCustNo(saveVO);

                }

            }
        }

        return custNo;

    }

}
