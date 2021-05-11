package chn.bhmc.dms.crm.crq.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.mgr.service.BatchOperService;
import chn.bhmc.dms.bat.mgr.service.BatchScheduleService;
import chn.bhmc.dms.bat.mgr.vo.BatchOperVO;
import chn.bhmc.dms.bat.mgr.vo.BatchScheduleVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CrmTargExtractService;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractVO;
import chn.bhmc.dms.crm.crq.service.CustomerCareExtrTargetService;
import chn.bhmc.dms.crm.crq.service.CustomerCareMgmtService;
import chn.bhmc.dms.crm.crq.service.dao.CustomerCareMgmtDAO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareExtrTargetVO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareSearchVO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 고객케어미션 관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.05.02.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.02         in moon lee            최초 생성
 * </pre>
 */

@Service("customerCareMgmtService")
public class CustomerCareMgmtServiceImpl extends HService implements CustomerCareMgmtService {

    /**
     * 고객케어미션 관리 DAO
     */
	@Resource(name="customerCareMgmtDAO")
	CustomerCareMgmtDAO customerCareMgmtDAO;

	/**
	 * 대상자 추출 Service
	 */
	@Resource(name="crmTargExtractService")
	CrmTargExtractService crmTargExtractService;

	/**
	 * 고객케어 대상자 추출 Service
	 */
	@Resource(name="customerCareExtrTargetService")
	CustomerCareExtrTargetService customerCareExtrTargetService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 배치작업 관리 서비스
     */
    @Resource(name="batchOperService")
    BatchOperService batchOperService;

    /**
     * 배치스케쥴 관리 서비스
     */
    @Resource(name="batchScheduleService")
    BatchScheduleService batchScheduleService;

    /**
     * 배치 등록 idGen 서비스
     */
    @Resource(name="customerCareBatchIdgenService")
    EgovIdGnrService customerCareBatchIdgenService;

    /**
     * 고객케어미션 관리 목록 수량 조회
     * @param CustomerCareSearchVO - 판매고문, 고객명, 고객케어미션유형코드
     */
    @Override
    public int selectCustomerCareMgmtsByConditionCnt(CustomerCareSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return customerCareMgmtDAO.selectCustomerCareMgmtsByConditionCnt(searchVO);
    }

    /**
     * 고객케어미션 관리 목록 조회
     * @param CustomerCareSearchVO - 판매고문, 고객명, 고객케어미션유형코드
     */
    @Override
    public List<CustomerCareVO> selectCustomerCareMgmtsByCondition(CustomerCareSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return customerCareMgmtDAO.selectCustomerCareMgmtsByCondition(searchVO);
    }


    /**
     * 고객케어미션 관리 상세 조회
     * @param CustomerCareSearchVO - 고객케어미션번호
     */
    @Override
    public CustomerCareVO selectCustomerCareMgmtByKey(CustomerCareSearchVO searchVO) {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return customerCareMgmtDAO.selectCustomerCareMgmtByKey(searchVO);
    }


