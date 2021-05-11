package chn.bhmc.dms.bat.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

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
 * @ClassName   : BatLaborCodeManageDAO.java
 * @Description : 공임관리 DAO
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
@Mapper("batLaborCodeManageDAO")
public interface BatLaborCodeManageDAO {

    /**
    *
    * 공임코드 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회조건이 포한된 BatLaborCodeSearchVO
    * @return 공임코드 목록
    * @throws Exception
    */
    public List<BatLaborCodeMasterVO> selectLaborCodeManages(BatLaborCodeSearchVO searchVO) throws Exception;

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
    * 공임코드   데이터 목록수를 조회한다.
    *
    * @param searchVO - 조회조건이 포한된 BatLaborCodeSearchVO
    * @return 공임코드 상세 데이터 목록수
    * @throws Exception
    */
    public int selectLaborCodeManageByConditionCnt(BatLaborCodeSearchVO searchVO) throws Exception;

    /**
    *
    * 공임코드 상세 데이터를 입력한다.
    *
    * @param laborCodeVO - 입력데이터가 포한된 BatLaborCodeDetailVO
    * @throws Exception
    */
    public void insertLaborCodeDetail(BatIfLaborCodeDetailVO laborCodeVO) throws Exception;

    /**
    *
    * 공임코드 상세 데이터를 수정한다.
    *
    * @param laborCodeVO - 입력데이터가 포한된 BatLaborCodeDetailVO
    * @throws Exception
    */
    public void updateLaborCodeDetail(BatIfLaborCodeDetailVO laborCodeVO)throws Exception;

    /**
    *
    * 공임 코드 마스터 갯수
    *
    * @param searchVO - 저장할 공임코드 정보
    * @return 공임코드 갯수
    * @throws Exception
    */
    public int selectLaborMasterByConditionCnt(BatLaborCodeMasterVO searchVO) throws Exception;

    /**
     * 공임 코드 마스터 정보를 등록 한다.
     * Statements
     *
     * @param laborVO - 공임관리 등록   정보를 포함한 VO
     * @throws Exception
     */
    public void insertLaborMaster(BatIfLaborCodeMasterVO laborVO)throws Exception;

    /**
     * 공임 팝업 데이터 갯수를 조회한다.
     *
     * @param searchVO - 조회조건이 포함된 BatLaborCodeSearchVO
     * @return
     */
    public void updateLaborMaster(BatIfLaborCodeMasterVO laborVO) throws Exception;


     /**
     *
     * 공임코드 상세 데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포한된 BatIfLaborCodeSearchVO
     * @return 공임코드 상세 데이터
     * @throws Exception
     */
    public List<BatLaborCodeVinVO> selectLaborCodeVinByCondition(BatLaborCodeSearchVO searchVO)throws Exception;


    /**
     * 공임 코드 VIN 정보를 등록 한다.
     * Statements
     *
     * @param laborVO - 공임관리 등록   정보를 포함한 VO
     * @throws Exception
     */
    public void insertLaborCodeVin(BatIfLaborCodeVinVO laborVO)throws Exception;

    /**
     * 공임 코드 VIN 정보를 수정 한다.
     *
     * @param searchVO - 조회조건이 포함된 BatLaborCodeSearchVO
     * @return
     */
    public void updateLaborCodeVin(BatIfLaborCodeVinVO laborVO) throws Exception;

    /**
     *
     * 공임코드 MODEL 데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포한된 BatIfLaborCodeSearchVO
     * @return 공임코드 상세 데이터
     * @throws Exception
     */
    public List<BatLaborCodeModelVO> selectLaborCodeModelByCondition(BatLaborCodeSearchVO searchVO)throws Exception;


    /**
     * 공임 코드 MODEL 정보를 등록 한다.
     * Statements
     *
     * @param laborVO - 공임관리 등록   정보를 포함한 VO
     * @throws Exception
     */
    public void insertLaborCodeModel(BatIfLaborCodeModelVO laborVO)throws Exception;

    /**
     * 공임 코드 MODEL 정보를 수정 한다.
     *
     * @param searchVO - 조회조건이 포함된 BatLaborCodeSearchVO
     * @return
     */
    public void updateLaborCodeModel(BatIfLaborCodeModelVO laborVO) throws Exception;
}
