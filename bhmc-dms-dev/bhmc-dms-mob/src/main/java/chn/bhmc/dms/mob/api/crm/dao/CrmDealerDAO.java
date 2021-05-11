package chn.bhmc.dms.mob.api.crm.dao;

import org.apache.ibatis.annotations.Param;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.DealerVO;

/**
 * 딜러에 관한 데이터처리 매퍼 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Mapper("CrmdealerDAO")
public interface CrmDealerDAO {

    /**
     * Key에 해당하는 딜러 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 딜러 정보
     */
    public DealerVO selectDealerByKey(@Param("dlrCd") String langCd);
}
