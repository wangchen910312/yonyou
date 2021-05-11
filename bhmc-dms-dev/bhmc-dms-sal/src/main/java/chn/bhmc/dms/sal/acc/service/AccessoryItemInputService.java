package chn.bhmc.dms.sal.acc.service;

import java.util.List;

import chn.bhmc.dms.par.pcm.service.InvcService;
import chn.bhmc.dms.par.pcm.vo.InvcItemVO;
import chn.bhmc.dms.par.pcm.vo.InvcVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemInputSearchVO;

/**
 * 용품입고 관리 서비스
 *
 * @ClassName   : AccessoryItemInputService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 2. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 9.     Kang Seok Han     최초 생성
 * </pre>
 */

public interface AccessoryItemInputService extends InvcService {

    /**
     * 용품입고 문서 목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<InvcVO> selectAccessoryItemInputDocsByCondition(AccessoryItemInputSearchVO searchVO) throws Exception;

    /**
     * 용품입고 문서 목록수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAccessoryItemInputDocsByConditionCnt(AccessoryItemInputSearchVO searchVO) throws Exception;

    /**
     * 용품입고 품목을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<InvcItemVO> selectAccessoryItemInputItemsByCondition(AccessoryItemInputSearchVO searchVO) throws Exception;

    /**
     * 용품입고 품목수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAccessoryItemInputItemsByConditionCnt(AccessoryItemInputSearchVO searchVO) throws Exception;
}
