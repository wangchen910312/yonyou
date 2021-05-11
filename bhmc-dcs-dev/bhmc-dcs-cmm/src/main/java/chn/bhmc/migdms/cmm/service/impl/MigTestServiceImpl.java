package chn.bhmc.migdms.cmm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.migdms.cmm.service.dao.MigTestDAO;

import chn.bhmc.migdms.cmm.service.MigTestService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AwayCustomerServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Service("migTestService")
public class MigTestServiceImpl extends HService implements MigTestService {
    /**
     * 자리 비움 DAO
     */
    @Resource(name = "migTestDAO")
    MigTestDAO migTestDAO;

    @Override
    public int selectMigTest() throws Exception {
        return migTestDAO.selectMigTest();
    }
}