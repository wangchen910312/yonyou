package chn.bhmc.dms.par.pmm.service;

import chn.bhmc.dms.par.pmm.vo.DealerInfoSearchVO;
import chn.bhmc.dms.par.pmm.vo.DealerInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DealerInfoService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Hyeong Gyun
 * @since 2017. 7. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 7. 28.    Lee Hyeong Gyun    최초 생성
 * </pre>
 */

public interface DealerInfoService {

    /**
     * 조회조건에 해당하는 딜러정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerInfoSearchVO
     * @return 조회 목록
     */
    public int selectDealerInfoListCnt(DealerInfoSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 딜러정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerInfoSearchVO
     * @return 조회 목록
     */
    public DealerInfoVO selectDealerInfoList(DealerInfoSearchVO searchVO) throws Exception;

}
