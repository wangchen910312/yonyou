package chn.bhmc.dms.par.pcm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueEtcItemVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemTrdVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO;

/**
 * 기타입고 서비스
 *
 * @author Ju Won Lee
 * @since 2016. 2. 04.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 04.     Ju Won Lee      최초 생성
 * </pre>
 */

public interface ReceiveEtcService {

    /**
     *기타입고  정보를 등록한다.
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcVO
     * @return 등록된 목록수
     */
    public ReceiveEtcVO createReceiveEtc(List<ReceiveEtcItemVO> list, ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     *기타입고  정보를 등록한다.
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcVO
     * @return 등록된 목록수
     */
    public ReceiveEtcVO createReceiveEtcReg(List<ReceiveEtcItemVO> list, ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     *기타입고  정보를 등록을 확정한다.
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcVO
     * @return 등록된 목록수
     */
    public ReceiveEtcVO createReceiveEtcCnfm(List<ReceiveEtcItemVO> list, ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     *기타입고  정보를 등록을 확정한다.
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcVO
     * @return 등록된 목록수
     */
    public ReceiveEtcVO createReceiveEtcCnfmNonUpdate(List<ReceiveEtcItemVO> list, ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     *기타입고  정보를 수정한다.
     * @param receiveEtcVO - 수정할 정보가 담긴 ReceiveEtcVO
     * @return 수정된 목록수
     */
    public void multiReceiveEtcs(BaseSaveVO<ReceiveEtcItemVO> receiveEtcSaveVO, ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     *기타입고(차입등기입고) 정보를 취소한다.
     * @param receiveEtcVO - 취소할 정보가 담긴 ReceiveEtcVO
     * @return 취소한 기타입고 정보
     */
    public void regCancReceiveEtcs(ReceiveEtcVO regReceiveEtcVO) throws Exception;

    /**
     * 기타입고  정보를 수정한다.
     * @param receiveEtcVO - 수정할 정보가 담긴 ReceiveEtcVO
     * @return 취소된 목록수
     */
    public int updateReceiveEtc(ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     * 기타입고 정보 수정일자를 수정한다.
     * @param receiveEtcVO - 수정할 정보가 담긴 ReceiveEtcVO
     * @return 수정된 목록수
     */
    public int updateReceiveEtcUpdtDt(ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     * 기타입고  정보를 취소한다.
     * @param receiveEtcVO - 취소할 정보가 담긴 ReceiveEtcVO
     * @return 취소된 목록수
     */
    public int cancelReceiveEtc(List<ReceiveEtcItemVO> list, ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     * 기타입고 등록 정보를 취소한다.
     * @param receiveEtcVO - 취소할 정보가 담긴 ReceiveEtcVO
     * @return 취소된 목록수
     */
    public int cancelRegReceiveEtc(List<ReceiveEtcItemVO> list, ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     *기타입고  정보를 수정 후 확정한다.(로컬업체 대상)
     * @param receiveEtcVO - 수정할 정보가 담긴 ReceiveEtcVO
     * @return 수정된 목록수
     */
    public void multiConfirmReceiveEtc(BaseSaveVO<ReceiveEtcItemVO> receiveEtcSaveVO, ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     * 기타입고  정보를 확정한다.(로컬업체 대상)
     * @param receiveEtcVO - 취소할 정보가 담긴 ReceiveEtcVO
     * @return 확정된 목록수
     */
    public int confirmReceiveEtc(ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     * 기타입고  정보를 수정 등록한다.(로컬업체 대상)
     * @param receiveEtcVO - 취소할 정보가 담긴 ReceiveEtcVO
     * @return 확정된 목록수
     */
    public int insertReceiveEtcItem(ReceiveEtcItemVO receiveEtcItemVO) throws Exception;

    /**
     * 기타입고  정보를 수정한다.(로컬업체 대상)
     * @param receiveEtcVO - 취소할 정보가 담긴 ReceiveEtcVO
     * @return 확정된 목록수
     */
    public int updateReceiveEtcItem(ReceiveEtcItemVO receiveEtcItemVO) throws Exception;

    /**
     * 기타입고  정보를 수정 삭제한다.(로컬업체 대상)
     * @param receiveEtcVO - 취소할 정보가 담긴 ReceiveEtcVO
     * @return 확정된 목록수
     */
    public int deleteRegReceiveEtcItem(ReceiveEtcItemVO receiveEtcItemVO) throws Exception;

    /**
     *기타구매입고  정보를 반품처리한다.
     * @param receiveEtcVO - 반품할 정보가 담긴 ReceiveEtcVO
     * @return 등록된 목록수
     */
    public ReceiveEtcVO returnInvcReceiveEtc(List<ReceiveEtcItemVO> list, ReceiveEtcVO receiveEtcVO) throws Exception;



    /**
     * Key에 해당하는 기타입고  정보를 조회한다.
     * @param receiveEtcVO - 조회할 정보가 담긴 ReceiveEtcVO
     * @return 조회한 기타입고  정의 정보
     */
    public ReceiveEtcVO selectReceiveEtcByKey(ReceiveEtcSearchVO receiveEtcSearchVO) throws Exception;


    /**
     * Key에 해당하는 구매반품 기타입고 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param lvlId - 레벨ID
     * @return 조회한 기타입고 정보
     */
    public ReceiveEtcVO selectReceiveReturnEtcByKey(ReceiveEtcSearchVO receiveEtcSearchVO) throws Exception;

    /**
     * Key에 해당하는 기타입고 부품 정보를 조회한다.
     * @param receiveEtcVO - 조회할 정보가 담긴 ReceiveEtcVO
     * @return 조회한 기타입고  정의 정보
     */
    public List<ReceiveEtcItemVO> selectReceiveEtcItemByKey(ReceiveEtcSearchVO receiveEtcSearchVO) throws Exception;

    /**
     * Key에 해당하는 기타입고 부품 정보(반품용)를 조회한다.
     * @param receiveEtcVO - 조회할 정보가 담긴 ReceiveEtcVO
     * @return 조회한 기타입고  정의 정보
     */
    public List<ReceiveEtcItemVO> selectReceiveEtcReturnItemByKey(ReceiveEtcSearchVO receiveEtcSearchVO) throws Exception;

    /**
     * Key에 해당하는  기타입고 부품 데이타(반품용)를 조회한다.(이동평균가를 수불정보에서 가져온다.)
     * @param receiveEtcVO - 조회할 정보가 담긴 ReceiveEtcVO
     * @return 조회한 기타입고  정의 정보
     */
    public List<ReceiveEtcItemVO> selectReceiveEtcReturnDocItemByKey(ReceiveEtcSearchVO receiveEtcSearchVO) throws Exception;

    /**
     * Key에 해당하는 차입입고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcItemVO> selectBorrowItemByKey(ReceiveEtcSearchVO receiveEtcSearchVO) throws Exception;


    /**
     * Key에 해당하는 업로드 등록용 기타입고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcItemVO
     * @return 조회한 기타입고 부품정보
     */
    public ReceiveEtcItemVO selectReceiveEtcItemExcelUploadByKey(ReceiveEtcItemVO receiveEtcItemVO) throws Exception;

    /**
     * 기타입고 정보에 해당하는 기타입고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcItemVO
     * @return 조회한 기타입고 부품정보
     */
    public ReceiveEtcItemVO selectItemInfoByReceiveEtcerInfo(ReceiveEtcItemVO receiveEtcItemVO) throws Exception;

    /**
     * 조회조건에 해당하는 기타입고  정보를 조회한다.
     * @param receiveEtcVO - 조회할 정보가 담긴 ReceiveEtcVO
     * @return 조회한 기타입고  정의 정보
     */
    public List<ReceiveEtcVO> selectReceiveEtcsByCondition(ReceiveEtcSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 기타입고  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcsByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 기타입고(반품대상)  정보를 조회한다.
     * @param receiveEtcVO - 조회할 정보가 담긴 ReceiveEtcVO
     * @return 조회한 기타입고  정의 정보
     */
    public List<ReceiveEtcVO> selectReceiveEtcForReturnsByCondition(ReceiveEtcSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 기타입고(반품대상)  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcForReturnsByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception;

    public String selectNextEtcGrDocNo() throws Exception;

    public String selectReceiveEtcUpdtDtByKey(ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     * 조회조건에 해당하는 기타입고  정보를 조회한다.
     * @param receiveEtcVO - 조회할 정보가 담긴 ReceiveEtcVO
     * @return 조회한 기타입고  정의 정보
     */
    public List<ReceiveEtcItemVO> selectInvcItemsByCondition(ReceiveEtcSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 기타입고  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectInvcItemsByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타입고부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectReceiveEtcPop(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타입고부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcPopCnt(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타입고집계 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcVO> selectReceiveEtcListByCondition(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타입고집계 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcListByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타입고명세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectReceiveEtcDetailListByCondition(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타입고명세 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcDetailListByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타입고반품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectReceiveEtcReturnsByCondition(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타입고반품 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcReturnsByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타입고반품 집계 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcVO> selectReceiveEtcReturnSummaryListByCondition(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타입고반품 집계 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcReturnSummaryListByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타입고반품(반품문서기준) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectPurcReceiveReturnsByCondition(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타입고반품(반품문서기준) 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcReceiveReturnsByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타입고반품(반품문서기준) 집계 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcVO> selectPurcReceiveReturnSummaryListByCondition(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타입고반품(반품문서기준) 집계 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcReceiveReturnSummaryListByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 기타입고(차입입고)명세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectReceiveEtcBorrowDetailListByCondition(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타입고(차입입고)명세 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveEtcBorrowDetailListByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception;


    /**
     * 구매입고 취소 가능 여부 체크한다.
     * @param receiveEtcVO - 조회할 정보가 담긴 ReceiveEtcVO
     * @return 조회한 기타입고  정의 정보
     */
    public String selectReceiveEtcReturnAvailableChk(ReceiveEtcVO receiveEtcVO) throws Exception;


    /**
     * Key에 해당하는 기타입고의 수정일자 정보를 체크한다.
     * @param receiveEtcVO - 조회 조건을 포함하는 ReceiveEtcVO
     * @return 체크완료여부
     */
    public boolean fnChkReceiveEtcUpdateSomebody(ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     *기초재고입고  정보를 등록한다.(테이블에서 즉시)
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcVO
     * @return 등록된 목록수
     */
    public ReceiveEtcVO createReceiveInitByDataReg(ReceiveEtcVO receiveEtcVO) throws Exception;


    /**
     *기초재고입고  정보를 등록을 확정한다.
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcVO
     * @return 등록된 목록수
     */
    public ReceiveEtcVO createReceiveInitByDataCnfm(ReceiveEtcVO receiveEtcVO) throws Exception;


    /**
     * 조회 조건에 해당하는 기초재고입고 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveInitItemByKeyCnt(ReceiveEtcSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 기초재고입고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectReceiveInitItemByKey(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 0303OH 기초재고입고 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveInitMigDataByKeyCnt(ReceiveEtcSearchVO searchVO) throws Exception;


    /**
     * 0303OH 기초재고입고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemTrdVO> selectReceiveInitMigDataByKey(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     * 기초재고입고 등록 정보(기타입고문서 라인별)를 취소한다.
     * @param receiveEtcVO - 취소할 정보가 담긴 ReceiveEtcVO
     * @return 취소된 목록수
     */
    public int cancelReceiveInitByData(ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     * 기초재고입고 등록 정보(기타입고문서 별)를 취소한다.
     * @param receiveEtcVO - 취소할 정보가 담긴 ReceiveEtcVO
     * @return 취소된 목록수
     */
    public int cancelReceiveInitByKey(ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기초재고입고 대상 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveInitListByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 기초재고입고 대상 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectReceiveInitListByCondition(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     *기초재고입고 (정비수령용) 정보를 등록한다.(테이블에서 즉시)
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcVO
     * @return 등록된 목록수
     */
    public ReceiveEtcVO createReceiveInitByRepairOrderDataReg(ReceiveEtcVO receiveEtcVO) throws Exception;


    /**
     *기초재고입고(정비수령용)  정보를 등록을 확정한다.
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcVO
     * @return 등록된 목록수
     */
    public ReceiveEtcVO createReceiveInitByRepairOrderDataCnfm(ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     * 기초재고입고(정비수령용) 등록 정보를 취소한다.
     * @param receiveEtcVO - 취소할 정보가 담긴 ReceiveEtcVO
     * @return 취소된 목록수
     */
    public int cancelReceiveInitByRepairOrderData(ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기초재고입고(정비수령용) 대상 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectRepairOrderInitListByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 기초재고입고(정비수령용) 대상 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectRepairOrderInitListByCondition(ReceiveEtcSearchVO searchVO) throws Exception;

    /**
     *기초재고입고(정비수령용)  정보를 등록을 확정한다.(프로시저)
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcVO
     * @return 등록된 목록수
     */
    public int executeReceiveEtcInitProcedure(ReceiveEtcVO receiveEtcVO) throws Exception;

    /**
     *기초재고입고(정비수령용)  정보를 등록을 확정한다.(프로시저)
     * @param receiveEtcVO - 등록할 정보가 담긴 ReceiveEtcVO
     * @return 등록된 목록수
     */
    public int executeReceiveEtcInitProcedureTest(ReceiveEtcVO receiveEtcVO) throws Exception;


}
