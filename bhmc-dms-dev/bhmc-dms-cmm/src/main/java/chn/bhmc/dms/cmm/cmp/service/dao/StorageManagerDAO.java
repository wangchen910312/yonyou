package chn.bhmc.dms.cmm.cmp.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.cmp.vo.StorageManagerVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;

/**
 * 창고담당자관리에 관한 데이터처리 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 2. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.17         In Bo Shim            최초 생성
 * </pre>
 */

@Mapper("storageManagerDAO")
public interface StorageManagerDAO {

    /**
     * 창고담당자 정보를 등록한다.
     * @param storageManagerVO - 등록할 정보가 담긴 StorageManagerVO
     * @return 등록된 목록수
     */
    public int insertStorageManager(StorageManagerVO storageManagerVO);

    /**
     * 창고 정보를 수정한다.
     * @param storageManagerVO - 수정할 정보가 담긴 StorageManagerVO
     * @return 수정된 목록수
     */
    public int updateStorageManager(StorageManagerVO storageManagerVO);

    /**
     * 창고 정보를 삭제한다.
     * @param storageManagerVO - 삭제할 정보가 담긴 StorageManagerVO
     * @return 삭제된 목록수
     */
    public int deleteStorageManager(StorageManagerVO storageManagerVO);

    /**
     * Key에 해당하는 창고 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param strgeCd - 창고코드
     * @return 조회한 창고 정보
     */
    public StorageManagerVO selectStorageManagerByKey(@Param("dlrCd") String dlrCd, @Param("strgeCd") String strgeCd, @Param("usrId") String usrId);

    /**
     * 조회 조건에 해당하는 창고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StorageSearchVO
     * @return 조회 목록
     */
    public List<StorageManagerVO> selectStorageManageresByCondition(StorageSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 창고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StorageSearchVO
     * @return
     */
    public int selectStorageManageresByConditionCnt(StorageSearchVO searchVO);
}
