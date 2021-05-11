package chn.bhmc.dms.par.pcm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.*;
import able.com.vo.*;

import org.apache.commons.lang3.*;
import org.jxls.common.*;
import org.springframework.context.i18n.*;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.excel.*;
import chn.bhmc.dms.core.util.*;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.par.pcm.service.InvcService;
import chn.bhmc.dms.par.pcm.service.PurcOrdService;
import chn.bhmc.dms.par.pcm.service.dao.InvcDAO;
import chn.bhmc.dms.par.pcm.vo.*;

/**
 * 송장 구현 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Ju Won Lee      최초 생성
 * </pre>
 */
@Service("invcService")
public class InvcServiceImpl extends HService implements InvcService, JxlsSupport {

    @Resource(name="invcDAO")
    private InvcDAO invcDAO;

    /**
     * 구매오더 서비스
     */
    @Resource(name="purcOrdService")
    PurcOrdService purcOrdService;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdesByCondition(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<InvcVO> selectInvcsByCondition(InvcSearchVO searchVO) throws Exception {
        return invcDAO.selectInvcsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdsByConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public int selectInvcsByConditionCnt(InvcSearchVO searchVO) throws Exception {
        return invcDAO.selectInvcsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectInvcsDetailByCondition(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<InvcItemVO> selectInvcsDetailByCondition(InvcSearchVO searchVO) throws Exception {
        return invcDAO.selectInvcsDetailByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectInvcsDetailByConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public int selectInvcsDetailByConditionCnt(InvcSearchVO searchVO) throws Exception {
        return invcDAO.selectInvcsDetailByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        InvcSearchVO searchVO = new InvcSearchVO();
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName", "selectTabId");
        if (!StringUtil.isEmpty((String)params.get("sInvcDtFr"))) {
            searchVO.setsInvcDtFr(DateUtil.convertToDate((String)params.get("sInvcDtFr")));
        }
        if (!StringUtil.isEmpty((String)params.get("sInvcDtTo"))) {
            searchVO.setsInvcDtTo(DateUtil.convertToDate((String)params.get("sInvcDtTo")));
        }
        if (!StringUtil.isEmpty((String)params.get("sConfirmDtFr"))) {
            searchVO.setsConfirmDtFr(DateUtil.convertToDate((String)params.get("sConfirmDtFr")));
        }
        if (!StringUtil.isEmpty((String)params.get("sConfirmDtTo"))) {
            searchVO.setsConfirmDtTo(DateUtil.convertToDate((String)params.get("sConfirmDtTo")));
        }

        if(StringUtils.defaultString((String)params.get("selectTabId"), "").equals("DT")){
            List<InvcItemVO> list = selectInvcsDetailByCondition(searchVO);
            for(InvcItemVO invcItemVO : list){
                invcItemVO.setPurcOrdTp(commonCodeService.selectCommonCodeName("PAR203", invcItemVO.getPurcOrdTp(), langCd));
                invcItemVO.setDlPdcCd(commonCodeService.selectCommonCodeName("PAR214", invcItemVO.getDlPdcCd(), langCd));
            }
            context.putVar("items", list);
        }else if(StringUtils.defaultString((String)params.get("selectTabId"), "").equals("HD")){
            List<InvcVO> list = selectInvcsByCondition(searchVO);
            for(InvcVO invcVO : list){
                invcVO.setInvcStatCd(commonCodeService.selectCommonCodeName("PAR213", invcVO.getInvcStatCd(), langCd));
            }
            context.putVar("items", list);
        }
    }

}
