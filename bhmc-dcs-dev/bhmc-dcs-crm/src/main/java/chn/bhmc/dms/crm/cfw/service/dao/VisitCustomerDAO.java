package chn.bhmc.dms.crm.cfw.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cfw.vo.VisitCustomerSearchVO;
import chn.bhmc.dms.crm.cfw.vo.VisitCustomerVO;

/**
 * 내방 예약에 관한 데이터처리 매퍼 클래스
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

@Mapper("visitCustomerDAO")
public interface VisitCustomerDAO {

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

    /**
     * 내방 예약 정보를 등록한다.
     * @param visitCustomerVO - 등록할 정보가 담긴 VisitCustomerVO
     * @return 등록된 목록수
     */
    public int insertVisitCustomer(VisitCustomerVO visitCustomerVO) throws Exception;

    /**
     * 내방 예약 정보를 수정한다.
     * @param visitCustomerVO - 수정할 정보가 담긴 VisitCustomerVO
     * @return 수정된 목록수
     */
    public int updateVisitCustomer(VisitCustomerVO visitCustomerVO) throws Exception;

    /**
     * 내방 예약 정보를 삭제한다.
     * @param visitCustomerVO - 삭제할 정보가 담긴 VisitCustomerVO
     * @return 삭제된 목록수
     */
    public int deleteVisitCustomer(VisitCustomerVO visitCustomerVO) throws Exception;

    /**
     * 내방 예약 관리 정보 저장
     * @param visitCustomerVO - 내방 예약 정보
     * @return 수정된 목록수
     */
    public int updateVisitCustomerMgmt(VisitCustomerVO visitCustomerVO)throws Exception;


    /**
     * 내방 예약 상세 정보를 조회
     * @param VisitCustomerSearchVO - 내방 예약 번호
     * @return 내방 예약 정보
     */
    public VisitCustomerVO selectVisitCustomerMgmtByKey(VisitCustomerSearchVO searchVO)throws Exception;

    /**
     * 내방 정보 수정 ( 고객번호 생성후 수정 )
     * @param saveVO - custNo, vsitNo, dlrCd, pltCd
     */
    public void updateCustNo(VisitCustomerVO saveVO)throws Exception;




}
