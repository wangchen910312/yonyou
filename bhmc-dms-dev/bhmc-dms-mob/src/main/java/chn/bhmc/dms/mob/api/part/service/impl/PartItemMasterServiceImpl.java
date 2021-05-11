package chn.bhmc.dms.mob.api.part.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mob.api.part.dao.PartItemMasterDAO;
import chn.bhmc.dms.mob.api.part.service.PartItemMasterService;
import chn.bhmc.dms.mob.api.part.vo.ItemMasterExcelDownVO;
import chn.bhmc.dms.mob.api.part.vo.ItemMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.ItemMasterVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;

/**
 * 품목마스터 관리 서비스 구현 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 7.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.07         Ju Won Lee            최초 생성
 * </pre>
 */

@Service("PartItemMasterService")
public class PartItemMasterServiceImpl extends HService implements PartItemMasterService, JxlsSupport {

    /**
     * 품목마스터 관리 DAO
     */
	@Resource(name="PartItemMasterDAO")
	PartItemMasterDAO PartItemMasterDAO;


    
    /**
     * {@inheritDoc}
     */
    @Override
    public ItemMasterVO selectItemMasterByKey(ItemMasterSearchVO itemMasterSearchVO) throws Exception {
        return PartItemMasterDAO.selectItemMasterByKey(itemMasterSearchVO);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<ItemMasterVO> selectItemMastersByCondition(ItemMasterSearchVO searchVO) throws Exception {
        return PartItemMasterDAO.selectItemMastersByCondition(searchVO);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public int selectItemMastersByConditionCnt(ItemMasterSearchVO searchVO) throws Exception {
        return PartItemMasterDAO.selectItemMastersByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectItemMastersExcelDownByCondition(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public List<ItemMasterExcelDownVO> selectItemMastersExcelDownByCondition(ItemMasterSearchVO searchVO) throws Exception {

        return PartItemMasterDAO.selectItemMastersExcelDownByCondition(searchVO);
    }
    
    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        ItemMasterSearchVO searchVO = new ItemMasterSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsItemCd(params.get("sItemCd").toString());
        searchVO.setsItemNm(params.get("sItemNm").toString());
        searchVO.setsItemDstinCd(params.get("sItemDstinCd").toString());
        searchVO.setsCarlineCd(params.get("sCarlineCd").toString());
        searchVO.setsCarlineCd2(params.get("sCarlineCd2").toString());
        searchVO.setsBpTp(params.get("sBpTp").toString());
        searchVO.setsBrandCd(params.get("sBrandCd").toString());
        searchVO.setsBpNm(params.get("sBpNm").toString());
        searchVO.setsAbcInd(params.get("sAbcInd").toString());

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<ItemMasterExcelDownVO> list = selectItemMastersExcelDownByCondition(searchVO);
        context.putVar("items", list);
    }

    public void chkItemMasterUpdateSomebody(ItemMasterVO itemMasterVO) throws Exception {

        String updtDtStrNow;
        String[] lblList = new String[3];

        try {
            updtDtStrNow = PartItemMasterDAO.selectItemMasterUpdtDtByKey(itemMasterVO);

            if(!updtDtStrNow.equals(itemMasterVO.getUpdtDtStr())){
                lblList[0] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                lblList[1] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());
                lblList[2] = messageSource.getMessage("global.btn.search", null, LocaleContextHolder.getLocale());
                throw processException("global.info.reTryInfo", lblList);
            }

        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())});
        }
    }

}
