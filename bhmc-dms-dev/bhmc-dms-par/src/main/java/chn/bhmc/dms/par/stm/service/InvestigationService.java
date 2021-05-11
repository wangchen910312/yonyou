package chn.bhmc.dms.par.stm.service;

import java.util.List;

import chn.bhmc.dms.par.stm.vo.InvestigationSaveVO;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueEtcItemVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemVO;
import chn.bhmc.dms.par.stm.vo.InvestigationItemVO;
import chn.bhmc.dms.par.stm.vo.InvestigationSearchVO;
import chn.bhmc.dms.par.stm.vo.InvestigationVO;

/**
 * 수불유형 서비스
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

public interface InvestigationService {

    /**
     * 재고실사 헤더 정보를 등록한다.
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public int createInvestigation(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception;

    /**
     * 재고실사 정보를 등록한다.(상태적용X)
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public InvestigationVO createInvestigationReg(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception;

    /**
     * 재고실사 정보를 수정한다.(상태적용X)
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public InvestigationVO updateInvestigationReg(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception;

    /**
     * 재고실사 정보를 수정한다.(상태적용X)
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public InvestigationVO updateInvestigationRegNew(InvestigationSaveVO investigationSaveVO) throws Exception;

    /**
     * 재고실사 정보를 수정한다.(상태적용X)
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public InvestigationVO updateInvestigationRegAdd(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception;

    /**
     * 재고실사 정보를 삭제한다.(상태적용X)
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public InvestigationVO deleteInvestigationReg(List<InvestigationItemVO> list) throws Exception;

    /**
     * 재고실사  정보를 수정한다.(상태적용X)
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public int multiInvestigationRegs(BaseSaveVO<InvestigationItemVO> saveVO, InvestigationVO investigationVO) throws Exception;

    /**
     * 재고실사 정보를 등록확정한다.(상태적용RGST)
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public InvestigationVO createInvestigationCnfm(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception;

    /**
     * 재고실사 정보를 저장/확정한다.
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public InvestigationVO updateInvestigationSaveCnfm(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception;

    /**
     * 재고실사 헤더정보를 수정한다.
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public int updateInvestigationHeaderByKey(InvestigationVO investigationVO) throws Exception;

    /**
     * 재고실사 승인요청한다.
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public int updateInvestigationApplyReq(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception;

    /**
     * 재고실사 수정한다.
     * @param list - 수정할 정보가 담긴 List<InvestigationItemVO>
     * @return 수정된 목록수
     */
    public void multiInvestigations(BaseSaveVO<InvestigationItemVO> obj, InvestigationVO investigationVO ) throws Exception;

    /**
     * 재고실사 취소처리한다.
     * @param investigationVO - 취소할 정보가 담긴 InvestigationVO
     * @return 취소된 목록수
     */
    public int deleteInvestigation(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception;


    public String selectNextStockDDDocNo() throws Exception;

    /**
     * Key에 해당하는 재고실사 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public List<InvestigationItemVO> selectInvestigationByKey(InvestigationSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 재고실사 헤더 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public InvestigationVO selectInvestigationInfoByKey(InvestigationSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 재고실사 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록 수
     */
    public int selectInvestigationByKeyCnt(InvestigationSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 재고실사 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public List<InvestigationVO> selectInvestigationListByCondition(InvestigationSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 재고실사 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록 수
     */
    public int selectInvestigationListByConditionCnt(InvestigationSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 재고실사 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public InvestigationVO selectInvestigationListByKey(InvestigationSearchVO searchVO) throws Exception;

    /**
     * 재고조정(Overage입고)한다.
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public int createInvestigationOverageReserve(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception;

    /**
     * 재고조정(Shortage출고)한다.
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public int createInvestigationShortageIssue(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception;

    /**
     * 재고조정 승인한다.
     * @param investigationVO - 등록할 정보가 담긴 InvestigationVO
     * @return 등록된 목록수
     */
    public int updateInvestigationApplyCnfm(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception;

    /**
     * 재고실사 반려처리한다.
     * @param investigationVO - 반려할 정보가 담긴 InvestigationVO
     * @return 반려된 목록수
     */
    public int updateInvestigationByReject(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception;


    /**
     * Key에 해당하는 실사문서를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public List<InvestigationVO> selectInvestigationListGridByCondition(InvestigationSearchVO searchVO) throws Exception;


    /**
     * Statements
     * Key에 해당하는  실사문서 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return
     */
    public int selectInvestigationListGridByConditionCnt(InvestigationSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 재고실사문서 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public int selectInvestigationListDetailGridByConditionCnt(InvestigationSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 재고실사문서 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public List<InvestigationItemVO> selectInvestigationListDetailGridByCondition(InvestigationSearchVO searchVO) throws Exception;

    /**
     * 재고 실사 문서(Overage 입고) 정보 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록 수
     */
    public int selectInvestigationForReserveByKeyCnt(InvestigationSearchVO searchVO) throws Exception;

    /**
     * 재고 실사 문서(Overage 입고) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectInvestigationForReserveByKey(InvestigationSearchVO searchVO) throws Exception;

    /**
     * 재고 실사 문서(Shortage 출고) 정보 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록 수
     */
    public int selectInvestigationForIssueByKeyCnt(InvestigationSearchVO searchVO) throws Exception;

    /**
     * 재고 실사 문서(Shortage 출고) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcItemVO> selectInvestigationForIssueByKey(InvestigationSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는재고 실사의 수정일자 정보를 체크한다.
     * @param investigationVO - 조회 조건을 포함하는 InvestigationVO
     * @return 체크완료여부
     */
    public boolean fnChkInvestigationUpdateSomebody(InvestigationVO investigationVO) throws Exception;

    /**
     * Key에 해당하는 재고실사 부품 창고 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public List<InvestigationItemVO> selectInvestigationStrgeByKey(InvestigationSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 재고실사 부품 창고 수량을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public int selectInvestigationStrgeByKeyCnt(InvestigationSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 재고실사 부품 정보를 창고별로 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public List<InvestigationItemVO> selectInvestigationItemByStrge(InvestigationSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 재고실사 부품 정보 수량을 창고별로 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvestigationSearchVO
     * @return 조회 목록
     */
    public int selectInvestigationItemByStrgeCnt(InvestigationSearchVO searchVO) throws Exception;

    public String createInvestigationForStrage(InvestigationVO investigationVO) throws Exception;
    /**
     * 验证盘点结果导入数据
     * @param searchVO
     * @return
     * @throws Exception
     */
    public InvestigationItemVO checkImportData(InvestigationSearchVO searchVO) throws Exception;
    /**
     * 根据excel批量更新
     * @param list
     */
    public void updateBathByExcel(InvestigationItemVO itemVO);
}
