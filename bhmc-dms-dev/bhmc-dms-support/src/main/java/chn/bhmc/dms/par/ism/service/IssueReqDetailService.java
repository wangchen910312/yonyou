package chn.bhmc.dms.par.ism.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailBorrowSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailResvSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqRoItemDelVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;
import chn.bhmc.dms.ser.rev.vo.PartReservationVO;
import chn.bhmc.dms.ser.rev.vo.ReservationReceiptVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;

/**
 * 부품요청상세 서비스
 *
 * @author In Bo Shim
 * @since 2016. 2. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 15.     In Bo Shim      최초 생성
 * </pre>
 */

public interface IssueReqDetailService {

    /**
     * RO 부품요청상세 정보를 등록한다.
     * @param issueReqDetailDetailVO 등록할 정보가 담긴 IssueReqDetailVO
     * @return 등록된 목록수
     */
    public int insertIssueReqDetailRo(IssueReqDetailVO issueReqDetailVO) throws Exception;

    /**
     * 부품예유 부품요청상세 정보를 등록한다.
     * @param issueReqDetailDetailVO 등록할 정보가 담긴 IssueReqDetailVO
     * @return 등록된 목록수
     */
    public int insertIssueReqDetailReady(IssueReqDetailVO issueReqDetailVO) throws Exception;

    /**
     * 정비RO 부품요청상세 최대 부품요청상세번호를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqDetailsMaxNumByConditionCnt(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 부품요청상세 정보를 등록한다.
     * @param issueReqDetailDetailVO 등록할 정보가 담긴 IssueReqDetailVO
     * @return 등록된 목록수
     */
    public int insertIssueReqDetail(IssueReqDetailVO issueReqDetailVO) throws Exception;

    /**
     * 차용정보를 출고요청정보로 등록한다.
     * @param issueReqDetailBorrowSaveVO 등록할 정보가 담긴 IssueReqDetailBorrowSaveVO
     * @return 등록된 IssuePartsOutSaveVO
     */
    public IssueReqDetailBorrowSaveVO insertIssueReqDetailBorrow(IssueReqDetailBorrowSaveVO issueReqDetailBorrowSaveVO) throws Exception;

    /**
     * 부품예약정보를 출고요청정보로 등록한다.
     * @param issueReqDetailResvSaveVO 등록할 정보가 담긴 IssueReqDetailResvSaveVO
     * @param mvtActYn 수불실행여부
     * @return 등록된 IssueReqDetailResvSaveVO
     */
    public IssueReqDetailResvSaveVO insertIssueReqDetailResv(IssueReqDetailResvSaveVO issueReqDetailResvSaveVO, boolean mvtActYn) throws Exception;

    /**
     * 출고요청정보 확정 후 부품예약(재고이동) 수불취소 처리한다.
     * @param issueReqDetailBorrowSaveVO 등록할 정보가 담긴 IssueReqDetailBorrowSaveVO
     */
    public void cancelIssueReqDetailResv(IssueReqDetailVO issueReqDetailVO) throws Exception;

    /**
     * 부품요청상세 정보를 수정한다.
     * @param issueReqDetailDetailVO - 수정할 정보가 담긴 IssueReqDetailVO
     * @return 수정된 목록수
     */
    public int updateIssueReqDetail(IssueReqDetailVO issueReqDetailVO) throws Exception;

    /**
     * RO번호 기준 부품요청상세 예류상태 정보 예류로 수정한다.
     * @param issueReqDetailDetailVO - 수정할 정보가 담긴 IssueReqDetailVO
     * @return 수정된 목록수
     */
    public int updateIssueReqDetailReadyStatusReturn(IssueReqDetailVO issueReqDetailVO) throws Exception;

    /**
     * 부품요청상세 정보를 삭제한다.
     * @param issueReqDetailVO - 삭제할 정보가 담긴 IssueReqDetailVO
     * @return 삭제된 목록수
     */
    public int deleteIssueReqDetail(IssueReqDetailVO issueReqDetailVO) throws Exception;

    /**
     * 부품요청상세 정보를 등록/수정/삭제 처리한다.
     * @param issueReqDetailSaveVO
     */
    public void multiIssueReqDetails(BaseSaveVO<IssueReqDetailVO> issueReqDetailSaveVO) throws Exception;

    /**
     * 기타출고(내부유용) 상세정보를 등록/수정/삭제 처리한다.
     * @param issueReqDetailSaveVO
     */
    public IssueReqSaveVO multiIssueReqInnerDetails(IssueReqDetailSaveVO issueReqDetailSaveVO) throws Exception;

    /**
     * 부품요청상세 정보를 등록/수정/삭제 처리한다.
     * @param issueReqDetailSaveVO
     */
    public void multiIssueReqDetails(IssueReqDetailSaveVO issueReqDetailSaveVO) throws Exception;

    /**
     * 부품예류상세 정보를 등록/수정/삭제 처리한다.
     * @param issueReqDetailSaveVO
     * @param mvtActYn 수불실행여부
     */
    public void multiIssueResvReadyDetails(IssueReqDetailSaveVO issueReqDetailSaveVO, boolean mvtActYn) throws Exception;

    /**
     * 정비예약등록 부품예류상세 정보를 취소 처리한다.
     * @param reservationReceiptVO
     */
    public void cancelIssueResvReadyDetails(ReservationReceiptVO reservationReceiptVO) throws Exception;

