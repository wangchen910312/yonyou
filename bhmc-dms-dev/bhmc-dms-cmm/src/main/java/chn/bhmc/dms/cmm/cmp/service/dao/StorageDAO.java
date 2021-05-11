package chn.bhmc.dms.cmm.cmp.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;

/**
 * 창고에 관한 데이터처리 매퍼 클래스
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

@Mapper("storageDAO")
public interface StorageDAO {

    /**
     * 창고 정보를 등록한다.
     * @param storageVO - 등록할 정보가 담긴 StorageVO
     * @return 등록된 목록수
     */
    public int insertStorage(StorageVO storageVO);

    /**
     * 창고 정보를 수정한다.
     * @param storageVO - 수정할 정보가 담긴 StorageVO
     * @return 수정된 목록수
     */
    public int updateStorage(StorageVO storageVO);

    /**
     * 창고 정보를 삭제한다.
     * @param storageVO - 삭제할 정보가 담긴 StorageVO
     * @return 삭제된 목록수
     */
    public int deleteStorage(StorageVO storageVO);

    /**
     * Key에 해당하는 창고 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param strgeCd - 창고코드
     * @return 조회한 창고 정보
     */
    public StorageVO selectStorageByKey(@Param("dlrCd") String dlrCd, @Param("pltCd") String pltCd, @Param("strgeCd") String strgeCd);

    /**
     * 조회 조건에 해당하는 창고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StorageSearchVO
     * @return 조회 목록
     */
    public List<StorageVO> selectStoragesByCondition(StorageSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 창고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StorageSearchVO
     * @return
     */
    public int selectStoragesByConditionCnt(StorageSearchVO searchVO);
}
