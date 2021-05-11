package chn.bhmc.dms.sal.ctl.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngSearchVO;
import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeadlineCtrlMngDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 4. 28
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 28      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("deadlineCtrlMngDAO")
public interface DeadlineCtrlMngDAO {

    /**
      * 조회 조건에 해당하는 마감시간통계 정보를 조회한다.
      */
    public List<DeadlineCtrlMngVO> selectDeadlineCtrlMngByCondition(DeadlineCtrlMngSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 마감시간통제 총 갯수를 조회한다.
     */
    public int selectDeadlineCtrlMngByConditionCnt(DeadlineCtrlMngSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 마감대상 정보를 조회한다.
     */
    public List<DeadlineCtrlMngVO> selectTargetDealerByCondition(DeadlineCtrlMngSearchVO searchVO);

   /**
    *  조회 조건에 해당하는 마감대상 총 갯수를 조회한다.
    */
    public int selectTargetDealerByConditionCnt(DeadlineCtrlMngSearchVO searchVO);


    /**
     * 마감시간 정보를 등록한다.
     * @param DeadlineCtrlMngVO - 등록할 정보가 담긴 DeadlineCtrlMngVO
     * @return 등록된 목록수
     */
    public int insertDeadlineCtrlMng(DeadlineCtrlMngVO vo) throws Exception;



    /**
     * 마감시간 정보를 주키로 검색한다.
     * @param DeadlineCtrlMngVO - 등록할 정보가 담긴 DeadlineCtrlMngVO
     * @return 검색된 목록수
     */
    public DeadlineCtrlMngVO selectDeadlineCtrlMngByKey(DeadlineCtrlMngVO vo) throws Exception;



    /**
     * 마감시간 정보를 수정한다.
     * @param DeadlineCtrlMngVO - 등록할 정보가 담긴 DeadlineCtrlMngVO
     * @return 수정된 목록수
     */
    public int updateDeadlineCtrlMng(DeadlineCtrlMngVO codeVO) throws Exception;



    /**
     * 마감대상딜러정보를 등록한다.
     * @param DeadlineCtrlMngVO - 등록할 정보가 담긴 DeadlineCtrlMngVO
     * @return 등록된 목록수
     */
    public int insertTargetDealer(DeadlineCtrlMngVO vo) throws Exception;



    /**
     * 마감대상딜러정보를 주키로 검색한다.
     * @param DeadlineCtrlMngVO - 등록할 정보가 담긴 DeadlineCtrlMngVO
     * @return 검색된 목록수
     */
    public DeadlineCtrlMngVO selectTargetDealerByKey(DeadlineCtrlMngVO vo) throws Exception;



    /**
     * 마감대상딜러정보를 수정한다.
     * @param DeadlineCtrlMngVO - 등록할 정보가 담긴 DeadlineCtrlMngVO
     * @return 수정된 목록수
     */
    public int updateTargetDealer(DeadlineCtrlMngVO codeVO) throws Exception;


    /**
     * 마감대상딜러정보를 삭제한다.
     * @param DeadlineCtrlMngVO - 등록할 정보가 담긴 DeadlineCtrlMngVO
     * @return 수정된 목록수
     */
    public int deleteTargetDealer(DeadlineCtrlMngVO codeVO) throws Exception;


    /**
     * 마감시간 체크
     * ex) sCtrlGrpCd  :  통제그룹                 A:오더 , B : 소매
     *     sCtrlTargCd :  통제대상(필수)         AS:전략오더, B00:전략수량등록, C01:소매처리
     *     sCtrlDlrCd  :  해당 딜러코드 (필수)
     * @param DeadlineCtrlMngSearchVO
     * @return
     * @throws Exception
     */
    public int selectDeadLineCheck(DeadlineCtrlMngSearchVO vo) throws Exception;

    /**
     * 마감시간통제-헤더 인터페이스 저장 프로시져.
     * @param DeadlineCtrlMngVO - 등록할 정보가 담긴 DeadlineCtrlMngVO
     * @return
     */
    public int procDeadlineHeader(DeadlineCtrlMngVO vo) throws Exception;

    /**
     * 마감시간통제-디테일 인터페이스 저장 프로시져.
     * @param DeadlineCtrlMngVO - 등록할 정보가 담긴 DeadlineCtrlMngVO
     * @return
     */
    public int procDeadlineDetail(DeadlineCtrlMngVO vo) throws Exception;

}
