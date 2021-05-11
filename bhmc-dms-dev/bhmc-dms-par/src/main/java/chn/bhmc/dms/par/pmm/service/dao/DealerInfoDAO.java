package chn.bhmc.dms.par.pmm.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.pmm.vo.DealerInfoSearchVO;
import chn.bhmc.dms.par.pmm.vo.DealerInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DealerInfoDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Hyeong Gyun
 * @since 2017. 7. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 7. 28.   Lee Hyeong Gyun     최초 생성
 * </pre>
 */

@Mapper("dealerInfoDAO")
public interface DealerInfoDAO {

    /**
     * 조회조건에 해당하는 딜러정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerInfoSearchVO
     * @return
     */
    public int selectDealerInfoListCnt(DealerInfoSearchVO searchVO)throws Exception;

    /**
     * 조건에 해당하는 딜러정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는  DealerInfoSearchVO
     * @return 조회 목록
     */
    public DealerInfoVO selectDealerInfoList(DealerInfoSearchVO searchVO);

}
