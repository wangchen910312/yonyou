package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.ser.svi.vo.PackageItemSaveVO;
import chn.bhmc.dms.ser.svi.vo.PackageLtsVO;
import chn.bhmc.dms.ser.svi.vo.PackageMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.PackageMasterVO;
import chn.bhmc.dms.ser.svi.vo.PackageParVO;
import chn.bhmc.dms.ser.svi.vo.PackageSaveVO;

/**
 * <pre>
 * package 관리 Service
 * </pre>
 *
 * @ClassName   : PackageManageService.java
 * @Description : package 관리 Service
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

public interface PackageManageService {

    /**
     * package 공임 정보를 등록한다.
     * @param packageLtsVO - 등록할 정보가 담긴 packageLtsVO
     * @return 등록된 목록수
     */
    public int insertPackageLts (PackageLtsVO packageLtsVO)throws Exception;

    /**
     * package 공임 정보를 수정한다.
     * @param packageLtsVO - 수정할 정보가 담긴 packageLtsVO
     * @return 수정된 목록수
     */
    public int updatePackageLts(PackageLtsVO packageLtsVO)throws Exception;

    /**
     * package 정보를 삭제한다.
     * @param packageLtsVO - 삭제할 정보가 담긴 packageLtsVO
     * @return 삭제된 목록수
     */
    public int deletePackages(PackageMasterVO packageMasterVO)throws Exception;

    /**
     * package 공임 정보를 삭제한다.
     * @param packageLtsVO - 삭제할 정보가 담긴 packageLtsVO
     * @return 삭제된 목록수
     */
    public int deletePackageLts(PackageLtsVO packageLtsVO)throws Exception;

    /**
     * 조회 조건에 해당하는 package 공임 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageLtsSearchVO
     * @return 조회 목록
     */
    public List<PackageLtsVO> selectPackageLtsByCondition(PackageMasterSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 package 공임 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageLtsSearchVO
     * @return
     */
    public int selectPackageLtsByConditionCnt(PackageMasterSearchVO searchVO)throws Exception;

    /**
     * package Lts 정보를 등록/수정/삭제 처리한다.
     * @param packageLtsSaveVO
     */
    public void multiPackageLtss(PackageSaveVO packageSaveVO) throws Exception;

    /**
     * package 마스터를 등록한다.
     * @param packageParSaveVO
     */
    public void insertPackages(BaseSaveVO<PackageMasterVO> packageMasterListVO) throws Exception;

    /**
     * package Par 정보를 등록/수정/삭제 처리한다.
     * @param packageParSaveVO
     */
    public void multiPackagePars(PackageSaveVO packageSaveVO) throws Exception;

    /**
     * package 마스터 정보를 등록한다.
     * @param packageMasterVO - 등록할 정보가 담긴 packageMasterVO
     * @return 등록된 목록수
     */
    public int insertPackageMaster (PackageMasterVO packageMasterVO)throws Exception;

    /**
     * package 마스터 정보를 수정한다.
     * @param packageMasterVO - 등록할 정보가 담긴 packageMasterVO
     * @return 등록된 목록수
     */
    public int updatePackageMaster (PackageMasterVO packageMasterVO)throws Exception;

    /**
     * 조회 조건에 해당하는 package Master 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageMasterSearchVO
     * @return 조회 목록
     */
    public List<PackageMasterVO> selectPackageMasterByCondition(PackageMasterSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 package Master 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageMasterSearchVO
     * @return
     */
    public int selectPackageMasterByConditionCnt(PackageMasterSearchVO searchVO)throws Exception;

    /**
     * package 부품 정보를 등록한다.
     * @param packageParVO - 등록할 정보가 담긴 packageParVO
     * @return 등록된 목록수
     */
    public int insertPackagePar (PackageParVO packageParVO)throws Exception;

    /**
     * package 부품 정보를 수정한다.
     * @param packageParVO - 수정할 정보가 담긴 packageParVO
     * @return 수정된 목록수
     */
    public int updatePackagePar(PackageParVO packageParVO)throws Exception;

    /**
     * package 부품 정보를 삭제한다.
     * @param packageParVO - 삭제할 정보가 담긴 packageParVO
     * @return 삭제된 목록수
     */
    public int deletePackagePar(PackageParVO packageParVO)throws Exception;

    /**
     * 조회 조건에 해당하는 package 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageParSearchVO
     * @return 조회 목록
     */
    public List<PackageParVO> selectPackageParByCondition(PackageMasterSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 package 부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageParSearchVO
     * @return
     */
    public int selectPackageParByConditionCnt(PackageMasterSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 package 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageParSearchVO
     * @return 조회 목록
     */
    public List<PackageParVO> selectPackageParSummaryByCondition(PackageMasterSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 package 부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageParSearchVO
     * @return
     */
    public int selectPackageParSummaryByConditionCnt(PackageMasterSearchVO searchVO)throws Exception;

    /**
     * package  정보를 등록한다.
     * @param saveVO - package 공임  등록/수정/삭제 목록을 포함하는 packageLtsSaveVO
     * @param bindingResult
     * @return
     */
    public int multiPackages(PackageSaveVO packageSaveVO) throws Exception;

    /**
     * Parts package  정보를 등록한다.
     * @param saveVO - package 부품  등록/수정/삭제 목록을 포함하는 packageLtsSaveVO
     * @param bindingResult
     * @return
     */
    public int multiItemPackages(PackageItemSaveVO packageItemSaveVO) throws Exception;

    /**
     * Parts package  정보를 등록한다.
     * @param saveVO - package 부품  등록/수정/삭제 목록을 포함하는 packageLtsSaveVO
     * @param bindingResult
     * @return
     */
    public int multiItemPartsPackages(PackageItemSaveVO packageItemSaveVO) throws Exception;

    /**
    *
    * PACKAGE DOC NO 를 구한다.
    *
    * @param searchVO
    * @return
    */
   public int selectPakDocNoByKey(PackageMasterSearchVO searchVO)throws Exception;

}
