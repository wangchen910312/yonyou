package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.pmm.vo.ItemMasterExcelDownVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterExcelVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterVO;

/**
 * 부품마스터에 관한 데이터처리 매퍼 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 7.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.07         Ju Won Lee            최초 생성
 * </pre>
 */

@Mapper("itemMasterDAO")
public interface ItemMasterDAO {

    /**
     * 부품마스터 정보를 등록한다.
     * @param itemMasterVO - 등록할 정보가 담긴 ItemMasterVO
     * @return 등록된 목록수
     */
    public int insertItemMaster(ItemMasterVO itemMasterVO);

    /**
     * 부품마스터 정보를 수정한다.
     * @param itemMasterVO - 수정할 정보가 담긴 ItemMasterVO
     * @return 수정된 목록수
     */
    public int updateItemMaster(ItemMasterVO itemMasterVO);

    /**
     * 액셀 부품마스터 정보를 추가한다.
     * @param itemMasterExcelVO - 수정할 정보가 담긴 ItemMasterExcelVO
     * @return 수정된 목록수
     */
    public int insertItemMasterExcel(ItemMasterExcelVO itemMasterExcelVO);

    /**
     * 액셀 부품마스터 정보를 수정한다.
     * @param itemMasterExcelVO - 수정할 정보가 담긴 ItemMasterExcelVO
     * @return 수정된 목록수
     */
    public int updateItemMasterExcel(ItemMasterExcelVO itemMasterExcelVO);

    /**
     * 부품마스터 의 최종입고일자를 수정한다.
     * @param itemMasterVO - 수정할 정보가 담긴 ItemMasterVO
     * @return 수정된 목록수
     */
    public int updateLastGrDt(ItemMasterVO itemMasterVO);

    /**
     * 부품마스터 의 최종입고단가를 수정한다.
     * @param itemMasterVO - 수정할 정보가 담긴 ItemMasterVO
     * @return 수정된 목록수
     */
    public int updateLastGrAmt(ItemMasterVO itemMasterVO);

    /**
     * 부품마스터 의 로케이션정보를 수정한다.
     * @param itemMasterVO - 수정할 정보가 담긴 ItemMasterVO
     * @return 수정된 목록수
     */
    public int updateItemLocCdMaster(ItemMasterVO itemMasterVO);

    /**
     * 부품마스터 로케이션 정보를 수정한다.
     * @param itemMasterVO - 수정할 정보가 담긴 ItemMasterVO
     * @return 수정된 목록수
     */
    public int updateLocCd(ItemMasterVO itemMasterVO);

    /**
     * 부품마스터의 최종입고일자를 취소한다.
     * @param itemMasterVO - 수정할 정보가 담긴 ItemMasterVO
     * @return 수정된 목록수
     */
    public int cancelLastGrDt(ItemMasterVO itemMasterVO);

    /**
     * 부품마스터 의 최종출고일자를 수정한다.
     * @param itemMasterVO - 수정할 정보가 담긴 ItemMasterVO
     * @return 수정된 목록수
     */
    public int updateLastGiDt(ItemMasterVO itemMasterVO);

    /**
     * 부품마스터의 최종출고일자를 취소한다.
     * @param itemMasterVO - 수정할 정보가 담긴 ItemMasterVO
     * @return 수정된 목록수
     */
    public int cancelLastGiDt(ItemMasterVO itemMasterVO);

    /**
     * 부품마스터 정보를 삭제한다.
     * @param itemMasterVO - 삭제할 정보가 담긴 ItemMasterVO
     * @return 삭제된 목록수
     */
    public int deleteItemMaster(ItemMasterVO itemMasterVO);

    /**
     * 부품마스터(로컬) 정보를 삭제한다.
     * @param itemMasterVO - 삭제할 정보가 담긴 ItemMasterVO
     * @return 삭제된 목록수
     */
    public int deleteLocalItemMaster(ItemMasterVO itemMasterVO);


    /**
     * 부품 패키지 헤더 변경에 따른 부품 마스터 정보를 수정한다.(브랜드 및 품목 명칭만)
     * @param itemMasterVO - 수정할 정보가 담긴 ItemMasterVO
     * @return 수정된 목록수
     */
    public int updateItemByPackage(ItemMasterVO itemMasterVO);

    /**
     * Key에 해당하는 부품마스터 정보를 조회한다.
     * @param cntryCd - 부품마스터(2자리)
     * @param langCd - 언어코드
     * @return 조회한 부품마스터 정보
     */
    public ItemMasterVO selectItemMasterByKey(ItemMasterSearchVO itemMasterSearchVO);

