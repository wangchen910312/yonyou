package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.pmm.vo.ItemMasterSendSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSendVO;

/**
 * 품목마스터 전송 정보에 관한 데이터처리 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 5. 27.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.27         In Bo Shim            최초 생성
 * </pre>
 */

@Mapper("itemMasterSendDAO")
public interface ItemMasterSendDAO {

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
     * Key에 해당하는 품목마스터 전송 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회한 품목마스터 전송 정보
     */
    public ItemMasterSendVO selectItemMasterSendByKey(ItemMasterSendSearchVO itemMasterSendSearchVO) throws Exception;

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
