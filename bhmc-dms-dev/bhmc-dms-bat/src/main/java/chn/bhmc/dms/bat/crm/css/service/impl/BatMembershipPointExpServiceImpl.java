package chn.bhmc.dms.bat.crm.css.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.css.service.BatMembershipPointExpService;
import chn.bhmc.dms.bat.crm.css.service.dao.BatMembershipPointExpDAO;
import chn.bhmc.dms.bat.crm.css.vo.BatMembershipPointExpVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatMembershipPointExpServiceImpl.java
 * @Description : 멤버십 포인트 소멸예정 배치서비스 구현체
 * @author Kim Hyun Ho
 * @since 2016. 6. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 22.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Service("batMembershipPointExpService")
public class BatMembershipPointExpServiceImpl extends HService implements BatMembershipPointExpService {

    /**
     * 멤버십 포인트 소멸예정 배치 DAO
     */
    @Resource(name="batMembershipPointExpDAO")
    BatMembershipPointExpDAO batMembershipPointExpDAO;

    /*
     * @see chn.bhmc.dms.bat.crm.css.service.BatMembershipPointExpService#insertMembershipPointExp()
     */
    @Override
    public int insertMembershipPointExp(BatMembershipPointExpVO expVO) throws Exception {
        if(expVO.getBatAddDay() == 0){// 0일 일 경우 sysdate + 5을 해주기 위해 하단에 5를 설정함
            expVO.setBatAddDay(5);
        }
        return batMembershipPointExpDAO.insertMembershipPointExp(expVO);
    }

}
