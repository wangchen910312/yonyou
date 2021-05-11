package chn.bhmc.dms.par.pcm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.pcm.vo.PurcOrdItemVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdVO;

/**
 * 구매오더 데이타 매퍼 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Ju Won Lee     최초 생성
 * </pre>
 */
@Mapper("purcOrdDAO")
public interface PurcOrdDAO {

    /**
     * 구매오더 정보를 등록한다.
     * @param purcOrdVO - 등록할 정보가 담긴 PurcOrdVO
     * @return 등록된 목록수
     */
    public int insertPurcOrd(PurcOrdVO purcOrdVO);

    /**
     * 구매오더 부품 정보를 등록한다.
     * @param purcOrdVO - 등록할 정보가 담긴 PurcOrdItemVO
     * @return 등록된 목록수
     */
    public int insertPurcOrdItem(PurcOrdItemVO purcOrdItemVO);

    /**
     * 구매오더 반품 부품 정보를 등록한다.(로컬부품)
     * @param purcOrdVO - 등록할 정보가 담긴 PurcOrdItemVO
     * @return 등록된 목록수
     */
    public int insertReturnPurcOrdItem(PurcOrdItemVO purcOrdItemVO);

    /**
     * 구매오더 반품 부품 정보를 수정한다.(로컬부품)
     * @param purcOrdVO - 수정할 정보가 담긴 PurcOrdItemVO
     * @return 수정된 목록수
     */
    public int updateReturnPurcOrdItem(PurcOrdItemVO purcOrdItemVO);

    /**
     * 구매오더 반품 부품 정보를 삭제한다.(로컬부품)
     * @param purcOrdVO - 삭제할 정보가 담긴 PurcOrdItemVO
     * @return 삭제된 목록수
     */
    public int deleteReturnPurcOrdItem(PurcOrdItemVO purcOrdItemVO);


    /**
     * 구매오더 정보를 수정한다.
     * @param purcOrdVO - 수정할 정보가 담긴 PurcOrdVO
     * @return 수정된 목록수
     */
    public int updatePurcOrd(PurcOrdVO purcOrdVO);


    /**
     * 구매오더 부품 정보를 수정한다.
     * @param purcOrdVO - 등록할 정보가 담긴 PurcOrdItemVO
     * @return 수정된 목록수
     */
    public int updatePurcOrdItem(PurcOrdItemVO purcOrdItemVO);


    /**
     * 구매오더 정보를 전송한다.
     * @param purcOrdVO - 전송할 정보가 담긴 PurcOrdVO
     * @return 전송된 목록수
     */
    public int sendPurcOrd(PurcOrdVO purcOrdVO);

    /**
     * 구매오더 부품 정보를 전송한다.(딜러정보와 구매오더정보만으로 한번에 Update)
     * @param purcOrdVO - 전송할 정보가 담긴 PurcOrdVO
     * @return 전송된 목록수
     */
    public int sendPurcOrdItem(PurcOrdVO purcOrdVO);

    /**
     * 구매오더 정보를 취소한다.
     * @param purcOrdVO - 전송할 정보가 담긴 PurcOrdVO
     * @return 취소된 목록수
     */
    public int cancelPurcOrd(PurcOrdVO purcOrdVO);

    /**
     * 구매오더 부품 정보를 삭제한다.
     * @param purcOrdVO - 전송할 정보가 담긴 PurcOrdItemVO
     * @return 삭제된 목록수
     */
    public int deletePurcOrdItem(PurcOrdItemVO purcOrdItemVO);

    /**
     * 구매오더  정보를 확정한다.(로컬업체 대상)
     * @param purcOrdVO - 취소할 정보가 담긴 PurcOrdVO
     * @return 확정된 목록수
     */
    public int confirmPurcOrd(PurcOrdVO purcOrdVO);

    /**
     * 구매오더  품목 정보를 확정한다.(로컬업체 대상)
     * @param purcOrdVO - 취소할 정보가 담긴 PurcOrdVO
     * @return 확정된 목록수
     */
    public int confirmPurcOrdItem(PurcOrdVO purcOrdVO);

    /**
     * 송장등록 시구매오더   정보를 완료한다.(로컬업체 대상)
     * @param purcOrdVO - 완료할 정보가 담긴 PurcOrdVO
     * @return 확정된 목록수
     */
    public int invcRegLocalPurcOrd(PurcOrdVO purcOrdVO);

    /**
     * 송장등록 시구매오더  품목 정보를 완료한다.(로컬업체 대상)
     * @param purcOrdVO - 완료할 정보가 담긴 PurcOrdVO
     * @return 확정된 목록수
     */
    public int invcRegLocalPurcOrdItem(PurcOrdVO purcOrdVO);

