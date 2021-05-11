package chn.bhmc.dms.mob.api.part.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.part.vo.VenderCustomerMasterExcelVO;
import chn.bhmc.dms.mob.api.part.vo.VenderMasterExcelVO;
import chn.bhmc.dms.mob.api.part.vo.VenderMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.VenderMasterVO;

/**
 * 거래처 관리 데이타 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 11.     In Bo Shim      최초 생성
 * </pre>
 */

@Mapper("PartVenderMasterDAO")
public interface PartVenderMasterDAO {

    /**
     * BHMC에 해당하는 거래처 정보를 가져옴.
     * @param dlrCd - 딜러코드
     * @return 조회한 거래처 정보
     */
    public VenderMasterVO selectBHMCVenderMaster(@Param("dlrCd") String dlrCd);

    /**
     * 조회 조건에 해당하는 거래처 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록
     */
    public List<VenderMasterVO> selectVenderMastersByCondition(VenderMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 거래처 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록
     */
    public List<VenderMasterExcelVO> selectVenderMastersExcelDownByCondition(VenderMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 고객 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return 조회 목록
     */
    public List<VenderCustomerMasterExcelVO> selectVenderCustomerMastersExcelDownByCondition(VenderMasterSearchVO searchVO);

}
