package chn.bhmc.dms.bat.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

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
@Mapper("batIfLaborCodeManageDAO")
public interface BatIfLaborCodeManageDAO {

    /**
    *
    * 공임코드 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회조건이 포한된 BatIfLaborCodeSearchVO
    * @return 공임코드 목록
    * @throws Exception
    */
    public List<BatIfLaborCodeMasterVO> selectLaborCodeManages(BatIfLaborCodeSearchVO searchVO) throws Exception;

    /**
    *
    * 공임코드 해더 데이터를 조회한다.
    *
    * @param searchVO - 조회조건이 포한된 BatIfLaborCodeSearchVO
    * @return 공임코드 해더 데이터
    * @throws Exception
    */
    public List<BatIfLaborCodeMasterVO> selectLaborCodeManageMasterByKey(BatIfLaborCodeSearchVO searchVO)throws Exception;

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
    * 공임코드   데이터 목록수를 조회한다.
    *
    * @param searchVO - 조회조건이 포한된 BatIfLaborCodeSearchVO
    * @return 공임코드 상세 데이터 목록수
    * @throws Exception
    */
    public int selectLaborCodeManageByConditionCnt(BatIfLaborCodeSearchVO searchVO) throws Exception;

    /**
    *
    * 공임코드 상세 데이터를 입력한다.
    *
    * @param laborCodeVO - 입력데이터가 포한된 BatIfLaborCodeDetailVO
    * @throws Exception
    */
    public void insertLaborCodeDetail(BatIfLaborCodeDetailVO laborCodeVO) throws Exception;

    /**
    *
    * 공임코드 상세 데이터를 수정한다.
    *
    * @param laborCodeVO - 입력데이터가 포한된 BatIfLaborCodeDetailVO
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
    public int selectLaborMasterByConditionCnt(BatIfLaborCodeMasterVO searchVO) throws Exception;

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
     * @param searchVO - 조회조건이 포함된 BatIfLaborCodeSearchVO
     * @return
     */
    public void updateLaborMaster(BatIfLaborCodeMasterVO laborVO) throws Exception;

     /**
     *
     * 공임코드 VIN MAPPING 데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포한된 BatIfLaborCodeSearchVO
     * @return 공임코드 상세 데이터
     * @throws Exception
     */
    public List<BatIfLaborCodeVinVO> selectLaborCodeVinByCondition(BatIfLaborCodeSearchVO searchVO)throws Exception;

    /**
     *
     * 공임코드 MODEL 데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포한된 BatIfLaborCodeSearchVO
     * @return 공임코드 상세 데이터
     * @throws Exception
     */
    public List<BatIfLaborCodeModelVO> selectLaborCodeModelByCondition(BatIfLaborCodeSearchVO searchVO)throws Exception;


}
