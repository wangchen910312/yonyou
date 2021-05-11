package chn.bhmc.dms.sal.acc.service;

import java.util.List;

import chn.bhmc.dms.par.pmm.service.ItemMasterService;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemMasterSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AccessoryItemMasterService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 2. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 4.     Kang Seok Han     최초 생성
 * </pre>
 */

public interface AccessoryItemMasterService extends ItemMasterService {

    /**
     * 용품마스터 정보를 등록한다.
     * @param accessoryItemMasterVO - 등록할 정보가 담긴 AccessoryItemMasterVO
     * @return 등록된 목록수
     */
    public int insertAccessoryItemMaster(AccessoryItemMasterVO accessoryItemMasterVO)  throws Exception;

    /**
     * 용품마스터 정보를 수정한다.
     * @param accessoryItemMasterVO - 수정할 정보가 담긴 AccessoryItemMasterVO
     * @return 수정된 목록수
     */
    public int updateAccessoryItemMaster(AccessoryItemMasterVO accessoryItemMasterVO) throws Exception;

    /**
     * 용품마스터 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param itemCd - 품목코드
     * @return
     */
    public AccessoryItemMasterVO selectAccessoryItemMasterByKey(String dlrCd, String itemCd) throws Exception;

    /**
     * 용품마스터 목록을 조회한다.
     * @param searchVO - 조회할 정보가 담긴 AccessoryItemMasterSearchVO
     * @return 조회한 현재고  정보
     */
    public List<AccessoryItemMasterVO> selectAccessoryItemMastersByCondition(AccessoryItemMasterSearchVO searchVO) throws Exception;

    /**
     * 용품마스터 목록수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AccessoryItemMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectAccessoryItemMastersByConditionCnt(AccessoryItemMasterSearchVO searchVO) throws Exception;

    /**
     * VAT 조회한다.
     */
    public String selectVATSearch(String sApplyDate, String sTypeCd) throws Exception;
}
