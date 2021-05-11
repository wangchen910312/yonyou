package chn.bhmc.dms.sal.veh.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionPriceSearchVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionPriceVO;

/**
 * 로컬옵션가격정보 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface LocalOptionPriceService {

	/**
     * 조회 조건에 해당하는 모델별 로컬옵션 가격 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LocalOptionPriceSearchVO
     * @return 조회 목록
     */
	public List<LocalOptionPriceVO> selectLocalOptionPricesByCondition(LocalOptionPriceSearchVO searchVO);

	/**
     * 조회 조건에 해당하는 모델별 로컬옵션 가격 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LocalOptionPriceSearchVO
     * @return
     */
	public int selectLocalOptionPricesByConditionCnt(LocalOptionPriceSearchVO searchVO);

	/**
     * 모델별 로컬옵션 가격을 등록/수정/삭제 처리한다
     * @param localOptionPriceSaveVO)- 조회 조건을 포함하는 LocalOptionPriceVO
     * @return
     */
	public void multiLocalOptionPrices(BaseSaveVO<LocalOptionPriceVO> localOptionPriceSaveVO);

    /**
     * 로컬옵션의 상품리스트 조회 [계약품의 화면]
     * @param LocalOptionPriceVO
     * @return
     */
	public int selectLocalOptionPriceListsByConditionCnt(LocalOptionPriceSearchVO searchVO);
    public List<LocalOptionPriceVO> selectLocalOptionPriceListsByCondition(LocalOptionPriceSearchVO searchVO);
}
