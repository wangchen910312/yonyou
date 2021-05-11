package chn.bhmc.dms.bat.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeDetailVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeMasterVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeModelVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeSearchVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeVinVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatIfLaborCodeManageService.java
 * @Description : 공임관리 서비스
 * @author YIN XUEYUAN
 * @since 2016. 5. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 24.     YIN XUEYUAN     최초 생성
 * </pre>
 */

public interface BatIfLaborCodeManageService {

    /**
    *
    * 공임코드 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회조건이 포한된 BatIfLaborCodeSearchVO
    * @return 공임코드 목록
    * @throws Exception
    */
    public List<BatIfLaborCodeMasterVO> selectLaborCodeManages(BatIfLaborCodeSearchVO searchVO)throws Exception;

    /**
    *
    * 공임코드 해더 데이터를 조회한다. - 보류
    *
    * @param searchVO - 조회조건이 포한된 BatIfLaborCodeSearchVO
    * @return 공임코드 해더 데이터
    * @throws Exception
    */
    public List<BatIfLaborCodeMasterVO> selectLaborCodeManageMasterByKey(BatIfLaborCodeSearchVO searchVO) throws Exception;

    /**
    *
    * 공임코드 마스터 데이터 목록수를 조회한다.
    *
    * @param searchVO - 조회조건이 포한된 BatIfLaborCodeSearchVO
    * @return 공임코드 상세 데이터 목록수
    * @throws Exception
    */
    public int selectLaborCodeManageByConditionCnt(BatIfLaborCodeSearchVO searchVO) throws Exception;

    /**
    *
    * 공임코드 상세 데이터를 조회한다.
    *
    * @param searchVO - 조회조건이 포한된 BatIfLaborCodeSearchVO
    * @return 공임코드 상세 데이터
    * @throws Exception
    */
    public List<BatIfLaborCodeDetailVO> selectLaborCodeManageByCondition(BatIfLaborCodeSearchVO searchVO)throws Exception;

    /**
     *
     * 공임코드 상세 데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포한된 BatIfLaborCodeSearchVO
     * @return 공임코드 상세 데이터
     * @throws Exception
     */
    public List<BatIfLaborCodeDetailVO> selectLaborCodeDetailByCondition(BatIfLaborCodeSearchVO searchVO)throws Exception;


    /**
     *
     * 공임코드 VIN MAPPING 상세 데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포한된 BatLaborCodeSearchVO
     * @return 공임코드 상세 데이터
     * @throws Exception
     */
    public List<BatIfLaborCodeVinVO> selectLaborCodeVinByCondition(BatIfLaborCodeSearchVO searchVO)throws Exception;

    /**
     *
     * 공임코드 MODEL 상세 데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포한된 BatLaborCodeSearchVO
     * @return 공임코드 상세 데이터
     * @throws Exception
     */
    public List<BatIfLaborCodeModelVO> selectLaborCodeModelByCondition(BatIfLaborCodeSearchVO searchVO)throws Exception;

    /**
     *
     * 공임 코드 마스터 갯수
     *
     * @param searchVO - 저장할 공임코드 정보
     * @return 공임코드 갯수
     * @throws Exception
     */
    public int selectLaborMasterByConditionCnt(BatIfLaborCodeMasterVO laborVO)throws Exception;

    /**
     * 공임 코드 마스터 정보를 등록전  중복 체크 한다.
     * Statements
     *
     * @param laborVO - 공임관리 등록   정보를 포함한 VO
     * @throws Exception
     */
    public void insertCheckLaborMaster(BatIfLaborCodeMasterVO laborVO) throws Exception;

    /**
     * 공임 코드 마스터 정보를 등록 한다.
     * Statements
     *
     * @param laborVO - 공임관리 등록   정보를 포함한 VO
     * @throws Exception
     */
    public void insertLaborMaster(BatIfLaborCodeMasterVO laborVO) throws Exception;

    /**
     * 공임 코드 마스터 정보를  수정한다.
     * Statements
     *
     * @param laborVO - 공임관리  수정 정보를 포함한 VO
     * @throws Exception
     */
    public void updateLaborMaster(BatIfLaborCodeMasterVO laborVO) throws Exception;


    /**
     *
     * 공임코드 디테일 정보를 입력한다.
     *
     * @param labrCodeVO - 공임코드관리  등록정보를 포함하는 SaveVO
     * @throws Exception
     */
    public void insertLaborCodeDetail(BatIfLaborCodeDetailVO laborCodeVO) throws Exception;

    /**
     *
     * 공임코드디테일  정보를 수정한다.
     *
     * @param labrCodeVO - 공임코드관리  수정 정보를 포함하는 SaveVO
     * @throws Exception
     */
    public void updateLaborCodeDetail(BatIfLaborCodeDetailVO laborCodeVO) throws Exception;


}
