package chn.bhmc.dms.sal.ctl.service;

import java.util.List;

import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngSaveVO;
import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngSearchVO;
import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngVO;

/**
 * 마감시간통제 서비스
 *
 * @author Kim yewon
 * @since 2016. 4. 28.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                       수정자                              수정내용
 *  ----------------   ------------    ---------------------------
 *   2016.04.28         Kim yewon            최초 생성
 * </pre>
 */

public interface DeadlineCtrlMngService {


	/**
     * 조회 조건에 해당하는 마감시간통제 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는DeadlineCtrlMngSearchVO
     * @return 조회 목록
     */
	public List<DeadlineCtrlMngVO> selectDeadlineCtrlMngByCondition(DeadlineCtrlMngSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 마감시간통제 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeadlineCtrlMngSearchVO
     * @return
     */
	public int selectDeadlineCtrlMngByConditionCnt(DeadlineCtrlMngSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 마감대상 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는DeadlineCtrlMngSearchVO
     * @return 조회 목록
     */
    public List<DeadlineCtrlMngVO> selectTargetDealerByCondition(DeadlineCtrlMngSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 마감대상 종보목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeadlineCtrlMngSearchVO
     * @return
     */
    public int selectTargetDealerByConditionCnt(DeadlineCtrlMngSearchVO searchVO) throws Exception;


    /**
     * 입력, 수정를 한꺼번에 수행한다.
     *
     * @param saveVO - 입력, 수정 데이터가 포함된 CommonCodeSaveVO
     * @return
     */
    public void multiDeadlineCtrlMng(DeadlineCtrlMngSaveVO saveVO) throws Exception;



    /**
     * 마감시간 정보를 등록한다.
     * @param CommonCodeVO - 등록할 정보가 담긴 CommonCodeVO
     * @return 등록된 목록수
     */
    public int insertDeadlineCtrlMng(DeadlineCtrlMngVO vo) throws Exception;

    /**
     * 마감시간 정보를 수정한다.
     * @param DeadlineCtrlMngVO - 수정할 정보가 담긴 DeadlineCtrlMngVO
     * @return 수정된 목록수
     */
    public int updateDeadlineCtrlMng(DeadlineCtrlMngVO vo) throws Exception;


    /**
     * Key에 해당하는  마감시간 정보를 조회한다.
     * @param DeadlineCtrlMngVO - 통제년월,통제그룹,통제대상
     * @return 조회한 마감시간 정보
     */
    public DeadlineCtrlMngVO selectDeadlineCtrlMngByKey(DeadlineCtrlMngVO vo) throws Exception;




    /**
     * 마감대상딜러정보 입력, 수정를 한꺼번에 수행한다.
     *
     * @param saveVO - 입력, 수정 데이터가 포함된 CommonCodeSaveVO
     * @return
     */
    public void multiTargetDealer(DeadlineCtrlMngSaveVO saveVO) throws Exception;



    /**
     * 마감대상딜러정보 정보를 등록한다.
     * @param CommonCodeVO - 등록할 정보가 담긴 CommonCodeVO
     * @return 등록된 목록수
     */
    public int insertTargetDealer(DeadlineCtrlMngVO vo) throws Exception;

    /**
     * 마감대상딜러정보 정보를 수정한다.
     * @param DeadlineCtrlMngVO - 수정할 정보가 담긴 DeadlineCtrlMngVO
     * @return 수정된 목록수
     */
    public int updateTargetDealer(DeadlineCtrlMngVO vo) throws Exception;


    /**
     * Key에 해당하는  마감대상딜러정보를 조회한다.
     * @param DeadlineCtrlMngVO - 통제년월,통제그룹,통제대상,딜러코드
     * @return 조회한 마감시간 정보
     */
    public DeadlineCtrlMngVO selectTargetDealerByKey(DeadlineCtrlMngVO vo) throws Exception;


    /**
     * 마감대상딜러정보 정보를 삭제한다.
     * @param DeadlineCtrlMngVO - 수정할 정보가 담긴 DeadlineCtrlMngVO
     * @return 수정된 목록수
     */
    public int deleteTargetDealer(DeadlineCtrlMngVO vo) throws Exception;

    /**
     * 마감시간 체크
     * ex) sCtrlGrpCd  :  통제그룹                 A:오더 , B : 소매
     *     sCtrlTargCd :  통제대상(필수)         AS:전략오더, B00:전략수량등록, C01:소매처리
     *     sCtrlDlrCd  :  해당 딜러코드 (필수)
     * @param vo
     * @return
     * @throws Exception
     */
    public int selectDeadLineCheck(DeadlineCtrlMngSearchVO vo) throws Exception;
    public int selectOneShotCheck(DeadlineCtrlMngSearchVO vo) throws Exception;


    /**
     * 마감대상딜러정보 헤더를 인터페이스 테이블에 등록한다.
     * @param CommonCodeVO - 등록할 정보가 담긴 CommonCodeVO
     * @return 등록된 목록수
     */
    public int procDeadlineHeader(DeadlineCtrlMngVO vo) throws Exception;


    /**
     * 마감대상딜러정보 디테일을 인터페이스 테이블에 등록한다.
     * @param CommonCodeVO - 등록할 정보가 담긴 CommonCodeVO
     * @return 등록된 목록수
     */
    public int procDeadlineDetail(DeadlineCtrlMngVO vo) throws Exception;
}
