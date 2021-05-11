package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

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
 * @ClassName   : NcdCodeManageDAO.java
 * @Description : 현상코드 관리 DAO
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

@Mapper("ncdCodeManageDAO")
public interface NcdCodeManageDAO {

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
    public List<NcdCodeManageVO> selectNcdCodeManageByCondition(NcdCodeManageSearchVO searchVO)throws Exception;

    /**
     * 현상코드를 수정한다.
     *
     * @param saveVO - 현상코드 수정 정보가 포한된 NcdCodeManageVO
     */
    public void updateNcdCodeManages(NcdCodeManageVO ncdCodeVO) throws Exception;

    /**
    *
    * 부품에 해당된 현상코드 갯수를 조회한다.
    *
    * @param searchVO - 부품번호
    * @return
    * @throws Exception
    */
    public int selectNcdCodeByConditionCnt(NcdCodeSearchVO searchVO) throws Exception;

    /**
    *
    * 부품에 연관된 대분류 현상코드를 조회한다.
    *
    * @param searchVO - 부품번호
    * @return
    * @throws Exception
    */
    public List<NcdLclsVO> selectNcdLclsMapByKey(NcdCodeSearchVO searchVO) throws Exception;

    /**
    *
    * 부품에 연관된 소분류 현상코드를 조회한다.
    *
    * @param searchVO - 부품번호
    * @return
    * @throws Exception
    */
    public List<NcdMclsVO> selectNcdMclsMapByKey(NcdCodeSearchVO searchVO) throws Exception;

    /**
    *
    * 부품에 연관된 소분류 현상코드를 조회한다.
    *
    * @param searchVO - 부품번호
    * @return
    * @throws Exception
    **/
    public List<NcdSclsVO> selectNcdSclsMapByKey(NcdCodeSearchVO searchVO) throws Exception;

    /**
     * 전체 대분류 현상코드를 조회한다.
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<NcdLclsVO> selectNcdLclsByKey(NcdCodeSearchVO searchVO) throws Exception;

    /**
    *
    *  대분류에 종속된 중분류 현상코드를 조회한다.
    *
    * @param searchVO - 대분류 코드
    * @return
    * @throws Exception
    */
    public List<NcdMclsVO> selectNcdMclsByKey(NcdCodeSearchVO searchVO) throws Exception;

    /**
     * 중분류에 종속된 소분류 현상코드를 조회한다.
     * Statements
     *
     * @param searchVO - 중분류코드
     * @return
     * @throws Exception
     */
    public List<NcdSclsVO> selectNcdSclsByKey(NcdCodeSearchVO searchVO) throws Exception;


}
