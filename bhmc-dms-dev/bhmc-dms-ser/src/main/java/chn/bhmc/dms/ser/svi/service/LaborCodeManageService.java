package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.ser.svi.vo.LaborCodeDetailVO;
import chn.bhmc.dms.ser.svi.vo.LaborCodeManageVO;
import chn.bhmc.dms.ser.svi.vo.LaborCodeMasterVO;
import chn.bhmc.dms.ser.svi.vo.LaborCodeSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LaborCodeManageService.java
 * @Description : 공임관리 서비스
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

public interface LaborCodeManageService {

    /**
    *
    * 공임코드 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회조건이 포한된 LaborCodeSearchVO
    * @return 공임코드 목록
    * @throws Exception
    */
    public List<LaborCodeMasterVO> selectLaborCodeManages(LaborCodeSearchVO searchVO)throws Exception;

    /**
    *
    * 공임코드 해더 데이터를 조회한다. - 보류
    *
    * @param searchVO - 조회조건이 포한된 LaborCodeSearchVO
    * @return 공임코드 해더 데이터
    * @throws Exception
    */
    public List<LaborCodeMasterVO> selectLaborCodeManageMasterByKey(LaborCodeSearchVO searchVO) throws Exception;

    /**
    *
    * 공임코드 마스터 데이터 목록수를 조회한다.
    *
    * @param searchVO - 조회조건이 포한된 LaborCodeSearchVO
    * @return 공임코드 상세 데이터 목록수
    * @throws Exception
    */
    public int selectLaborCodeManageByConditionCnt(LaborCodeSearchVO searchVO) throws Exception;

    /**
    *
    * 공임코드 상세 데이터를 조회한다.
    *
    * @param searchVO - 조회조건이 포한된 LaborCodeSearchVO
    * @return 공임코드 상세 데이터
    * @throws Exception
    */
    public List<LaborCodeDetailVO> selectLaborCodeManageByCondition(LaborCodeSearchVO searchVO)throws Exception;

    /**
     *
     * 공임 코드 마스터 갯수
     *
     * @param searchVO - 저장할 공임코드 정보
     * @return 공임코드 갯수
     * @throws Exception
     */
    public int selectLaborMasterByConditionCnt(LaborCodeMasterVO laborVO)throws Exception;

    /**
     * 공임 코드 마스터 정보를 등록/수정한다.
     * Statements
     *
     * @param laborVO - 공임관리 등록 / 수정 정보를 포함한 VO
     * @throws Exception
     */
    public void multiLaborMaster(LaborCodeManageVO objVO) throws Exception;

    /**
     * 공임 코드 상세 정보를 등록/수정한다.
     * Statements
     *
     * @param laborVO - 공임관리 등록 / 수정 정보를 포함한 VO
     * @throws Exception
     */
    public void multiLaborDetail(LaborCodeManageVO objVO) throws Exception;

    /**
     * 공임 코드 마스터 정보를 등록전  중복 체크 한다.
     * Statements
     *
     * @param laborVO - 공임관리 등록   정보를 포함한 VO
     * @throws Exception
     */
    public void insertCheckLaborMaster(LaborCodeMasterVO laborVO) throws Exception;

    /**
     * 공임 코드 마스터 정보를 등록 한다.
     * Statements
     *
     * @param laborVO - 공임관리 등록   정보를 포함한 VO
     * @throws Exception
     */
    public void insertLaborMaster(LaborCodeMasterVO laborVO) throws Exception;

    /**
     *
     * 공임코드 데이터를 삭제한다.
     *
     * @param laborCodeVO - 입력데이터가 포한된 LaborCodeDetailVO
     * @throws Exception
     */
    public void deleteLaborDetail(LaborCodeDetailVO laborCodeVO)throws Exception;


    /**
     * 공임 코드 마스터 정보를  수정한다.
     * Statements
     *
     * @param laborVO - 공임관리  수정 정보를 포함한 VO
     * @throws Exception
     */
    public void updateLaborMaster(LaborCodeMasterVO laborVO) throws Exception;


