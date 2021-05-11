package chn.bhmc.dms.par.pmm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.pmm.service.PackagePartsHeaderService;
import chn.bhmc.dms.par.pmm.service.dao.PackagePartsHeaderDAO;
import chn.bhmc.dms.par.pmm.vo.PackagePartsHeaderVO;

/**
 * 패키지 부품 관리 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 11. 16.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 11. 16.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("packagePartsHeaderService")
public class PackagePartsHeaderServiceImpl extends HService implements PackagePartsHeaderService{

    @Resource(name="packagePartsHeaderDAO")
    private PackagePartsHeaderDAO packagePartsHeaderDAO;

    /*
     * @see chn.bhmc.dms.par.pmm.service.PackagePartsHeaderService#insertPackagePartsHeader(chn.bhmc.dms.par.pmm.vo.PackagePartsHeaderVO)
     */
    @Override
    public int insertPackagePartsHeader(PackagePartsHeaderVO packagePartsHeaderVO) throws Exception {
        return packagePartsHeaderDAO.insertPackagePartsHeader(packagePartsHeaderVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PackagePartsHeaderService#updatePackagePartsHeader(chn.bhmc.dms.par.pmm.vo.PackagePartsHeaderVO)
     */
    @Override
    public int updatePackagePartsHeader(PackagePartsHeaderVO packagePartsHeaderVO) throws Exception {
        return packagePartsHeaderDAO.updatePackagePartsHeader(packagePartsHeaderVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PackagePartsHeaderService#deletePackagePartsHeader(chn.bhmc.dms.par.pmm.vo.PackagePartsHeaderVO)
     */
    @Override
    public int deletePackagePartsHeader(PackagePartsHeaderVO packagePartsHeaderVO) throws Exception {
        return packagePartsHeaderDAO.deletePackagePartsHeader(packagePartsHeaderVO);
    }

}
