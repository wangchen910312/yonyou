package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocSearchVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;

/**
 * 품목마스터 관리 서비스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 7.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.07         Ju Won Lee            최초 생성
 * </pre>
 */

public interface MvtDocService {

    public List<MvtDocItemVO> multiSaveMvtDocs(MvtDocVO mvtVO, List<MvtDocItemVO> list)  throws Exception;

    public List<MvtDocItemVO> multiCnclMvtDocs(MvtDocVO mvtVO, List<MvtDocItemVO> list)  throws Exception;

    public String selectNextMvtDocNo() throws Exception;

    /**
     * 취소 수불 정보를 원수불정보에 반영한다.
     * @param MvtDocItemVO - 수정할 정보가 담긴 MvtDocItemVO
     * @return 수정된 목록수
     */
    public int updateMvtDocInfoByCancel(MvtDocItemVO mvtDocItemVO) throws Exception;


    /**
     * 참조번호에 해당하는 수불문서품목 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param refDocNo - 참조번호
     * @param refDocLineNo - 참조라인번호
     * @param mvtDocNo - 수불문서
     * @return 조회한 수불문서품목 정보
     */
    public MvtDocItemVO selectMvtDocItemByRefInfo(String dlrCd, String refDocNo, int refDocLineNo, String mvtDocNo, String debitCreditDstinCd) throws Exception;

    /**
     * 참조판매문서번호에 해당하는 수불문서품목 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param refDocNo - 참조번호
     * @param refDocLineNo - 참조라인번호
     * @return 조회한 수불문서품목 정보
     */
    public MvtDocItemVO selectMvtDocItemByDocRefInfo(@Param("dlrCd") String dlrCd, @Param("refDocNo") String refDocNo, @Param("refDocLineNo") int refDocLineNo, @Param("mvtDocNo") String mvtDocNo, @Param("debitCreditDstinCd") String  debitCreditDstinCd) throws Exception;


    /**
     * 조회 조건에 해당하는 입출고현황(입고) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public List<MvtDocItemVO> selectGrList(MvtDocSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 입출고현황(입고) Count 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public int selectGrListCnt(MvtDocSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 입출고현황(입고) Count 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public int selectGrListForDeleteCnt(MvtDocSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 입출고현황(출고) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public List<MvtDocItemVO> selectGiList(MvtDocSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 입출고현황(출고) Count 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public int selectGiListCnt(MvtDocSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 입출고현황(출고) Count 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public int selectGiListForDeleteCnt(MvtDocSearchVO searchVO) throws Exception;

    /**
     * 부품번호에 해당하는 입출고요약 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public List<MvtDocItemVO> selectGrGiSummaryByItemCd(MvtDocSearchVO searchVO) throws Exception;

    /**
     * 부품번호에 해당하는 입출고요약 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public MvtDocVO selectGrGiSummary(MvtDocSearchVO searchVO) throws Exception;

    /**
     * 입고금액 소계정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public MvtDocVO selectPartsGrCostSummary(MvtDocSearchVO searchVO) throws Exception;

    /**
     * 출고금액 소계정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public MvtDocVO selectPartsGiCostSummary(MvtDocSearchVO searchVO) throws Exception;

    /**
     * 부품판매금액 소계정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public MvtDocVO selectPartsSaleCostSummary(MvtDocSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 수불문서품목 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param mdocYm - 수불년월
     * @param mdocNo - 수불번호
     * @param mdocLineNo - 수불라인번호
     * @return 조회한 수불문서품목 정보
     */
    public MvtDocItemVO selectMvtDocItem(String dlrCd, String mdocYm, String mdocNo, int mdocLineNo);

}
