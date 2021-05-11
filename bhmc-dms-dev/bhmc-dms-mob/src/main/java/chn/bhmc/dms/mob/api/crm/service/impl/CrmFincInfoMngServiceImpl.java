package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.dao.CrmFincInfoMngDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmFincInfoMngService;
import chn.bhmc.dms.mob.api.crm.vo.FincInfoMngSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.FincInfoMngVO;
import chn.bhmc.dms.sal.cnt.service.ContractMntService;

/**
 * <pre>
 * 금융정보관리 서비스
 * </pre>
 *
 * @ClassName   : FincInfoMngServiceImpl
 * @Description : 금융정보관리
 * @author
 * @since 2016. 6. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 09.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Service("CrmfincInfoMngService")
public class CrmFincInfoMngServiceImpl extends HService implements CrmFincInfoMngService{

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 계약관리 서비스
     */
    @Resource(name="contractMntService")
    private ContractMntService contractMntService;

    
    /**
     * 금융 DAO 선언
     */
    @Resource(name="CrmfincInfoMngDAO")
    CrmFincInfoMngDAO CrmfincInfoMngDAO;

    /**
     * 금융 소매판매 주문번호 생성 id gen
     */
    @Resource(name="salFincMngNoIdgenService")
    TableIdGenService salFincMngNoIdgenService;

    /**
     * CRM : 고객의 금융 정보 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCustFincInfosByConditionCnt(FincInfoMngSearchVO searchVO) throws Exception{
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        if(StringUtils.isEmpty(searchVO.getsCustCd())){
            // 고객을 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custTp", null, LocaleContextHolder.getLocale())});
        }
        return CrmfincInfoMngDAO.selectCustFincInfosByConditionCnt(searchVO);
    }
    public List<FincInfoMngVO> selectCustFincInfosByCondition(FincInfoMngSearchVO searchVO) throws Exception{
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        if(StringUtils.isEmpty(searchVO.getsCustCd())){
            // 고객을 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custTp", null, LocaleContextHolder.getLocale())});
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return CrmfincInfoMngDAO.selectCustFincInfosByCondition(searchVO);
    }

}
