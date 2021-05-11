package chn.bhmc.dms.par.pcm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.ism.vo.IssueEtcItemVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcInitProcedureVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemTrdVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO;

/**
 * 기타입고 데이타 매퍼 클래스
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
@Mapper("receiveEtcDAO")
public interface ReceiveEtcDAO {

    /**
     * 기타입고 정보를 등록한다.
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcVO
     * @return 등록된 목록수
     */
    public int insertReceiveEtc(ReceiveEtcVO receiveEtcVO);

    /**
     * 기타입고 부품 정보를 등록한다.
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcItemVO
     * @return 등록된 목록수
     */
    public int insertReceiveEtcItem(ReceiveEtcItemVO receiveEtcItemVO);

    /**
     * 기타입고 정보를 수정한다.
     * @param receiveEtcVO - 수정할 정보가 담긴 ReceiveEtcVO
     * @return 수정된 목록수
     */
    public int updateReceiveEtc(ReceiveEtcVO receiveEtcVO);

    /**
     * 기타입고 정보 수정일자를 수정한다.
     * @param receiveEtcVO - 수정할 정보가 담긴 ReceiveEtcVO
     * @return 수정된 목록수
     */
    public int updateReceiveEtcUpdtDt(ReceiveEtcVO receiveEtcVO);


    /**
     * 기타입고 부품 정보를 수정한다.
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcItemVO
     * @return 수정된 목록수
     */
    public int updateReceiveEtcItem(ReceiveEtcItemVO receiveEtcItemVO);

    /**
     * 기타입고 부품 정보를 확정한다.
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcItemVO
     * @return 수정된 목록수
     */
    public int updateCnfmReceiveEtcItem(ReceiveEtcItemVO receiveEtcItemVO);

    /**
     * 기타입고 부품 정보를 수정한다.(수불정보)
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcItemVO
     * @return 수정된 목록수
     */
    public int updateReceiveEtcItemMvtInfo(ReceiveEtcItemVO receiveEtcItemVO);

    /**
     * 기타출고 부품 정보를 수정한다.(인터페이스)
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcItemVO
     * @return 수정된 목록수
     */
    public int updateReceiveEtcItemInfc(ReceiveEtcItemVO receiveEtcItemVO);

    /**
     * 기타입고 정보를 취소한다.
     * @param receiveEtcVO - 전송할 정보가 담긴 ReceiveEtcVO
     * @return 취소된 목록수
     */
    public int cancelReceiveEtc(ReceiveEtcVO receiveEtcVO);

    /**
     * 기타입고 부품 정보를 삭제한다.
     * @param receiveEtcVO - 전송할 정보가 담긴 ReceiveEtcItemVO
     * @return 삭제된 목록수
     */
    public int deleteReceiveEtcItem(ReceiveEtcItemVO receiveEtcItemVO);

    /**
     * 기타입고상세 전체 취소.
     * @param receiveEtcVO - 전송할 정보가 담긴 ReceiveEtcItemVO
     * @return 삭제된 목록수
     */
    public int updateReceiveCancelEtcKey(ReceiveEtcItemVO receiveEtcItemVO);

    /**
     * 등록된 기타입고 부품 정보를 삭제한다.(수불발생 안한 부품 실제 삭제)
     * @param receiveEtcVO - 전송할 정보가 담긴 ReceiveEtcItemVO
     * @return 삭제된 목록수
     */
    public int deleteRegReceiveEtcItem(ReceiveEtcItemVO receiveEtcItemVO);

    /**
     * Key에 해당하는 기타입고 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param lvlId - 레벨ID
     * @return 조회한 기타입고 정보
     */
    public ReceiveEtcVO selectReceiveEtcByKey(ReceiveEtcSearchVO receiveEtcSearchVO);

    /**
     * Key에 해당하는 구매반품 기타입고 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param lvlId - 레벨ID
     * @return 조회한 기타입고 정보
     */
    public ReceiveEtcVO selectReceiveReturnEtcByKey(ReceiveEtcSearchVO receiveEtcSearchVO);

    /**
     * Key에 해당하는 기타입고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectReceiveEtcItemByKey(ReceiveEtcSearchVO receiveEtcSearchVO);

    /**
     * Key에 해당하는 기타입고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectReceiveEtcReturnItemByKey(ReceiveEtcSearchVO receiveEtcSearchVO);

    /**
     * Key에 해당하는 기타입고 부품 정보를 조회한다.(이동평균가를 수불정보에서 가져온다.)
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectReceiveEtcReturnDocItemByKey(ReceiveEtcSearchVO receiveEtcSearchVO);

    /**
     * Key에 해당하는 차입입고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcItemVO> selectBorrowItemByKey(ReceiveEtcSearchVO receiveEtcSearchVO);

    /**
     * Key에 해당하는 업로드 등록용 기타입고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcItemVO
     * @return 조회한 기타입고 부품정보
     */
    public ReceiveEtcItemVO selectReceiveEtcItemExcelUploadByKey(ReceiveEtcItemVO receiveEtcItemVO);

    /**
     * 기타입고 정보에 해당하는 기타입고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcItemVO
     * @return 조회한 기타입고 부품정보
     */
    public ReceiveEtcItemVO selectItemInfoByReceiveEtcerInfo(ReceiveEtcItemVO receiveEtcItemVO);

    /**
     * 조회 조건에 해당하는 기타입고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcVO> selectReceiveEtcsByCondition(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타입고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcsByConditionCnt(ReceiveEtcSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 기타입고 정보(반품대상)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcVO> selectReceiveEtcForReturnsByCondition(ReceiveEtcSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 기타입고 총 갯수(반품대상)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcForReturnsByConditionCnt(ReceiveEtcSearchVO searchVO);

    /**
     * 구매번호에 해당하는 구매라인 Max값을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcMaxLineNo(ReceiveEtcVO receiveEtcVO);


    /**
     * 조회 조건에 해당하는 기타입고부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectInvcItemsByCondition(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타입고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectInvcItemsByConditionCnt(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타입고부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectReceiveEtcPop(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타입고부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcPopCnt(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타입고집계 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcVO> selectReceiveEtcListByCondition(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타입고집계 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcListByConditionCnt(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타입고명세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectReceiveEtcDetailListByCondition(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타입고명세 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcDetailListByConditionCnt(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타입고반품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectReceiveEtcReturnsByCondition(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타입고반품 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcReturnsByConditionCnt(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타입고반품 집계 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcVO> selectReceiveEtcReturnSummaryListByCondition(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타입고반품 집계 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcReturnSummaryListByConditionCnt(ReceiveEtcSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 기타입고반품(구매입고반품) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectPurcReceiveReturnsByCondition(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타입고반품(구매입고반품) 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcReceiveReturnsByConditionCnt(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타입고반품(구매입고반품) 집계 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcVO> selectPurcReceiveReturnSummaryListByCondition(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타입고반품(구매입고반품) 집계 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcReceiveReturnSummaryListByConditionCnt(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타입고(차입입고)명세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectReceiveEtcBorrowDetailListByCondition(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타입고(차입입고)명세 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcBorrowDetailListByConditionCnt(ReceiveEtcSearchVO searchVO);

    /**
     * 구매입고 취소 가능 여부 체크한다.
     * @param receiveEtcVO - 조회할 정보가 담긴 ReceiveEtcVO
     * @return 조회한 기타입고  정의 정보
     */
    public String selectReceiveEtcReturnAvailableChk(ReceiveEtcVO receiveEtcVO);

    /**
     * 기타입고Key에 해당하는 수정일자  정보를 조회한다.
     * @param receiveEtcVO - 조회할 정보가 담긴 ReceiveEtcVO
     * @return 조회한 기타입고  정의 정보
     */
    public String selectReceiveEtcUpdtDtByKey(ReceiveEtcVO receiveEtcVO);


    /**
     * 조회 조건에 해당하는 기초재고입고대상 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveInitListCnt(ReceiveEtcSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 기초재고입고대상을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectReceiveInitList(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기초재고입고 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveInitItemByKeyCnt(ReceiveEtcSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 기초재고입고  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectReceiveInitItemByKey(ReceiveEtcSearchVO searchVO);

    /**
     * 0303OH 기초재고입고 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveInitMigDataByCnt(ReceiveEtcSearchVO searchVO);

    /**
     * 0303OH 기초재고입고  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemTrdVO> selectReceiveInitMigDataByKey(ReceiveEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기초재고입고 대상 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveInitListByConditionCnt(ReceiveEtcSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 기초재고입고 대상 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectReceiveInitListByCondition(ReceiveEtcSearchVO searchVO);


    /**
     * 기초재고입고 대상 부품 정보를 확정한다.
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcItemVO
     * @return 수정된 목록수
     */
    public int applyReceiveInitItem(ReceiveEtcItemVO receiveEtcItemVO);

    /**
     * 기초재고입고 대상 부품 정보를 클로징한다.
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcItemVO
     * @return 수정된 목록수
     */
    public int closingReceiveInitItem(ReceiveEtcItemVO receiveEtcItemVO);

    /**
     * 기초재고입고 대상 부품 정보를 확정취소한다.
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcItemVO
     * @return 수정된 목록수
     */
    public int cancelReceiveInitTargetItem(ReceiveEtcItemVO receiveEtcItemVO);

    /**
     * 기초재고입고 대상 부품 정보를 전체 취소한다.
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcItemVO
     * @return 수정된 목록수
     */
    public int cancelReceiveInitTargetAll(ReceiveEtcItemVO receiveEtcItemVO);

    /**
     *기초재고입고 (정비수령용) 정보를 등록한다.(테이블에서 즉시)
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcVO
     * @return 등록된 목록수
     */
    public ReceiveEtcVO createReceiveInitByRepairOrderDataReg(ReceiveEtcVO receiveEtcVO);


    /**
     *기초재고입고(정비수령용)  정보를 등록을 확정한다.
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcVO
     * @return 등록된 목록수
     */
    public ReceiveEtcVO createReceiveInitByRepairOrderDataCnfm(ReceiveEtcVO receiveEtcVO);

    /**
     * 기초재고입고(정비수령용) 부품 정보를 확정취소한다.
     * @param receiveEtcItemVO - 취소할 정보가 담긴 ReceiveEtcItemVO
     * @return 취소된 목록수
     */
    public int cancelRepairOrderInitTargetItem(ReceiveEtcItemVO receiveEtcItemVO);

    /**
     * 조회 조건에 해당하는 기초재고입고(정비수령용) 대상 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectRepairOrderInitListByConditionCnt(ReceiveEtcSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 기초재고입고(정비수령용) 대상 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectRepairOrderInitListByCondition(ReceiveEtcSearchVO searchVO);

    /**
     * 기초재고입고(정비수령용) 대상 부품 정보를 확정한다.
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcItemVO
     * @return 수정된 목록수
     */
    public int applyRepairOrderInitItem(ReceiveEtcItemVO receiveEtcItemVO);

    /**
     * 기초재고입고(정비수령용) 대상 부품 정보를 클로징한다.
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcItemVO
     * @return 수정된 목록수
     */
    public int closingRepairOrderInitItem(ReceiveEtcItemVO receiveEtcItemVO);

    /**
     * 조회 조건에 해당하는 기초재고입고대상(정비수령용) Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectRepairOrderInitListCnt(ReceiveEtcSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 기초재고입고대상(정비수령용)을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectRepairOrderInitList(ReceiveEtcSearchVO searchVO);

    /**
     *기초재고입고  정보를 등록을 확정한다.(프로시저)
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcVO
     * @return 등록된 목록수
     */
    public int executeReceiveEtcInitProcedure(String dlrCd, String docNo, String usrId, String callMode, String callId, String debugMode);

    /**
     *기초재고입고  정보를 등록을 확정한다.(프로시저)
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcVO
     * @return 등록된 목록수
     */
    public ReceiveEtcInitProcedureVO executeReceiveEtcInitProcedureTest(ReceiveEtcInitProcedureVO receiveEtcInitProcedureVO);

}
