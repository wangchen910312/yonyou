package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipBhmcCalcService;
import chn.bhmc.dms.crm.dmm.service.dao.BlueMembershipBhmcCalcDAO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipBhmcCalcSearchVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipBhmcCalcVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfCalcPointInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipBhmcCalcServiceImpl.java
 * @Description : 블루멤버십 정산 서비스 구현체
 * @author Kim Hyun Ho
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Service("blueMembershipBhmcCalcService")
public class BlueMembershipBhmcCalcServiceImpl extends HService implements BlueMembershipBhmcCalcService, JxlsSupport{

    /**
     * 블루멤버십 정산 DAO
     */
    @Resource(name="blueMembershipBhmcCalcDAO")
    BlueMembershipBhmcCalcDAO blueMembershipBhmcCalcDAO;
    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipBhmcCalcService#selectBlueMembershipCalcsByConditionCnt(chn.bhmc.dms.crm.dmm.vo.BlueMembershipBhmcCalcSearchVO)
     */
    @Override
    public int selectBlueMembershipCalcsByConditionCnt(BlueMembershipBhmcCalcSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipBhmcCalcDAO.selectBlueMembershipCalcsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipBhmcCalcService#selectBlueMembershipCalcsByCondition(chn.bhmc.dms.crm.dmm.vo.BlueMembershipBhmcCalcSearchVO)
     */
    @Override
    public List<BlueMembershipBhmcCalcVO> selectBlueMembershipCalcsByCondition(BlueMembershipBhmcCalcSearchVO searchVO)
            throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipBhmcCalcDAO.selectBlueMembershipCalcsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipBhmcCalcService#selectBlueMembershipCalcsByKey(chn.bhmc.dms.crm.dmm.vo.BlueMembershipBhmcCalcSearchVO)
     */
    @Override
    public BlueMembershipBhmcCalcVO selectBlueMembershipCalcsByKey(BlueMembershipBhmcCalcVO bhmcClacVO)
            throws Exception {
        if (StringUtils.isEmpty(bhmcClacVO.getDlrCd())){bhmcClacVO.setDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipBhmcCalcDAO.selectBlueMembershipCalcsByKey(bhmcClacVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipBhmcCalcService#selectBlueMembershipCalcDetailsByConditionCnt(chn.bhmc.dms.crm.dmm.vo.BlueMembershipBhmcCalcSearchVO)
     */
    @Override
    public int selectBlueMembershipCalcDetailsByConditionCnt(BlueMembershipBhmcCalcSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipBhmcCalcDAO.selectBlueMembershipCalcDetailsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipBhmcCalcService#selectBlueMembershipCalcDetailsByCondition(chn.bhmc.dms.crm.dmm.vo.BlueMembershipBhmcCalcSearchVO)
     */
    @Override
    public List<BlueMembershipCalcVO> selectBlueMembershipCalcDetailsByCondition(BlueMembershipBhmcCalcSearchVO searchVO)
            throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        return blueMembershipBhmcCalcDAO.selectBlueMembershipCalcDetailsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipBhmcCalcService#updateCalcAcceptInfo(chn.bhmc.dms.crm.dmm.vo.BlueMembershipBhmcCalcVO)
     */
    @Override
    public int updateCalcAcceptInfo(BlueMembershipBhmcCalcVO bhmcCalcVO) throws Exception {
        if (StringUtils.isEmpty(bhmcCalcVO.getDlrCd())){bhmcCalcVO.setDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipBhmcCalcDAO.updateCalcAcceptInfo(bhmcCalcVO);
    }

    /**
     * 블루멤버십 정산 상세정보(정산응답 요청작업시 param으로 보내는 리스트)
     * @param searchVO - BlueMembershipBhmcCalcSearchVO
     * @return 블루멤버십 정산 상세정보
     */
    @Override
    public List<BlueMembershipIfCalcPointInfoVO> selectBlueMembershipPointInfosByCondition(
            BlueMembershipBhmcCalcSearchVO searchVO) {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipBhmcCalcDAO.selectBlueMembershipPointInfosByCondition(searchVO);
    }

    /* 블루멤버십 정산 상세 엑셀 export
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        // 엑셀 export는 a href 이기 때문에 exception 메시지는 notification 이 아닌 json 새창으로 나옴 앞단에서 처리해야함.
        BlueMembershipBhmcCalcSearchVO searchVO = new BlueMembershipBhmcCalcSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        List<BlueMembershipCalcVO> list = selectBlueMembershipCalcDetailsByCondition(searchVO);

        if( list.size() == 0 ){

            // 추출할 대상자가 존재하지 않습니다.
            //throw processException("crm.err.targetEmptyUsr");

        } else {

            context.putVar("items", list);

        }

    }
}