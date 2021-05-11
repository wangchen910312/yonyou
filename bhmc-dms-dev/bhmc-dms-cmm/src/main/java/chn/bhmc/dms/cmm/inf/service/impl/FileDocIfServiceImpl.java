package chn.bhmc.dms.cmm.inf.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.inf.service.FileDocIfService;
import chn.bhmc.dms.cmm.inf.service.dao.FileDocIfDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FileDocIfServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 10. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 15.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("fileDocIfService")
public class FileDocIfServiceImpl extends HService implements FileDocIfService {

    @Resource(name="fileDocIfDAO")
    FileDocIfDAO fileDocIfDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertFileDoc(String fileDocNo) throws Exception {
        return fileDocIfDAO.insertFileDoc(fileDocNo);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateFileDoc(String fileDocNo) throws Exception {
        return fileDocIfDAO.updateFileDoc(fileDocNo);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteFileDoc(String fileDocNo) throws Exception {
        return fileDocIfDAO.deleteFileDoc(fileDocNo);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertFileItem(String fileDocNo, int fileNo) throws Exception {
        return fileDocIfDAO.insertFileItem(fileDocNo, fileNo);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteFileItem(String fileDocNo, int fileNo) throws Exception {
        return fileDocIfDAO.deleteFileItem(fileDocNo, fileNo);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteFileItemsByFileDocNo(String fileDocNo) throws Exception {
        return fileDocIfDAO.deleteFileItemsByFileDocNo(fileDocNo);
    }
}