    /**
     * 고객케어미션 관리 - 배치 자동 등록
     * @param CustomerCareVO - 고객케어미션 정보
     */
    public void insertCustomerCareBatch(CustomerCareVO saveVO) throws Exception {

        String batchId = saveVO.getBatOperId();
        String userId = LoginUtil.getUserId();

        // 배치작업 정보를 저장,수정,삭제 한다.
        BatchOperVO batchOperVO = new BatchOperVO();

        batchOperVO.setBatOperId(batchId);
        batchOperVO.setBatOperNm(messageSource.getMessage("crm.lbl.customerCareExtr", null, LocaleContextHolder.getLocale())+" - "+batchId);        // 고객케어 대상사 추출 - batchId 배치작업명
        batchOperVO.setBatTp("01");                                     // QuartzJob
        batchOperVO.setBatPrgmNm("chn.bhmc.dms.bat.BatchSampleJobBean");
        batchOperVO.setBatParamVal("");
        batchOperVO.setBatEnabledYn(saveVO.getUseYn());
        batchOperVO.setRegUsrId(userId);

        batchOperService.insertBatchOper(batchOperVO);

        //배치 등록후 배치 아이디 set
        saveVO.setBatOperId(batchId);

        // 배치스케쥴 정보를 저장,수정,삭제 한다.
        BatchScheduleVO batchScheduleVO = new BatchScheduleVO();

        batchScheduleVO.setBatOperId(batchId);
        batchScheduleVO.setBatOperNm("");
        batchScheduleVO.setBatScheduleId(batchId+"-01");
        batchScheduleVO.setCronExpressionTxt(saveVO.getCustExtrCycleCont());
        batchScheduleVO.setTimezoneId("Asia/Seoul");        //TODO [한강석] 타임존 적용
        batchScheduleVO.setRegUsrId(userId);

        // TODO 배치스케줄이 등록되면 삭제가 안된다. 추후 작업!
        //batchScheduleService.insertBatchSchedule(batchScheduleVO);

        //TODO [이인문,안형준,이교진] 소스정리 필요 배치작업 등록
        /*
        int batchOperCnt = batchOperService.insertBatchOper(batchOperVO);

        if ( batchOperCnt == 1 ) {

            //배치 등록후 배치 아이디 set
            saveVO.setBatOperId(batchId);

            // 배치스케쥴 정보를 저장,수정,삭제 한다.
            BatchScheduleVO batchScheduleVO = new BatchScheduleVO();

            batchScheduleVO.setBatOperId(batchId);
            batchScheduleVO.setBatOperNm("");
            batchScheduleVO.setBatScheduleId(batchId+"-01");
            batchScheduleVO.setCronExpressionTxt(saveVO.getCustExtrCycleCont());
            batchScheduleVO.setTimezoneId("Asia/Seoul");        //TODO [한강석] 타임존 적용
            batchScheduleVO.setRegUsrId(userId);

            // TODO 배치스케줄이 등록되면 삭제가 안된다. 추후 작업!
            //batchScheduleService.insertBatchSchedule(batchScheduleVO);

        }
        */

    }


