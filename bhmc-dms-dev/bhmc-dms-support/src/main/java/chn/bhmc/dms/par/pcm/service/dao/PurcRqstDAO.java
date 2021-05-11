package chn.bhmc.dms.par.pcm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.pcm.vo.PurcRqstSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcRqstVO;

/**
 * 구매요청 데이타 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 29.     In Bo Shim     최초 생성
 * </pre>
 */
@Mapper("purcRqstDAO")
public interface PurcRqstDAO {

    /**
     * 구매요청 정보를 등록한다.
     * @param purcRqstVO - 등록할 정보가 담긴 PurcRqstVO
     * @return 등록된 목록수
     */
    public int insertPurcRqst(PurcRqstVO purcRqstVO);

    /**
     * 구매요청 정보를 수정한다.
     * @param purcRqstVO - 수정할 정보가 담긴 PurcRqstVO
     * @return 수정된 목록수
     */
    public int updatePurcRqst(PurcRqstVO purcRqstVO);

    /**
     * 부품요청 호출 시 구매요청 정보를 수정한다.
     * @param purcRqstVO - 수정할 정보가 담긴 PurcRqstVO
     * @return 수정된 목록수
     */
    public int updateIssueReqDetailPurcRqst(PurcRqstVO purcRqstVO);

    /**
     * 구매요청에 대한 구매오더 시 구매요청 정보를 수정한다.
     * @param purcRqstVO - 수정할 정보가 담긴 PurcRqstVO
     * @return 수정된 목록수
     */
    public int updatePurcRqstCnfm(PurcRqstVO purcRqstVO);

    /**
     * 구매입고확정 시 구매요청 정보를 수정한다.(문자 수신 완료여부)
     * @param searchVO - 수정할 정보가 담긴 PurcRqstSearchVO
     * @return 수정된 목록수
     */
    public int updatePurcRqstByReceiveCnfm(PurcRqstSearchVO searchVO);

    /**
     * 구매요청 정보를 삭제한다.
     * @param purcRqstVO - 삭제할 정보가 담긴 PurcRqstVO
     * @return 삭제된 목록수
     */
    public int deletePurcRqst(PurcRqstVO purcRqstVO);

    /**
     * Key에 해당하는 구매요청 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param lvlId - 레벨ID
     * @return 조회한 구매요청 정보
     */
    public PurcRqstVO selectPurcRqstByKey(@Param("dlrCd") String dlrCd, @Param("purcReqNo") String purcReqNo, @Param("refDocNo") String refDocNo, @Param("strgeCd") String strgeCd, @Param("itemCd") String itemCd);

    /**
     * 조회 조건에 해당하는 구매요청 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcRqstSearchVO
     * @return 조회 목록
     */
    public List<PurcRqstVO> selectPurcRqstesByCondition(PurcRqstSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매요청 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcRqstSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcRqstesByConditionCnt(PurcRqstSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매요청 팝업 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcRqstSearchVO
     * @return 조회 목록
     */
    public List<PurcRqstVO> selectPurcReqsPopByCondition(PurcRqstSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매요청 팝업 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcRqstSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcReqsPopByConditionCnt(PurcRqstSearchVO searchVO);

    /**
     * 입고확정에 대한 문자 수신 여부 수정할 구매요청자 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcRqstSearchVO
     * @return 조회 목록
     */
    public List<PurcRqstVO> selectPurcReqUsersByConditionForSms(PurcRqstSearchVO searchVO);

    /**
     * 입고확정에 대한 문자 수신 여부 수정할 구매요청 카운트를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcRqstSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcReqItemsByConditionForSmsCnt(PurcRqstSearchVO searchVO);


}
