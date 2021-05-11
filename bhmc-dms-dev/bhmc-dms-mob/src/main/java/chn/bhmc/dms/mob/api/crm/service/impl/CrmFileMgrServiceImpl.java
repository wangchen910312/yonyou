package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.crm.dao.CrmFileMgrDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmFileMgrService;
import chn.bhmc.dms.mob.api.crm.vo.FileItemVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FileMgrServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

@Service("CrmfileMgrService")
public class CrmFileMgrServiceImpl  extends HService implements CrmFileMgrService {

    @Resource(name="CrmfileMgrDAO")
    CrmFileMgrDAO CrmfileMgrDAO;


    /*
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService#selectFileItemsByFileDocNo(java.lang.String)
     */
    @Override
    public List<FileItemVO> selectFileItemsByFileDocNo(String fileDocNo)  throws Exception {
        return CrmfileMgrDAO.selectFileItemsByFileDocNo(fileDocNo);
    }
}