    /**
     * Key에 해당하는 구매오더 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param lvlId - 레벨ID
     * @return 조회한 구매오더 정보
     */
    public PurcOrdVO selectPurcOrdByKey(PurcOrdSearchVO purcOrdSearchVO);

    /**
     * Key에 해당하는 구매오더 서머리 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param lvlId - 레벨ID
     * @return 조회한 구매오더 정보
     */
    public PurcOrdVO selectPurcOrdSummaryByKey(PurcOrdSearchVO purcOrdSearchVO);

    /**
     * Key에 해당하는 구매오더 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectPurcOrdItemByKey(PurcOrdSearchVO purcOrdSearchVO);

    /**
     * Key에 해당하는 반품구매오더 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectReturnPurcOrdItemByKey(PurcOrdSearchVO purcOrdSearchVO);

    /**
     * Key에 해당하는 업로드 등록용 구매오더 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdItemVO
     * @return 조회한 구매오더 부품정보
     */
    public PurcOrdItemVO selectPurcOrdItemExcelUploadByKey(PurcOrdItemVO purcOrdItemVO);

    /**
     * 구매오더 정보에 해당하는 구매오더 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdItemVO
     * @return 조회한 구매오더 부품정보
     */
    public PurcOrdItemVO selectItemInfoByPurcOrderInfo(PurcOrdItemVO purcOrdItemVO);

    /**
     * 조회 조건에 해당하는 구매오더 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdVO> selectPurcOrdsByCondition(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매오더 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcOrdsByConditionCnt(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매오더부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdVO> selectPurcOrdItemCondition(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매오더부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcOrdItemConditionCnt(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 반품구매오더부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectReturnPurcOrdItemCondition(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 반품구매오더부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectReturnPurcOrdItemConditionCnt(PurcOrdSearchVO searchVO);

    /**
     * 구매번호에 해당하는 구매라인 Max값을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcOrdMaxLineNo(PurcOrdVO purcOrdVO);

    /**
     * 구매번호에 해당하는 총구매금액을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public double selectPurcOrdTotPurcAmt(PurcOrdVO purcOrdVO);

    /**
     * 구매번호에 해당하는 총구매(세금불포함)금액을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public double selectPurcOrdTotTaxDdctAmt(PurcOrdVO purcOrdVO);

    /**
     * 조회 조건에 해당하는 구매오더부품 정보를 조회한다.(송장등록을 위한)
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectInvcItemsByCondition(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매오더 총 갯수를 조회한다.(송장등록을 위한)
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectInvcItemsByConditionCnt(PurcOrdSearchVO searchVO);

    /**
     * 입고확정 시구매오더 부품 정보를 수정한다.
     * @param purcOrdItemVO - 등록할 정보가 담긴 PurcOrdItemVO
     * @return 수정된 목록수
     */
    public int updatePurcOrdCnfmItemByReceive(PurcOrdItemVO purcOrdItemVO);

    /**
     * 입고확정 시구매오더 부품 정보를 수정한다.(구매오더 확정 == 입고 확정 수량 시)
     * @param purcOrdItemVO - 등록할 정보가 담긴 PurcOrdItemVO
     * @return 수정된 목록수
     */
    public int updatePurcOrdCnfmEndItemByReceive(PurcOrdItemVO purcOrdItemVO);

    /**
     * 조회 조건에 해당하는 구매현황 데이타 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectPurcOrdStatusByCondition(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매현황 데이타 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcOrdStatusByConditionCnt(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 B/O 데이타 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectPurcOrdStatusListSummary(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매현황 데이타 정보를 조회한다.(구매현황용)
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectPurcOrdStatusByConditionForPurcOrdSummary(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매현황 데이타 총 갯수를 조회한다.(구매현황용)
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcOrdStatusByConditionForPurcOrdSummaryCnt(PurcOrdSearchVO searchVO);

    /**
     * 부품구매Key에 해당하는 수정일자  정보를 조회한다.
     * @param purcOrdVO - 조회할 정보가 담긴 PurcOrdVO
     * @return 조회한 부품구매의 정보
     */
    public String selectPurcOrdUpdtDtByKey(PurcOrdVO purcOrdVO);

    /**
     * 조회 조건에 해당하는 구매오더  총 갯수를 조회한다.(모바일)
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectMobilePurcOrdsByConditionCnt(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매상태 데이타 SUMMARY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectPurcOrdStatusSummary(PurcOrdSearchVO searchVO);

    /**
     * 合格证申请修改弹出配件选择窗口 add by lyy 2018-09-07
     * @param searchVO - PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectPurcOrdByCondition(PurcOrdSearchVO searchVO);

    /**
     * 合格证申请修改弹出配件选择窗口 add by lyy 2018-09-07
     * @param searchVO - PurcOrdSearchVO
     * @return
     */
    public int selectPurcOrdByConditionCnt(PurcOrdSearchVO searchVO);

}
