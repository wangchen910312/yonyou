package chn.bhmc.dms.mob.api.repair.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mob.api.repair.dao.RepairReservationReceiptDAO;
import chn.bhmc.dms.mob.api.repair.service.RepairReservationReceiptService;
import chn.bhmc.dms.mob.api.repair.vo.ReservationReceiptSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.ReservationReceiptVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BayManageServiceImpl.java
 * @Description : Bay관리 ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 1. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("RepairReservationReceiptService")
public class RepairReservationReceiptServiceImpl extends HService implements RepairReservationReceiptService, JxlsSupport {

    /**
     * 예약접수 DAO
     */
    @Resource(name="RepairReservationReceiptDAO")
    RepairReservationReceiptDAO RepairReservationReceiptDAO;

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectReservationReceiptListByConditionCnt(ReservationReceiptSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return RepairReservationReceiptDAO.selectReservationReceiptListByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<ReservationReceiptVO> selectReservationReceiptListByCondition(ReservationReceiptSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<ReservationReceiptVO> resvList = RepairReservationReceiptDAO.selectReservationReceiptListByCondition(searchVO);

        return resvList;
    }


    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        ReservationReceiptSearchVO searchVO = new ReservationReceiptSearchVO();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        if(!StringUtils.isBlank(params.get("sResvFromDt").toString())){
            String sResvFromDt = params.get("sResvFromDt").toString();
            Date dResvFromDt = DateUtil.convertToDate(sResvFromDt);
            searchVO.setsResvFromDt(dResvFromDt);
        }
        if(!StringUtils.isBlank(params.get("sResvToDt").toString())){
            String sResvToDt = params.get("sResvToDt").toString();
            Date dResvToDt = DateUtil.convertToDate(sResvToDt);
            searchVO.setsResvToDt(dResvToDt);
        }
        if(!StringUtils.isBlank(params.get("sSerResvStartFromDt").toString())){
            String sSerResvStartFromDt = params.get("sSerResvStartFromDt").toString();
            Date dSerResvStartFromDt = DateUtil.convertToDate(sSerResvStartFromDt);
            searchVO.setsSerResvStartFromDt(dSerResvStartFromDt);
        }
        if(!StringUtils.isBlank(params.get("sSerResvStartToDt").toString())){
            String sSerResvStartToDt = params.get("sSerResvStartToDt").toString();
            Date dSerResvStartToDt = DateUtil.convertToDate(sSerResvStartToDt);
            searchVO.setsSerResvStartToDt(dSerResvStartToDt);
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<ReservationReceiptVO> list = selectReservationReceiptListByCondition(searchVO);
        context.putVar("items", list);

    }
}