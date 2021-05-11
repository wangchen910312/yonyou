package chn.bhmc.dms.par.stm.service;

import chn.bhmc.dms.par.stm.vo.ItemMovingAvgPrcVO;

/**
 * 부품이동평균가격 서비스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Ju Won Lee      최초 생성
 * </pre>
 */

public interface ItemMovingAvgPrcService {

    /**
     * 부품이동평균가격 정보를 등록한다.
     * @param itemMovingAvgPrcVO - 등록할 정보가 담긴 ItemMovingAvgPrcVO
     * @return 등록된 목록수
     */
    public int insertItemMovingAvgPrc(ItemMovingAvgPrcVO itemMovingAvgPrcVO) throws Exception;

    /**
     * 부품이동평균가격 정보를 수정한다.
     * @param itemMovingAvgPrcVO - 수정할 정보가 담긴 ItemMovingAvgPrcVO
     * @return 수정된 목록수
     */
    public int updateItemMovingAvgPrc(ItemMovingAvgPrcVO itemMovingAvgPrcVO) throws Exception;

    /**
     * 부품이동평균가격 정보를 등록한다.(히스토리)
     * @param itemMovingAvgPrcVO - 등록할 정보가 담긴 ItemMovingAvgPrcVO
     * @return 등록된 목록수
     */
    public int insertItemMovingAvgPrcHistory(ItemMovingAvgPrcVO itemMovingAvgPrcVO) throws Exception;


    /**
     * Key에 해당하는 부품 이동평균가격 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMovingAvgPrcVO
     * @return 조회 목록
     */
    public ItemMovingAvgPrcVO selectItemMovingAvgPrcByKey(ItemMovingAvgPrcVO searchVO) throws Exception;

    /**
     * Key에 해당하는 부품 이동평균가격 SEQ Max값을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMovingAvgPrcVO
     * @return 조회 목록 수
     */
    public int selectItemMovingAvgPrcHistoryMaxLineNo(ItemMovingAvgPrcVO itemMovingAvgPrcVO) throws Exception;


    /**
     * 부품가격(기본정보) 정보를 등록한다.
     * @param itemMovingAvgPrcVO - 등록할 정보가 담긴 ItemMovingAvgPrcVO
     * @return 등록된 목록수
     */
    public int insertPartsVenderSalPriceTargetMaster(ItemMovingAvgPrcVO itemMovingAvgPrcVO) throws Exception;


    /**
     * 창고별 부품번호에 해당하는 공급처별 부품판매가격 마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderSalPriceMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectPartsVenderSalPriceMastersByItemInfoCnt(ItemMovingAvgPrcVO itemMovingAvgPrcVO) throws Exception;

    /**
     * 부품가격 중 BMP 구매가격을 조회한다.
     * @param itemMovingAvgPrcVO - 등록할 정보가 담긴 ItemMovingAvgPrcVO
     * @return 등록된 목록수
     */
    public double selectBmpPurcPrcByItemCd(ItemMovingAvgPrcVO itemMovingAvgPrcVO) throws Exception;


}
