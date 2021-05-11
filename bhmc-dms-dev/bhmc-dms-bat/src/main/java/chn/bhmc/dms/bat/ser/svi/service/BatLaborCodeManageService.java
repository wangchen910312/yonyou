package chn.bhmc.dms.bat.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeDetailVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeMasterVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeModelVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeVinVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatLaborCodeDetailVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatLaborCodeMasterVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatLaborCodeModelVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatLaborCodeSearchVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatLaborCodeVinVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatLaborCodeManageService.java
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

public interface BatLaborCodeManageService {

    /**
    *
    * 공임코드 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회조건이 포한된 BatLaborCodeSearchVO
    * @return 공임코드 목록
    * @throws Exception
    */
    public List<BatLaborCodeMasterVO> selectLaborCodeManages(BatLaborCodeSearchVO searchVO)throws Exception;

    /**
    *
    * 공임코드 마스터 데이터 목록수를 조회한다.
    *
    * @param searchVO - 조회조건이 포한된 BatLaborCodeSearchVO
    * @return 공임코드 상세 데이터 목록수
    * @throws Exception
    */
    public int selectLaborCodeManageByConditionCnt(BatLaborCodeSearchVO searchVO) throws Exception;

    /**
    *
    * 공임코드 상세 데이터를 조회한다.
    *
    * @param searchVO - 조회조건이 포한된 BatLaborCodeSearchVO
    * @return 공임코드 상세 데이터
    * @throws Exception
    */
    public List<BatLaborCodeDetailVO> selectLaborCodeManageByCondition(BatLaborCodeSearchVO searchVO)throws Exception;

    /**
     *
     * 공임코드 상세 데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포한된 BatLaborCodeSearchVO
     * @return 공임코드 상세 데이터
     * @throws Exception
     */
    public List<BatLaborCodeDetailVO> selectLaborCodeDetailByCondition(BatLaborCodeSearchVO searchVO)throws Exception;

    /**
     *
     * 공임코드 VIN MAPPING 상세 데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포한된 BatLaborCodeSearchVO
     * @return 공임코드 상세 데이터
     * @throws Exception
     */
    public List<BatLaborCodeVinVO> selectLaborCodeVinByCondition(BatLaborCodeSearchVO searchVO)throws Exception;

    /**
     *
     * 공임코드 MODEL 상세 데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포한된 BatLaborCodeSearchVO
     * @return 공임코드 상세 데이터
     * @throws Exception
     */
    public List<BatLaborCodeModelVO> selectLaborCodeModelByCondition(BatLaborCodeSearchVO searchVO)throws Exception;

    /**
     *
     * 공임 코드 마스터 갯수
     *
     * @param searchVO - 저장할 공임코드 정보
     * @return 공임코드 갯수
     * @throws Exception
     */
    public int selectLaborMasterByConditionCnt(BatLaborCodeMasterVO laborVO)throws Exception;

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
     * 공임 코드 마스터 정보를 등록/수정한다.
     * Statements
     *
     * @param laborVO - 공임관리 등록 / 수정 정보를 포함한 VO
     * @throws Exception
     */
    public void multiLaborMaster() throws Exception;

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

    /**
     *
     * 공임코드디테일  정보를 등록/수정한다.
     *
     * @param labrCodeVO - 공임코드관리  수정 정보를 포함하는 SaveVO
     * @throws Exception
     */
    public void multiLaborCodeDetail() throws Exception;

    /**
     *
     * 공임 VIN MAPPING  정보를 등록/수정한다.
     *
     * @param labrCodeVO - 공임코드관리  수정 정보를 포함하는 SaveVO
     * @throws Exception
     */
    public void multiLaborCodeVin() throws Exception;

    /**
     *
     * 공임 MODEL  정보를 등록/수정한다.
     *
     * @param labrCodeVO - 공임코드관리  수정 정보를 포함하는 SaveVO
     * @throws Exception
     */
    public void multiLaborCodeModel() throws Exception;

    /**
     *
     * 공임  정보를 등록/수정한다.
     *
     * @param labrCodeVO - 공임코드관리  수정 정보를 포함하는 SaveVO
     * @throws Exception
     */
    public void multiLabor() throws Exception;

    /**
     *
     * 공임코드 VIN 정보를 입력한다.
     *
     * @param labrCodeVO - 공임코드관리  등록정보를 포함하는 SaveVO
     * @throws Exception
     */
    public void insertLaborCodeVin(BatIfLaborCodeVinVO laborCodeVO) throws Exception;

    /**
     *
     * 공임코드 VIN  정보를 수정한다.
     *
     * @param labrCodeVO - 공임코드관리  수정 정보를 포함하는 SaveVO
     * @throws Exception
     */
    public void updateLaborCodeVin(BatIfLaborCodeVinVO laborCodeVO) throws Exception;

    /**
     *
     * 공임코드 VIN 정보를 입력한다.
     *
     * @param labrCodeVO - 공임코드관리  등록정보를 포함하는 SaveVO
     * @throws Exception
     */
    public void insertLaborCodeModel(BatIfLaborCodeModelVO laborCodeVO) throws Exception;

    /**
     *
     * 공임코드 VIN  정보를 수정한다.
     *
     * @param labrCodeVO - 공임코드관리  수정 정보를 포함하는 SaveVO
     * @throws Exception
     */
    public void updateLaborCodeModel(BatIfLaborCodeModelVO laborCodeVO) throws Exception;


}
