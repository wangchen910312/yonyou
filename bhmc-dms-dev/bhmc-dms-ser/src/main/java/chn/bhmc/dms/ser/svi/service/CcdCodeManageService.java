package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.ser.svi.vo.CcdCodeManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.CcdCodeManageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CcdCodeManageService.java
 * @Description : 원인코드 관리 서비스
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

public interface CcdCodeManageService {

    /**
     * 조회조건에 맞는 원인코드 총 갯수를 조회한다.
     *
     * @param searchVO - 조회조건을 포함한 CcdCodeManageSearchVO
     * @return 조회목록 갯수
     */
    public int selectCcdCodeManageByConditionCnt(CcdCodeManageSearchVO searchVO)throws Exception;

    /**
     * 조회조건에 맞는 원인코드 목록을 조회한다.
     *
     * @param searchVO - 조회조건을 포함한 CcdCodeManageSearchVO
     * @return 조회목록
     */
    public List<CcdCodeManageVO> selectCcdCodeManageByCondition(CcdCodeManageSearchVO searchVO) throws Exception;

    /**
     * 원인코드를 수정한다.
     *
     * @param saveVO - 원인코드 수정 정보가 포한된 CcdCodeManageSaveVO
     */
    public void updateCcdCodeManages(BaseSaveVO<CcdCodeManageVO> saveVO)throws Exception;

    /**
     * 원인 코드 팝업 목록을 조회한다.
     *
     * @return
     */
    public List<CcdCodeManageVO> selectCcdCodeByKey(CcdCodeManageSearchVO searchVO) throws Exception;



}
