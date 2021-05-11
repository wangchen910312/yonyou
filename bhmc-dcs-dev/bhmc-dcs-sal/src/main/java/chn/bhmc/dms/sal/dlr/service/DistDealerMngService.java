package chn.bhmc.dms.sal.dlr.service;

import java.util.List;

import chn.bhmc.dms.sal.dlr.vo.DistDealerSaveVO;
import chn.bhmc.dms.sal.dlr.vo.DistDealerSearchVO;
import chn.bhmc.dms.sal.dlr.vo.DistDealerVO;

/**
 * 지역딜러(사무소)관리 서비스
 *
 * @author Kim yewon
 * @since 2016. 5. 25.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                       수정자                              수정내용
 *  ----------------   ------------    ---------------------------
 *   2016. 05. 25.      Kim yewon            최초 생성
 * </pre>
 */

public interface DistDealerMngService {


	/**
     * 조회 조건에 해당하는 지역딜러(사무소)관리 - 사무소 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DistDealerSearchVO
     * @return 조회 목록
     */
	public List<DistDealerVO> selectDistDealerMngByCondition(DistDealerSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 지역딜러(사무소)관리 - 사무소 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DistDealerSearchVO
     * @return
     */
	public int selectDistDealerMngByConditionCnt(DistDealerSearchVO searchVO) throws Exception;


	/**
     * 조회 조건에 해당하는 지역딜러(사무소)관리 - 딜러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DistDealerSearchVO
     * @return 조회 목록
     */
    public List<DistDealerVO> selectDealerByCondition(DistDealerSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 지역딜러(사무소)관리 - 딜러 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DistDealerSearchVO
     * @return
     */
    public int selectDealerByConditionCnt(DistDealerSearchVO searchVO) throws Exception;


    //지역딜러 저장
    public void saveDistDealer(DistDealerSaveVO VO) throws Exception;

}
