package chn.bhmc.dms.par.pmm.service;

import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsPriceBwmsItemVO;

/**
 * 부품가격 BWMS 서비스
 *
 * @author In Bo Shim
 * @since 2017. 06. 21.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2017. 06. 21.     In Bo Shim      최초 생성
 * </pre>
 */

public interface PartsPriceBwmsService {

    /**
     * 부품코드에 해당하는 BWMS 보증가 정보를 조회한다.
     * @param ItemMasterSearchVO - searchVO
     * @return 조회한 BWMS 부품정보
     */
    public PartsPriceBwmsItemVO selectBwmsItemCdByKey(ItemMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품가격 총 갯수를 조회한다.
     * @param ItemMasterSearchVO - searchVO
     * @return 조회 목록 수
     */
    public int selectItemPriceItemCdByCnt(ItemMasterSearchVO searchVO) throws Exception;

    /**
     * 부품가격관리 보증가 수정.
     * @param PartsPriceBwmsItemVO - partsPriceBwmsItemVO
     * @return 처리 수
     */
    public int updateItemPriceItemCdGrtePrc(PartsPriceBwmsItemVO partsPriceBwmsItemVO) throws Exception;

    /**
     * 조회 조건에 해당하는판매가 대상선정 부품가격 일치 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderPriceTargetMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectPartsVenderSalPriceTargetMastersPriceEqualByConditionCnt(ItemMasterSearchVO searchVO) throws Exception;

}
