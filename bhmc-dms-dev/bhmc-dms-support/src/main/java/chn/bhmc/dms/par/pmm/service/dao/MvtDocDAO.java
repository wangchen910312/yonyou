package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocSearchVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;

/**
 * 수불유형 데이타 매퍼 클래스
 *
 * @author 이 주원
 * @since 2016. 1. 6.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 6.     In Bo Shim      최초 생성
 * </pre>
 */

@Mapper("mvtDocDAO")
public interface MvtDocDAO {

    /**
     * 수불헤더 정보를 등록한다.
     * @param mvtDocVO - 등록할 정보가 담긴 MvtDocVO
     * @return 등록된 목록수
     */
    public int insertMvtDoc(MvtDocVO mvtDocVO);

    /**
     * 수불아이템 정보를 등록한다.
     * @param mvtDocVO - 등록할 정보가 담긴 MvtDocVO
     * @return 등록된 목록수
     */
    public int insertMvtDocItem(MvtDocItemVO mvtDocItemVO);

    /**
     * 수불유형 정보를 수정한다.
     * @param mvtDocVO - 수정할 정보가 담긴 MvtDocVO
     * @return 수정된 목록수
     */
    public int updateMvtDoc(MvtDocVO mvtDocVO);

    /**
     * 수불유형 정보를 삭제한다.
     * @param mvtDocVO - 삭제할 정보가 담긴 MvtDocVO
     * @return 삭제된 목록수
     */
    public int deleteMvtDoc(MvtDocVO mvtDocVO);

    /**
     * 취소 수불 정보를 원수불정보에 반영한다.
     * @param MvtDocItemVO - 수정할 정보가 담긴 MvtDocItemVO
     * @return 수정된 목록수
     */
    public int updateMvtDocInfoByCancel(MvtDocItemVO mvtDocItemVO);

    /**
     * Key에 해당하는 수불문서헤더 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param mdocYm - 수불년월
     * @param mdocNo - 수불번호
     * @return 조회한 수불문서헤더 정보
     */
    public MvtDocVO selectMvtDocByKey(@Param("dlrCd") String dlrCd, @Param("mdocYm") String mdocYm, @Param("mdocNo") String mdocNo);

    /**
     * Key에 해당하는 수불문서품목 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param mdocYm - 수불년월
     * @param mdocNo - 수불번호
     * @param mdocLineNo - 수불라인번호
     * @return 조회한 수불문서품목 정보
     */
    public MvtDocItemVO selectMvtDocItem(@Param("dlrCd") String dlrCd, @Param("mvtDocYyMm") String mdocYm, @Param("mvtDocNo") String mdocNo, @Param("mvtDocLineNo") int mdocLineNo);

    /**
     * 참조번호에 해당하는 수불문서품목 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param refDocNo - 참조번호
     * @param refDocLineNo - 참조라인번호
     * @return 조회한 수불문서품목 정보
     */
    public MvtDocItemVO selectMvtDocItemByRefInfo(@Param("dlrCd") String dlrCd, @Param("refDocNo") String refDocNo, @Param("refDocLineNo") int refDocLineNo);

    /**
     * 참조판매문서번호에 해당하는 수불문서품목 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param refDocNo - 참조번호
     * @param refDocLineNo - 참조라인번호
     * @return 조회한 수불문서품목 정보
     */
    public MvtDocItemVO selectMvtDocItemByDocRefInfo(@Param("dlrCd") String dlrCd, @Param("refDocNo") String refDocNo, @Param("refDocLineNo") int refDocLineNo, @Param("mvtDocNo") String mvtDocNo, @Param("debitCreditDstinCd") String  debitCreditDstinCd);

    /**
     * 조회 조건에 해당하는 입출고현황(입고) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public List<MvtDocItemVO> selectGrList(MvtDocSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 입출고현황(입고) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public List<MvtDocItemVO> selectGrExcelList(MvtDocSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 입출고현황(입고) Count 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public int selectGrListCnt(MvtDocSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 입출고현황(입고) Count 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public int selectGrListForDeleteCnt(MvtDocSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 입출고현황(출고) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public List<MvtDocItemVO> selectGiList(MvtDocSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 입출고현황(출고) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public List<MvtDocItemVO> selectGiExcelList(MvtDocSearchVO searchVO);

    /**
     * 부품번호에 해당하는 입출고요약 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public List<MvtDocItemVO> selectGrGiSummaryByItemCd(MvtDocSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 입출고현황(출고) Count 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public int selectGiListCnt(MvtDocSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 입출고현황(출고) Count 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public int selectGiListForDeleteCnt(MvtDocSearchVO searchVO);

    /**
     * 부품번호에 해당하는 입출고요약 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public MvtDocVO selectGrGiSummary(MvtDocSearchVO searchVO);

    /**
     * 부품번호에 해당하는 수불발생 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MvtDocSearchVO
     * @return 조회 목록
     */
    public int selectGrGiListCntByItemCd(@Param("dlrCd") String dlrCd, @Param("itemCd") String itemCd);

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



}
