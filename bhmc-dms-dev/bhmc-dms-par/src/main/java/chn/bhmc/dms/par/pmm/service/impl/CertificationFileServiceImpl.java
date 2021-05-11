package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.pmm.service.CertificationFileService;
import chn.bhmc.dms.par.pmm.service.dao.CertificationFileDAO;
import chn.bhmc.dms.par.pmm.vo.CertificationFileVO;
import chn.bhmc.dms.par.pmm.vo.CertificationSearchVO;


/**
 * <pre>
 * 합격증 관리 파일 서비스 구현 클래스
 * </pre>
 *
 * @ClassName   : CertificationFileServiceImpl
 * @author In Bo Shim
 * @since 2016. 11. 07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 07.     In Bo Shim     최초 생성
 * </pre>
 */

@Service("certificationFileService")
public class CertificationFileServiceImpl extends HService implements CertificationFileService  {

    /**
     * 합격증 파일 관리 DAO
     */
    @Resource(name="certificationFileDAO")
    CertificationFileDAO certificationFileDAO;

    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationFileService#insertCertificationFile(chn.bhmc.dms.par.pmm.vo.CertificationFileVO)
     */
    @Override
    public int insertCertificationFile(CertificationFileVO certificationFileVO) throws Exception {
        return certificationFileDAO.insertCertificationFile(certificationFileVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationFileService#updateCertificationFile(chn.bhmc.dms.par.pmm.vo.CertificationFileVO)
     */
    @Override
    public int updateCertificationFile(CertificationFileVO certificationFileVO) throws Exception {
        return certificationFileDAO.updateCertificationFile(certificationFileVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationFileService#deleteCertificationFile(chn.bhmc.dms.par.pmm.vo.CertificationFileVO)
     */
    @Override
    public int deleteCertificationFile(CertificationFileVO certificationFileVO) throws Exception {
        return certificationFileDAO.deleteCertificationFile(certificationFileVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationFileService#selectCertificationFileCnt(chn.bhmc.dms.par.pmm.vo.CertificationSearchVO)
     */
    @Override
    public int selectCertificationFileCnt(CertificationSearchVO searchVO) throws Exception {
        return certificationFileDAO.selectCertificationFileCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationFileService#selectCertificationFileByCondition(chn.bhmc.dms.par.pmm.vo.CertificationSearchVO)
     */
    @Override
    public List<CertificationFileVO> selectCertificationFileByCondition(CertificationSearchVO searchVO)
            throws Exception {
        return certificationFileDAO.selectCertificationFileByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.CertificationFileService#selectCertificationFileByKey(chn.bhmc.dms.par.pmm.vo.CertificationSearchVO)
     */
    @Override
    public CertificationFileVO selectCertificationFileByKey(CertificationSearchVO searchVO) throws Exception {
        return certificationFileDAO.selectCertificationFileByKey(searchVO);
    }


}
