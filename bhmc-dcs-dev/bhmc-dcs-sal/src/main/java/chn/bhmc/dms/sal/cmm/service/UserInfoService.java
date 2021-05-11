package chn.bhmc.dms.sal.cmm.service;

import java.util.List;

import chn.bhmc.dms.sal.cmm.vo.UserInfoVO;

/**
 * 판매 사용자 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface UserInfoService {

    /**
     * 판매사원정보를 조회한다.
     * @param 딜러코드, 직무코드
     * @return 조회 목록
     */
    public List<UserInfoVO> selectUserInfoListsByCndition(String dlrCd, String dutyCd) throws Exception;


}
