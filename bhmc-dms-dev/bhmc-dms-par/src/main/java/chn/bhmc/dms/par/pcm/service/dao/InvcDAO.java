package chn.bhmc.dms.par.pcm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.par.pcm.vo.InvcExcelVO;
import chn.bhmc.dms.par.pcm.vo.InvcItemVO;
import chn.bhmc.dms.par.pcm.vo.InvcSearchVO;
import chn.bhmc.dms.par.pcm.vo.InvcVO;


/**
 * 송장 데이타 매퍼 클래스
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
@Mapper("invcDAO")
public interface InvcDAO {
    /**
     * 송장 정보를 등록한다.
     * @param invcVO - 등록할 정보가 담긴 invcVO
     * @return 등록된 목록수
     */
    public int insertInvc(InvcVO invcVO);

    /**
     * 송장 부품 정보를 등록한다.
     * @param invcVO - 등록할 정보가 담긴 PurcOrdItemVO
     * @return 등록된 목록수
     */
    public int insertInvcItem(InvcItemVO invcItemVO);

    /**
     * 송장 정보를 수정한다.
     * @param invcVO - 수정할 정보가 담긴 invcVO
     * @return 수정된 목록수
     */
    //public int updateInvc(InvcVO invcVO);


    /**
     * 입고 확정 시 입고 확정 안된 송장 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectInvcsByReceiveCnt(InvcItemVO invcItemVO);


    /**
     * 조회 조건에 해당하는 송장 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcVO> selectInvcsByCondition(InvcSearchVO searchVO);

    /**
     * Key에 해당하는 업로드 등록용 기타입고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcItemVO
     * @return 조회한 기타입고 부품정보
     */
    public InvcItemVO selectInvcReceiveEtcItemExcelUploadByKey(InvcItemVO invcItemVO);

    /**
     * 조회 조건에 해당하는 송장 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectInvcsByConditionCnt(InvcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 입고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcVO> selectReceivesByCondition(InvcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 입고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceivesByConditionCnt(InvcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 입고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcVO> selectReceivesByConditionForPopup(InvcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 입고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceivesByConditionForPopupCnt(InvcSearchVO searchVO);


    /**
     * Key에 해당하는 송장관리 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcItemVO> selectInvcItemByKey(InvcSearchVO invcSearchVO);

    /**
     * 구매Key에 해당하는 송장관리 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcVO> selectInvcItemByPurcKey(InvcSearchVO invcSearchVO);

    /**
     * 송장Key에 해당하는 송장관리 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcItemVO> selectReceiveCnfmItemByInvcKey(InvcSearchVO invcSearchVO);

    /**
     * 기타입고Key에 해당하는 송장관리 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcItemVO> selectReceiveCnfmItemByEtcGrKey(InvcSearchVO invcSearchVO);

    /**
     * Key에 해당하는 송장관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public InvcVO selectInvcByKey(InvcVO invcVO);

    /**
     * 입고확정  SUMMARY 정보를 조회한다.(송장번호로 인한)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public InvcVO selectReceiveCnfmItemSummaryByInvcKey(InvcSearchVO search);
    /**
     * 입고확정  정보를 조회한다.(송장번호로 인한)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public InvcVO selectReceiveCnfmItemSummaryByEtcGrKey(InvcSearchVO search);


    /**
     * 송장  정보를 확정한다.
     * @param purcOrdVO - 수정할 정보가 담긴 InvcVO
     * @return 확정된 목록수
     */
    public int updateInvcCnfm(InvcVO invcVO);

    /**
     * 송장확정 정보를 취소한다.
     * @param purcOrdVO - 취소할 정보가 담긴 InvcVO
     * @return 취소된 목록수
     */
    public int cancelInvcCnfm(InvcVO invcVO);

    /**
     * 송장 정보 아이템을 삭제한다.
     * @param purcOrdVO - 삭제할 정보가 담긴 InvcVO
     * @return 삭제된 목록수
     */
    public int deleteInvcDocItem(InvcVO invcVO);

    /**
     * 송장 정보 헤더를 삭제한다.
     * @param purcOrdVO - 삭제할 정보가 담긴 InvcVO
     * @return 삭제된 목록수
     */
    public int deleteInvcDoc(InvcVO invcVO);

    /**
     * 송장 정보 입고확정한다.
     * @param InvcVO - 확정할 정보가 담긴 InvcVO
     * @return 확정된 목록수
     */
    public int updateReceiveCnfm(InvcVO invcVO);

    /**
     * 송장 정보 입고확정한다.(모바일용)
     * @param InvcVO - 확정할 정보가 담긴 InvcVO
     * @return 확정된 목록수
     * 모바일은 상태가 '02'(송장확정)인 정보를 기준으로 확정한다.
     */
    public int updateReceiveCnfmForMobile(InvcVO invcVO);

    /**
     * 송장 정보 입고등록한다.
     * @param InvcVO - 확정할 정보가 담긴 InvcVO
     * @return 확정된 목록수
     */
    public int updateReceiveRgst(InvcVO invcVO);

    /**
     * 입고 등록시 송장 라인 정보를 수정한다.
     * @param InvcItemVO - 수정할 정보가 담긴 InvcItemVO
     * @return 수정된 목록수
     */
    public int updateReceiveRgstItem(InvcItemVO invcItemVO);

    /**
     * 입고 확정시 송장 라인 정보를 수정한다.
     * @param InvcItemVO - 수정할 정보가 담긴 InvcItemVO
     * @return 수정된 목록수
     */
    public int updateReceiveCnfmItem(InvcItemVO invcItemVO);

    /**
     * 클레임 발생시 송장 라인 정보를 수정한다.
     * @param InvcItemVO - 수정할 정보가 담긴 InvcItemVO
     * @return 수정된 목록수
     */
    public int updateInvcItemByClaim(InvcItemVO invcItemVO);

    /**
     * 입고확정 대상 송장정보를 조회한다.(모바일용)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcVO> selectReceiveByMobile(InvcSearchVO invcSearchVO);


    /**
     * 입고확정 대상 송장정보 Count를 조회한다.(모바일용)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public int selectReceiveByMobileCnt(InvcSearchVO invcSearchVO);

    /**
     * 조회조건에 해당하는 입고확정대상 부품 정보를 조회한다.(모바일 바코드용)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public InvcItemVO selectReceiveItemByInvcItemBarcode(InvcSearchVO invcSearchVO);

    /**
     * 조회조건에 해당하는 입고확정대상 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcItemVO> selectReceiveItemByCondition(InvcSearchVO invcSearchVO);

    /**
     * 조회 조건에 해당하는입고확정대상 부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveItemByConditionCnt(InvcSearchVO searchVO);

    /**
     * 조회조건에 해당하는 클레임대상 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcItemVO> selectClaimItemByCondition(InvcSearchVO invcSearchVO);

    /**
     * 조회 조건에 해당하는 클레임확정대상 부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectClaimItemByConditionCnt(InvcSearchVO searchVO);

    /**
     * 조회조건에 해당하는 입고 현황을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회목록
     */
    public List<InvcItemVO> selectReceiveCnfmListByCondition(InvcSearchVO searchVO);

    /**
     * 조회조건에 해당하는 입고 현황 조회 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회목록 수
     */
    public int selectReceiveCnfmListByConditionCnt(InvcSearchVO searchVO);

    /**
     * 조회조건에 해당하는 부품별 입고 내역 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회목록
     */
    public List<InvcItemVO> selectReceiveHistoryByItemCd(InvcSearchVO searchVO);

    /**
     * 조회조건에 해당하는 부품별 입고 내역 정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회목록 수
     */
    public int selectReceiveHistoryByItemCdCnt(InvcSearchVO searchVO);


    /**
     * 입고번호에 해당하는 입고라인 Max값을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcMaxLineNo(InvcVO invcVO);

    /**
     * 부품송장Key에 해당하는 수정일자  정보를 조회한다.
     * @param invcVO - 조회할 정보가 담긴 InvcVO
     * @return 조회한 부품송장의 정보
     */
    public String selectInvcUpdtDtByKey(InvcVO invcVO);


    /**
     * Key에 해당하는 DMS송장 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public InvcVO selectDmsInvcByKey(InvcSearchVO searchVO);

    /**
     * 조회조건에 해당하는 부품별 입고 대상 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회목록
     */
    public List<InvcItemVO> selectInvcItemByKeyForRgst(InvcSearchVO searchVO);

    /**
     * 조회조건에 해당하는 부품별 입고 대상 정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회목록 수
     */
    public int selectInvcItemByKeyForRgstCnt(InvcSearchVO searchVO);


    /**
     * 
     * @MethodName: selectInvcsByConditionExcel
     * <p>Title: 电子信息查询/待入库清单导出功能</p >
     * @Description: TODO
     * @author wangc
     * @param searchVO
     * @return List<InvcExcelVO>
     * @date 2021-05-13 02:21:15 
     * @param searchVO
     */
    public List<InvcExcelVO> selectInvcsByConditionExcel(InvcSearchVO searchVO);
}
