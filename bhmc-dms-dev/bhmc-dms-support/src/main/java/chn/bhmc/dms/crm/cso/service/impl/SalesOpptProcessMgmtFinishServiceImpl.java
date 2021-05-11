package chn.bhmc.dms.crm.cso.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtFinishService;
import chn.bhmc.dms.crm.cso.service.dao.SalesOpptProcessMgmtFinishDAO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtFinishSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtFinishVO;


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

@Service("salesOpptProcessMgmtFinishService")
public class SalesOpptProcessMgmtFinishServiceImpl extends HService implements SalesOpptProcessMgmtFinishService{

    /**
     * 판매기회진행이력 관리 DAO
     */
    @Resource(name="salesOpptProcessMgmtFinishDAO")
    SalesOpptProcessMgmtFinishDAO salesOpptProcessMgmtFinishDAO;

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtFinishService#selectSalesOpptProcessMgmtFinishByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtFinishSearchVO)
     */
    @Override
    public int selectSalesOpptProcessMgmtFinishByConditionCnt(SalesOpptProcessMgmtFinishSearchVO searchVO)
            throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}

        return salesOpptProcessMgmtFinishDAO.selectSalesOpptProcessMgmtFinishByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtFinishService#selectSalesOpptProcessMgmtFinishByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtFinishSearchVO)
     */
    @Override
    public List<SalesOpptProcessMgmtFinishVO> selectSalesOpptProcessMgmtFinishByCondition(
            SalesOpptProcessMgmtFinishSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}

        return salesOpptProcessMgmtFinishDAO.selectSalesOpptProcessMgmtFinishByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtFinishService#updateSalesOpptProcessMgmtFinish(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtFinishVO)
     */
    @Override
    public int updateSalesOpptProcessMgmtFinish(SalesOpptProcessMgmtFinishVO salesOpptProcessMgmtFinishVO)
            throws Exception {

        if (StringUtils.isEmpty(salesOpptProcessMgmtFinishVO.getDlrCd())){salesOpptProcessMgmtFinishVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(salesOpptProcessMgmtFinishVO.getUpdtUsrId())) {salesOpptProcessMgmtFinishVO.setUpdtUsrId(LoginUtil.getUserId());}

        if ( StringUtils.isEmpty(salesOpptProcessMgmtFinishVO.getcSeq()) ) {
            // 판매기회번호는 필수 입력사항 입니다.
            throw processException("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.saleOpptSeq", null, LocaleContextHolder.getLocale())});
        }

        return salesOpptProcessMgmtFinishDAO.updateSalesOpptProcessMgmtFinish(salesOpptProcessMgmtFinishVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtFinishService#insertSalesOpptProcessMgmtFinish(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtFinishVO)
     */
    @Override
    public int insertSalesOpptProcessMgmtFinish(SalesOpptProcessMgmtFinishVO salesOpptProcessMgmtFinishVO)
            throws Exception {

        if (StringUtils.isEmpty(salesOpptProcessMgmtFinishVO.getDlrCd())){salesOpptProcessMgmtFinishVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(salesOpptProcessMgmtFinishVO.getUpdtUsrId())) {salesOpptProcessMgmtFinishVO.setUpdtUsrId(LoginUtil.getUserId());}

        return salesOpptProcessMgmtFinishDAO.insertSalesOpptProcessMgmtFinish(salesOpptProcessMgmtFinishVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtFinishService#selectSalesOpptProcessMgmtFinishByKey(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtFinishSearchVO)
     */
    @Override
    public SalesOpptProcessMgmtFinishVO selectSalesOpptProcessMgmtFinishByKey(SalesOpptProcessMgmtFinishSearchVO searchVO)
            throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}

        return salesOpptProcessMgmtFinishDAO.selectSalesOpptProcessMgmtFinishByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtFinishService#mergeSalesOpptProcessMgmtFinish(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtFinishVO)
     */
    @Override
    public int mergeSalesOpptProcessMgmtFinish(SalesOpptProcessMgmtFinishVO salesOpptProcessMgmtFinishVO)
            throws Exception {

        if (StringUtils.isEmpty(salesOpptProcessMgmtFinishVO.getDlrCd())){salesOpptProcessMgmtFinishVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(salesOpptProcessMgmtFinishVO.getUpdtUsrId())) {salesOpptProcessMgmtFinishVO.setUpdtUsrId(LoginUtil.getUserId());}

        if ( StringUtils.isEmpty(salesOpptProcessMgmtFinishVO.getSeq()) ) {
            // 판매기회번호는 필수 입력사항 입니다.
            throw processException("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.saleOpptSeq", null, LocaleContextHolder.getLocale())});
        }

        return salesOpptProcessMgmtFinishDAO.mergeSalesOpptProcessMgmtFinish(salesOpptProcessMgmtFinishVO);
    }



}
