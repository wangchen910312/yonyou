package chn.bhmc.dms.ser.wac.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.wac.vo.*;

/**
 * <pre>
 * 고품관리 처리에 대한 mapper class
 * </pre>
 *
 * @ClassName   : ClaimOldItemManageDAO.java
 * @Description : 고품관리 DAO
 * @author Yin Xueyuan
 * @since 2016. 5. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 6.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Mapper("claimOldItemManageDAO")
public interface ClaimOldItemManageDAO {

    /**
     * 고품출고관리 정보를 등록한다.
     * @param claimOldItemManageVO - 등록할 정보가 담긴 ClaimOldItemManageVO
     * @return 등록된 목록수
     */
    public int insertClaimOldItemManage(ClaimOldItemManageVO claimOldItemManageVO)throws Exception;

    /**
     * 고품출고관리 정보를 수정한다.
     * @param claimOldItemManageVO - 수정할 정보가 담긴 ClaimOldItemManageVO
     * @return 수정된 목록수
     */
    public int updateClaimOldItemManage(ClaimOldItemManageVO claimOldItemManageVO)throws Exception;

    /**
     * 고품출고관리 정보를 삭제한다.
     * @param claimOldItemManageVO - 삭제할 정보가 담긴 ClaimOldItemManageVO
     * @return 삭제된 목록수
     */
    public int deleteClaimOldItemManage(ClaimOldItemManageVO claimOldItemManageVO)throws Exception;

    /**
     * 조회 조건에 해당하는 고품요청조회 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public List<ClaimOldItemManageVO> selectClaimOldItemRequestByCondition(ClaimOldItemManageSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 고품요청조회정보 갯수 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public int selectClaimOldItemRequestByConditionCnt(ClaimOldItemManageSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 고품출고관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public List<ClaimOldItemManageVO> selectDlrClaimOldItemManageByCondition(ClaimOldItemManageSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 고품출고관리 갯수 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public int selectDlrClaimOldItemManageByConditionCnt(ClaimOldItemManageSearchVO searchVO)throws Exception;

     /**
     * 조회 조건에 해당하는 고품관리 키정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public ClaimOldItemManageVO selectClaimOldItemManageByKey(ClaimOldItemManageSearchVO searchVO)throws Exception;


    /**
     * 고품관리 정보를 TEMP로 저장한다.
     * @param claimOldItemManageVO - 등록할 정보가 담긴 ClaimOldItemManageVO
     * @return 삭제된 목록수
     */
    public int insertClaimToTemp(ClaimOldItemManageVO claimOldItemManageVO)throws Exception;

    /**
     * 고품프린트 정보를 저장한다.
     * @param ClaimOldItemPrintVO - 등록할 정보가 담긴 ClaimOldItemPrintVO
     * @return 저장된 목록수
     */
    public int insertDlrClaimOldItemPrint(ClaimOldItemPrintVO claimOldItemPrintVO) throws Exception;

}