    /**
     * 정비부품예약 부품예류상세 정보를 취소 처리한다.
     * @param partReservationVO
     */
    public void cancelIssueResvReadyDetails(PartReservationVO partReservationVO) throws Exception;

    /**
     * 정비 예약등록 부품예류상세 요청 정보를 취소 처리한다.
     * @param partReservationVO
     */
    public void cancelIssueResvReadyStatus(ReservationReceiptVO reservationReceiptVO) throws Exception;

    /**
     * 정비 부품예약 부품예류상세 요청 정보를 취소 처리한다.
     * @param partReservationVO
     */
    public void cancelIssueResvReadyStatus(PartReservationVO partReservationVO) throws Exception;


    /**
     * 기타예류상세 정보를 등록/수정/삭제 처리한다.
     * @param issueReqDetailSaveVO
     */
    public void multiIssueOtherReadyDetails(IssueReqDetailSaveVO issueReqDetailSaveVO) throws Exception;

    /**
     * 부품차용상세 정보를 등록/수정/삭제 처리한다.
     * @param issueReqDetailSaveVO
     */
    public void multiIssueReqBorrowDetails(IssueReqDetailSaveVO issueReqDetailSaveVO) throws Exception;

    /**
     * Key에 해당하는 부품요청상세 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 부품요청상세 정보
     */
    public IssueReqDetailVO selectIssueReqDetailByKey(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 정비 예약,부품예약번호 기준 구매요청상세 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 부품요청상세 정보
     */
    public List<IssueReqDetailVO> selectIssueReqDetailSrSpItemList(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 정비 RO번호 기준 구매요청상세 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 부품요청상세 정보
     */
    public List<IssueReqDetailVO> selectIssueReqDetailRoItemList(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 정비수령 부품요청상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqDetailVO> selectIssueReqDetailsByCondition(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 정비수령집계 부품요청상세 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqDetailStatusByConditionCnt(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 정비수령집계 부품요청상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqDetailVO> selectIssueReqDetailStatusByCondition(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 정비수령 부품요청상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqDetailVO> selectIssueReqInnerDetailsByCondition(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품요청상세 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqDetailsByConditionCnt(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품요청상세 총 갯수를 조회한다.(부품삭제위한)
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqDetailsByConditionForItemDeleteCnt(IssueReqSearchVO searchVO) throws Exception;



    /**
     * 조회 조건에 해당하는 부품별 정비수령 부품요청상세 완료수량 소계정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqRoItemDelVO> selectIssueReqItemsEndQtySumDetailsByCondition(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 정비수령 부품요청상세 완료/반품 계산 수량정보를 조회.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public IssueReqDetailVO selectIssueReqDetailMaxEndQty(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품요청상세 프린트 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectPrintIssueReqDetailsByConditionCnt(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 정비수령 부품요청상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqDetailVO> selectPrintIssueReqDetailsByCondition(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 부품요청헤더 해당하는 정비 RO 가격 정보를 조회한다.
     * @param issueReqVO - 조회 조건을 포함하는 IssueReqVO
     */
    public void calculateIssueReqDetailsPriceInfo(IssueReqVO issueReqVO, RepairOrderVO repairOrderVO) throws Exception;

    /**
     * 부품출고헤더 해당하는 정비 RO 가격 정보를 조회한다.
     * @param issueReqVO - 조회 조건을 포함하는 IssueReqVO
     */
    public void calculateIssueReqDetailsPriceInfo(IssuePartsOutVO issuePartsOutVO, RepairOrderVO repairOrderVO) throws Exception;

    /**
     * 입출고예정정보 요청 추가.
     * @param issueReqDetailVO - 조회 조건을 포함하는 IssueReqDetailVO
     */
    public void createGrGiScheduleRequest(IssueReqDetailVO issueReqDetailVO) throws Exception;

    /**
     * 입출고예정정보 반환 추가.
     * @param issueReqDetailVO - 조회 조건을 포함하는 IssueReqDetailVO
     */
    public void createGrGiScheduleReturn(IssueReqDetailVO issueReqDetailVO) throws Exception;

    /**
     * 입출고예정정보 완료 추가.
     * @param issueReqDetailVO - 조회 조건을 포함하는 IssueReqDetailVO
     */
    public void createGrGiScheduleEnd(IssueReqDetailVO issueReqDetailVO) throws Exception;

    /**
     * 부품요청상세 차용상태정보를 수정한다.
     * @return 수정된 목록수
     */
    public int updateCancelIssueDetailBorrowStatus(String dlrCd , String parReqDocNo, int parReqDocLineNo, String itemCd , String borrowDocNo, String borrowStatCd);

    /**
     * 정비차용상태 변경.
     * @param issueReqVO - 조회 조건을 포함하는 IssueReqVO
     */
    public void updateBorrowStatCdIssueReqHeader(String parReqDocNo) throws Exception;

    /**
     * 부품요청상세 가격체크 리스트.
     * @param searchVO - 부품요청상세검색 VO
     * @return 조회한 부품요청상세 가격 정보
     */
    public List<IssueReqDetailVO> selectIssueReqDetailItemPriceCheckList(IssueReqSearchVO searchVO) throws Exception;

}
