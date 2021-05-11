package chn.bhmc.dms.ser.wac.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.wac.service.ClaimInfoStatusService;
import chn.bhmc.dms.ser.wac.service.dao.ClaimInfoStatusDAO;
import chn.bhmc.dms.ser.wac.vo.ClaimInfoStatusSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInfoStatusVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInfoStatusServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("claimInfoStatusService")
public class ClaimInfoStatusServiceImpl extends HService implements ClaimInfoStatusService, JxlsSupport{

    @Resource(name="claimInfoStatusDAO")
    ClaimInfoStatusDAO claimInfoStatusDAO;


    /**
    *
    * 클레임 정보 현황 목록수를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 정보 목록수 데이터
    * @throws Exception
    */
    public int selectClaimInfoStatusByConditionCnt(ClaimInfoStatusSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return claimInfoStatusDAO.selectClaimInfoStatusByConditionCnt(searchVO);
    }

    /**
    *
    * 클레임 정보 현황을 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 정보 목록 데이터
    * @throws Exception
    */
    public List<ClaimInfoStatusVO> selectClaimInfoStatusByCondition(ClaimInfoStatusSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return claimInfoStatusDAO.selectClaimInfoStatusByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        ClaimInfoStatusSearchVO searchVO = new ClaimInfoStatusSearchVO();

        if(!StringUtils.isBlank(params.get("sClaimReqFromDt").toString())){
            String sClaimReqFromDt = params.get("sClaimReqFromDt").toString();
            Date dClaimReqFromDt = DateUtil.convertToDate(sClaimReqFromDt);
            searchVO.setsClaimReqFromDt(dClaimReqFromDt);
        }
        if(!StringUtils.isBlank(params.get("sClaimReqToDt").toString())){
            String sClaimReqToDt = params.get("sClaimReqToDt").toString();
            Date dClaimReqToDt = DateUtil.convertToDate(sClaimReqToDt);
            searchVO.setsClaimReqToDt(dClaimReqToDt);
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<ClaimInfoStatusVO> list = selectClaimInfoStatusByCondition(searchVO);
        context.putVar("items", list);

    }
}