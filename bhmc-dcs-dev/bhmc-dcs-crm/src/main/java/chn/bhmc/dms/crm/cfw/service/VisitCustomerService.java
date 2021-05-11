package chn.bhmc.dms.crm.cfw.service;

import java.util.List;

import chn.bhmc.dms.crm.cfw.vo.VisitCustomerSaveVO;
import chn.bhmc.dms.crm.cfw.vo.VisitCustomerSearchVO;
import chn.bhmc.dms.crm.cfw.vo.VisitCustomerVO;

/**
 * 내방 예약 관리 서비스
 *
 * @author in moon lee
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         in moon lee            최초 생성
 * </pre>
 */

public interface VisitCustomerService {

    /**
     * 조회 조건에 해당하는 내방 예약 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VisitCustomerSearchVO
     * @return
     */
    public int selectVisitCustomersByConditionCnt(VisitCustomerSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 내방 예약 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VisitCustomerSearchVO
     * @return 조회 목록
     */
    public List<VisitCustomerVO> selectVisitCustomersByCondition(VisitCustomerSearchVO searchVO) throws Exception;


//
//    /**
//     * 내방 예약 정보를 등록한다.
//     * @param visitCustomerVO - 등록할 정보가 담긴 VisitCustomerVO
//     * @return 등록된 목록수
//     */
//    public int insertVisitCustomer(VisitCustomerVO visitCustomerVO) throws Exception;
//
//    /**
//     * 내방 예약 정보를 수정한다.
//     * @param visitCustomerVO - 수정할 정보가 담긴 VisitCustomerVO
//     * @return 수정된 목록수
//     */
//    public int updateVisitCustomer(VisitCustomerVO visitCustomerVO) throws Exception;
//
//
    /**
     * 내방 예약 정보 저장
     * @param visitCustomerVO - 내방 예약 정보
     * @return 수정된 목록수
     */
    public String multiVisitCustomer(VisitCustomerVO visitCustomerVO) throws Exception;


    /**
     * 내방 예약 관리 정보 저장
     * @param visitCustomerVO - 내방 예약 정보
     * @return 수정된 목록수
     */
    public int updateVisitCustomerMgmt(VisitCustomerVO visitCustomerVO) throws Exception;


    /**
     * 전시장 유동량 관리 결과 정보를 저장 한다.
     * @param visitCustomerVO - 내방 예약 정보
     * @return 수정된 목록수
     */
    public String multiVisitCustomerMgmt(VisitCustomerSaveVO saveVO) throws Exception;

//    /**
//     * 전시장 유동량 관리 정보를 저장 한다.
//     * @param visitCustomerVO - 내방 예약 정보
//     * @return 수정된 목록수
//     */
//    public String multiVisitCustomerMgmt(VisitCustomerSaveVO saveVO) throws Exception;
//

    /**
     * 내방 예약 상세 정보를 조회
     * @param VisitCustomerSearchVO - 내방 예약 번호
     * @return 내방 예약 정보
     */
    public VisitCustomerVO selectVisitCustomerMgmtByKey(VisitCustomerSearchVO searchVO) throws Exception;

    /**
     * 내방 -> 판매기회 이동시 고객 자동등록 프로세스.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    public String customerInfoReg(String vsitNo) throws Exception;



}
