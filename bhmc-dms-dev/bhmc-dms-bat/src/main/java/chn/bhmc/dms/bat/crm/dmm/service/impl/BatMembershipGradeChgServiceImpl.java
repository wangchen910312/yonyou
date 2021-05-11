package chn.bhmc.dms.bat.crm.dmm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.dmm.service.BatMembershipGradeChgService;
import chn.bhmc.dms.bat.crm.dmm.service.dao.BatMembershipGradeChgDAO;
import chn.bhmc.dms.bat.crm.dmm.vo.BatMembershipGradeChgVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatMembershipGradeChgServiceImpl.java
 * @Description : 멤버십 등급 변경 대상자 추출 구현 클래스
 * @author Kim Hyun Ho
 * @since 2016. 8. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 12.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Service("batMembershipGradeChgService")
public class BatMembershipGradeChgServiceImpl extends HService implements BatMembershipGradeChgService {

    /**
     * 멤버십 등급 변경 대상자 추출 DAO
     */
    @Resource(name="batMembershipGradeChgDAO")
    BatMembershipGradeChgDAO batMembershipGradeChgDAO;

    /*
     * @see chn.bhmc.dms.bat.crm.dmm.service.BatMembershipGradeChgService#selectCallMembershipGradeChg(chn.bhmc.dms.bat.crm.dmm.service.BatMembershipGradeChgSearchVO)
     */
    @Override
    public void selectCallMembershipGradeChg(BatMembershipGradeChgVO saveVO) throws Exception {
        // TODO Auto-generated method stub
        saveVO.setRegUsrId("SYSTEM");
        saveVO.setUpdtUsrId("SYSTEM");
        batMembershipGradeChgDAO.selectCallMembershipGradeChg(saveVO);
    }

}
