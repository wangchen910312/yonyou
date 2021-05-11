package chn.bhmc.dms.mob.api.sales.service.impl;

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
import chn.bhmc.dms.mob.api.sales.dao.SalesContractProgressDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesContractProgressService;
import chn.bhmc.dms.mob.api.sales.vo.ContractReSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.ContractReVO;


/**
 * 계약종합조회
 *
 * @author
 * @since 2016. 2. 19.
 * @version 1.0
 * @see
 * @Modification Information
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 19      Kim yewon             최초 생성
 */

@Service("SalesContractProgressService")
public class SalesContractProgressServiceImpl extends HService implements SalesContractProgressService ,JxlsSupport{

    /**
     * 계약종합조회 DAO 선언
     */
    @Resource(name="SalesContractProgressDAO")
    SalesContractProgressDAO SalesContractProgressDAO;

    /**
     * 조회 조건에 해당하는 계약품의진척을 조회한다.
     */
    @Override
    public List<ContractReVO> selectContractProgressByCondition(ContractReSearchVO searchVO) throws Exception {
        return SalesContractProgressDAO.selectContractProgressByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 계약품의진척 목록 총 갯수를 조회한다.
     */
    @Override
    public int selectContractProgressByConditionCnt(ContractReSearchVO searchVO) throws Exception {
        return SalesContractProgressDAO.selectContractProgressByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        ContractReSearchVO searchVO = new ContractReSearchVO();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<ContractReVO> list = null;
        
        
        if(!StringUtils.isBlank(params.get("sStartDt").toString())){
            String sStartContractDt = params.get("sStartDt").toString();
            Date startContractDt = DateUtil.convertToDate(sStartContractDt);
            searchVO.setsStartDt(startContractDt);
        }
        if(!StringUtils.isBlank(params.get("sEndDt").toString())){
            String sEndContractDt = params.get("sEndDt").toString();
            Date endContractDt = DateUtil.convertToDate(sEndContractDt);
            searchVO.setsEndDt(endContractDt);
        }

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        list = selectContractProgressByCondition(searchVO);


        context.putVar("items", list);

    }


}
