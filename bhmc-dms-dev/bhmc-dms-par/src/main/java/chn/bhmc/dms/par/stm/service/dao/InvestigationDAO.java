package chn.bhmc.dms.par.stm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.par.ism.vo.IssueEtcItemVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemVO;
import chn.bhmc.dms.par.stm.vo.InvestigationItemVO;
import chn.bhmc.dms.par.stm.vo.InvestigationSearchVO;
import chn.bhmc.dms.par.stm.vo.InvestigationVO;
import chn.bhmc.dms.par.stm.vo.StockInOutVO;

/**
 * 재고실사 데이타 매퍼 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Ju Won Lee      최초 생성
 * </pre>
 */

@Mapper("investigationDAO")
public interface InvestigationDAO {



    /**
     * 재고실사 헤더 정보를 등록한다.
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public int insertInvestigationHeader(InvestigationVO investigationVO);

    /**
     * 재고실사 헤더 정보를 등록한다.
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public int insertInvestigationHeaderAdd(InvestigationVO investigationVO);

    /**
     * 재고실사 부품 정보를 등록한다.
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public int insertInvestigationItem(InvestigationItemVO investigationItemVO);

    /**
     * 재고실사 부품 정보를 등록한다.
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public int insertInvestigationItemNew(InvestigationItemVO investigationItemVO);

    /**
     * 재고실사  정보를 수정한다(승인요청및 비고).
     * @param investigationVO - 수정할 정보가 담긴 InvestigationVO
     * @return 수정된 목록수
     */
    public int updateInvestigationApplyReq(InvestigationVO investigationVO);



    /**
     * 재고실사 부품 정보를 수정한다.
     * @param investigationVO - 수정할 정보가 담긴 InvestigationVO
     * @return 수정된 목록수
     */
    public int updateInvestigationItem(InvestigationItemVO investigationItemVO);

    /**
     * 재고실사 부품 정보를 삭제한다.(상태값 없는 실사부품 삭제
     * @param investigationVO - 수정할 정보가 담긴 InvestigationVO
     * @return 수정된 목록수
     */
    public int deleteInvestigationItem(InvestigationItemVO investigationItemVO);

    /**
     * 재고실사 부품 정보를 수정한다.(수불정보)
     * @param investigationVO - 수정할 정보가 담긴 InvestigationVO
     * @return 수정된 목록수
     */
    public int updateInvestigationItemMvtInfo(InvestigationItemVO investigationItemVO);

    /**
     * 재고실사 부품 정보를 수정한다.(상태완료)
     * @param investigationVO - 수정할 정보가 담긴 InvestigationVO
     * @return 수정된 목록수
     */
    public int updateInvestigationItemStat(InvestigationItemVO investigationItemVO);

    /**
     * 재고실사 부품 정보를 수정한다.(상태완료)
     * @param investigationVO - 수정할 정보가 담긴 InvestigationVO
     * @return 수정된 목록수
     */
    public int updateInvestigationAllItemStat(InvestigationVO investigationVO);

    /**
     * 재고실사  정보를 상태를 변경한다.
     * @param investigationVO - 수정할 정보가 담긴 InvestigationVO
     * @return 수정된 목록수
     */
    public int updateInvestigationStat(InvestigationVO investigationVO);

    /**
     * 재고실사  정보를 등록상태를 확정한다.
     * @param investigationVO - 수정할 정보가 담긴 InvestigationVO
     * @return 수정된 목록수
     */
    public int updateInvestigationRegCnfm(InvestigationVO investigationVO);

    /**
     * 재고실사  정보를 상태를 변경한다.(반려)
     * @param investigationVO - 수정할 정보가 담긴 InvestigationVO
     * @return 수정된 목록수
     */
    public int updateInvestigationReject(InvestigationVO investigationVO);

    /**
     * 재고실사  정보를 상태를 변경한다.(승인)
     * @param investigationVO - 수정할 정보가 담긴 InvestigationVO
     * @return 수정된 목록수
     */
    public int updateInvestigationApplyCnfm(InvestigationVO investigationVO);

    /**
     * 재고실사  정보를 변경일자를 변경한다.
     * @param investigationVO - 수정할 정보가 담긴 InvestigationVO
     * @return 수정된 목록수
     */
    public int updateInvestigationUpdtDt(InvestigationVO investigationVO);


