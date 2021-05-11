package chn.bhmc.dms.ser.svi.service.impl;


import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.PackageManageService;
import chn.bhmc.dms.ser.svi.service.dao.PackageManageDAO;
import chn.bhmc.dms.ser.svi.vo.PackageItemSaveVO;
import chn.bhmc.dms.ser.svi.vo.PackageLtsVO;
import chn.bhmc.dms.ser.svi.vo.PackageMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.PackageMasterVO;
import chn.bhmc.dms.ser.svi.vo.PackageParVO;
import chn.bhmc.dms.ser.svi.vo.PackageSaveVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;

/**
 * <pre>
 * package 구현 서비스
 * </pre>
 *
 * @ClassName   : PackageManageServiceImpl.java
 * @Description : package ServiceImpl
 * @author Yin Xueyuan
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Service("packageManageService")
public class PackageManageServiceImpl extends HService implements PackageManageService {

    /**
    * package DAO
    */
    @Resource(name="packageManageDAO")
    PackageManageDAO packageManageDAO;


    /**
     * 조회 조건에 해당하는 package 공임 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageLtsSearchVO
     * @return 조회 목록
     */
    @Override
    public List<PackageLtsVO> selectPackageLtsByCondition(PackageMasterSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return packageManageDAO.selectPackageLtsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 package 공임 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageLtsSearchVO
     * @return
     */
    @Override
    public int selectPackageLtsByConditionCnt(PackageMasterSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return packageManageDAO.selectPackageLtsByConditionCnt(searchVO);
    }

    /**
     * Parts package  정보를 등록한다.
     * @param saveVO - package 부품 등록/수정/삭제 목록을 포함하는 packageLtsSaveVO
     * @param bindingResult
     * @return
     */
    public int multiItemPackages(PackageItemSaveVO packageItemSaveVO) throws Exception {

        PackageMasterVO packageMasterVO = packageItemSaveVO.getPackageMasterVO();

        if( packageMasterVO.getPkgDocNo() == 0){

            packageMasterVO.setDlrCd(LoginUtil.getDlrCd());
            packageMasterVO.setRegUsrId(LoginUtil.getUserId());

            PackageMasterSearchVO packageMasterSearchVO = new PackageMasterSearchVO();
            packageMasterSearchVO.setsDlrCd(packageMasterVO.getDlrCd());
            packageMasterSearchVO.setsPkgItemCd(packageMasterVO.getPkgItemCd());
            packageMasterSearchVO.setsLtsModelCd(packageMasterVO.getLtsModelCd());

            int dupChkCnt = packageManageDAO.selectPakDocNoByKey(packageMasterSearchVO);

            if(dupChkCnt > 1 ){
                 Exception e = processException("global.err.duplicate");
                throw e;
            }

            packageMasterSearchVO = new PackageMasterSearchVO();
            packageMasterSearchVO.setsDlrCd(packageMasterVO.getDlrCd());
            packageMasterSearchVO.setsPkgItemCd(packageMasterVO.getPkgItemCd());


            int pkgDocNo = packageManageDAO.selectPakDocNoByKey(packageMasterSearchVO);

            packageMasterVO.setDlrCd(LoginUtil.getDlrCd());
            packageMasterVO.setRegUsrId(LoginUtil.getUserId());
            packageMasterVO.setPkgDocNo(pkgDocNo);

            packageManageDAO.insertPackageMaster(packageMasterVO);

        }


        return packageMasterVO.getPkgDocNo();

    }

    /*
     * @see chn.bhmc.dms.ser.svi.service.PackageManageService#multiItemPartsPackages(chn.bhmc.dms.ser.svi.vo.PackageItemSaveVO)
     */
    @Override
    public int multiItemPartsPackages(PackageItemSaveVO packageItemSaveVO) throws Exception {

        PackageMasterVO packageMasterVO = packageItemSaveVO.getPackageMasterVO();

        packageMasterVO.setDlrCd(LoginUtil.getDlrCd());
        packageMasterVO.setRegUsrId(LoginUtil.getUserId());

        if(!"02".equals(packageMasterVO.getPkgTp())){//부품패키지 아닐때 실행.
            chkPackageMasterUpdateSomebody(packageMasterVO);
        }

        for(PackageParVO packageParVO : packageItemSaveVO.getPackageParVO().getDeleteList()){
            packageParVO.setDlrCd(LoginUtil.getDlrCd());
            packageManageDAO.deletePackagePar(packageParVO);
        }

        for(PackageParVO packageParVO : packageItemSaveVO.getPackageParVO().getInsertList()){
            packageParVO.setDlrCd(LoginUtil.getDlrCd());
            packageParVO.setRegUsrId(LoginUtil.getUserId());
            packageParVO.setPkgDocNo(packageMasterVO.getPkgDocNo());
            packageManageDAO.insertPackagePar(packageParVO);
        }
        for(PackageParVO packageParVO : packageItemSaveVO.getPackageParVO().getUpdateList()){
            packageParVO.setDlrCd(LoginUtil.getDlrCd());
            packageParVO.setRegUsrId(LoginUtil.getUserId());
            packageParVO.setUpdtUsrId(LoginUtil.getUserId());

            PackageMasterSearchVO searchVO = new PackageMasterSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsPkgDocNo(packageMasterVO.getPkgDocNo());
            searchVO.setsPkgItemCd(packageMasterVO.getPkgItemCd());
            searchVO.setsItemCd(packageParVO.getItemCd());

            if(packageManageDAO.selectPackageDetailByConditionCnt(searchVO) == 0){
                packageManageDAO.insertPackagePar(packageParVO);
            }else{
                packageManageDAO.updatePackagePar(packageParVO);
            }
        }

        packageManageDAO.updatePackageMasterUpdtDt(packageMasterVO);

        return 1;
    }



	/**
     * package  정보를 등록한다.
     * @param saveVO - package 공임  등록/수정/삭제 목록을 포함하는 packageLtsSaveVO
     * @param bindingResult
     * @return
     */
    public void insertPackages(BaseSaveVO<PackageMasterVO> packageMasterListVO) throws Exception {


        for(PackageMasterVO packageMasterVO : packageMasterListVO.getInsertList()){

            if( packageMasterVO.getPkgDocNo() == 0){

                packageMasterVO.setDlrCd(LoginUtil.getDlrCd());
                packageMasterVO.setRegUsrId(LoginUtil.getUserId());

                PackageMasterSearchVO packageMasterSearchVO = new PackageMasterSearchVO();
                packageMasterSearchVO.setsDlrCd(packageMasterVO.getDlrCd());
                packageMasterSearchVO.setsPkgItemCd(packageMasterVO.getPkgItemCd());
                packageMasterSearchVO.setsLtsModelCd(packageMasterVO.getLtsModelCd());


                int dupChkCnt = packageManageDAO.selectPakDocNoByKey(packageMasterSearchVO);

                if(dupChkCnt > 1 ){
                    String ltsItem = "["+packageMasterSearchVO.getsLtsModelCd()+"]["+packageMasterSearchVO.getsPkgItemCd()+"]";
                    throw processException("ser.info.dupMsg", new String[]{ltsItem});
                }

                packageMasterSearchVO = new PackageMasterSearchVO();
                packageMasterSearchVO.setsDlrCd(packageMasterVO.getDlrCd());
                packageMasterSearchVO.setsPkgItemCd(packageMasterVO.getPkgItemCd());

                int pkgDocNo = packageManageDAO.selectPakDocNoByKey(packageMasterSearchVO);
                packageMasterVO.setPkgDocNo(pkgDocNo);
                packageManageDAO.insertPackageMaster(packageMasterVO);
            }

        }

    }

    /**
     * package  정보를 등록한다.
     * @param saveVO - package 공임  등록/수정/삭제 목록을 포함하는 packageLtsSaveVO
     * @param bindingResult
     * @return
     */
    public int multiPackages(PackageSaveVO packageSaveVO) throws Exception {

        PackageMasterVO packageMasterVO = packageSaveVO.getPackageMasterVO();

        if( packageMasterVO.getPkgDocNo() == 0){

            packageMasterVO.setDlrCd(LoginUtil.getDlrCd());
            packageMasterVO.setRegUsrId(LoginUtil.getUserId());

            PackageMasterSearchVO packageMasterSearchVO = new PackageMasterSearchVO();
            packageMasterSearchVO.setsDlrCd(packageMasterVO.getDlrCd());
            packageMasterSearchVO.setsPkgItemCd(packageMasterVO.getPkgItemCd());
            packageMasterSearchVO.setsLtsModelCd(packageMasterVO.getLtsModelCd());


            int dupChkCnt = packageManageDAO.selectPakDocNoByKey(packageMasterSearchVO);

            if(dupChkCnt > 1 ){
                String ltsItem = "["+packageMasterSearchVO.getsLtsModelCd()+"]["+packageMasterSearchVO.getsPkgItemCd()+"]";
                throw processException("ser.info.dupMsg", new String[]{ltsItem});
            }

            packageMasterSearchVO = new PackageMasterSearchVO();
            packageMasterSearchVO.setsDlrCd(packageMasterVO.getDlrCd());
            packageMasterSearchVO.setsPkgItemCd(packageMasterVO.getPkgItemCd());

            int pkgDocNo = packageManageDAO.selectPakDocNoByKey(packageMasterSearchVO);


            packageMasterVO.setPkgDocNo(pkgDocNo);

            if(packageManageDAO.insertPackageMaster(packageMasterVO) > 0){
                packageSaveVO.setPkgDocNo(pkgDocNo);
            }
        }

        packageSaveVO.setPkgDocNo(packageMasterVO.getPkgDocNo());
        if(packageSaveVO.getPackageLtsVO() != null){
            multiPackageLtss(packageSaveVO);
        }
        if(packageSaveVO.getPackageParVO() != null){
            multiPackagePars(packageSaveVO);
        }

        return packageMasterVO.getPkgDocNo();
    }


    /**
     * package 공임 등록/수정/삭제 일괄처리
     */
    @Override
    public void multiPackageLtss(PackageSaveVO obj) throws Exception {

        BaseSaveVO<PackageLtsVO> ltsVO = obj.getPackageLtsVO();


        for(PackageLtsVO packageLtsVO : ltsVO.getInsertList()){
            packageLtsVO.setDlrCd(LoginUtil.getDlrCd());
            packageLtsVO.setRegUsrId(LoginUtil.getUserId());
            packageLtsVO.setPkgDocNo(obj.pkgDocNo);

            packageManageDAO.insertPackageLts(packageLtsVO);

        }
        for(PackageLtsVO packageLtsVO : ltsVO.getUpdateList()){
            packageLtsVO.setDlrCd(LoginUtil.getDlrCd());
            packageLtsVO.setUpdtUsrId(LoginUtil.getUserId());
            packageManageDAO.updatePackageLts(packageLtsVO);
        }
        for(PackageLtsVO packageLtsVO : ltsVO.getDeleteList()){
            packageLtsVO.setDlrCd(LoginUtil.getDlrCd());
            packageManageDAO.deletePackageLts(packageLtsVO);
        }
    }

    /**
    * package 부품 등록/수정/삭제 일괄처리
    */
    @Override
    public void multiPackagePars(PackageSaveVO saveObj) throws Exception {

        BaseSaveVO<PackageParVO> partVO = saveObj.getPackageParVO();

        for(PackageParVO packageParVO : partVO.getInsertList()){
            packageParVO.setDlrCd(LoginUtil.getDlrCd());
            packageParVO.setRegUsrId(LoginUtil.getUserId());
            packageParVO.setPkgDocNo(saveObj.pkgDocNo);
            packageManageDAO.insertPackagePar(packageParVO);
        }
        for(PackageParVO packageParVO : partVO.getUpdateList()){
            packageParVO.setDlrCd(LoginUtil.getDlrCd());
            packageParVO.setUpdtUsrId(LoginUtil.getUserId());
            packageManageDAO.updatePackagePar(packageParVO);
        }
        for(PackageParVO packageParVO : partVO.getDeleteList()){
            packageParVO.setDlrCd(LoginUtil.getDlrCd());
            packageManageDAO.deletePackagePar(packageParVO);
        }
    }


     /**
      * package 공임 정보를 등록한다.
      * @param packageManageDAO - 등록할 정보가 담긴 packageLtsVO
      * @return 등록된 목록수
      */
    @Override
    public int insertPackageLts(PackageLtsVO packageLtsVO) throws Exception {
        return packageManageDAO.insertPackageLts(packageLtsVO);
    }

     /**
      * package 정보를 삭제한다.
      * @param packageLtsVO - 삭제할 정보가 담긴 packageLtsVO
      * @return 삭제된 목록수
     */
    public int deletePackages(PackageMasterVO packageMasterVO)throws Exception{

        int delCnt = 0;
        String dlrCd = LoginUtil.getDlrCd();


        PackageLtsVO packageLtsVO = new PackageLtsVO();
        packageLtsVO.setDlrCd(dlrCd);
        packageLtsVO.setPkgDocNo(packageMasterVO.getPkgDocNo());
        packageLtsVO.setPkgItemCd(packageMasterVO.getPkgItemCd());

        packageManageDAO.deletePackageLts(packageLtsVO);

        PackageParVO packageParVO = new PackageParVO();
        packageLtsVO.setDlrCd(dlrCd);
        packageLtsVO.setPkgDocNo(packageMasterVO.getPkgDocNo());
        packageLtsVO.setPkgItemCd(packageMasterVO.getPkgItemCd());


        packageParVO.setDlrCd(dlrCd);
        packageParVO.setPkgItemCd(packageMasterVO.getPkgItemCd());
        packageParVO.setPkgDocNo(packageMasterVO.getPkgDocNo());
        packageManageDAO.deletePackagePar(packageParVO);
        delCnt = packageManageDAO.deletePackages(packageMasterVO);

        return delCnt;

    }



     /**
     * package 공임 정보를 수정한다.
     * @param packageManageDAO - 수정할 정보가 담긴 packageLtsVO
     * @return 수정된 목록수
     */
    @Override
    public int updatePackageLts(PackageLtsVO packageLtsVO) throws Exception {
         return packageManageDAO.updatePackageLts(packageLtsVO);
    }

     /**
      * package 공임 정보를 삭제한다.
      * @param packageManageDAO - 삭제할 정보가 담긴 packageLtsVO
      * @return 삭제된 목록수
      */
    @Override
    public int deletePackageLts(PackageLtsVO packageLtsVO) throws Exception {
         return packageManageDAO.deletePackageLts(packageLtsVO);
    }

    /**
     *
     * PACKAGE DOC NO 를 구한다.
     *
     * @param searchVO
     * @return
     */
    public int selectPakDocNoByKey(PackageMasterSearchVO searchVO)throws Exception{

        return packageManageDAO.selectPakDocNoByKey(searchVO);
    }

   /**
    * package 헤더 정보를 등록한다.
    * @param packageManageDAO - 등록할 정보가 담긴 packageMasterVO
    * @return 등록된 목록수
    */
    @Override
    public int insertPackageMaster(PackageMasterVO packageMasterVO) throws Exception{
        return packageManageDAO.insertPackageMaster(packageMasterVO);
    }

    /*
     * @see chn.bhmc.dms.ser.svi.service.PackageManageService#updatePackageMaster(chn.bhmc.dms.ser.svi.vo.PackageMasterVO)
     */
    @Override
    public int updatePackageMaster(PackageMasterVO packageMasterVO) throws Exception {
        return packageManageDAO.updatePackageMaster(packageMasterVO);
    }

    /**
     * 조회 조건에 해당하는 package 헤더 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageMasterSearchVO
     * @return 조회 목록
     */
    @Override
    public List<PackageMasterVO> selectPackageMasterByCondition(PackageMasterSearchVO searchVO) throws Exception{

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return packageManageDAO.selectPackageMasterByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 package 헤더 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageMasterSearchVO
     * @return
     */
    @Override
    public int selectPackageMasterByConditionCnt(PackageMasterSearchVO searchVO)throws Exception{

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return packageManageDAO.selectPackageMasterByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 package 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageParSearchVO
     * @return 조회 목록
     */
    @Override
    public List<PackageParVO> selectPackageParByCondition(PackageMasterSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return packageManageDAO.selectPackageParByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 package 부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageParSearchVO
     * @return
     */
    @Override
    public int selectPackageParByConditionCnt(PackageMasterSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return packageManageDAO.selectPackageParByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.ser.svi.service.PackageManageService#selectPackageParSummaryByCondition(chn.bhmc.dms.ser.svi.vo.PackageMasterSearchVO)
     */
    @Override
    public List<PackageParVO> selectPackageParSummaryByCondition(PackageMasterSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return packageManageDAO.selectPackageParSummaryByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.ser.svi.service.PackageManageService#selectPackageParSummaryByConditionCnt(chn.bhmc.dms.ser.svi.vo.PackageMasterSearchVO)
     */
    @Override
    public int selectPackageParSummaryByConditionCnt(PackageMasterSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return packageManageDAO.selectPackageParSummaryByConditionCnt(searchVO);
    }


     /**
      * package 부품 정보를 등록한다.
      * @param packageManageDAO - 등록할 정보가 담긴 packageParVO
      * @return 등록된 목록수
      */
    @Override
    public int insertPackagePar(PackageParVO packageParVO) throws Exception {
        return packageManageDAO.insertPackagePar(packageParVO);
    }

     /**
      * package 부품 정보를 수정한다.
      * @param packageManageDAO - 수정할 정보가 담긴 packageParVO
      * @return 수정된 목록수
      */
    @Override
    public int  updatePackagePar(PackageParVO packageParVO) throws Exception {
         return packageManageDAO.updatePackagePar(packageParVO);
    }

     /**
      * package 부품 정보를 삭제한다.
      * @param packageManageDAO - 삭제할 정보가 담긴 packageParVO
      * @return 삭제된 목록수
      */
    @Override
    public int deletePackagePar(PackageParVO packageParVO) throws Exception {
         return packageManageDAO.deletePackagePar(packageParVO);
    }


    public void chkPackageMasterUpdateSomebody(PackageMasterVO packageMasterVO) throws Exception {

        String updtDtStrNow;
        String[] lblList = new String[3];

        try {
            updtDtStrNow = packageManageDAO.selectPackageMasterUpdtDtByKey(packageMasterVO);

            if(!updtDtStrNow.equals(packageMasterVO.getPkgUpdtDtStr())){
                lblList[0] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                lblList[1] = messageSource.getMessage("ser.lbl.packageCd", null, LocaleContextHolder.getLocale());
                lblList[2] = messageSource.getMessage("global.btn.search", null, LocaleContextHolder.getLocale());
                throw processException("global.info.reTryInfo", lblList);
            }

        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("ser.lbl.packageCd", null, LocaleContextHolder.getLocale())});
        }
    }

}
