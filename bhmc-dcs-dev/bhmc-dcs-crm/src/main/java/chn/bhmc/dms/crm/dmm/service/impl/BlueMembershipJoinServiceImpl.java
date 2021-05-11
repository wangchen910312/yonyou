package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService;
import chn.bhmc.dms.crm.dmm.service.dao.BlueMembershipJoinDAO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinSearchVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipJoinServiceImpl.java
 * @Description : 블루멤버십 가입신청 서비스 구현체
 * @author Kim Hyun Ho
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Service("blueMembershipJoinService")
public class BlueMembershipJoinServiceImpl extends HService implements BlueMembershipJoinService{

    /**
     * 블루멤버십 신청 DAO
     */
    @Resource(name="blueMembershipJoinDAO")
    BlueMembershipJoinDAO blueMembershipJoinDAO;

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#selectsByConditionCnt(chn.bhmc.dms.crm.dmm.service.BlueMembershipSearchVO)
     */
    @Override
    public int selectBlueMembershipJoinsByConditionCnt(BlueMembershipJoinSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipJoinDAO.selectBlueMembershipJoinsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#selectMembershipsByCondition(chn.bhmc.dms.crm.dmm.service.BlueMembershipSearchVO)
     */
    @Override
    public List<BlueMembershipJoinVO> selectBlueMembershipJoinsByCondition(BlueMembershipJoinSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipJoinDAO.selectBlueMembershipJoinsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#insertBlueMembershipJoin(chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinSearchVO)
     */
    @Override
    public int insertBlueMembershipJoin(BlueMembershipJoinVO blueMembershipJoinVO) throws Exception {
        blueMembershipJoinVO.setDlrCd(LoginUtil.getDlrCd());
        blueMembershipJoinVO.setJoinDlrCd(LoginUtil.getDlrCd());

        //블루멤버십 가입되어 있는지 확인
        BlueMembershipJoinSearchVO searchVO = new BlueMembershipJoinSearchVO();
        searchVO.setsDlrCd(blueMembershipJoinVO.getDlrCd());
        searchVO.setsCustNo(blueMembershipJoinVO.getCustNo());

        BlueMembershipJoinVO mem = blueMembershipJoinDAO.selectBlueMembershipJoinByKey(searchVO);

        if(mem != null){
            //throw processException("global.info.alreadyCont", new String[]{messageSource.getMessage("global.lbl.customer", null, LocaleContextHolder.getLocale())});
            //등록된 회원일 경우 주소수정만 가능하다.
            blueMembershipJoinVO.setUpdtUsrId(LoginUtil.getUserId());
            return blueMembershipJoinDAO.updateBlueMembershipJoinAddr(blueMembershipJoinVO);
        }else{
            return blueMembershipJoinDAO.insertBlueMembershipJoin(blueMembershipJoinVO);
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#selectBlueMembershipJoinByKey(chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO)
     */
    @Override
    public BlueMembershipJoinVO selectBlueMembershipJoinByKey(BlueMembershipJoinSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return blueMembershipJoinDAO.selectBlueMembershipJoinByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#updateBlueMembershipApprove(chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO)
     */
    @Override
    public int updateBlueMembershipApprove(BlueMembershipJoinVO blueMembershipJoinVO) throws Exception {
        // [TODO] 승인정보를 수정할 시에는 CR_0101T 테이블의 블루멤버십 커럼도 수정해 주어야 한다.
        return blueMembershipJoinDAO.updateBlueMembershipApprove(blueMembershipJoinVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#updateBlueMembershipJoinAddr(chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO)
     */
    @Override
    public int updateBlueMembershipJoinAddr(BlueMembershipJoinVO blueMembershipJoinVO) throws Exception {
        blueMembershipJoinVO.setUpdtUsrId(LoginUtil.getUserId());
        return blueMembershipJoinDAO.updateBlueMembershipJoinAddr(blueMembershipJoinVO);
    }

}
