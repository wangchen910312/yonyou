package chn.bhmc.dms.bat.crm.css.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.css.service.BatMembershipPointDelService;
import chn.bhmc.dms.bat.crm.css.service.dao.BatMembershipPointDelDAO;
import chn.bhmc.dms.bat.crm.css.vo.BatMembershipPointDelVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatMembershipPointDelServiceImpl.java
 * @Description : 멤버십 소멸예정 포인트 소멸  서비스 구현체
 * @author Kim Hyun Ho
 * @since 2016. 6. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 24.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Service("batMembershipPointDelService")
public class BatMembershipPointDelServiceImpl extends HService implements BatMembershipPointDelService{

    /**
     * 멤버십 포인트 소멸 배치 DAO
     */
    @Resource(name="batMembershipPointDelDAO")
    BatMembershipPointDelDAO batMembershipPointDelDAO;
    /*
     * @see chn.bhmc.dms.bat.crm.css.service.BatMembershipPointDelService#deleteMembershipPointDel(chn.bhmc.dms.bat.crm.css.vo.BatMembershipPointDelVO)
     */
    @Override
    public void deleteMembershipPointDel(BatMembershipPointDelVO delVO) throws Exception {
        batMembershipPointDelDAO.deleteMembershipPointDel(delVO);
    }

}
