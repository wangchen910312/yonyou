package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipCalcService;
import chn.bhmc.dms.crm.dmm.service.dao.BlueMembershipCalcDAO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcSearchVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipCalcServiceImpl.java
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

@Service("blueMembershipCalcService")
public class BlueMembershipCalcServiceImpl extends HService implements BlueMembershipCalcService{

    /**
     * 블루멤버십 정산 DAO
     */
    @Resource(name="blueMembershipCalcDAO")
    BlueMembershipCalcDAO blueMembershipCalcDAO;

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipCalcService#selectBlueMembershipCalcsByConditionCnt(chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcSearchVO)
     */
    @Override
    public int selectBlueMembershipCalcsByConditionCnt(BlueMembershipCalcSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipCalcDAO.selectBlueMembershipCalcsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipCalcService#selectBlueMembershipCalcsByCondition(chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcSearchVO)
     */
    @Override
    public List<BlueMembershipCalcVO> selectBlueMembershipCalcsByCondition(BlueMembershipCalcSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipCalcDAO.selectBlueMembershipCalcsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipCalcService#selectBlueMembershipCalcsByCondition(chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcSearchVO)
     */
    @Override
    public BlueMembershipCalcVO selectBluePointInfosCondition(BlueMembershipCalcSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipCalcDAO.selectBluePointInfosCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipCalcService#selectBlueMembershipCalcDetailsByConditionCnt(chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcSearchVO)
     */
    @Override
    public int selectBlueMembershipCalcDetailsByConditionCnt(BlueMembershipCalcSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipCalcDAO.selectBlueMembershipCalcDetailsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipCalcService#selectBlueMembershipCalcDetailsByCondition(chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcSearchVO)
     */
    @Override
    public List<BlueMembershipCalcVO> selectBlueMembershipCalcDetailsByCondition(BlueMembershipCalcSearchVO searchVO)
            throws Exception {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipCalcDAO.selectBlueMembershipCalcDetailsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipCalcService#selectBlueMembershipTotPointIfByKey(chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcSearchVO)
     */
    @Override
    public BlueMembershipCalcVO selectBlueMembershipTotPointIfByKey(BlueMembershipCalcSearchVO searchVO)
            throws Exception {
        // TODO Auto-generated method stub
        return null;
    }

}