    /**
     * Key에 해당하는 부품마스터 정보(모바일용)를 조회한다.
     * @param cntryCd - 부품마스터(2자리)
     * @param langCd - 언어코드
     * @return 조회한 부품마스터 정보
     */
    public ItemMasterVO selectMobileItemMasterByKey(ItemMasterSearchVO itemMasterSearchVO);

    /**
     * 조회 조건에 해당하는 부품마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> selectItemMastersByCondition(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 부품마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> selectPopItemMastersByCondition(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 통용부품마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> selectComItemMastersByCondition(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 부품마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterExcelDownVO> selectItemMastersExcelDownByCondition(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 부품마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectItemMastersByConditionCnt(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 부품마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectPopItemMastersByConditionCnt(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 통용부품정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectComItemMastersByConditionCnt(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 품목팝업 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> selectItemPopupByCondition(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 품목팝업 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectItemPopupByConditionCnt(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 품목팝업 정보(판매단가용)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> selectItemSalePrcPopupByCondition(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 품목팝업(판매단가용) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectItemSalePrcPopupByConditionCnt(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 품목팝업 정보(서비스 단일부품 보증단가)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> selectItemGrtePrcPopupByCondition(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 품목팝업 정보(서비스 단일부품 보증단가)를 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectItemGrtePrcPopupByConditionCnt(ItemMasterSearchVO searchVO);



    /**
     * 조회 조건에 해당하는 품목팝업 정보(서비스 판매단가용)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> selectItemSalePrcForServicePopupByCondition(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 품목팝업(서비스 판매단가용) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectItemSalePrcForServicePopupByConditionCnt(ItemMasterSearchVO searchVO);

    /**
     * 부품번호에 해당하는 품목(구매단가) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public ItemMasterVO selectPurcPrcItemByKey(ItemMasterSearchVO searchVO);

    /**
     * 부품번호에 해당하는 품목(구매단가) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectPurcPrcItemByKeyCnt(ItemMasterSearchVO searchVO);

    /**
     * 부품번호에 해당하는 품목(판매단가용)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public ItemMasterVO selectSalePrcItemByKey(ItemMasterSearchVO searchVO);

    /**
     * 부품번호에 해당하는 품목(판매단가용) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectSalePrcItemByKeyCnt(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 검색용 품목팝업 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> selectSearchItemPopupByCondition(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 검색용 품목팝업 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectSearchItemPopupByConditionCnt(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 검색용 품목팝업 정보를 조회한다.(기술자문)
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> selectSearchItemPopupByQnACondition(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 검색용 품목팝업 총 갯수를 조회한다.(기술자문)
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectSearchItemPopupByQnAConditionCnt(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 BMP&딜러 재고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> selectInventoryInfoByCondition(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 BMP&딜러 재고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectInventoryInfoByConditionCnt(ItemMasterSearchVO searchVO);

    /**
     * 부품코드 query를 포함하는 목록을 조회한다.
     * @param sText 조회 텍스트
     * @param maxRows 최대 목록 수
     * @return
     */
    //public List<ItemMasterVO> selectPurcPrcItemsForSuggest(@Param("sText") String sText, @Param("maxRows") int maxRows);
    public List<ItemMasterVO> selectPurcPrcItemsForSuggest(ItemMasterSearchVO searchVO);

    /**
     * 부품코드 query를 포함하는 목록을 조회한다.(정비수령전용)
     * @param sText 조회 텍스트
     * @param maxRows 최대 목록 수
     * @return
     */
    public List<ItemMasterVO> selectSalePrcItemsForSuggest(ItemMasterSearchVO searchVO);

    /**
     * key in한 부품번호에 해당하는 목록을 조회한다.(정비수령전용)
     * @param sText 조회 텍스트
     * @param maxRows 최대 목록 수
     * @return
     */
    public List<ItemMasterVO> selectIssueReqItemSalePrcByKeyIn(ItemMasterSearchVO searchVO);


    /**
     * 부품번호의 기준 창고를 조회한다.
     * @param StockInOutSearchVO searchVO
     * @return 조회한 창고코드
     */
    public String selectStandardStrgeCdByItemCd(ItemMasterSearchVO searchVO);

    /**
     * 부품번호의 수정일시를 조회한다.
     * @param ItemMasterVO itemMasterVO
     * @return 조회한 수정일시
     */
    public String selectItemMasterUpdtDtByKey(ItemMasterVO itemMasterVO);
    
    /**
     * 借进登记入库修改弹出配件选择窗口 add by lyy 2018-09-07
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> selectReceiveEtcBorrowByCondition(ItemMasterSearchVO searchVO);
    
    /**
     * 借进登记入库修改弹出配件选择窗口 add by lyy 2018-09-07
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectReceiveEtcBorrowByConditionCnt(ItemMasterSearchVO searchVO);

}
