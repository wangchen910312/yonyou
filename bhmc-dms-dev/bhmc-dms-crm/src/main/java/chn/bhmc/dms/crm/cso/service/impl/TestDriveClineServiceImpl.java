package chn.bhmc.dms.crm.cso.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.TestDriveClineService;
import chn.bhmc.dms.crm.cso.service.dao.TestDriveClineDAO;
import chn.bhmc.dms.crm.cso.vo.TestDriveClineSaveVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveClineSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveClineVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvSearchVO;

/**
 * 시승노선관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.05.12.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.12         in moon lee            최초 생성
 * </pre>
 */

@Service("testDriveClineService")
public class TestDriveClineServiceImpl extends HService implements TestDriveClineService {

    /**
     * 시승노선관리 DAO
     */
	@Resource(name="testDriveClineDAO")
	TestDriveClineDAO testDriveClineDAO;

	/**
	 * 파일관리
	 */
	@Resource(name="fileMgrService")
	FileMgrService fileMgrService;

    /**
     * 시승노선목록 수량 조회
     */
    @Override
    public int selectTestDriveClinesByConditionCnt(TestDriveClineSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return testDriveClineDAO.selectTestDriveClinesByConditionCnt(searchVO);
    }

    /**
     * 시승노선목록 조회
     */
    @Override
    public List<TestDriveClineVO> selectTestDriveClinesByCondition(TestDriveClineSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return testDriveClineDAO.selectTestDriveClinesByCondition(searchVO);
    }

    /**
     * 시승노선을 저장한다.
     */
    @Override
    public int multiTestDriveClineMgmt(TestDriveClineSaveVO saveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        String pltCd = LoginUtil.getPltCd();

        int resultCnt = 0;

        for(TestDriveClineVO insertTestDriveClineVO : saveVO.getInsertList()){

            insertTestDriveClineVO.setRegUsrId(userId);
            insertTestDriveClineVO.setDlrCd(dlrCd);
            insertTestDriveClineVO.setPltCd(pltCd);
            //insertTestDriveClineVO.setClineDocNo(insertTestDriveClineVO.getFileDocNo());
            resultCnt += testDriveClineDAO.insertTestDriveClineMgmt(insertTestDriveClineVO);

        }

        for(TestDriveClineVO updateTestDriveClineVO : saveVO.getUpdateList()){

            if ( updateTestDriveClineVO.getUseYn().equals("N") ) {

                int duplChk = selectTdrvClineByKeyCnt(updateTestDriveClineVO.getClineSeq());
                if(duplChk > 0) {
                    //해당 노선으로 시승예약이 존재합니다.
                    throw processException("crm.err.existTdrvCline");
                }
            }

            updateTestDriveClineVO.setUpdtUsrId(userId);
            updateTestDriveClineVO.setDlrCd(dlrCd);
            updateTestDriveClineVO.setPltCd(pltCd);
            resultCnt += testDriveClineDAO.updateTestDriveClineMgmt(updateTestDriveClineVO);

        }

        for(TestDriveClineVO deleteTestDriveClineVO : saveVO.getDeleteList()){

            int duplChk = selectTdrvClineByKeyCnt(deleteTestDriveClineVO.getClineSeq());
            if(duplChk > 0) {
                //해당 노선으로 시승예약이 존재합니다.
                throw processException("crm.err.existTdrvCline");
            }

            deleteTestDriveClineVO.setDlrCd(dlrCd);
            deleteTestDriveClineVO.setPltCd(pltCd);
            resultCnt += testDriveClineDAO.deleteTestDriveClineMgmt(deleteTestDriveClineVO);

            // 시승노선 마스터에서 그리드 정보 삭제 후 파일 삭제
            fileMgrService.deleteFileItem(deleteTestDriveClineVO.getFileDocNo(), deleteTestDriveClineVO.getFileNo());

        }

        return resultCnt ;

    }

    /**
     * 시승노선 사용여부 확인한다.
     */
    public int selectTdrvClineByKeyCnt(int clineSeq) throws Exception {

        TestDriveResvSearchVO searchVO = new TestDriveResvSearchVO();
        searchVO.setsTdrvClineCd(String.valueOf(clineSeq));

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}


        /******************************************
         *** 날짜 검색 조건 시작
         ******************************************/
        Calendar startCal = Calendar.getInstance();

        if(searchVO.getsStartDt() == null ){
            searchVO.setsStartDt(startCal.getTime());
        }

        int year;
        int month;
        int day;

        startCal.setTime(searchVO.getsStartDt());
        year = startCal.get(Calendar.YEAR);
        month = startCal.get(Calendar.MONTH);
        day = startCal.get(Calendar.DATE);

        startCal.set(year, month, day, 00, 00, 00);
        searchVO.setsStartDt(startCal.getTime());             // 시작일 설정
        /******************************************
         *** 날짜 검색 조건 시작 ***********************
         ******************************************/

        return testDriveClineDAO.selectTdrvClineByKeyCnt(searchVO);
    }


    /**
     * 시승노선을 등록한다.
     */
    public int insertTestDriveClineMgmt(TestDriveClineVO saveVO) throws Exception {
        return testDriveClineDAO.insertTestDriveClineMgmt(saveVO);
    }

    /**
     * 시승노선을 수정한다.
     */
    public int updateTestDriveClineMgmt(TestDriveClineVO saveVO) throws Exception {
        return testDriveClineDAO.updateTestDriveClineMgmt(saveVO);
    }

    /**
     * 시승노선을 삭제한다.
     */
    public int deleteTestDriveClineMgmt(TestDriveClineVO saveVO) throws Exception {
        return testDriveClineDAO.deleteTestDriveClineMgmt(saveVO);
    }

}
