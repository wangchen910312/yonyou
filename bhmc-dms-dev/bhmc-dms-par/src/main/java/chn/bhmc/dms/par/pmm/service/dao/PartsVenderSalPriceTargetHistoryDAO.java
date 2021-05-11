package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetHistorySearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetHistoryVO;

/**
 * 판매가 대상선정 부품구매/판매가격 히스토리 데이타 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 4. 19.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 4. 19.     In Bo Shim      최초 생성
 * </pre>
 */
@Mapper("partsVenderSalPriceTargetHistoryDAO")
public interface PartsVenderSalPriceTargetHistoryDAO {


    /**
     * 공급처별 부품판매가격 히스토리 정보를 등록한다.
     * @param partsVenderSalPriceTargetHistoryVO - 등록할 정보가 담긴 PartsVenderSalPriceTargetHistoryVO
     * @return 등록된 목록수
     */
    public int insertPartsVenderSalPriceTargetHistory(PartsVenderSalPriceTargetHistoryVO partsVenderSalPriceTargetHistoryVO);

    /**
     * 조회 조건에 해당하는 판매가 대상선정 부품구매/판매가격 히스토리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderSalPriceTargetMasterSearchVO
     * @return 조회 목록
     */
    public List<PartsVenderSalPriceTargetHistoryVO> selectPartsVenderSalPriceTargetHistorysByCondition(PartsVenderSalPriceTargetHistorySearchVO searchVO);

    /**
     * 조회 조건에 해당하는 판매가 대상선정 부품구매/판매가격 히스토리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderSalPriceTargetMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectPartsVenderSalPriceTargetHistorysByConditionCnt(PartsVenderSalPriceTargetHistorySearchVO searchVO);
}
