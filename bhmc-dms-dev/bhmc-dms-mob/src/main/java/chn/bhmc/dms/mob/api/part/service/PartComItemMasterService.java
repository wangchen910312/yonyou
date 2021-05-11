package chn.bhmc.dms.mob.api.part.service;

import java.util.List;

import chn.bhmc.dms.mob.api.part.vo.ComItemMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.ComItemMasterVO;


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

public interface PartComItemMasterService {

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

   
}
