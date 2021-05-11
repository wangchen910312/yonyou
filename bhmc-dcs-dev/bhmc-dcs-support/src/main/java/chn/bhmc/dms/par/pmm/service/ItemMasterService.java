package chn.bhmc.dms.par.pmm.service;

import java.util.List;

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
     * Key에 해당하는 부품마스터 정보를 조회한다.
     * @param cntryCd - 부품마스터(2자리)
     * @param langCd - 언어코드
     * @return 조회한 부품마스터 정보
     */
    public ItemMasterVO selectItemMasterByKey(ItemMasterSearchVO itemMasterSearchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 부품마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
	public List<ItemMasterVO> selectItemMastersByCondition(ItemMasterSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 부품마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
	public int selectItemMastersByConditionCnt(ItemMasterSearchVO searchVO) throws Exception;

}
