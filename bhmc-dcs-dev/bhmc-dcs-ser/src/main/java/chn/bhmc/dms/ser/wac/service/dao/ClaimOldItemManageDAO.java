package chn.bhmc.dms.ser.wac.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.wac.vo.ClaimOldItemManageSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimOldItemManageVO;

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
     * 고품요청 관리 정보를 등록한다. -사용
     * @param claimOldItemManageVO - 등록할 정보가 담긴 ClaimOldItemManageVO
     * @return 등록된 목록수
     */
    public int insertClaimOldItemManage(ClaimOldItemManageVO claimOldItemManageVO)throws Exception;
    
    /**
     * 고품요청 관리 Interface 정보를 등록한다. -사용
     * @param claimOldItemManageVO - 등록할 정보가 담긴 ClaimOldItemManageVO
     * @return 등록된 목록수
     */
    public int insertClaimOldItemManageIf(ClaimOldItemManageVO claimOldItemManageVO)throws Exception;

    /**
     * 고품회수 관리 정보를 수정한다. --사용
     * @param claimOldItemManageVO - 수정할 정보가 담긴 ClaimOldItemManageVO
     * @return 수정된 목록수
     */
    public int updateReceiveOldItemManage(ClaimOldItemManageVO claimOldItemManageVO)throws Exception;
    
    /**
     * 고품공제관리 정보를 수정한다.
     * @param claimOldItemManageVO - 수정할 정보가 담긴 ClaimOldItemManageVO
     * @return 수정된 목록수
     */
    public int updateDeductOldItemManage(ClaimOldItemManageVO claimOldItemManageVO)throws Exception;
    
    /**
     * 고품관리 정보를 수정한다.
     * @param claimOldItemManageVO - 수정할 정보가 담긴 ClaimOldItemManageVO
     * @return 수정된 목록수
     */
    public int updateClaimOldItemOutManage(ClaimOldItemManageVO claimOldItemManageVO);

    /**
     * 고품관리 정보를 삭제한다.
     * @param claimOldItemManageVO - 삭제할 정보가 담긴 ClaimOldItemManageVO
     * @return 삭제된 목록수
     */
    public int deleteClaimOldItemManage(ClaimOldItemManageVO claimOldItemManageVO);

    /**
     * 고품요청 관리 Interface 정보를 삭제한다. - 사용
     * @param claimOldItemManageVO - 삭제할 정보가 담긴 ClaimOldItemManageVO
     * @return 삭제된 목록수
     */
    public int deleteClaimOldItemManageIf(ClaimOldItemManageVO claimOldItemManageVO)throws Exception;
    
    /**
     * 조회 조건에 해당하는 고품관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public List<ClaimOldItemManageVO> selectClaimOldItemRecoveryByCondition(ClaimOldItemManageSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 클레임 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public List<ClaimOldItemManageVO> selectClaimOldItemInfoByCondition(ClaimOldItemManageSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 고품공제관리 목록수
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public int selectDeductOldItemManageByConditionCnt(ClaimOldItemManageSearchVO searchVO)throws Exception;
    
    /**
     * 조회 조건에 해당하는 고품공제 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public List<ClaimOldItemManageVO> selectDeductOldItemManageByCondition(ClaimOldItemManageSearchVO searchVO)throws Exception;
    
    /**
     * 조회 조건에 해당하는 고품출고 관리 목록수
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public int selectOldItemOutManageByConditionCnt(ClaimOldItemManageSearchVO searchVO)throws Exception;
    
    /**
     * 조회 조건에 해당하는 고품출고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public List<ClaimOldItemManageVO> selectOldItemOutManageByCondition(ClaimOldItemManageSearchVO searchVO)throws Exception;
    
    /**
     * 조회 조건에 해당하는 고품요청  정보 갯수 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public int selectClaimOldItemMaterInfoByConditionCnt(ClaimOldItemManageSearchVO searchVO)throws Exception;
    
    /**
     * 조회 조건에 해당하는 고품요청 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public List<ClaimOldItemManageVO> selectClaimOldItemMaterInfoByCondition(ClaimOldItemManageSearchVO searchVO)throws Exception;
    
    /**
     * 조회 조건에 해당하는 고품요청 상세  정보 갯수 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public int selectClaimOldItemDetailInfoByConditionCnt(ClaimOldItemManageSearchVO searchVO)throws Exception;
    
    /**
     * 조회 조건에 해당하는 고품요청 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public List<ClaimOldItemManageVO> selectClaimOldItemDetailInfoByCondition(ClaimOldItemManageSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 고품관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return
     */
    public int selectClaimOldItemRecoveryByConditionCnt(ClaimOldItemManageSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 클레임 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return
     */
    public int selectClaimOldItemInfoByConditionCnt(ClaimOldItemManageSearchVO searchVO);

     /**
     * 조회 조건에 해당하는 고품관리 키정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public ClaimOldItemManageVO selectClaimOldItemManageByKey(ClaimOldItemManageSearchVO searchVO);


    /**
     * 고품관리 정보를 TEMP로 저장한다.
     * @param claimOldItemManageVO - 등록할 정보가 담긴 ClaimOldItemManageVO
     * @return 삭제된 목록수
     */
    public int insertClaimToTemp(ClaimOldItemManageVO claimOldItemManageVO);
    
    /**
     * 고품관리 Excel 정보를 TEMP로 저장한다.
     * @param claimOldItemManageVO - 등록할 정보가 담긴 ClaimOldItemManageVO
     * @return 삭제된 목록수
     */
    public int insertExcelClaimToTemp(String atqReqNo)throws Exception;
    
    /**
     * 고품관리 엑셀 업로드  TEMP 정보를 본테이블로  등록한다.
     * @param claimOldItemManageVO - 등록할 정보가 담긴 ClaimOldItemManageVO
     * @return 삭제된 목록수
     */
    public int insertExcelData(String atqReqNo)throws Exception;
    
    /**
     * 고품관리 엑셀 업로드  정보를 TEMP로 삭제한다.
     * @param claimOldItemManageVO - 삭제할 정보가 담긴 ClaimOldItemManageVO
     * @return 삭제된 목록수
     */
    public int deleteClaimOldItemExcelTemp() throws Exception;
    
    /**
     * 고품관리 엑셀 업로드  정보를 TEMP로 등록한다.
     * @param claimOldItemManageVO - 등록할 정보가 담긴 ClaimOldItemManageVO
     * @return 삭제된 목록수
     */
    public int insertClaimOldItemExcelTemp(ClaimOldItemManageVO claimOldItemManageVO) throws Exception;
    
    /**
     * 고품관리 엑셀 업로드 에러 정보를  삭제한다.
     * @param claimOldItemManageVO - 삭제할 정보가 담긴 ClaimOldItemManageVO
     * @return 삭제된 목록수
     */
    public int deleteClaimOldItemExcelTempErr() throws Exception;
    
    /**
     * 고품관리 엑셀 업로드 에러 정보를 TEMP로 등록한다.
     * @param claimOldItemManageVO - 등록할 정보가 담긴 ClaimOldItemManageVO
     * @return 삭제된 목록수
     */
    public int insertClaimOldItemExcelTempErr(ClaimOldItemManageVO claimOldItemManageVO) throws Exception;
    
    /**
     * 고품관리 업로드  목록수
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectClaimOldItemExcelTempByConditionCnt(ClaimOldItemManageSearchVO searchVO)throws Exception;
    
    /**
     * 고품관리 업로드  목록
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ClaimOldItemManageVO> selectClaimOldItemExcelTempByCondition(ClaimOldItemManageSearchVO searchVO)throws Exception;
    
    /**
     * 고품관리 업로드 에러 목록수
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectClaimOldItemExcelTempErrByConditionCnt(ClaimOldItemManageSearchVO searchVO)throws Exception;
    
    /**
     * 고품관리 업로드 에러 목록
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ClaimOldItemManageVO> selectClaimOldItemExcelTempErrByCondition(ClaimOldItemManageSearchVO searchVO)throws Exception;

}
