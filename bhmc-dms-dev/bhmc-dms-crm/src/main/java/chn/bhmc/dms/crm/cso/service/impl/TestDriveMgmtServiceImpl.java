package chn.bhmc.dms.crm.cso.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.TestDriveCarService;
import chn.bhmc.dms.crm.cso.service.TestDriveMgmtService;
import chn.bhmc.dms.crm.cso.service.dao.TestDriveMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.TestDriveCalendarVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvVO;

/**
 * 시승 예약 관리 서비스 구현 클래스
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

@Service("testDriveMgmtService")
public class TestDriveMgmtServiceImpl extends HService implements TestDriveMgmtService {

    /**
     * 시승 예약 관리 DAO
     */
    @Resource(name="testDriveMgmtDAO")
    TestDriveMgmtDAO testDriveMgmtDAO;


    /**
     * 시승 차량 관리 Service
     */
    @Resource(name="testDriveCarService")
    TestDriveCarService testDriveCarService;


    /**
     * 시승 예약 목록 수량 조회
     */
    @Override
    public int selectTestDriveResvsByConditionCnt(TestDriveResvSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}

        return testDriveMgmtDAO.selectTestDriveResvsByConditionCnt(searchVO);
    }

    /**
     * 시승 예약 목록 조회
     */
    @Override
    public List<TestDriveResvVO> selectTestDriveResvsByCondition(TestDriveResvSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}

        return testDriveMgmtDAO.selectTestDriveResvsByCondition(searchVO);
    }

    /**
     * 시승 상세 조회
     */
    @Override
    public TestDriveResvVO selectTestDriveMgmtByKey(TestDriveResvSearchVO searchVO) throws Exception {

        if(searchVO.getsTdrvSeq() <= 0){
            // 시승번호 / 을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.tdrvSeq", null, LocaleContextHolder.getLocale())});
        }

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        TestDriveResvVO testDriveResvVO = testDriveMgmtDAO.selectTestDriveMgmtByKey(searchVO);


        if(testDriveResvVO == null){
         // 시승정보 / 을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.tdrvInfo", null, LocaleContextHolder.getLocale())});
        }

        return testDriveResvVO;
    }

    /**
     * 최근 시승 날짜 조회
     */
    @Override
    public TestDriveResvVO selectTestDriveLastTimeDrivByKey(TestDriveResvSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}
        TestDriveResvVO testDriveResvVO = testDriveMgmtDAO.selectTestDriveLastTimeDrivByKey(searchVO);

        return testDriveResvVO;
    }



    /**
     * 시승 예약 중복을 확인한다.
     */
    @Override
    public int selectTdrvResvByKeyCnt(TestDriveResvVO testDriveResvVO) throws Exception {

        testDriveResvVO.setDlrCd(LoginUtil.getDlrCd());
        testDriveResvVO.setPltCd(LoginUtil.getPltCd());

        // 종료일 설정후 검색조건 추가
        Calendar cal = Calendar.getInstance();
        cal.setTime(testDriveResvVO.getResvDt());

        int tdrvHm = 0;
        if(testDriveResvVO.getTdrvHmCd() == null){
            tdrvHm = 30;
        }else{
            tdrvHm = Integer.parseInt(testDriveResvVO.getTdrvHmCd());
        }

        cal.add(Calendar.MINUTE, tdrvHm);
        testDriveResvVO.setResvEndDt(cal.getTime());

        return testDriveMgmtDAO.selectTdrvResvByKeyCnt(testDriveResvVO);
    }

    /**
     * 시승 예약 정보 저장
     */
    @Override
    public int multiTestDriveResvs(TestDriveResvVO testDriveResvVO) throws Exception {

        int resultCnt = 0;

        testDriveResvVO.setDlrCd(LoginUtil.getDlrCd());
        testDriveResvVO.setPltCd(LoginUtil.getPltCd());
        testDriveResvVO.setRegUsrId(LoginUtil.getUserId());
        testDriveResvVO.setUpdtUsrId(LoginUtil.getUserId());

        int duplChk = selectTdrvResvByKeyCnt(testDriveResvVO);
        if(duplChk > 0) {
            //중복된 데이터가 존재합니다.
            throw processException("global.err.duplicate");
        }

        // 시승 접수
        testDriveResvVO.setTdrvStatCd("01");   // 시승상태 ( 01:예약 / 02:취소 / 03:시승 )

        if(testDriveResvVO.getTdrvSeq() == 0 ){
            resultCnt = testDriveMgmtDAO.insertTestDriveResv(testDriveResvVO);
        }else{
            resultCnt = testDriveMgmtDAO.updateTestDriveResv(testDriveResvVO);
        }

        return resultCnt;
    }

    /**
     * 시승 예약 삭제
     */
    @Override
    public int cancelTestDriveResv(TestDriveResvVO testDriveResvVO) throws Exception {
        return testDriveMgmtDAO.cancelTestDriveResv(testDriveResvVO);
    }

    /**
     * 시승 일지를 저장 한다.
     */
    @Override
    public int updateTestDriveMgmt(TestDriveResvVO testDriveResvVO) throws Exception {


        String tdrvStatCd = "03";
        String updtUsrId = LoginUtil.getUserId();

        if(testDriveResvVO.getTdrvSeq() == 0){
            // 시승번호 / 을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.tdrvSeq", null, LocaleContextHolder.getLocale())});
        }

        // 시승 일지를 작성하면 시승 상태 완료로 변경
        testDriveResvVO.setTdrvStatCd(tdrvStatCd);
        testDriveResvVO.setUpdtUsrId(updtUsrId);

        int resultCnt = 0;
        resultCnt = testDriveMgmtDAO.updateTestDriveMgmt(testDriveResvVO);

        // 시승일지 작성 완료후 이후 주행거리 -> 시승차량 마스터의 최종 주행거리로 UPDATE
        if ( resultCnt == 1 ){

            String dlrCd = LoginUtil.getDlrCd();
            String pltCd = LoginUtil.getPltCd();

            TestDriveCarVO testDriveCarVO = new TestDriveCarVO();
            testDriveCarVO.setUpdtUsrId(updtUsrId);
            testDriveCarVO.setRunDistVal(testDriveResvVO.getAftRunDistVal());
            testDriveCarVO.setTdrvVinNo(testDriveResvVO.getTdrvVinNo());
            testDriveCarVO.setDlrCd(dlrCd);
            testDriveCarVO.setPltCd(pltCd);

            testDriveCarService.updateTestDriveCarRunDistVal(testDriveCarVO);

        }


        return resultCnt;
    }


    /**
     * 시승 예약 캘린더 목록 수량 조회
     */
    @Override
    public int selectTestDriveCalendarsByConditionCnt(TestDriveResvSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return testDriveMgmtDAO.selectTestDriveCalendarsByConditionCnt(searchVO);
    }

    /**
     * 시승 예약 캘린더 목록 조회
     */
    @Override
    public List<TestDriveCalendarVO> selectTestDriveCalendarsByCondition(TestDriveResvSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return testDriveMgmtDAO.selectTestDriveCalendarsByCondition(searchVO);
    }




}
