package chn.bhmc.dms.mob.api.part.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.part.vo.StorageSearchVO;
import chn.bhmc.dms.mob.api.part.vo.StorageVO;



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

@Mapper("PartStorageDAO")
public interface PartStorageDAO {

   
    /**
     * 조회 조건에 해당하는 창고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StorageSearchVO
     * @return 조회 목록
     */
    public List<StorageVO> selectStoragesByCondition(StorageSearchVO searchVO);

}
