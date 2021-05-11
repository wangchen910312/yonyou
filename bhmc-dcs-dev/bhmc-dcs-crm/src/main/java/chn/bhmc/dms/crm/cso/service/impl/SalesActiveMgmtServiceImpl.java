package chn.bhmc.dms.crm.cso.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cfw.service.VisitCustomerService;
import chn.bhmc.dms.crm.cfw.vo.VisitCustomerSearchVO;
import chn.bhmc.dms.crm.cfw.vo.VisitCustomerVO;
import chn.bhmc.dms.crm.cso.service.SalesActiveMgmtService;
import chn.bhmc.dms.crm.cso.service.TestDriveMgmtService;
import chn.bhmc.dms.crm.cso.service.dao.SalesActiveMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.SalesActiveSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesActiveVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvVO;
import chn.bhmc.dms.crm.cso.vo.TotalSchedulerVO;

/**
 * 영업활동 관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.04.27.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.27         in moon lee            최초 생성
 * </pre>
 */

@Service("salesActiveMgmtService")
public class SalesActiveMgmtServiceImpl extends HService implements SalesActiveMgmtService {

    /**
     * 영업활동 관리 DAO
     */
	@Resource(name="salesActiveMgmtDAO")
	SalesActiveMgmtDAO salesActiveMgmtDAO;

	/**
	 * 전시장관리 DAO
	 */
	@Resource(name="visitCustomerService")
	VisitCustomerService visitCustomerService;

	/**
	 * 시승 관리 DAO
	 */
	@Resource(name="testDriveMgmtService")
	TestDriveMgmtService testDriveMgmtService;

    /**
     * 영업활동 관리 목록 수량 조회
     * @param SalesActiveSearchVO - 판매고문, 고객명, 영업활동유형코드
     */
    @Override
    public int selectSalesActiveMgmtsByConditionCnt(SalesActiveSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return salesActiveMgmtDAO.selectSalesActiveMgmtsByConditionCnt(searchVO);
    }

    /**
     * 영업활동 관리 목록 조회
     * @param SalesActiveSearchVO - 판매고문, 고객명, 영업활동유형코드
     */
    @Override
    public List<SalesActiveVO> selectSalesActiveMgmtsByCondition(SalesActiveSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return salesActiveMgmtDAO.selectSalesActiveMgmtsByCondition(searchVO);
    }


    /**
     * 영업활동 관리 상세 조회
     * @param SalesActiveSearchVO - 영업활동번호
     */
    @Override
    public SalesActiveVO selectSalesActiveMgmtByKey(SalesActiveSearchVO searchVO) {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return salesActiveMgmtDAO.selectSalesActiveMgmtByKey(searchVO);
    }

