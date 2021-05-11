package chn.bhmc.dms.crm.cso.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CarLineInfoService;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoVO;
import chn.bhmc.dms.crm.cso.service.SalesOpptMgmtService;
import chn.bhmc.dms.crm.cso.service.dao.SalesOpptMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptFailMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtVO;
import chn.bhmc.dms.crm.slm.service.LeadInfoService;
import chn.bhmc.dms.crm.slm.vo.LeadInfoVO;

/**
 * 판매기회 관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.07         in moon lee            최초 생성
 * </pre>
 */

@Service("salesOpptMgmtService")
public class SalesOpptMgmtServiceImpl extends HService implements SalesOpptMgmtService {

    /**
     * 판매기회 관리 DAO
     */
	@Resource(name="salesOpptMgmtDAO")
	SalesOpptMgmtDAO salesOpptMgmtDAO;

	/**
	 * 차량 공통 관리 Service
	 */
    @Resource(name="carLineInfoService")
    CarLineInfoService carLineInfoService;

    /**
     * systemConfigInfoService Service
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 리드관리 Service
     */
    @Resource(name="leadInfoService")
    LeadInfoService leadInfoService;



    /**
     * 판매기회 목록 수량 조회
     */
    @Override
    public int selectSalesOpptMgmtsByConditionCnt(SalesOpptMgmtSearchVO searchVO) throws Exception {

        /*
         * dlrCd, 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return salesOpptMgmtDAO.selectSalesOpptMgmtsByConditionCnt(searchVO);
    }

    /**
     * 판매기회 목록 조회
     */
    @Override
    public List<SalesOpptMgmtVO> selectSalesOpptMgmtsByCondition(SalesOpptMgmtSearchVO searchVO) throws Exception {

        /*
         * dlrCd, 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return salesOpptMgmtDAO.selectSalesOpptMgmtsByCondition(searchVO);
    }

    /**
     * 판매기회 정보를 등록한다. ( 판매기회 + 관심차 )
     *
     */
    @Override
    public String multiSalesOpptMgmts(SalesOpptMgmtSaveVO saveVO) throws Exception {

        // 관심차 저장
        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        saveVO.getSalesOpptMgmtVO().setRegUsrId(userId);
        saveVO.getSalesOpptMgmtVO().setUpdtUsrId(userId);
        saveVO.getSalesOpptMgmtVO().setDlrCd(dlrCd);

        // 리드번호가 없으면 리드 중복체크

        String leadNo = saveVO.getSalesOpptMgmtVO().getLeadNo();

        if ( StringUtils.isEmpty(leadNo) ) {
            if ( leadInfoService.selectLeadDupOutSideByKey(dlrCd, saveVO.getSalesOpptMgmtVO().getCustNo(), "ALL") > 0 ) {
                // 이미 등록 된 {중복리드} 입니다.
                throw processException("global.info.alreadyCont", new String[]{messageSource.getMessage("global.lbl.leadDup", null, LocaleContextHolder.getLocale())});
            }
        }

        // 신규 등록일경우 판매기회 중복체크
        if ( StringUtils.isEmpty(saveVO.getSalesOpptMgmtVO().getSaleOpptNo()) ) {

            if ( selectSalesOpptDupCnt(dlrCd, saveVO.getSalesOpptMgmtVO().getCustNo()) > 0 ) {
                // 이미 등록 된 {판매기회} 입니다.
                throw processException("global.info.alreadyCont", new String[]{messageSource.getMessage("global.lbl.saleOppt", null, LocaleContextHolder.getLocale())});
            }
        }

        int resultCnt = 0;
        String saleOpptNo = saveVO.getSalesOpptMgmtVO().getSaleOpptNo();

        // 판매기회 저장
        if(StringUtils.isNotEmpty(saleOpptNo)){
            resultCnt = updateSalesOpptMgmt(saveVO.salesOpptMgmtVO);
        } else {

            resultCnt = insertSalesOpptMgmt(saveVO.salesOpptMgmtVO);
            saleOpptNo = saveVO.getSalesOpptMgmtVO().getSaleOpptNo();        // selectKey 로 seq 받아온다

            // 리드번호가 없으면 리드 중복체크
            if ( StringUtils.isNotEmpty(leadNo) ) {

                // 리드 상태 변경
                LeadInfoVO leadInfoVO = new LeadInfoVO();

                leadInfoVO.setDlrCd(dlrCd);
                leadInfoVO.setLeadNo(leadNo);
                leadInfoVO.setStatCd("03");

                int updtLeadInfo = leadInfoService.updateLeadStat(leadInfoVO);

                if ( updtLeadInfo != 1 ) {
                    // {리드상태변경}에 실패하였습니다.
                    throw processException("global.info.failedMsg", new String[]{messageSource.getMessage("crm.lbl.leadStatChange", null, LocaleContextHolder.getLocale())});
                }

            }

        }

        // 관심차 저장
        for(CarLineInfoVO carLineInfoVO : saveVO.getInsertList()){
            carLineInfoVO.setRefKeyNm(saleOpptNo);                              // 판매 기회 번호 설정
            carLineInfoVO.setRegUsrId(userId);
            carLineInfoVO.setDlrCd(dlrCd);
            carLineInfoService.insertCarLine(carLineInfoVO);
        }

        for(CarLineInfoVO carLineInfoVO : saveVO.getUpdateList()){
            carLineInfoVO.setUpdtUsrId(userId);
            carLineInfoVO.setDlrCd(dlrCd);
            carLineInfoService.updateCarLine(carLineInfoVO);
        }

        for(CarLineInfoVO carLineInfoVO : saveVO.getDeleteList()){
            carLineInfoVO.setDlrCd(dlrCd);
            carLineInfoService.deleteCarLine(carLineInfoVO);
        }

        if(resultCnt < 1){
            // 내방정보 등록 실패되었습니다.
            throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("global.lbl.visitInfo", null, LocaleContextHolder.getLocale())});
        }

        //대표 관심차가 1개 있는지 확인
        int carLineFlagYnChk = 0;
        String refTableNm = "CR_0201T";
        String refKeyNm = saleOpptNo;

        HMap hm = new HMap();
        hm.put("dlrCd", dlrCd);
        hm.put("refTableNm", refTableNm);
        hm.put("refKeyNm", refKeyNm);

        carLineFlagYnChk = carLineInfoService.carLineFlagYnChk(hm);
        if(carLineFlagYnChk != 1){
            // 대표 관심차 1종을 등록해 주세요
            throw processException("global.err.typicalCarReg");
        }

        // 기회번호 return;
        return saleOpptNo;
    }

