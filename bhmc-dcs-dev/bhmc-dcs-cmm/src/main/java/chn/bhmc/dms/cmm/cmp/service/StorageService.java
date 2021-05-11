package chn.bhmc.dms.cmm.cmp.service;

import java.util.List;

import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * 창고 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

public interface StorageService {

    /**
     * 창고 정보를 등록한다.
     * @param storageVO - 등록할 정보가 담긴 StorageVO
     * @return 등록된 목록수
     */
    public int insertStorage(StorageVO storageVO) throws Exception;

    /**
     * 창고 정보를 수정한다.
     * @param storageVO - 수정할 정보가 담긴 StorageVO
     * @return 수정된 목록수
     */
    public int updateStorage(StorageVO storageVO) throws Exception;

    /**
     * 창고 정보를 삭제한다.
     * @param storageVO - 삭제할 정보가 담긴 StorageVO
     * @return 삭제된 목록수
     */
    public int deleteStorage(StorageVO storageVO) throws Exception;

    /**
     * 창고 정보를 등록/수정/삭제 처리한다.
     * @param storageSaveVO
     */
    public void multiStorages(BaseSaveVO<StorageVO> storageSaveVO) throws Exception;

    /**
     * Key에 해당하는 창고 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param strgeCd - 창고코드
     * @return 조회한 창고 정보
     */
    public StorageVO selectStorageByKey(String dlrCd, String pltCd, String strgeCd) throws Exception;

    /**
     * 조회 조건에 해당하는 창고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StorageSearchVO
     * @return 조회 목록
     */
    public List<StorageVO> selectStoragesByCondition(StorageSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 창고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StorageSearchVO
     * @return
     */
    public int selectStoragesByConditionCnt(StorageSearchVO searchVO) throws Exception;
}
