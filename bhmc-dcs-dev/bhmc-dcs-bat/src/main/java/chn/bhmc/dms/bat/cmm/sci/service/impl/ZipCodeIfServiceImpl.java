package chn.bhmc.dms.bat.cmm.sci.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.cmm.sci.service.ZipCodeIfService;
import chn.bhmc.dms.bat.cmm.sci.service.dao.ZipCodeIfDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ZipCodeIfServiceImpl.java
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
@Service("zipCodeIfService")
public class ZipCodeIfServiceImpl extends HService implements ZipCodeIfService {

    @Resource(name="zipCodeIfDAO")
    ZipCodeIfDAO zipCodeIfDAO;

    /*
     * @see chn.bhmc.dms.bat.cmm.sci.service.ZipCodeIfService#insertZopCodeIf(int)
     */
    @Override
    public int insertZipCodeIf(int day) throws Exception {
        return zipCodeIfDAO.insertZipCodeIf(day);
    }

}
