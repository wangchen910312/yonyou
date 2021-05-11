package chn.bhmc.dms.par.ism.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqRoItemDelVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;

/**
 * 부품요청 상세 데이타 매퍼 클래스
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

@Mapper("issueReqDetailDAO")
public interface IssueReqDetailDAO {

    /**
     * RO에서 전달된 부품요청상세 정보를 등록한다.
     * @param issueReqDetail - 등록할 정보가 담긴 IssueReqDetail
     * @return 등록된 목록수
     */
    public int insertIssueReqDetailRo(IssueReqDetailVO issueReqDetailVO);

    /**
     * 부품예류에서 전달된 부품요청상세 정보를 등록한다.
     * @param issueReqDetail - 등록할 정보가 담긴 IssueReqDetail
     * @return 등록된 목록수
     */
    public int insertIssueReqDetailReady(IssueReqDetailVO issueReqDetailVO);

    /**
     * 정비RO 부품요청상세 최대 부품요청상세번호를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqDetailsMaxNumByConditionCnt(IssueReqSearchVO searchVO);

    /**
     * 부품요청상세 정보를 등록한다.
     * @param issueReqDetail - 등록할 정보가 담긴 IssueReqDetail
     * @return 등록된 목록수
     */
    public int insertIssueReqDetail(IssueReqDetailVO issueReqDetailVO);

    /**
     * 부품요청상세 정보를 수정한다.
     * @param issueReqDetail - 수정할 정보가 담긴 IssueReqDetail
     * @return 수정된 목록수
     */
    public int updateIssueReqDetail(IssueReqDetailVO issueReqDetailVO);

    /**
     * RO번호 기준 부품요청상세 예류상태 정보 예류로 수정한다.
     * @param issueReqDetail - 수정할 정보가 담긴 IssueReqDetail
     * @return 수정된 목록수
     */
    public int updateIssueReqDetailReadyStatusReturn(IssueReqDetailVO issueReqDetailVO);

    /**
     * 부품요청상세 예류정보를 수정한다.
     * @param issueReqDetail - 수정할 정보가 담긴 IssueReqDetail
     * @return 수정된 목록수
     */
    public int updateIssueReqDetailReady(IssueReqDetailVO issueReqDetailVO);

    /**
     * 정비수령 차용 부품이동 시 부품요청상세 정보를 수정한다.
     * @param issueReqDetail - 수정할 정보가 담긴 IssueReqDetail
     * @return 수정된 목록수
     */
    public int updateIssueReqDetailBorrow(IssueReqDetailVO issueReqDetailVO);

    /**
     * 부품요청상세 정보를 삭제한다.
     * @param issueReqDetail - 삭제할 정보가 담긴 IssueReqDetail
     * @return 삭제된 목록수
     */
    public int deleteIssueReqDetail(IssueReqDetailVO issueReqDetailVO);

    /**
     * 부품요청상세 기타예류정보를 삭제한다.
     * @param issueReqDetail - 삭제할 정보가 담긴 IssueReqDetail
     * @return 삭제된 목록수
     */
    public int deleteIssueReqDetailOtherReady(IssueReqDetailVO issueReqDetailVO);

    /**
     * 부품요청상세 차용정보를 삭제한다.
     * @param issueReqDetail - 삭제할 정보가 담긴 IssueReqDetail
     * @return 삭제된 목록수
     */
    public int deleteIssueReqDetailBorrow(IssueReqDetailVO issueReqDetailVO);

    /**
     * 부품요청상세 예류상태정보를 수정한다.
     * @return 수정된 목록수
     */
    public int updateCancelIssueResvReadyStatus(@Param("dlrCd") String dlrCd , @Param("resvDocNo") String resvDocNo , @Param("readyStatCd") String readyStatCd);

    /**
     * 부품요청상세 차용상태정보를 수정한다.
     * @return 수정된 목록수
     */
    public int updateCancelIssueDetailBorrowStatus(@Param("dlrCd") String dlrCd , @Param("parReqDocNo") String parReqDocNo, @Param("parReqDocLineNo") int parReqDocLineNo, @Param("itemCd") String itemCd , @Param("borrowDocNo") String borrowDocNo, @Param("borrowStatCd") String borrowStatCd);

    /**
     * Key에 해당하는 부품요청상세 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 부품요청상세 정보
     */
    public IssueReqDetailVO selectIssueReqDetailByKey(@Param("dlrCd") String dlrCd , @Param("dbItemCd") String dbItemCd, @Param("parReqDocNo") String parReqDocNo, @Param("parReqDocLineNo") int parReqDocLineNo, @Param("parReqStatCd") String parReqStatCd, @Param("roDocNo") String roDocNo, @Param("roDocLineNo") int roDocLineNo, @Param("resvDocNo") String resvDocNo, @Param("resvDocLineNo") int resvDocLineNo, @Param("minParReqDocLineNoYn") String minParReqDocLineNoYn);

    /**
     * 정비 예약,부품예약번호 기준 구매요청상세 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 부품요청상세 리스트 정보
     */
    public List<IssueReqDetailVO> selectIssueReqDetailSrSpItemList(@Param("dlrCd") String dlrCd , @Param("dbItemCd") String dbItemCd, @Param("roDocNo") String roDocNo, @Param("roDocLineNo") int roDocLineNo, @Param("parGiTp") String parGiTp);

    /**
     * 정비 RO번호 기준 구매요청상세 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 부품요청상세 리스트 정보
     */
    public List<IssueReqDetailVO> selectIssueReqDetailRoItemList(@Param("dlrCd") String dlrCd , @Param("dbItemCd") String dbItemCd, @Param("roDocNo") String roDocNo, @Param("roDocLineNo") int roDocLineNo, @Param("parGiTp") String parGiTp);

    /**
     * 조회 조건에 해당하는 정비수령 부품요청상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqDetailVO> selectIssueReqDetailsByCondition(IssueReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 정비수령집계 부품요청상세 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqDetailStatusByConditionCnt(IssueReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 정비수령집계 부품요청상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqDetailVO> selectIssueReqDetailStatusByCondition(IssueReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 내부수령 부품요청상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqDetailVO> selectIssueReqInnerDetailsByCondition(IssueReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 정비수령 부품요청상세 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqDetailsByConditionCnt(IssueReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 정비수령 부품요청상세 총 갯수를 조회한다.(부품 삭제 위한)
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqDetailsByConditionForItemDeleteCnt(IssueReqSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 정비수령 부품요청상세 프린트 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqDetailVO> selectPrintIssueReqDetailsByCondition(IssueReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 정비수령 부품요청상세 프린트 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectPrintIssueReqDetailsByConditionCnt(IssueReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 부품별 정비수령 부품요청상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqDetailVO> selectIssueReqItemsGroupDetailsByCondition(IssueReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 정비수령 부품요청상세 등록/완료 부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqItemsGroupDetailsByConditionCnt(IssueReqSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 부품별 정비수령 부품요청상세 완료수량 소계정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqRoItemDelVO> selectIssueReqItemsEndQtySumDetailsByCondition(IssueReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 삭제 할 부품별 정비수령 부품요청상세 완료수량 소계정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqRoItemDelVO> selectIssueReqItemsEndQtySumDetailsRoByCondition(IssueReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 부품별 정비수령 부품요청상세 완료정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqDetailVO> selectIssueReqItemsGroupEndQtyDetailsByCondition(IssueReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 정비수령 부품요청상세 완료/반품 계산 수량정보를 조회.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public IssueReqDetailVO selectIssueReqDetailMaxEndQty(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 부품요청상세 가격체크 리스트.
     * @param searchVO - 부품요청상세검색 VO
     * @return 조회한 부품요청상세 가격 정보
     */
    public List<IssueReqDetailVO> selectIssueReqDetailItemPriceCheckList(IssueReqSearchVO searchVO) throws Exception;


}