	/**
	 * 고객케어미션 관리 저장
	 * @param CustomerCareVO - 고객케어미션 정보
	 */
    //@Override
    public int multiCustomerCareMgmts(CustomerCareVO saveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        saveVO.setDlrCd(dlrCd);
        saveVO.setRegUsrId(userId);
        saveVO.setUpdtUsrId(userId);

        int resultCnt = 0;
        int custCareSeq = saveVO.getCustCareSeq();

        /**
         * 1. 배치 등록
         *      신규 : 고객추출자동여부 Y 등록
         *
         *      수정 : 고객추출자동여부 N -> Y 변경
         *
         * 2. 배치 수정
         *      사용안함으로 변경
         *          고객추출자동여부 Y -> N 수정
         *          사용여부 Y -> N 수정
         *      사용함으로 변경
         *          사용여부 N -> Y 으로 수정
         */

        // 배치 신규 등록
        if ( StringUtils.isEmpty(saveVO.getBatOperId()) ) {

            // 고객추출자동여부 : Y 일때 배치 등록
            if ( saveVO.getCustExtrAutoYn().equals("Y") ) {

                // 배치 신규 등록
                String batchId = customerCareBatchIdgenService.getNextStringId();
                saveVO.setBatOperId(batchId);
                insertCustomerCareBatch(saveVO);

            }
            // /고객추출자동여부 : Y 일때 배치 등록

        } else {

            // 배치 번호가 존재하는 경우
            BatchOperVO obj = batchOperService.selectBatchOperByKey(saveVO.getBatOperId());

            // TODO 배치 마스터에서 배치를 지웠을경우 ??? 기존 배치 번호로 다시 등록??
            if ( obj == null || obj.getBatOperId().isEmpty() && saveVO.getUseYn().equals("Y") && saveVO.getCustExtrAutoYn().equals("Y") ) {
                insertCustomerCareBatch(saveVO);
            } else {

                obj.setUpdtUsrId(userId);
                // 배치사용 N 수정 : 배치사용 Y && 고객케어사용 N || 고객추출자동여부 N
                if ( obj.getBatEnabledYn().equals("Y") && saveVO.getUseYn().equals("N") || obj.getBatEnabledYn().equals("Y") && saveVO.getCustExtrAutoYn().equals("N") ) {
                    obj.setBatEnabledYn("N");
                    batchOperService.updateBatchOper(obj);
                // 배치사용 Y 수정 : 배치사용N && 고객케어사용Y
                }else if ( obj.getBatEnabledYn().equals("N") && saveVO.getUseYn().equals("Y") || obj.getBatEnabledYn().equals("N") && saveVO.getCustExtrAutoYn().equals("Y") ) {
                    obj.setBatEnabledYn("Y");
                    batchOperService.updateBatchOper(obj);
                }

            }

        }
        // /배치 신규 등록

        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        Date currentDt  = DateUtil.convertToDate(sysDate, "yyyy-MM-dd");
        Date getStartDt = DateUtil.convertToDate(DateUtil.convertToString(saveVO.getStartDt(), "yyyy-MM-dd"), "yyyy-MM-dd");
        int dateDiff = DateUtil.daysBetween(currentDt ,getStartDt);

        // 고객추출자동여부가 N -> Y 로 변경시 && 시작일 > 오늘날짜 일경우 기존 대상자 목록 삭제 한다.
        if ( saveVO.getTmpCustExtrAutoYn().equals("N") && saveVO.getCustExtrAutoYn().equals("Y") && dateDiff > 0 ) {

            // 대상자 목록 삭제
            CustomerCareExtrTargetVO extrTargetVO = new CustomerCareExtrTargetVO();
            extrTargetVO.setDlrCd(dlrCd);
            extrTargetVO.setCustCareSeq(saveVO.getCustCareSeq());
            customerCareExtrTargetService.deleteExtrTarget(extrTargetVO);

            // 추출차수 및 마지막 추출일 초기화
            extrTargetVO.setExtrDgreCnt(0);

            customerCareMgmtDAO.updateExtrDgreCnt(extrTargetVO);

        }

        // 고객케어미션 관리 저장
        if ( custCareSeq > 0 ) {
            resultCnt = updateCustomerCareMgmt(saveVO);
        } else {
            resultCnt = insertCustomerCareMgmt(saveVO);
            custCareSeq = saveVO.getCustCareSeq();        // selectKey 로 seq 받아온다
        }

        /**
         * 실행유형 activeTpCd = sms
         * 고객추출자동여부 custExtrAutoYn = 'Y'
         * 자동발송여부 autoActiveYn ='Y'
         * ----------------------------> sms템플릿 activeTmplId 자동 발송
         */

        if(resultCnt < 1){
            // 고객케어미션 관리 등록 실패되었습니다.
            throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("global.lbl.visitInfo", null, LocaleContextHolder.getLocale())});
        }

        return custCareSeq;
    }

    /**
     * 고객케어미션 관리 등록
     * @param CustomerCareVO - 고객케어미션 정보
     */
    public int insertCustomerCareMgmt(CustomerCareVO salesActiveVO) throws Exception {
        return customerCareMgmtDAO.insertCustomerCareMgmt(salesActiveVO);
    }

    /**
     * 고객케어미션 관리 수정
     * @param CustomerCareVO - 고객케어미션 정보
     */
    public int updateCustomerCareMgmt(CustomerCareVO salesActiveVO) throws Exception {
        return customerCareMgmtDAO.updateCustomerCareMgmt(salesActiveVO);
    }

    /**
     * 고객케어미션 정보를 삭제 한다.
     * @param CustomerCareSearchVO - custCareSeq(고객케어번호)
     * @return 삭제 수량
     */
    @Override
    public int deleteCustomerCareMgmt(CustomerCareSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        if ( searchVO.getsCustCareSeq() == 0 ) {
            // 고객케어일련번호 / 을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custCareSeq", null, LocaleContextHolder.getLocale())});
        }

        int resultCnt = 0;

        resultCnt = customerCareMgmtDAO.deleteCustomerCareMgmt(searchVO);

        if ( resultCnt == 1 ) {
            // TODO 고객케어 삭제하면 배치 삭제?? 아니면 배치 사용 N 으로 ??
            // 고객케어 삭제 하면 대상자도 삭제, 배치도 삭제


        } else {

            // 고객케어일련번호 / 삭제 실패하였습니다.
            throw processException("global.err.delFailedParam", new String[]{messageSource.getMessage("crm.lbl.custCareSeq", null, LocaleContextHolder.getLocale())});


        }

        return resultCnt;
    }

    /**
     * 고객 추출 프로시저 호출
     *
     * @param customerCareSearchVO
     */
    @Override
    public boolean selectTargetExtractSave(CustomerCareExtrTargetVO customerCareExtrTargetVO) throws Exception {

        boolean result = false;

        if ( !customerCareExtrTargetVO.getCustExtrAutoYn().equals("N") ) {
            // {고객추출자동여부}을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custExtrAutoYn", null, LocaleContextHolder.getLocale())});
        }

        if ( customerCareExtrTargetVO.getCustCareSeq() == 0 ) {
            // {고객케어일련번호}을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custCareSeq", null, LocaleContextHolder.getLocale())});
        }

        if ( StringUtils.isEmpty(customerCareExtrTargetVO.getCustExtrTermNo()) ) {
            // {고객추출조건}을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custExtrTermNo", null, LocaleContextHolder.getLocale())});
        }

        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();

        CrmTargExtractSearchVO searchVO = new CrmTargExtractSearchVO();
        searchVO.setsDlrCd(dlrCd);

        try {

            CrmTargExtractVO crmTargExtractVO = new CrmTargExtractVO();
            crmTargExtractVO.setDlrCd(dlrCd);
            crmTargExtractVO.setCustExtrTermNo(customerCareExtrTargetVO.getCustExtrTermNo());       // 추출조건번호 설정
            crmTargExtractVO.setRegUsrId(userId);
            crmTargExtractVO.setUpdtUsrId(userId);

            CrmTargExtractVO targExtractResult = crmTargExtractService.selectTargetExtractSaveExcel(crmTargExtractVO);
            searchVO.setsSeq(targExtractResult.getSeq());   // 템프테이블 삭제를 위한 param set, try catch 때문에 여기서 설정함.

            // 프로시저 호출 성공일경우
            if ( targExtractResult.getResult().equals("00") ) {

                // 고객케어실행 - 대상자 목록에 인서트 후
                int insertCnt = 0;

                /*
                 * dlrCd 체크해서 기본 셋팅 시작
                 */
                if (StringUtils.isEmpty(customerCareExtrTargetVO.getDlrCd())){customerCareExtrTargetVO.setDlrCd(dlrCd);}

                //customerCareExtrTargetVO.setExtrSeq(Integer.parseInt(targExtractResult.getSeq()));          // 추출 템프 테이블 일련번호
                customerCareExtrTargetVO.setExtrSeq(targExtractResult.getSeq());          // 추출 템프 테이블 일련번호
                customerCareExtrTargetVO.setExtrDgreCnt(customerCareExtrTargetVO.getExtrDgreCnt() +1);      // 추출 차수 ( 기존 차수 + 1 )
                customerCareExtrTargetVO.setRegUsrId(userId);

                // 추출대상자 -> 고객테어 대상자 테이블 인서트
                insertCnt = customerCareExtrTargetService.insertTargExtract(customerCareExtrTargetVO);

                // 인서트 후 템프테이블 삭제
                if ( insertCnt > 0 ) {
                    crmTargExtractService.deleteTempList(searchVO);
                } else {
                    throw new Exception();
                }

                // 대상자 추출후 고객케어 실행유형이 전화인경우 콜센터 자동 전송 ( activeTpCd : 01 )
                if ( customerCareExtrTargetVO.getActiveTpCd().equals("01") ) {

                    boolean extrTargetTrsfCallCenter = customerCareExtrTargetService.insertExtrTargetTrsfCallCenter(customerCareExtrTargetVO);

                    if ( !extrTargetTrsfCallCenter ) {
                        throw new Exception();
                    }
                }

                // 고객케어실행 - 추출 차수, 콜센터 전송일 업데이트
                customerCareMgmtDAO.updateExtrDgreCnt(customerCareExtrTargetVO);

                result = true;

            }

        } catch (Exception e) {

            // TODO try - catch 를 하는게 맞나???? 프로시저 - JAVA Login 트렌젝션이 따로 묶여 있어서리...
            // TODO throw new Exception(); 으로 catch에 들어오면 roll-back 이 안되는데... DB 처리중 catch 로 들어오면 롤백된다. 추후 확인.
            crmTargExtractService.deleteTempList(searchVO);                                 // 템프테이블 삭제
            customerCareExtrTargetService.deleteExtrTarget(customerCareExtrTargetVO);       // 대상자 목록 삭제
            result = false;

            // {고객추출조건}을(를) 확인하여 주세요.
            //throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custExtrTermNo", null, LocaleContextHolder.getLocale())});

        }

        return result;

    }

}
