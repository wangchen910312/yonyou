package chn.bhmc.dms.bat.cmm.sci.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.cmm.sci.service.CommonCodeIfBatchService;
import chn.bhmc.dms.bat.cmm.sci.service.dao.CommonCodeIfBatchDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CommonCodeIfServiceImpl.java
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
@Service("commonCodeIfBatchService")
public class CommonCodeIfBatchServiceImpl extends HService implements CommonCodeIfBatchService {

    @Resource(name="commonCodeIfBatchDAO")
    CommonCodeIfBatchDAO commonCodeIfBatchDAO;

    /*
     * @see chn.bhmc.dms.bat.cmm.sci.service.CommonCodeIfService#insertCommonCodeGroupCodeIf(int)
     */
    @Override
    public int insertCommonCodeGroupCodeIf(int day) throws Exception {
        return commonCodeIfBatchDAO.insertCommonCodeGroupCodeIf(day);
    }

    /*
     * @see chn.bhmc.dms.bat.cmm.sci.service.CommonCodeIfService#insertCommonCodeGroupTextIf()
     */
    @Override
    public int insertCommonCodeGroupTextIf() throws Exception {
        return commonCodeIfBatchDAO.insertCommonCodeGroupTextIf();
    }

    /*
     * @see chn.bhmc.dms.bat.cmm.sci.service.CommonCodeIfService#insertCommonCodeIf(int)
     */
    @Override
    public int insertCommonCodeIf(int day) throws Exception {
        return commonCodeIfBatchDAO.insertCommonCodeIf(day);
    }

    /*
     * @see chn.bhmc.dms.bat.cmm.sci.service.CommonCodeIfService#insertCommonCodeTextIf()
     */
    @Override
    public int insertCommonCodeTextIf() throws Exception {
        return commonCodeIfBatchDAO.insertCommonCodeTextIf();
    }
}
