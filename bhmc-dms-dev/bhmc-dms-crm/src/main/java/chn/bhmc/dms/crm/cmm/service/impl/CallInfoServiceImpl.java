package chn.bhmc.dms.crm.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CallInfoService;
import chn.bhmc.dms.crm.cmm.service.dao.CallInfoDAO;
import chn.bhmc.dms.crm.cmm.vo.CallInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CallInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CallInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 2. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 25.     Kyo Jin Lee     최초 생성
 * </pre>
 */
@Service("callInfoService")
public class CallInfoServiceImpl extends HService implements CallInfoService {

    /**
     * Call 관리 DAO
     */
    @Resource(name="callInfoDAO")
    CallInfoDAO callInfoDAO;

    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CallInfoService#selectCallInfoByConditionCnt(chn.bhmc.dms.crm.cmm.vo.CallInfoVO)
     */
    @Override
    public int selectCallInfoByConditionCnt(CallInfoSearchVO searchVO) throws Exception {
        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return callInfoDAO.selectCallInfoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CallInfoService#selectCallInfoByCondition(chn.bhmc.dms.crm.cmm.vo.CallInfoVO)
     */
    @Override
    public List<CallInfoVO> selectCallInfoByCondition(CallInfoSearchVO searchVO) throws Exception {
        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return callInfoDAO.selectCallInfoByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CallInfoService#multiCallInfo(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCallInfo(BaseSaveVO<CallInfoVO> callInfoVO) throws Exception {
        // TODO Auto-generated method stub

    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CallInfoService#insertCallInfo(chn.bhmc.dms.crm.cmm.vo.CallInfoVO)
     */
    @Override
    public int insertCallInfo(CallInfoVO callInfoVO) throws Exception {
        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(callInfoVO.getDlrCd())){callInfoVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(callInfoVO.getPltCd())) {callInfoVO.setPltCd(LoginUtil.getPltCd());}

        callInfoVO.setRegUsrId(LoginUtil.getUserId());

        return callInfoDAO.insertCallInfo(callInfoVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CallInfoService#updateCallInfo(chn.bhmc.dms.crm.cmm.vo.CallInfoVO)
     */
    @Override
    public int updateCallInfo(CallInfoVO callInfoVO) throws Exception {
        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(callInfoVO.getDlrCd())){callInfoVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(callInfoVO.getPltCd())) {callInfoVO.setPltCd(LoginUtil.getPltCd());}

        callInfoVO.setUpdtUsrId(LoginUtil.getUserId());

        return callInfoDAO.updateCallInfo(callInfoVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CallInfoService#deleteCallInfo(chn.bhmc.dms.crm.cmm.vo.CallInfoVO)
     */
    @Override
    public int deleteCallInfo(CallInfoVO callInfoVO) throws Exception {
        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(callInfoVO.getDlrCd())){callInfoVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(callInfoVO.getPltCd())) {callInfoVO.setPltCd(LoginUtil.getPltCd());}

        callInfoVO.setUpdtUsrId(LoginUtil.getUserId());


        return callInfoDAO.deleteCallInfo(callInfoVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CallInfoService#selectCallInfoByKey(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public CallInfoVO selectCallInfoByKey(String dlrCd, String pltCd, String callListNo) throws Exception {
        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(dlrCd)) {dlrCd = LoginUtil.getDlrCd();}
        if (StringUtils.isEmpty(pltCd)) {pltCd = LoginUtil.getPltCd();}

        return callInfoDAO.selectCallInfoByKey(dlrCd, pltCd, callListNo);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CallInfoService#selectNextCallListNo()
     */
    @Override
    public String selectNextCallListNo() throws Exception {
        return callInfoDAO.selectNextCallListNo();
    }





}
