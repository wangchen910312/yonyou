package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.par.pmm.vo.ItemMasterExcelDownVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterExcelVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterPackageSaveVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSaveVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterVO;

/**
 * 부품마스터 관리 서비스
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

public interface ItemMasterService {

    /**
     * 부품마스터 정보를 등록한다.
     * @param itemMasterVO - 등록할 정보가 담긴 ItemMasterVO
     * @return 등록된 목록수
     */
    public int insertItemMaster(ItemMasterVO itemMasterVO)  throws Exception;

    /**
     * 부품마스터 정보 추가 및 패키지정보를 추가 한다.
     * @param itemMasterSaveVO - 등록할 정보가 담긴 ItemMasterSaveVO
     * @return 등록된 목록수
     */
    public int insertItemMaster(ItemMasterSaveVO itemMasterSaveVO)  throws Exception;

    /**
     * 부품마스터 정보를 수정한다.
     * @param itemMasterVO - 수정할 정보가 담긴 ItemMasterVO
     * @return 수정된 목록수
     */
    public int updateItemMaster(ItemMasterVO itemMasterVO) throws Exception;

    /**
     * 부품마스터 정보를 수정 및 부품유형정보를 등록/수정 한다.
     * @param itemMasterVO - 수정할 정보가 담긴 ItemMasterVO
     * @return 수정된 목록수
     */
    public int updateItemMaster(ItemMasterSaveVO itemMasterSaveVO) throws Exception;

    /**
     * 부품마스터 정보를 수정 및 부품유형정보를 등록/수정 한다.
     * @param itemMasterVO - 수정할 정보가 담긴 ItemMasterVO
     * @return 수정된 목록수
     */
    public int updateItemLocCdMaster(ItemMasterVO itemMasterVO) throws Exception;

    /**
     * 부품마스터 정보를 삭제한다.
     * @param itemMasterVO - 삭제할 정보가 담긴 ItemMasterVO
     * @return 삭제된 목록수
     */
    public int deleteItemMaster(ItemMasterVO itemMasterVO) throws Exception;

    /**
     * 부품마스터(로컬) 정보를 삭제한다.
     * @param itemMasterVO - 삭제할 정보가 담긴 ItemMasterVO
     * @return 삭제된 목록수
     */
    public int deleteLocalItemMaster(ItemMasterVO itemMasterVO) throws Exception;

    /**
     * 부품 패키지 헤더 변경에 따른 부품 마스터 정보를 수정한다.(브랜드 및 품목 명칭만)
     * @param itemMasterVO - 수정할 정보가 담긴 ItemMasterVO
     * @return 수정된 목록수
     */
    public int updateItemByPackage(ItemMasterVO itemMasterVO) throws Exception;

    /**
     * Key에 해당하는 부품마스터 정보를 조회한다.
     * @param cntryCd - 부품마스터(2자리)
     * @param langCd - 언어코드
     * @return 조회한 부품마스터 정보
     */
    public ItemMasterVO selectItemMasterByKey(ItemMasterSearchVO itemMasterSearchVO) throws Exception;

    /**
     * Key에 해당하는 부품마스터 정보(모바일용)를 조회한다.
     * @param cntryCd - 부품마스터(2자리)
     * @param langCd - 언어코드
     * @return 조회한 부품마스터 정보
     */
    public ItemMasterVO selectMobileItemMasterByKey(ItemMasterSearchVO itemMasterSearchVO) throws Exception;


    /**
     * 부품마스터 정보를 등록/수정/삭제 처리한다.
     * @param itemMasterSaveVO
     */
	//public void multiItemMasters(BaseSaveVO<itemMasterVO> itemMasterSaveVO);

	/**
     * 조회 조건에 해당하는 부품마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
	public List<ItemMasterVO> selectItemMastersByCondition(ItemMasterSearchVO searchVO) throws Exception;

	/**
	 * 조회 조건에 해당하는 부품마스터 정보를 조회한다.
	 * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
	 * @return 조회 목록
	 */
	public List<ItemMasterVO> selectPopItemMastersByCondition(ItemMasterSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 통용부품정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> selectComItemMastersByCondition(ItemMasterSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 부품마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterExcelDownVO> selectItemMastersExcelDownByCondition(ItemMasterSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 부품마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
	public int selectItemMastersByConditionCnt(ItemMasterSearchVO searchVO) throws Exception;

	/**
	 * 조회 조건에 해당하는 부품마스터 총 갯수를 조회한다.
	 * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
	 * @return
	 */
	public int selectPopItemMastersByConditionCnt(ItemMasterSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 통용부품마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectComItemMastersByConditionCnt(ItemMasterSearchVO searchVO) throws Exception;

	/**
	 * 조회 조건에 해당하는 품목팝업 정보를 조회한다.
	 * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
	 * @return 조회 목록
	 */
	public List<ItemMasterVO> selectItemPopupByCondition(ItemMasterSearchVO searchVO) throws Exception;

	/**
	 * 조회 조건에 해당하는 품목팝업 총 갯수를 조회한다.
	 * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
	 * @return
	 */
	public int selectItemPopupByConditionCnt(ItemMasterSearchVO searchVO) throws Exception;

	/**
	 * 조회 조건에 해당하는 품목팝업 정보(판매단가용)를 조회한다.
	 * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
	 * @return 조회 목록
	 */
	public List<ItemMasterVO> selectItemSalePrcPopupByCondition(ItemMasterSearchVO searchVO) throws Exception;

	/**
	 * 조회 조건에 해당하는 품목팝업(판매단가용) 총 갯수를 조회한다.
	 * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
	 * @return
	 */
	public int selectItemSalePrcPopupByConditionCnt(ItemMasterSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 품목팝업 정보(서비스 단일부품 보증단가)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> selectItemGrtePrcPopupByCondition(ItemMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 품목팝업(서비스 단일부품 보증단가) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectItemGrtePrcPopupByConditionCnt(ItemMasterSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 품목팝업 정보(서비스 판매단가용)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> selectItemSalePrcForServicePopupByCondition(ItemMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 품목팝업(서비스 판매단가용) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectItemSalePrcForServicePopupByConditionCnt(ItemMasterSearchVO searchVO) throws Exception;

	/**
	 * 조회 조건에 해당하는 검색용 품목팝업 정보를 조회한다.
	 * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
	 * @return 조회 목록
	 */
	public List<ItemMasterVO> selectSearchItemPopupByCondition(ItemMasterSearchVO searchVO) throws Exception;

	/**
	 * 조회 조건에 해당하는 검색용 품목팝업 총 갯수를 조회한다.
	 * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
	 * @return
	 */
	public int selectSearchItemPopupByConditionCnt(ItemMasterSearchVO searchVO) throws Exception;

	 /**
     * 조회 조건에 해당하는 검색용 품목팝업 정보를 조회한다.(기술자문)
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> selectSearchItemPopupByQnACondition(ItemMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 검색용 품목팝업 총 갯수를 조회한다.(기술자문)
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectSearchItemPopupByQnAConditionCnt(ItemMasterSearchVO searchVO) throws Exception;

	/**
     * 부품번호에 해당하는 품목(구매단가) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public ItemMasterVO selectPurcPrcItemByKey(ItemMasterSearchVO searchVO) throws Exception;

    /**
     * 부품번호에 해당하는 품목(구매단가) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectPurcPrcItemByKeyCnt(ItemMasterSearchVO searchVO) throws Exception;

    /**
     * 부품번호에 해당하는 품목(판매단가용)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public ItemMasterVO selectSalePrcItemByKey(ItemMasterSearchVO searchVO) throws Exception;

    /**
     * 부품번호에 해당하는 품목(판매단가용) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectSalePrcItemByKeyCnt(ItemMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 BMP&딜러 재고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> selectInventoryInfoByCondition(ItemMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 BMP&딜러 재고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectInventoryInfoByConditionCnt(ItemMasterSearchVO searchVO) throws Exception;

    /**
     * 부품마스터 패키지정보 패키지 헤더 정보를 및  추가 한다.
     * @param itemMasterPackageSaveVO - 등록할 정보가 담긴 ItemMasterPackageSaveVO
     * @return 등록된 목록수
     */
    public int insertItemMaster(ItemMasterPackageSaveVO itemMasterPackageSaveVO)  throws Exception;

    /**
     * 부품마스터 패키지정보 패키지 헤더 정보를 및  수정 한다.
     * @param itemMasterSaveVO - 수정할 정보가 담긴 ItemMasterSaveVO
     * @return 수정된 목록수
     */
    public int updateItemMaster(ItemMasterPackageSaveVO itemMasterPackageSaveVO) throws Exception;

    /**
     * 부품코드  query를 포함하는 목록을 조회한다.(구매단가용)
     * @param query 조회 텍스트
     * @param maxRows 최대 목록 수
     * @return
     */
    //public List<ItemMasterVO> selectPurcPrcItemsForSuggest(String query, int maxRows) throws Exception;
    public List<ItemMasterVO> selectPurcPrcItemsForSuggest(ItemMasterSearchVO searchVO) throws Exception;

    /**
     * 부품코드 query를 포함하는 목록을 조회한다.(정비수령전용)
     * @param sText 조회 텍스트
     * @param maxRows 최대 목록 수
     * @return
     */
    public List<ItemMasterVO> selectSalePrcItemsForSuggest(ItemMasterSearchVO searchVO) throws Exception;

    /**
     * key in한 부품번호에 해당하는 목록을 조회한다.(정비수령전용)
     * @param sText 조회 텍스트
     * @param maxRows 최대 목록 수
     * @return
     */
    public List<ItemMasterVO> selectIssueReqItemSalePrcByKeyIn(ItemMasterSearchVO searchVO) throws Exception;

    /**
     * 액셀 부품마스터 정보를 등록/수정/삭제 처리한다.
     * @param itemMasterSaveVO
     */
    public void multiItemMasterExcelData(List<ItemMasterExcelVO> itemMasterExcelList);


    /**
     * 부품번호의 기준 창고를 조회한다.
     * @param ItemMasterSearchVO searchVO
     * @return 조회한 창고코드
     */
    public String selectStandardStrgeCdByItemCd(ItemMasterSearchVO searchVO) throws Exception;

    /**
	 * 借进登记入库修改弹出配件选择窗口 add by lyy 2018-09-07
	 * @param searchVO - ItemMasterSearchVO
	 * @return 조회 목록
	 */
	public List<ItemMasterVO> selectReceiveEtcBorrowByCondition(ItemMasterSearchVO searchVO) throws Exception;

	/**
	 * 借进登记入库修改弹出配件选择窗口 add by lyy 2018-09-07
	 * @param searchVO - ItemMasterSearchVO
	 * @return
	 */
	public int selectReceiveEtcBorrowByConditionCnt(ItemMasterSearchVO searchVO) throws Exception;

}
