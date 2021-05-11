package chn.bhmc.dms.cmm.mail.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.mail.service.dao.InternalMailDAO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InternalMailSummaryServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 9.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Service("internalMailSummaryService")
public class InternalMailSummaryServiceImpl extends Thread {
    @Resource(name = "internalMailDAO")
    InternalMailDAO internalMailDAO;

    private InternalMailVO internalMailVO;

    public InternalMailSummaryServiceImpl() {
        super();
    }

    public InternalMailSummaryServiceImpl(InternalMailVO internalMailVO) {
        this.internalMailVO = internalMailVO;

        run();
    }

    @Override
    public void run() {
        internalMailDAO.insertInternalMailSummary(internalMailVO);
    }
}