    /**
     * Key에 해당하는 재고실사 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public List<InvestigationItemVO> selectInvestigationByKey(InvestigationSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 재고실사 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록 수
     */
    public int selectInvestigationByKeyCnt(InvestigationSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 재고실사 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public List<InvestigationVO> selectInvestigationListByCondition(InvestigationSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 재고실사 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록 수
     */
    public int selectInvestigationListByConditionCnt(InvestigationSearchVO searchVO);

    /**
     * Key에 해당하는 재고실사 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public InvestigationVO selectInvestigationListByKey(InvestigationSearchVO searchVO);

    /**
     * Key에 해당하는 재고실사 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public InvestigationVO selectInvestigationInfoByKey(InvestigationSearchVO searchVO);

    /**
     * 재고조정 승인한다.
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public int updateInvestigationApplyCnfm(List<InvestigationItemVO> list, InvestigationVO investigationVO);

    /**
     * 재고실사 반려처리한다.
     * @param investigationVO - 반려할 정보가 담긴 InvestigationVO
     * @return 반려된 목록수
     */
    public int updateInvestigationByReject(List<InvestigationItemVO> list, InvestigationVO investigationVO);


    /**
     * 조회 조건에 해당하는 재고실사 현황 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public List<InvestigationVO> selectInvestigationListGridByCondition(InvestigationSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 재고실사 현황 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록 수
     */
    public int selectInvestigationListGridByConditionCnt(InvestigationSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 재고실사문서 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public int selectInvestigationListDetailGridByConditionCnt(InvestigationSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 재고실사문서 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public List<InvestigationItemVO> selectInvestigationListDetailGridByCondition(InvestigationSearchVO searchVO);

    /**
     * 재고 실사 문서(Overage 입고) 정보 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록 수
     */
    public int selectInvestigationForReserveByKeyCnt(InvestigationSearchVO searchVO);

    /**
     * 재고 실사 문서(Overage 입고) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectInvestigationForReserveByKey(InvestigationSearchVO searchVO);

    /**
     * 재고 실사 문서(Shortage 출고) 정보 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록 수
     */
    public int selectInvestigationForIssueByKeyCnt(InvestigationSearchVO searchVO);

    /**
     * 재고 실사 문서(입출고) 정보 Count를 한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록 수
     */
    public int selectInvestigationForEndCnt(InvestigationSearchVO searchVO);

    /**
     * 재고 실사 문서(Shortage 출고) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcItemVO> selectInvestigationForIssueByKey(InvestigationSearchVO searchVO);

    /**
     * 재고 실사 문서에 해당하는재고 실사라인 Max값을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationVO
     * @return 조회 목록 수
     */
    public int selectInvestigationMaxLineNo(InvestigationVO investigationVO);


    /**
     * 재고 실사 문서에 해당하는 수정일자  정보를 조회한다.
     * @param investigationVO - 조회할 정보가 담긴 InvestigationVO
     * @return 조회한 재고실사  정의 정보
     */
    public String selectInvestigationUpdtDtByKey(InvestigationVO investigationVO);

    /**
     * 재고실사문서 상태를 조회한다.
     * @param investigationVO - 조회할 정보가 담긴 InvestigationVO
     * @return 조회한 재고실사  상태 정보
     */
    public String selectInvestigationStatusByKey(InvestigationVO investigationVO);

    /**
     * 현재고의 재고통제 정보를 조회한다.
     * @param investigationVO - 부품 정보가 담긴 InvestigationVO
     * @return 재고통제 부품 CNT
     */
    public int selectStockLockItem(StockInOutVO stockInOutVO);

    /**
     * 현재고의 재고통제 정보를 조회한다.
     * @param investigationVO - 부품 정보가 담긴 InvestigationVO
     * @return 재고통제 부품 CNT
     */
    public int selectStockLockItemList(InvestigationVO investigationVO);

    /**
     * 현재고의 재고통제 정보를 수정한다.
     * @param investigationVO - 수정할 정보가 담긴 InvestigationVO
     * @return 수정된 목록수
     */
    public int updateStockInOutByStockLockYn(InvestigationVO investigationVO);

    /**
     * Key에 해당하는 재고실사 부품 창고 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public List<InvestigationItemVO> selectInvestigationStrgeByKey(InvestigationSearchVO searchVO);

    /**
     * Key에 해당하는 재고실사 부품 창고 수량을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public int selectInvestigationStrgeByKeyCnt(InvestigationSearchVO searchVO);

    /**
     * Key에 해당하는 재고실사 부품 정보를 창고별로 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public List<InvestigationItemVO> selectInvestigationItemByStrge(InvestigationSearchVO searchVO);

    /**
     * Key에 해당하는 재고실사 부품 정보를 창고별로 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public int selectInvestigationItemByStrgeCnt(InvestigationSearchVO searchVO);
    /**
     * 验证导入数据
     * @param searchVO
     * @return
     */
    public List<InvestigationItemVO> checkImportData(InvestigationSearchVO searchVO);
    
    /**
     * 根据excel批量更新盘点数量
     * @param searchVO
     */
    public void updateBathByExcel(InvestigationItemVO itemVo);
}