    /**
     * 공임코드디테일 정보를 등록한다.
     * @param saveVO - 공임코드관리 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @return
     */
    public void multiLaborCodeDetail(LaborCodeManageVO objVO) throws Exception;



    /**
     *
     * 공임코드 디테일 정보를 입력한다.
     *
     * @param labrCodeVO - 공임코드관리  등록정보를 포함하는 SaveVO
     * @throws Exception
     */
    public void insertLaborCodeDetail(LaborCodeDetailVO laborCodeVO) throws Exception;


    /**
     *
     * Excel 공임코드 상세 데이터를 TEMP 테이블에 삭제 한다.
     *
     * @param laborCodeVO - 입력데이터가 포한된 LaborCodeDetailVO
     * @throws Exception
     */
    public void deleteLaborCodeDetailExcelTemp(LaborCodeDetailVO laborCodeVO) throws Exception;

    /**
     *
     * Excel 공임코드 상세 데이터를 TEMP 테이블에 등록 한다.
     *
     * @param laborCodeVO - 입력데이터가 포한된 LaborCodeDetailVO
     * @throws Exception
     */
    public void insertLaborCodeDetailExcelTemp(LaborCodeDetailVO laborCodeVO) throws Exception;

    /**
     *
     * Excel 공임코드 상세 데이터를 입력한다.
     *
     * @param laborCodeVO - 입력데이터가 포한된 LaborCodeDetailVO
     * @throws Exception
     */
    public void insertLaborCodeDetailExcel(LaborCodeDetailVO laborCodeVO) throws Exception;

    /**
     *
     * 공임코드디테일  정보를 수정한다.
     *
     * @param labrCodeVO - 공임코드관리  수정 정보를 포함하는 SaveVO
     * @throws Exception
     */
    public void updateLaborCodeDetail(LaborCodeDetailVO laborCodeVO) throws Exception;

    /**
     * 공임 팝업 데이터 갯수를 조회한다.
     *
     * @param searchVO - 조회조건이 포함된 LaborCodeSearchVO
     * @return
     */
    public int selectLaborCodePopUpByConditionCnt(LaborCodeSearchVO searchVO)throws Exception;

    /**
     * 공임 팝업 데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포함된 LaborCodeSearchVO
     * @return 조회된 결과를 담은 LaborCodePopupVO
     */
    public List<LaborCodeDetailVO> selectLaborCodePopUpByCondition(LaborCodeSearchVO searchVO)throws Exception;

    /**
     *
     * 공임코드 사용이력  데이터 수를 조회한다.
     *
     * @param searchVO - 조회조건이 포한된 LaborCodeSearchVO
     * @return 공임코드 사용이력  데이터 수
     * @throws Exception
     */
    public int selectUsedLaborByConditionCnt(LaborCodeMasterVO laborCodeMasterVO) throws Exception;

    /**
    *
    * 공임코드 데이터를 삭제한다.
    *
    * @param laborCodeVO - 삭제데이터가 포한된 LaborCodeDetailVO
    * @throws Exception
    */
    public void deleteLabor(LaborCodeMasterVO laborCodeMasterVO) throws Exception;

    /**
    *
    * 공임코드 엑셀 업로드 데이터를 Temp에 등록한다.
    *
    * @param laborCodeVO - 등록데이터가 포한된 LaborCodeDetailVO
    * @throws Exception
    */
    public void excelUploadLaborCode(List<LaborCodeDetailVO> laborCodeDetailList) throws Exception;

    /**
     * 엑셀 업로드 전 TEMP 테이블의 데이터 정보 목록수
     *
     * @param searchVO
     * @return
     */
    public int selectLaborCodeManageExcelTmpByConditionCnt(LaborCodeSearchVO searchVO) throws Exception;

    /**
     * 엑셀 업로드 전 TEMP 테이블의 데이터 정보
     *
     * @param searchVO - 조회조건이 포함된 LaborCodeSearchVO
     * @return 조회된 결과를 담은 LaborCodePopupVO
     */
    public List<LaborCodeDetailVO> selectLaborCodeManageExcelTmpByCondition(LaborCodeSearchVO searchVO)throws Exception;


}
