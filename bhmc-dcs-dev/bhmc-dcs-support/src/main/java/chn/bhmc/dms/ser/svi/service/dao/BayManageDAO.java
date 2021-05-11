package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.svi.vo.BayDetailVO;
import chn.bhmc.dms.ser.svi.vo.BayManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.BayMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BayManageDAO.java
 * @Description : Bay관리 DAO
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

@Mapper("bayManageDAO")
public interface BayManageDAO {

    /**
     * 조회 조건에 해당하는 Bay마스터 정보 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public int selectBayMastersByConditionCnt(BayManageSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 Bay마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public List<BayMasterVO> selectBayMastersByCondition(BayManageSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 Bay마스터 KEY 정보 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public int selectBayMasterByKeyCnt(BayManageSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 Bay마스터 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public BayMasterVO selectBayMasterByKey(BayManageSearchVO searchVO);

    /**
     * Bay마스터 정보를 등록한다.
     * @param bayMasterVO - 등록할 정보가 담긴 BayMasterVO
     * @return 등록된 목록수
     */
    public void insertBayMaster(BayMasterVO obj);

    /**
     * Bay마스터 정보를 수정한다.
     * @param bayMasterVO - 수정할 정보가 담긴 BayMasterVO
     * @return 수정된 목록수
     */
    public void updateBayMaster(BayMasterVO obj);

    /**
     * Bay마스터 정보를 삭제한다.
     * @param searchVO - 삭제할 정보가 담긴 BayMasterVO
     * @return 삭제된 목록수
     */
    public void deleteBayMaster(BayMasterVO obj);

        /**
     * 조회 조건에 해당하는 Bay상세 정보 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public int selectBayDetailsByConditionCnt(BayManageSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 Bay상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public List<BayDetailVO> selectBayDetailsByCondition(BayManageSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 Bay상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public void insertBayDetail(BayDetailVO obj);

    /**
     * 조회 조건에 해당하는 Bay상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public void updateBayDetail(BayDetailVO obj);

    /**
     * Bay상세 정보를 삭제한다.
     * @param obj - 조회 조건을 포함하는 BayDetailVO
     * @return 조회 목록
     */
    public void deleteBayDetail(BayDetailVO obj);

}
