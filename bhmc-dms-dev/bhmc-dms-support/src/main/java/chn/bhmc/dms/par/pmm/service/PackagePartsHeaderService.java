package chn.bhmc.dms.par.pmm.service;

import chn.bhmc.dms.par.pmm.vo.PackagePartsHeaderVO;


/**
 * 패키지 부품 관리 서비스
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

public interface PackagePartsHeaderService {

    /**
     * 패키지 부품정보를 등록한다.
     * @param packagePartsVO - 등록할 정보가 담긴 PackagePartsHeaderVO
     * @return 등록된 목록수
     */
    public int insertPackagePartsHeader(PackagePartsHeaderVO packagePartsHeaderVO) throws Exception;

    /**
     * 패키지 부품정보를 수정한다.
     * @param packagePartsVO - 수정할 정보가 담긴 PackagePartsHeaderVO
     * @return 수정된 목록수
     */
    public int updatePackagePartsHeader(PackagePartsHeaderVO packagePartsHeaderVO) throws Exception;

    /**
     * 패키지 부품정보를 삭제한다.
     * @param packagePartsHeaderVO - 삭제할 정보가 담긴 PackagePartsHeaderVO
     * @return 삭제된 목록수
     */
    public int deletePackagePartsHeader(PackagePartsHeaderVO packagePartsHeaderVO) throws Exception;


}
