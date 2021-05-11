package chn.bhmc.dms.bat.cmm.sci.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.cmm.sci.service.DBMessageSourceIfService;
import chn.bhmc.dms.bat.cmm.sci.service.dao.DBMessageSourceIfDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DBMessageSourceIfServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 10. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 6.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("dbMessageSourceIfService")
public class DBMessageSourceIfServiceImpl extends HService implements DBMessageSourceIfService {

    @Resource(name="dbMessageSourceIfDAO")
    DBMessageSourceIfDAO dbMessageSourceIfDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertDBMessageSourceIf(int day) throws Exception {
        return dbMessageSourceIfDAO.insertDBMessageSourceIf(day);
    }

}
