package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSendSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSendVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ItemMasterSendService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 5. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 27.     In Bo Shim     최초 생성
 * </pre>
 */

public interface ItemMasterSendService {

    /**
     * 품목마스터 전송 정보를 등록한다.
     * @param itemMasterVO - 등록할 정보가 담긴 ItemMasterSendVO
     * @return 등록된 목록수
     */
    public int insertItemMasterSend(ItemMasterSendVO itemMasterVO)  throws Exception;

    /**
     * 품목마스터 전송 정보를 수정한다.
     * @param itemMasterVO - 수정할 정보가 담긴 ItemMasterSendVO
     * @return 수정된 목록수
     */
    public int updateItemMasterSend(ItemMasterSendVO itemMasterVO) throws Exception;

    /**
     * 품목마스터 전송 정보를 삭제한다.
     * @param itemMasterVO - 삭제할 정보가 담긴 ItemMasterSendVO
     * @return 삭제된 목록수
     */
    public int deleteItemMasterSend(ItemMasterSendVO itemMasterVO) throws Exception;

    /**
     * 품목마스터 전송 정보를 등록/수정/삭제
     * @param itemMasterVO - 삭제할 정보가 담긴 ItemMasterSendVO
     * @return 등록/수정/삭제 목록 수
     */
    public void multiItemMasterSend(BaseSaveVO<ItemMasterSendVO> itemMasterSendVO) throws Exception;

    /**
     * 품목마스터 재고 전송 정보를 등록/수정/삭제
     * @param itemMasterVO - 삭제할 정보가 담긴 ItemMasterSendVO
     * @return 등록/수정/삭제 목록 수
     */
    public void multiItemMasterStockSend(BaseSaveVO<ItemMasterSendVO> itemMasterSendVO) throws Exception;

    /**
     * Key에 해당하는 품목마스터 전송 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회한 품목마스터 전송 정보
     */
    public ItemMasterSendVO selectItemMasterSendByKey(ItemMasterSendSearchVO itemMasterSearchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 품목마스터 전송 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterSendVO> selectItemMasterSendsByCondition(ItemMasterSendSearchVO itemMasterSendSearchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 품목마스터 전송 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectItemMasterSendsByConditionCnt(ItemMasterSendSearchVO itemMasterSendSearchVO) throws Exception;
}
