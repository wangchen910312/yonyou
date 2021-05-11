package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.ser.svi.vo.BayDetailVO;
import chn.bhmc.dms.ser.svi.vo.BayManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.BayManageVO;
import chn.bhmc.dms.ser.svi.vo.BayMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BayManageService.java
 * @Description : Bay관리 Service
 * @author KyungMok Kim
 * @since 2016. 1. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19.   KyungMok Kim     최초 생성
 * </pre>
 */

public interface BayManageService {

        /**
     * 조회 조건에 해당하는 Bay마스터 정보 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public int selectBayMastersByConditionCnt(BayManageSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 Bay마스터 KEY 정보 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public int selectBayMasterByKeyCnt(BayManageSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 Bay마스터 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public BayMasterVO selectBayMasterByKey(BayManageSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 Bay마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public List<BayMasterVO> selectBayMastersByCondition(BayManageSearchVO searchVO) throws Exception;

    /**
     * Bay마스터 정보를 등록한다.
     * @param bayMasterVO - 등록할 정보가 담긴 BayMasterVO
     */
    public void insertBayMaster(BayMasterVO obj) throws Exception;

    /**
     * Bay마스터 정보를 수정한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     */
    public void updateBayMaster(BayMasterVO obj) throws Exception;

    /**
     * Bay마스터 정보를 삭제한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     */
    public void deleteBayMaster(BayMasterVO obj) throws Exception;

    /**
     * 조회 조건에 해당하는 Bay상세 정보 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public int selectBayDetailsByConditionCnt(BayManageSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 Bay상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public List<BayDetailVO> selectBayDetailsByCondition(BayManageSearchVO searchVO) throws Exception;

    /**
     * Bay 디테일 정보를 등록한다.
     * @param searchVO - 조회 조건을 포함하는 BayDetailVO
     */
    public void insertBayDetail(BayDetailVO obj) throws Exception;

    /**
     * Bay 디테일 정보를 수정한다.
     * @param searchVO - 조회 조건을 포함하는 BayDetailVO
     */
    public void updateBayDetail(BayDetailVO obj) throws Exception;

    /**
     * Bay 디테일 정보를 삭제한다.
     * @param searchVO - 조회 조건을 포함하는 BayDetailVO
     */
    public void deleteBayDetail(BayDetailVO obj) throws Exception;

    /**
     * Bay마스터 정보를 등록/수정/삭제한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageVO
     * @return 조회 목록
     */
    public void saveBayManages(BayManageVO bayManageVO) throws Exception;
    
    /**
     * Bay마스터 정보를 등록/수정/삭제한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageVO
     * @return 조회 목록
     */
    public void multiBayManages(BayManageVO bayManageVO) throws Exception;
    
    /**
     * Bay마스터 정보를 등록/수정/삭제한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageVO
     * @return 조회 목록
     */
    public void saveBayDetails(BayManageVO bayManageVO) throws Exception;

    /**
     * Bay정보를 삭제한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageVO
     * @return 조회 목록
     */
    public void deleteBayManage(BayMasterVO bayMasterVO) throws Exception;

}
