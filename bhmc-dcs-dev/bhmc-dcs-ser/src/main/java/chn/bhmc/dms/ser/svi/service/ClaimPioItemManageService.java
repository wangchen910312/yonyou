package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.ser.svi.vo.ClaimPioItemSaveVO;
import chn.bhmc.dms.ser.svi.vo.ClaimPioItemSearchVO;
import chn.bhmc.dms.ser.svi.vo.ClaimPioItemVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimPioItemManageService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 1.     Kwon ki hyun     최초 생성
 * </pre>
 */

public interface ClaimPioItemManageService {

    /**
    *
    * PIO 부품 정보를 저장/수정한다.
    *
    * @param saveVO
    * @return
    * @throws Exception
    */
    public boolean mulitClaimPioItemMange(ClaimPioItemSaveVO saveVO)throws Exception;



    /**
     *
     * PIO 부품 목록수
     *
     * @param claimPioItemVO
     * @return
     * @throws Exception
     */
    public int selectClaimPioItemManageByConditionCnt(ClaimPioItemSearchVO searchVO)throws Exception;


    /**
     *
     * PIO 부품 목록
     *
     * @param claimPioItemVO
     * @return
     * @throws Exception
     */
    public List<ClaimPioItemVO> selectClaimPioItemManageByCondition(ClaimPioItemSearchVO searchVO)throws Exception;




}