    /**
    * 판매기회 등록
    */
   @Override
   public int insertSalesOpptMgmt(SalesOpptMgmtVO salesOpptMgmtVO) throws Exception {
       return salesOpptMgmtDAO.insertSalesOpptMgmt(salesOpptMgmtVO);
   }

   /**
    * 판매기회 수정
    */
   @Override
   public int updateSalesOpptMgmt(SalesOpptMgmtVO salesOpptMgmtVO) throws Exception {
       return salesOpptMgmtDAO.updateSalesOpptMgmt(salesOpptMgmtVO);
   }

   /**
   * 판매기회 상세 조회
   */
  @Override
  public SalesOpptMgmtVO selectSalesOpptMgmtByKey(SalesOpptMgmtSearchVO searchVO) throws Exception {

      /*
       * dlrCd, 체크해서 기본 셋팅 시작
       */
      if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

      SalesOpptMgmtVO salesOpptMgmtVO = salesOpptMgmtDAO.selectSalesOpptMgmtByKey(searchVO);

      if(salesOpptMgmtVO == null){
          // 판매기회 상세정보 / 이(가) 올바르지 않습니다.
          throw processException("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.salesOpptDetlInfo", null, LocaleContextHolder.getLocale())});
      }else{

          Calendar cal = Calendar.getInstance();
          int dayDiff = DateUtil.daysBetween(salesOpptMgmtVO.getRegDt(), cal.getTime());        // 등록일 - 오늘날짜 차이 구하기

          //if(dayDiff >= 1 && dayDiff < 2 ){
          if(dayDiff >= 30 && dayDiff < 60 ){
              salesOpptMgmtVO.setRegPrid(1);
          //}else if(dayDiff >= 2){
          }else if(dayDiff >= 60){
              salesOpptMgmtVO.setRegPrid(2);
          }

      }

      return salesOpptMgmtVO;
  }


  /**
   * 판매기회 히스토리 목록 수량 조회
   */
  @Override
  public int selectSalesOpptHistorysByConditionCnt(SalesOpptMgmtSearchVO searchVO) throws Exception {

      /*
       * dlrCd 체크해서 기본 셋팅 시작
       */
      if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

      return salesOpptMgmtDAO.selectSalesOpptHistorysByConditionCnt(searchVO);
  }

  /**
   * 판매기회 히스토리 목록 조회
   */
  @Override
  public List<SalesOpptMgmtVO> selectSalesOpptHistorysByCondition(SalesOpptMgmtSearchVO searchVO) throws Exception {

      /*
       * dlrCd 체크해서 기본 셋팅 시작
       */
      if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

      return salesOpptMgmtDAO.selectSalesOpptHistorysByCondition(searchVO);
  }

  /**
   * 판매기회단계 상태 변경
   */
    @Override
    public int updateSalesOpptStep(SalesOpptMgmtVO saveVO) throws Exception {

        if(saveVO.getSaleOpptStepCd() == null) {
            // 판매기회단계 을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.saleOpptStepCd", null, LocaleContextHolder.getLocale())});
        }

        if(saveVO.getSaleOpptNo() == null) {
            // 판매기회번호 을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.saleOpptNo", null, LocaleContextHolder.getLocale())});
        }

        int result = salesOpptMgmtDAO.updateSalesOpptStep(saveVO);

        return result;
    }


    /**
     * 전출상태 변경
     */
    @Override
    public int updateTrsfStat(SalesOpptMgmtVO saveVO) throws Exception {

        if(saveVO.getTrsfStatCd() == null) {
            throw processException("global.err.duplicate");
        }

        int result = salesOpptMgmtDAO.updateTrsfStat(saveVO);

        return result;
    }

    /**
     * 판매기회 실패 등록
     */
    @Override
    public int insertSalesOpptFail(SalesOpptFailMgmtVO saveVO) throws Exception {

        int result = salesOpptMgmtDAO.insertSalesOpptFail(saveVO);

        // 판매기회 상태 변경
        if(result > 0){
            SalesOpptMgmtVO updtSaveVO = new SalesOpptMgmtVO();
            updtSaveVO.setSaleOpptNo(saveVO.getSaleOpptNo());
            updtSaveVO.setSaleOpptStepCd("07");                 // 판매기회단계 상태 변경 ( CRM211 / 07:실패)
            updtSaveVO.setUpdtUsrId(LoginUtil.getUserId());     // 수정자
            updtSaveVO.setScId(LoginUtil.getUserId());
            updtSaveVO.setDlrCd(LoginUtil.getDlrCd());
            updateSalesOpptStep(updtSaveVO);
        }

        return result;
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptMgmtService#updateSalesOpptFail(java.lang.String[])
     */
    @Override
    public int updateSalesOpptFail(String[] saleOpptNos) throws Exception {

        if(saleOpptNos.length == 0){
            throw processException("global.err.duplicate");
        }

        int result = 0;
        SalesOpptMgmtVO saveVO = new SalesOpptMgmtVO();

        for (String sSaleOpptNos : saleOpptNos) {

            saveVO.setSaleOpptNo(sSaleOpptNos);

            saveVO.setRegUsrId(LoginUtil.getUserId());     // 등록자
            saveVO.setUpdtUsrId(LoginUtil.getUserId());     // 수정자
            saveVO.setScId(LoginUtil.getUserId());
            saveVO.setDlrCd(LoginUtil.getDlrCd());        //

            //result += updateSalesOpptStat(saveVO);
        }

        return result;

    }

    /**
     * 판매기회단계 진행중 중복 수량 체크
     * @param dlrCd, custNo
     * @return 고객기준 판매기회단계 진행중인 수량 ( saleOpptStepCd : 02,03,04,05 )
     */
    @Override
    public int selectSalesOpptDupCnt(String dlrCd, String custNo) throws Exception {

        try {

            if( StringUtils.isEmpty(dlrCd) ){
                // 딜러코드 / 을(를) 확인하여 주세요.
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.dlrCd", null, LocaleContextHolder.getLocale())});
            }
            if( StringUtils.isEmpty(custNo) ){
                // 고객번호 / 을(를) 확인하여 주세요.
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
            }

            int result = 0;

            String dupConfigDay = systemConfigInfoService.selectStrValueByKey("termOfSalesOpptCheck");

            SalesOpptMgmtSearchVO searchVO = new SalesOpptMgmtSearchVO();
            searchVO.setsDlrCd(dlrCd);
            searchVO.setsCustNo(custNo);
            searchVO.setsDupConfigDay(dupConfigDay);

            result = salesOpptMgmtDAO.selectSalesOpptDupCnt(searchVO);

            return result;

        } catch (Exception e) {
            throw new BizException(e.getMessage());
        }

    }

}
