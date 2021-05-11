package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.svi.vo.PackageLtsVO;
import chn.bhmc.dms.ser.svi.vo.PackageMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.PackageMasterVO;
import chn.bhmc.dms.ser.svi.vo.PackageParVO;

/**
 * <pre>
 * package  처리에 대한 mapper class
 * </pre>
 *
 * @ClassName   : PackageDetailDAO.java
 * @Description : package  DAO
 * @author Yin Xueyuan
 * @since 2016. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 17.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Mapper("packageManageDAO")
public interface PackageManageDAO {

    /**
     * package 공임 정보를 등록한다.
     * @param packageLtsVO - 등록할 정보가 담긴 packageLtsVO
     * @return 등록된 목록수
     */
    public int insertPackageLts (PackageLtsVO packageLtsVO);

    /**
     * package 공임 정보를 수정한다.
     * @param packageLtsVO - 수정할 정보가 담긴 packageLtsVO
     * @return 수정된 목록수
     */
    public int updatePackageLts(PackageLtsVO packageLtsVO);

    /**
     * package 공임 정보를 삭제한다.
     * @param packageLtsVO - 삭제할 정보가 담긴 packageLtsVO
     * @return 삭제된 목록수
     */
    public int deletePackageLts(PackageLtsVO packageLtsVO);

    /**
     * 조회 조건에 해당하는 package 공임 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageLtsSearchVO
     * @return 조회 목록
     */
    public List<PackageLtsVO> selectPackageLtsByCondition(PackageMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 package 공임 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageLtsSearchVO
     * @return
     */
    public int selectPackageLtsByConditionCnt(PackageMasterSearchVO searchVO);

    /**
     * package 마스터 정보를 등록한다.
     * @param packageMasterVO - 등록할 정보가 담긴 packageMasterVO
     * @return 등록된 목록수
     */
    public int insertPackageMaster (PackageMasterVO packageMasterVO);

    /**
     * 조회 조건에 해당하는 package Master 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageMasterSearchVO
     * @return 조회 목록
     */
    public List<PackageMasterVO> selectPackageMasterByCondition(PackageMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 package Master 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageMasterSearchVO
     * @return
     */
    public int selectPackageMasterByConditionCnt(PackageMasterSearchVO searchVO);

    /**
     * package 부품 정보를 등록한다.
     * @param packageParVO - 등록할 정보가 담긴 packageParVO
     * @return 등록된 목록수
     */
    public int insertPackagePar (PackageParVO packageParVO);

    /**
     * package 부품 정보를 수정한다.
     * @param packageParVO - 수정할 정보가 담긴 packageParVO
     * @return 수정된 목록수
     */
    public int updatePackagePar(PackageParVO packageParVO);

    /**
     * package 부품 정보를 삭제한다.
     * @param packageParVO - 삭제할 정보가 담긴 packageParVO
     * @return 삭제된 목록수
     */
    public int deletePackagePar(PackageParVO packageParVO);

    /**
     * 조회 조건에 해당하는 package 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageParSearchVO
     * @return 조회 목록
     */
    public List<PackageParVO> selectPackageParByCondition(PackageMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 package 부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageParSearchVO
     * @return
     */
    public int selectPackageParByConditionCnt(PackageMasterSearchVO searchVO);

}
