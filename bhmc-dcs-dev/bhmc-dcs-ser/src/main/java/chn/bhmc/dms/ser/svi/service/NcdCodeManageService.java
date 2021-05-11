package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.ser.svi.vo.NcdCodeManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.NcdCodeManageVO;
import chn.bhmc.dms.ser.svi.vo.NcdCodeSearchVO;
import chn.bhmc.dms.ser.svi.vo.NcdLclsVO;
import chn.bhmc.dms.ser.svi.vo.NcdMclsVO;
import chn.bhmc.dms.ser.svi.vo.NcdSclsVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NcdCodeManageService.java
 * @Description : 현상코드 관리
 * @author Ki Hyun Kwon
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

public interface NcdCodeManageService {

    /**
     * 조회조건에 맞는 현상코드 총 갯수를 조회한다.
     *
     * @param searchVO - 조회조건을 포함한 NcdCodeManageSearchVO
     * @return 조회목록 갯수
     */
    public int selectNcdCodeManageByConditionCnt(NcdCodeManageSearchVO searchVO)throws Exception;

    /**
     * 조회조건에 맞는 현상코드 목록을 조회한다.
     *
     * @param searchVO - 조회조건을 포함한 NcdCodeManageSearchVO
     * @return 조회목록
     */
    public List<NcdCodeManageVO> selectNcdCodeManageByCondition(NcdCodeManageSearchVO searchVO) throws Exception;

   /**
    *
    * 현상코드 관리 정보를 수정한다.
    *
    * @param saveVO - 현상코드 수정정보가 포함된 NcdCodeManageSaveVO
    * @return
    * @throws Exception
    */
    public void updateNcdCodeManages(BaseSaveVO<NcdCodeManageVO> saveVO) throws Exception;


    /**
     *
     * 부품에 해당된 현상코드 갯수를 조회한다.
     *
     * @param searchVO - 부품번호
     * @return
     * @throws Exception
     */
    public int selectNcdCodeByConditionCnt(NcdCodeSearchVO searchVO)throws Exception;

    /**
     *
     * 부품에 연관된 대분류 현상코드를 조회한다.
     *
     * @param searchVO - 부품번호
     * @return
     * @throws Exception
     */
    public List<NcdLclsVO> selectNcdLclsMapByKey(NcdCodeSearchVO searchVO)throws Exception;

    /**
     * 전체 대분류 현상코드를 조회한다.
     * Statements
     *
     * @param searchVO - 부품번호
     * @return
     * @throws Exception
     */
    public List<NcdLclsVO> selectNcdLclsByKey(NcdCodeSearchVO searchVO)throws Exception;


    /**
    *
    * 중분류 현상코드를 조회한다.
    *
    * @param searchVO - 부품번호
    * @return
    * @throws Exception
    */
    public List<NcdMclsVO> selectNcdMCodeByKey(NcdCodeSearchVO searchVO)throws Exception;

    /**
     *
     * 부품에 연관된 중분류 현상코드를 조회한다.
     *
     * @param searchVO - 부품번호
     * @return
     * @throws Exception
     */
    public List<NcdMclsVO> selectNcdMclsMapByKey(NcdCodeSearchVO searchVO)throws Exception;

    /**
     * 전체 중분류 현상코드를 조회한다.
     * Statements
     *
     * @param searchVO - 부품번호
     * @return
     * @throws Exception
     */
    public List<NcdMclsVO> selectNcdMclsByKey(NcdCodeSearchVO searchVO)throws Exception;


    /**
    *
    * 소분류 현상코드를 조회한다.
    *
    * @param searchVO - 부품번호
    * @return
    * @throws Exception
    */
    public List<NcdSclsVO> selectNcdSCodeByKey(NcdCodeSearchVO searchVO)throws Exception;

    /**
     *
     * 부품에 연관된 소분류 현상코드를 조회한다.
     *
     * @param searchVO - 부품번호
     * @return
     * @throws Exception
     */
    public List<NcdSclsVO> selectNcdSclsMapByKey(NcdCodeSearchVO searchVO)throws Exception;

    /**
     * 전체 소분류 현상코드를 조회한다.
     * Statements
     *
     * @param searchVO - 부품번호
     * @return
     * @throws Exception
     */
    public List<NcdSclsVO> selectNcdSclsByKey(NcdCodeSearchVO searchVO)throws Exception;








}
