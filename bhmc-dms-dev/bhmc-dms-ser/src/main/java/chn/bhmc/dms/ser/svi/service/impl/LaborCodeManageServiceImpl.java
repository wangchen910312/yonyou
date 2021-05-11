package chn.bhmc.dms.ser.svi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.svi.service.LaborCodeManageService;
import chn.bhmc.dms.ser.svi.service.dao.LaborCodeManageDAO;
import chn.bhmc.dms.ser.svi.vo.LaborCodeDetailVO;
import chn.bhmc.dms.ser.svi.vo.LaborCodeManageVO;
import chn.bhmc.dms.ser.svi.vo.LaborCodeMasterVO;
import chn.bhmc.dms.ser.svi.vo.LaborCodeSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LaborCodeManageServiceImpl.java
 * @Description : 공임관리 서비스 구현 클래스
 * @author Ki Hyun Kwon
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

@Service("laborCodeManageService")
public class LaborCodeManageServiceImpl extends HService implements LaborCodeManageService, JxlsSupport{

    @Resource(name="laborCodeManageDAO")
    LaborCodeManageDAO laborCodeManageDAO;


    /*
     * {@inheritDoc}
     */
    @Override
    public List<LaborCodeMasterVO> selectLaborCodeManages(LaborCodeSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return laborCodeManageDAO.selectLaborCodeManages(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<LaborCodeMasterVO> selectLaborCodeManageMasterByKey(LaborCodeSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return laborCodeManageDAO.selectLaborCodeManageMasterByKey(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectLaborCodeManageByConditionCnt(LaborCodeSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return laborCodeManageDAO.selectLaborCodeManageByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<LaborCodeDetailVO> selectLaborCodeManageByCondition(LaborCodeSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        return laborCodeManageDAO.selectLaborCodeManageByCondition(searchVO);
    }

    /**
     *
     * 공임코드 엑셀용상세 데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포한된 LaborCodeSearchVO
     * @return 공임코드 상세 데이터
     * @throws Exception
     */
    public List<LaborCodeDetailVO> selectLaborCodeManageExcelByCondition(LaborCodeSearchVO searchVO)throws Exception{

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        return laborCodeManageDAO.selectLaborCodeManageExcelByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectLaborMasterByConditionCnt(LaborCodeMasterVO laborVO) throws Exception {

        laborVO.setDlrCd(LoginUtil.getDlrCd());
        return laborCodeManageDAO.selectLaborMasterByConditionCnt(laborVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void multiLaborMaster(LaborCodeManageVO objVO) throws Exception {
        BaseSaveVO<LaborCodeMasterVO> masterVO = objVO.getLaborCodeMasterListVO();
        String user_id = LoginUtil.getUserId();

        for(LaborCodeMasterVO laborCodeVO : masterVO.getUpdateList()){
            laborCodeVO.setUpdtUsrId(user_id);
            updateLaborMaster(laborCodeVO);
        }
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void multiLaborDetail(LaborCodeManageVO objVO) throws Exception {

        int resultCnt = 0;

        String dlrCd = "";
        LaborCodeMasterVO masterVO = objVO.getLaborCodeMasterVO();

        dlrCd = (masterVO.getDstinCd().equals("G")) ? "A07AA" : LoginUtil.getDlrCd();

        masterVO.setDlrCd(dlrCd);
        masterVO.setUpdtUsrId(LoginUtil.getUserId());

        if(!masterVO.getDstinCd().equals("H")){
            resultCnt = selectLaborMasterByConditionCnt(masterVO);
            if(resultCnt > 0){
                masterVO.setDlrCd(dlrCd);
                updateLaborMaster(masterVO); // 공임 마스터 수정
            }else{
                masterVO.setDlrCd(dlrCd);
                insertLaborMaster(masterVO); // 공임 마스터 등록
            }
        }

        objVO.setDstinCd(masterVO.getDstinCd());
        objVO.setDlrCd(masterVO.getDlrCd());
        objVO.setLbrCd(masterVO.getLbrCd());

        multiLaborCodeDetail(objVO );
    }



    /*
     * {@inheritDoc}
     */
    @Override
    public void insertCheckLaborMaster(LaborCodeMasterVO masterVO) throws Exception {
        String dlrCd = (masterVO.getDstinCd().equals("G")) ? "A07AA" : LoginUtil.getDlrCd();
        masterVO.setDlrCd(dlrCd);
        masterVO.setRegUsrId(LoginUtil.getUserId());

        // 중복체크
        int resultCnt = selectLaborMasterByConditionCnt(masterVO);
        if(resultCnt > 0){
            Exception e = processException("global.err.duplicate");
            throw e;
        }

        // 공임구분이 자체정의(D)인경우 10건을 초과하여 입력불가
        if(masterVO.getDstinCd().equals("D")){
            LaborCodeMasterVO checkMasterVO = new LaborCodeMasterVO();
            checkMasterVO.setDlrCd(dlrCd);
            checkMasterVO.setDstinCd(masterVO.getDstinCd());
            int dCnt = laborCodeManageDAO.selectLaborMasterByDstinCdCnt(checkMasterVO);
            if(dCnt >= 10){
                throw processException("ser.info.checkLabourCnt");
            }
        }

        masterVO.setDlrCd(dlrCd);
        insertLaborMaster(masterVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void insertLaborMaster(LaborCodeMasterVO masterVO) throws Exception {

        laborCodeManageDAO.insertLaborMaster(masterVO);

    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void updateLaborMaster(LaborCodeMasterVO masterVO) throws Exception {

        laborCodeManageDAO.updateLaborMaster(masterVO);

    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void multiLaborCodeDetail(LaborCodeManageVO objVO) throws Exception {

        BaseSaveVO<LaborCodeDetailVO>  detailVO = objVO.getLaborCodeDetailVO();

        String user_id = LoginUtil.getUserId();

        for(LaborCodeDetailVO laborCodeVO : detailVO.getInsertList()){

            laborCodeVO.setRegUsrId(user_id);
            laborCodeVO.setDlrCd(laborCodeVO.getDlrCd());

            LaborCodeSearchVO searchVO = new LaborCodeSearchVO();
            searchVO.setsDstinCd(laborCodeVO.getDstinCd());
            searchVO.setsDlrCd(laborCodeVO.getDlrCd());
            searchVO.setsLbrCd(laborCodeVO.getLbrCd());
            searchVO.setsLtsModelCd(laborCodeVO.getLtsModelCd());

            /*int result = laborCodeManageDAO.selectLaborCodePopUpByConditionCnt(searchVO);

            if(result > 0 ){
                Exception e = processException("global.err.duplicate");
                throw e;
            }*/
            insertLaborCodeDetail(laborCodeVO);

        }
        for(LaborCodeDetailVO laborCodeVO : detailVO.getUpdateList()){

            laborCodeVO.setUpdtUsrId(user_id);
            updateLaborCodeDetail(laborCodeVO);
        }

        for(LaborCodeDetailVO laborCodeVO : detailVO.getDeleteList()){
            deleteLaborDetail(laborCodeVO);
        }
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void insertLaborCodeDetail(LaborCodeDetailVO laborCodeVO) throws Exception {

        laborCodeManageDAO.insertLaborCodeDetail(laborCodeVO);
    }

    /**
     *
     * Excel 공임코드 상세 데이터를 TEMP 테이블에 삭제 한다.
     *
     * @param laborCodeVO - 입력데이터가 포한된 LaborCodeDetailVO
     * @throws Exception
     */
    public void deleteLaborCodeDetailExcelTemp(LaborCodeDetailVO laborCodeVO) throws Exception{

        laborCodeManageDAO.deleteLaborCodeDetailExcelTemp(laborCodeVO);
    }

    /**
     *
     * Excel 공임코드 상세 데이터를 TEMP 테이블에 등록 한다.
     *
     * @param laborCodeVO - 입력데이터가 포한된 LaborCodeDetailVO
     * @throws Exception
     */
    public void insertLaborCodeDetailExcelTemp(LaborCodeDetailVO laborCodeVO) throws Exception{

        laborCodeManageDAO.insertLaborCodeDetailExcelTemp(laborCodeVO);
    }

    /**
     *
     * Excel 공임코드 상세 데이터를 입력한다.
     *
     * @param laborCodeVO - 입력데이터가 포한된 LaborCodeDetailVO
     * @throws Exception
     */
    public void insertLaborCodeDetailExcel(LaborCodeDetailVO laborCodeVO) throws Exception{

        laborCodeManageDAO.insertLaborCodeDetailExcel(laborCodeVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void deleteLaborDetail(LaborCodeDetailVO laborCodeVO) throws Exception {

        laborCodeManageDAO.deleteLaborDetail(laborCodeVO);

    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void updateLaborCodeDetail(LaborCodeDetailVO laborCodeVO) throws Exception {

        laborCodeManageDAO.updateLaborCodeDetail(laborCodeVO);

    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectLaborCodePopUpByConditionCnt(LaborCodeSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        //searchVO.setsDlrCd(searchVO.getsDstinCd().equals("H") ? "A07AA" : LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return laborCodeManageDAO.selectLaborCodePopUpByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<LaborCodeDetailVO> selectLaborCodePopUpByCondition(LaborCodeSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        //searchVO.setsDlrCd(searchVO.getsDstinCd().equals("H") ? "A07AA" : LoginUtil.getDlrCd());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        return laborCodeManageDAO.selectLaborCodePopUpByCondition(searchVO);

    }

    /**
     *
     * 공임코드 사용이력  데이터 수를 조회한다.
     *
     * @param searchVO - 조회조건이 포한된 LaborCodeSearchVO
     * @return 공임코드 사용이력  데이터 수
     * @throws Exception
     */
    public int selectUsedLaborByConditionCnt(LaborCodeMasterVO laborCodeMasterVO) throws Exception{

        return laborCodeManageDAO.selectUsedLaborByConditionCnt(laborCodeMasterVO);
    };

    /**
    *
    * 공임코드 데이터를 삭제한다.
    *
    * @param laborCodeVO - 삭제데이터가 포한된 LaborCodeDetailVO
    * @throws Exception
    */
    public void deleteLabor(LaborCodeMasterVO laborCodeMasterVO) throws Exception{


        laborCodeMasterVO.setDlrCd(LoginUtil.getDlrCd());

        int cnt = selectUsedLaborByConditionCnt(laborCodeMasterVO);
        if(cnt > 0 ){
            throw processException("ser.info.usedLbrCd");
        }

        // 공임 상세 데이터 삭제
        LaborCodeDetailVO laborCodeVO = new LaborCodeDetailVO();
        laborCodeVO.setDstinCd(laborCodeMasterVO.getDstinCd());
        laborCodeVO.setDlrCd(laborCodeMasterVO.getDlrCd());
        laborCodeVO.setLbrCd(laborCodeMasterVO.getLbrCd());
        deleteLaborDetail(laborCodeVO);

        //공임 마스터 삭제
        laborCodeManageDAO.deleteLabor(laborCodeMasterVO);

    };

    /**
     * 엑셀 업로드 전 TEMP 테이블의 데이터 정보 목록수
     *
     * @param searchVO
     * @return
     */
    public int selectLaborCodeManageExcelTmpByConditionCnt(LaborCodeSearchVO searchVO) throws Exception{

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return laborCodeManageDAO.selectLaborCodeManageExcelTmpByConditionCnt(searchVO);
    }

    /**
     * 엑셀 업로드 전 TEMP 테이블의 데이터 정보
     *
     * @param searchVO - 조회조건이 포함된 LaborCodeSearchVO
     * @return 조회된 결과를 담은 LaborCodePopupVO
     */
    public List<LaborCodeDetailVO> selectLaborCodeManageExcelTmpByCondition(LaborCodeSearchVO searchVO)throws Exception{

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return laborCodeManageDAO.selectLaborCodeManageExcelTmpByCondition(searchVO);
    }

    /**
    *
    * 공임코드 엑셀 업로드 데이터를 Temp에 등록한다.
    *
    * @param laborCodeVO - 등록데이터가 포한된 LaborCodeDetailVO
    * @throws Exception
    */
    public void excelUploadLaborCode(List<LaborCodeDetailVO> laborCodeDetailList) throws Exception{

        String dlrCd = LoginUtil.getDlrCd();
        String usrId = LoginUtil.getUserId();

        //temp table 삭제
        LaborCodeDetailVO detailVO = new LaborCodeDetailVO();
        detailVO.setDlrCd(dlrCd);
        deleteLaborCodeDetailExcelTemp(detailVO);

        for(LaborCodeDetailVO laborCodeDetailVO : laborCodeDetailList){
            if(!StringUtil.nullConvert(laborCodeDetailVO.getDstinCd()).equals("") &&
               !StringUtil.nullConvert(laborCodeDetailVO.getLtsModelCd()).equals("") &&
               !StringUtil.nullConvert(String.valueOf(laborCodeDetailVO.getLbrHm())).equals("") &&
               !StringUtil.nullConvert(String.valueOf(laborCodeDetailVO.getValidStartDt())).equals("")
            ){
               /* if(!laborCodeDetailVO.getDstinCd().equals("H") &&
                        !laborCodeDetailVO.getDstinCd().equals("E")){
                    laborCodeDetailVO.setRegUsrId(usrId);
                    laborCodeDetailVO.setDlrCd(dlrCd);
                    laborCodeDetailVO.setBrandCd("HD");
                    insertLaborCodeDetailExcelTemp(laborCodeDetailVO);
                } */

                if(laborCodeDetailVO.getDstinCd().equals("H") ||
                        laborCodeDetailVO.getDstinCd().equals("G") ||
                        laborCodeDetailVO.getDstinCd().equals("E")){
                    laborCodeDetailVO.setDlrCd("A07AA");
                }else{
                    laborCodeDetailVO.setDlrCd(dlrCd);
                }
                laborCodeDetailVO.setRegUsrId(usrId);
                laborCodeDetailVO.setBrandCd("N");
                insertLaborCodeDetailExcelTemp(laborCodeDetailVO);

             }
        }

    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        LaborCodeSearchVO searchVO = new LaborCodeSearchVO();
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<LaborCodeDetailVO> list = selectLaborCodeManageExcelByCondition(searchVO);

        context.putVar("items", list);

    };


}
