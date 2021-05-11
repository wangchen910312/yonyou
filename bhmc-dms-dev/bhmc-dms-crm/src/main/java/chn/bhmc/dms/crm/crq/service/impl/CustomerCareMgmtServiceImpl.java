package chn.bhmc.dms.crm.crq.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CrmTargExtractService;
import chn.bhmc.dms.crm.crq.service.CustomerCareExtrTargetService;
import chn.bhmc.dms.crm.crq.service.CustomerCareMgmtService;
import chn.bhmc.dms.crm.crq.service.dao.CustomerCareMgmtDAO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareExtrTargetVO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareSearchVO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareVO;
import chn.bhmc.dms.crm.mcm.service.CampaignActionService;

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
     * 캠페인 관리 서비스
     */
    @Resource(name="campaignActionService")
    CampaignActionService campaignActionService;

    /**
     * 시스템설정정보 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

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
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}

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
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}

        return customerCareMgmtDAO.selectCustomerCareMgmtByKey(searchVO);
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

        // 고객케어미션 관리 저장
        if ( custCareSeq > 0 ) {

           Calendar cal = Calendar.getInstance();
           int dateDiff = DateUtil.daysBetween(cal.getTime(), saveVO.getStartDt());        // 등록일 - 오늘날짜 차이 구하기

           // 대상자자동추출가 N -> Y 로 변경시 && 시작일 > 오늘날짜 일경우 기존 대상자 목록 삭제 한다.
           if ( saveVO.getTmpCustExtrAutoYn().equals("N") && saveVO.getCustExtrAutoYn().equals("Y") && dateDiff > 0 ) {

               // 대상자 목록 삭제
               CustomerCareSearchVO searchVO = new CustomerCareSearchVO();
               searchVO.setsDlrCd(dlrCd);
               searchVO.setsCustCareSeq(saveVO.getCustCareSeq());
               customerCareExtrTargetService.deleteExtrTargetAll(searchVO);

               // 추출차수 및 마지막 추출일 초기화
               CustomerCareExtrTargetVO extrTargetVO = new CustomerCareExtrTargetVO();
               extrTargetVO.setDlrCd(dlrCd);
               extrTargetVO.setCustCareSeq(saveVO.getCustCareSeq());
               extrTargetVO.setExtrDgreCnt(0);

               customerCareMgmtDAO.updateExtrDgreCnt(extrTargetVO);

           }

            resultCnt = updateCustomerCareMgmt(saveVO);
        } else {
            resultCnt = insertCustomerCareMgmt(saveVO);
            custCareSeq = saveVO.getCustCareSeq();        // selectKey 로 seq 받아온다
        }

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
     * 시작전인경우 삭제 , 추출된 대상자도 삭제 ( 수동추출인경우 대상자가 있을수 있음. / 시작전이면 콜센터 전송이 안되기 때문에 콜센터 전송은 신경 안써도됨. )
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

        if ( resultCnt != 1 ) {
            // 고객케어일련번호 / 삭제 실패하였습니다.
            throw processException("global.err.delFailedParam", new String[]{messageSource.getMessage("crm.lbl.custCareSeq", null, LocaleContextHolder.getLocale())});
        } else {
            // 고객 케어 대상자 전체 삭제
            customerCareExtrTargetService.deleteExtrTargetAll(searchVO);
        }

        return resultCnt;
    }

    /**
     * 고객 추출 프로시저 호출
     *
     * @param customerCareSearchVO
     */
    @Override
    public String selectTargetExtractSave(CustomerCareVO customerCareVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();
        String result = "";

        if ( customerCareVO.getCustCareSeq() == 0 ) {
            // {고객케어일련번호}을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custCareSeq", null, LocaleContextHolder.getLocale())});
        }

        if ( !customerCareVO.getCustExtrAutoYn().equals("N") ) {
            // {대상자자동추출}을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custExtrAutoYn", null, LocaleContextHolder.getLocale())});
        }

        if ( StringUtils.isEmpty(customerCareVO.getCustExtrTermCd()) ) {
            // {고객추출조건}을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custExtrTermCd", null, LocaleContextHolder.getLocale())});
        }

        try {

                // 고객케어 대상자 추출 호출 - 고객케어 대상자 추출 후 추출정보 업데이트 ( 추출차수, 추출일 )
                customerCareVO.setDlrCd(dlrCd);
                customerCareVO.setRegUsrId(userId);
                customerCareVO.setUpdtUsrId(userId);
                customerCareMgmtDAO.callCustCareTargExtr(customerCareVO);
                result = customerCareVO.getResult();

        } catch (Exception e) {
            result = "99";
        }

        return result;

    }

}