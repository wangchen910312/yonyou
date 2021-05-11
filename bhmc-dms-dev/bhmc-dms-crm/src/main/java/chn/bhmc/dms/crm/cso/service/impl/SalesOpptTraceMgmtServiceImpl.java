package chn.bhmc.dms.crm.cso.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptTraceMgmtService;
import chn.bhmc.dms.crm.cso.service.dao.SalesOpptTraceMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptTraceMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptTraceMgmtVO;


/**
 * 추적 관리 서비스 구현 클래스
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

@Service("salesOpptTraceMgmtService")
public class SalesOpptTraceMgmtServiceImpl extends HService implements SalesOpptTraceMgmtService {

    /**
     * 추적프로세스 관리 DAO
     */
    @Resource(name="salesOpptTraceMgmtDAO")
    SalesOpptTraceMgmtDAO salesOpptTraceMgmtDAO;

    /**
     * salesOpptProcessMgmtOutBoundService 관리 DAO
     */
    @Resource(name="salesOpptProcessMgmtOutBoundService")
    SalesOpptProcessMgmtOutBoundService salesOpptProcessMgmtOutBoundService;

    /**
     * 추적프로세스 관리 DAO
     */
    @Resource(name="salesOpptProcessMgmtService")
    SalesOpptProcessMgmtService salesOpptProcessMgmtService;

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptTraceMgmtService#selectSalesOpptTraceMgmtsByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptTraceMgmtSearchVO)
     */
    @Override
    public int selectSalesOpptTraceMgmtsByConditionCnt(SalesOpptTraceMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return salesOpptTraceMgmtDAO.selectSalesOpptTraceMgmtsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptTraceMgmtService#selectSalesOpptTraceMgmtsByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptTraceMgmtSearchVO)
     */
    @Override
    public List<SalesOpptTraceMgmtVO> selectSalesOpptTraceMgmtsByCondition(SalesOpptTraceMgmtSearchVO searchVO)
            throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return salesOpptTraceMgmtDAO.selectSalesOpptTraceMgmtsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptTraceMgmtService#multiSalesOpptTraceMgmts(chn.bhmc.dms.crm.cso.vo.SalesOpptTraceMgmtVO)
     */
    @Override
    public String multiSalesOpptTraceMgmts(SalesOpptTraceMgmtVO saveVO) throws Exception {

        try {
            if (StringUtils.isEmpty(saveVO.getDlrCd())){saveVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(saveVO.getLangCd())){saveVO.setLangCd(LoginUtil.getLangCd());}
            if (StringUtils.isEmpty(saveVO.getRegUsrId())) {saveVO.setRegUsrId(LoginUtil.getUserId());}
            if (StringUtils.isEmpty(saveVO.getUpdtUsrId())) {saveVO.setUpdtUsrId(LoginUtil.getUserId());}

            String salesOpptTraceNo = saveVO.getSeq();
            String salesOpptProcNo = saveVO.getSaleOpptSeq();

            if (StringUtils.isNotEmpty(salesOpptProcNo)) {
                // Trace insert
                saveVO.setDelYn("N");
                insertSalesOpptTraceMgmt(saveVO);
                salesOpptTraceNo = saveVO.getSeq();

                if (StringUtils.isNotEmpty(salesOpptTraceNo)) {
                    // salesOpptProcee Update (CR_0211T)
                    // 이전 단계 , 이전 책임자를 조회하여 함께 넘겨준다.
                    SalesOpptProcessMgmtSearchVO salesOpptProcessMgmtSearchVO = new SalesOpptProcessMgmtSearchVO();
                    salesOpptProcessMgmtSearchVO.setsSeq(salesOpptProcNo);
                    SalesOpptProcessMgmtVO salesOpptProcess = salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsByKey(salesOpptProcessMgmtSearchVO);

                    SalesOpptProcessMgmtVO salesOpptProcessMgmtVO = new SalesOpptProcessMgmtVO();
                    salesOpptProcessMgmtVO.setSeq(salesOpptProcNo);
                    salesOpptProcessMgmtVO.setBefLeadStatCd(salesOpptProcess.getBefLeadStatCd());
                    salesOpptProcessMgmtVO.setBefMngScId(salesOpptProcess.getBefMngScId());

                    salesOpptProcessMgmtVO.setTraceMthCd(saveVO.getTraceMthCd());
                    salesOpptProcessMgmtVO.setTraceDt(saveVO.getTraceDt());
                    if (saveVO.getNextTraceDt() == null){
                        saveVO.setNextTraceDt(DateUtils.parseDate("9999-12-31", "yyyy-MM-dd"));
                        salesOpptProcessMgmtVO.setNextTraceDtNullUpdYn("Y");
                        //.convertToDate("9999-12-31", "yyyy-MM-dd HH:mm")); // db Update문에 if null 비교에서 체크하기 위한 체크 값
                    }
                    salesOpptProcessMgmtVO.setNextTraceDt(saveVO.getNextTraceDt());
                    salesOpptProcessMgmtVO.setTraceGradeCd(saveVO.getTraceGradeCd());
                    salesOpptProcessMgmtVO.setValidGradeCd(saveVO.getValidGradeCd());
                    salesOpptProcessMgmtVO.setInvalidCauCd(saveVO.getInvalidCauCd());
                    salesOpptProcessMgmtVO.setUpdtUsrId(LoginUtil.getUserId());
                    salesOpptProcessMgmtVO.setLeadStatCd(saveVO.getLeadStatCd());
                    salesOpptProcessMgmtVO.setMngScId(saveVO.getMngScId());

                    salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);
                } else {
                    throw processException("global.err.updateFailedParam", new String[]{messageSource.getMessage("global.lbl.saleOppt", null, LocaleContextHolder.getLocale())});
                }

            } else {
                throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.saleOpptSeq", null, LocaleContextHolder.getLocale())});
            }

            return salesOpptTraceNo;

        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }

    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptTraceMgmtService#insertSalesOpptTraceMgmt(chn.bhmc.dms.crm.cso.vo.SalesOpptTraceMgmtVO)
     */
    @Override
    public int insertSalesOpptTraceMgmt(SalesOpptTraceMgmtVO salesOpptTraceMgmtVO) throws Exception {
        if (StringUtils.isEmpty(salesOpptTraceMgmtVO.getDlrCd())){salesOpptTraceMgmtVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(salesOpptTraceMgmtVO.getLangCd())){salesOpptTraceMgmtVO.setLangCd(LoginUtil.getLangCd());}

        return salesOpptTraceMgmtDAO.insertSalesOpptTraceMgmt(salesOpptTraceMgmtVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptTraceMgmtService#updateSalesOpptTraceMgmt(chn.bhmc.dms.crm.cso.vo.SalesOpptTraceMgmtVO)
     */
    @Override
    public int updateSalesOpptTraceMgmt(SalesOpptTraceMgmtVO salesOpptTraceMgmtVO) throws Exception {
        if (StringUtils.isEmpty(salesOpptTraceMgmtVO.getDlrCd())){salesOpptTraceMgmtVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(salesOpptTraceMgmtVO.getLangCd())){salesOpptTraceMgmtVO.setLangCd(LoginUtil.getLangCd());}
        return salesOpptTraceMgmtDAO.updateSalesOpptTraceMgmt(salesOpptTraceMgmtVO);
    }



}