	/**
	 * 영업활동 관리 저장
	 * @param SalesActiveVO - 영업활동 정보
	 */
    //@Override
    public String multiSalesActiveMgmts(SalesActiveVO saveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        saveVO.setDlrCd(dlrCd);
        saveVO.setRegUsrId(userId);
        saveVO.setUpdtUsrId(userId);

        int resultCnt = 0;
        String saleActiveNo = saveVO.getSalesActiveNo();

        // 영업활동 관리 저장
        if(StringUtils.isNotEmpty(saleActiveNo)){
            resultCnt = updateSalesActiveMgmt(saveVO);
        } else {
            resultCnt = insertSalesActiveMgmt(saveVO);
            saleActiveNo = saveVO.getSalesActiveNo();        // selectKey 로 seq 받아온다
        }

        if(resultCnt < 1){
            // 영업활동 관리 등록 실패되었습니다.
            throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("global.lbl.visitInfo", null, LocaleContextHolder.getLocale())});
        }

        return saleActiveNo;
    }

    /**
     * 영업활동 관리 등록
     * @param SalesActiveVO - 영업활동 정보
     */
    //@Override
    public int insertSalesActiveMgmt(SalesActiveVO salesActiveVO) throws Exception {
        return salesActiveMgmtDAO.insertSalesActiveMgmt(salesActiveVO);
    }

    /**
     * 영업활동 관리 수정
     * @param SalesActiveVO - 영업활동 정보
     */
    //@Override
    public int updateSalesActiveMgmt(SalesActiveVO salesActiveVO) throws Exception {
        return salesActiveMgmtDAO.updateSalesActiveMgmt(salesActiveVO);
    }

    /**
     * 영업활동스케줄 목록(내방/시승/활동)
     * @param
     */
    @Override
    public SearchResult selectSalesTotalActiveCalendars(SalesActiveSearchVO searchVO) throws Exception {


        SearchResult result = new SearchResult();

        // 내방 / 시승 / 영업자 스케줄을 담을 전체 스케줄 리스트 생성
        List<TotalSchedulerVO> totalSchedulerList = new ArrayList<TotalSchedulerVO>();

        /*********************************************************************************
         *************** 내방 -> 전체 스케줄러 리스트에 추가 *****************************/
        VisitCustomerSearchVO visitCustomerSearchVO = new VisitCustomerSearchVO();
        visitCustomerSearchVO.setsVsitStat("N");      // 방문 상태 ( N : 예약/방문 인것)
        visitCustomerSearchVO.setsScId(searchVO.getsScId());      // SC 아이디
        visitCustomerSearchVO.setsStartDt(searchVO.getsStartDt());  // 시작일
        visitCustomerSearchVO.setsEndDt(searchVO.getsEndDt());      // 종료일
        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(visitCustomerSearchVO.getsDlrCd())){visitCustomerSearchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(visitCustomerSearchVO.getsPltCd())) {visitCustomerSearchVO.setsPltCd(LoginUtil.getPltCd());}

        int visitResvCnt = visitCustomerService.selectVisitCustomersByConditionCnt(visitCustomerSearchVO);

        if(visitResvCnt > 0){

            List<VisitCustomerVO> VisitCustomersByCondition = visitCustomerService.selectVisitCustomersByCondition(visitCustomerSearchVO);

            for (VisitCustomerVO visitCustomerVO : VisitCustomersByCondition) {

                TotalSchedulerVO visitResvVO = new TotalSchedulerVO();
                visitResvVO.setTotalSchedulerSeq("VSIT_"+visitCustomerVO.getVsitNo());                // 스케줄 ID 는 인트로.. 그래서 테이블명 + 기존 SEQ 합처서 스케줄 ID 만든다
                visitResvVO.setSchedulerSeq(visitCustomerVO.getVsitNo());
                visitResvVO.setSchedulerTp("01");       // SchedulerTp : 01(내방) / 02(시승) / 03(영업자 스케줄)
                visitResvVO.setSchedulerStat(visitCustomerVO.getVsitStatCd());       // 내방 상태 : 01(예약) / 02(취소) / 03(내방)
                visitResvVO.setTitle(messageSource.getMessage("global.lbl.visit", null, LocaleContextHolder.getLocale()));       //     내방
                visitResvVO.setStart(visitCustomerVO.getResvSchStartDt());
                visitResvVO.setEnd(visitCustomerVO.getResvSchEndDt());
                visitResvVO.setCustNm(visitCustomerVO.getCustNm());
                visitResvVO.setScId(visitCustomerVO.getScId());         // 스케줄러에서 scId 로 필터링 하기 때문에 필수
                visitResvVO.setScNm(visitCustomerVO.getScNm());

                totalSchedulerList.add(visitResvVO);

            }

        }
        /**************** 내방 -> 전체 스케줄러 리스트에 추가 ************************************
         *********************************************************************************/

        /*********************************************************************************
         *************** 시승 예약 -> 전체 스케줄러 리스트에 추가 *****************************/
        TestDriveResvSearchVO testDriveResvSearchVO = new TestDriveResvSearchVO();
        testDriveResvSearchVO.setsTdrvStat("N");     // 방문 상태 ( Y : 전체, N : 예약/방문 인것)
        testDriveResvSearchVO.setsScId(searchVO.getsScId());      // SC 아이디
        testDriveResvSearchVO.setsStartDt(searchVO.getsStartDt());  // 시작일
        testDriveResvSearchVO.setsEndDt(searchVO.getsEndDt());      // 종료일
        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(testDriveResvSearchVO.getsDlrCd())){testDriveResvSearchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(testDriveResvSearchVO.getsPltCd())) {testDriveResvSearchVO.setsPltCd(LoginUtil.getPltCd());}

        int testDriveResvCnt = testDriveMgmtService.selectTestDriveResvsByConditionCnt(testDriveResvSearchVO);

        if(testDriveResvCnt > 0){

            List<TestDriveResvVO> TestDrivesByCondition = testDriveMgmtService.selectTestDriveResvsByCondition(testDriveResvSearchVO);

            for (TestDriveResvVO testDriveResvVO : TestDrivesByCondition) {

                TotalSchedulerVO tdrvResvVO = new TotalSchedulerVO();
                tdrvResvVO.setTotalSchedulerSeq("TDRV_"+testDriveResvVO.getTdrvSeq());                      // 스케줄 ID 는 인트로.. 그래서 테이블명 + 기존 SEQ 합처서 스케줄 ID 만든다
                tdrvResvVO.setSchedulerSeq(Integer.toString(testDriveResvVO.getTdrvSeq()));
                tdrvResvVO.setSchedulerTp("02");       // SchedulerTp : 01(내방) / 02(시승) / 03(영업자 스케줄)
                tdrvResvVO.setSchedulerStat(testDriveResvVO.getTdrvStatCd());       // 시승 상태 : 01(예약) / 02(취소) / 03(내방)
                tdrvResvVO.setTitle(messageSource.getMessage("global.lbl.tdrv", null, LocaleContextHolder.getLocale()));       //     시승
                tdrvResvVO.setStart(testDriveResvVO.getResvDt());
                tdrvResvVO.setEnd(testDriveResvVO.getResvEndDt());
                tdrvResvVO.setCustNm(testDriveResvVO.getCustNm());
                tdrvResvVO.setScId(testDriveResvVO.getScId());         // 스케줄러에서 scId 로 필터링 하기 때문에 필수
                tdrvResvVO.setScNm(testDriveResvVO.getScNm());

                totalSchedulerList.add(tdrvResvVO);

            }

        }
        /**************** 시승 예약 -> 전체 스케줄러 리스트에 추가 ********************************
         *********************************************************************************/

        /*********************************************************************************
         *************** 영업자 스케줄 -> 전체 스케줄러 리스트에 추가 *****************************/

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        int schedulerListCnt = selectSalesActiveMgmtsByConditionCnt(searchVO);

        if(schedulerListCnt > 0){

            List<SalesActiveVO> SchedulerList = selectSalesActiveMgmtsByCondition(searchVO);

            for (SalesActiveVO salesActiveVO  : SchedulerList) {

                TotalSchedulerVO salesActiveResvVO = new TotalSchedulerVO();
                salesActiveResvVO.setTotalSchedulerSeq("ACTIVE_"+salesActiveVO.getSalesActiveNo());            // 스케줄 ID 는 인트로.. 그래서 테이블명 + 기존 SEQ 합처서 스케줄 ID 만든다
                salesActiveResvVO.setSchedulerSeq(salesActiveVO.getSalesActiveNo());
                salesActiveResvVO.setSchedulerTp("03");                                             // SchedulerTp : 01(내방) / 02(시승) / 03(영업자 스케줄)
                salesActiveResvVO.setSalesActiveTpCd(salesActiveVO.getSalesActiveTpCd());               // 영업활동유형코드
                salesActiveResvVO.setSchedulerStat(salesActiveVO.getSalesActiveStatCd());         // 활동 상태 : 01(예정) / 02(실행중) / 03(종료)
                salesActiveResvVO.setTitle(messageSource.getMessage("crm.lbl.salesActive", null, LocaleContextHolder.getLocale()));       //     영업활동
                salesActiveResvVO.setStart(salesActiveVO.getStartDt());
                salesActiveResvVO.setEnd(salesActiveVO.getEndDt());
                salesActiveResvVO.setCustNm(salesActiveVO.getCustNm());
                salesActiveResvVO.setScId(salesActiveVO.getScId());         // 스케줄러에서 scId 로 필터링 하기 때문에 필수
                salesActiveResvVO.setScNm(salesActiveVO.getScNm());

                totalSchedulerList.add(salesActiveResvVO);

            }

        }
        /**************** 영업자 스케줄 -> 전체 스케줄러 리스트에 추가 ****************************
         *********************************************************************************/

        int resultCnt;
        resultCnt = visitResvCnt + testDriveResvCnt + schedulerListCnt;
        result.setTotal(resultCnt);
        result.setData(totalSchedulerList);

        return result;
    }


}
