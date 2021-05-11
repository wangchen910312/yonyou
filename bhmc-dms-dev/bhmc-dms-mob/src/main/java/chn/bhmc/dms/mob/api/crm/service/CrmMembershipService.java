package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.MembershipSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.MembershipVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipService.java
 * @Description : 멤버십 서비스
 * @author Kim Hyun Ho
 * @since 2016. 3. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 22.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public interface CrmMembershipService {


    /**
     * 멤버십 등록된 목록수 조회
     * [20170603] 사용처 - [CRM:고객상세, 멤버십관리, 멤버십양도/양수등록 팝업], [판매:용품판매관리], [모바일:고객상세]
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return 조회 목록
     */
    public int selectMembershipsByConditionCnt(MembershipSearchVO searchVO) throws Exception;

    /**
     * 멤버십 등록된 목록 조회
     * [20170603] 사용처 - [CRM:고객상세, 멤버십관리, 멤버십양도/양수등록 팝업], [판매:용품판매관리], [모바일:고객상세]
     * sListTarget :  T:멤버십양도양수팝업, 양도,양수에서는 sum데이터(금액 등) 을 볼필요가 없으므로 파라미터 받아서 분기처리
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return 조회 목록
     */
    public List<MembershipVO> selectMembershipsByCondition(MembershipSearchVO searchVO) throws Exception;

}