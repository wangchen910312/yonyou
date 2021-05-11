package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.pmm.vo.ComItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ComItemMasterVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterVO;

/**
 * <pre>
 * 공용품목마스터 관리 서비스
 * </pre>
 *
 * @ClassName   : ComItemMasterService.java
 * @author Eun Jung Jang
 * @since 2016. 5. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 16.     Eun Jung Jang     최초 생성
 * </pre>
 */

public interface ComItemMasterService {

    /**
     * Key에 해당하는 공용부품마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ComItemMasterVO> comItemMasterByKey(ComItemMasterSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 공용부품마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return
     */
    public int comItemMasterByKeyCnt(ComItemMasterSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 공용부품마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ComItemMasterVO> comItemMasterByCondition(ComItemMasterSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 공용부품마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return
     */
    public int comItemMasterByConditionCnt(ComItemMasterSearchVO searchVO) throws Exception;


    /**
     * 공용부품마스터 정보를 등록/수정/삭제 처리한다.
     * @param ComItemMasterSaveVO
     */
    public void multiUpdateComItemCd(BaseSaveVO<ComItemMasterVO> ComItemMasterSaveVO) throws Exception;

    /**
     * 조회조건에 해당하는 공용부품마스터 재고정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> comItemMasterStockByCondition(ItemMasterSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 공용부품마스터 재고기준 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return
     */
    public int comItemMasterStockByConditionCnt(ItemMasterSearchVO searchVO) throws Exception;

}
