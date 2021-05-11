package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvVO;
import chn.bhmc.dms.mob.api.crm.dao.CrmTestDriveMgmtDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmTestDriveMgmtService;
import chn.bhmc.dms.mob.api.crm.vo.CrmTestDriveResvVO;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveResvSearchVO;

/**
 * 시승 예약 관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         in moon lee            최초 생성
 * </pre>
 */

@Service("CrmTestDriveMgmtService")
public class CrmTestDriveMgmtServiceImpl extends HService implements CrmTestDriveMgmtService {

    /**
     * 시승 예약 관리 DAO
     */
    @Resource(name="CrmTestDriveMgmtDAO")
    CrmTestDriveMgmtDAO CrmTestDriveMgmtDAO;


    @Override
    public int selectTestDriveResvsByConditionCnt(TestDriveResvSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}

        return CrmTestDriveMgmtDAO.selectTestDriveResvsByConditionCnt(searchVO);
    }
    
    @Override
    public TestDriveResvVO selectTestDriveLastTimeDrivByKey(TestDriveResvSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}
        TestDriveResvVO testDriveResvVO = CrmTestDriveMgmtDAO.selectTestDriveLastTimeDrivByKey(searchVO);

        return testDriveResvVO;
    }

    @Override
    public List<CrmTestDriveResvVO> selectTestDriveResvsByCondition(TestDriveResvSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        return CrmTestDriveMgmtDAO.selectTestDriveResvsByCondition(searchVO);
    }

    @Override
    public CrmTestDriveResvVO selectTestDriveMgmtByKey(TestDriveResvSearchVO searchVO) throws Exception {

        if(searchVO.getsTdrvSeq() <= 0){
            // 시승번호 / 을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.tdrvSeq", null, LocaleContextHolder.getLocale())});
        }

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}
        CrmTestDriveResvVO testDriveResvVO = CrmTestDriveMgmtDAO.selectTestDriveMgmtByKey(searchVO);
        
        if(testDriveResvVO == null){
         // 시승정보 / 을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.tdrvInfo", null, LocaleContextHolder.getLocale())});
        }

        return testDriveResvVO;
    }

}
