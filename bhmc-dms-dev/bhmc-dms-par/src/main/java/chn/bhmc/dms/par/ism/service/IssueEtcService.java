package chn.bhmc.dms.par.ism.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueEtcItemVO;
import chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueEtcVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemVO;

/**
 * 기타출고 서비스
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

public interface IssueEtcService {

    /**
     *기타출고  정보를 등록한다.
     * @param issueEtcVO - 등록할 정보가 담긴 IssueEtcVO
     * @return 등록된 목록수
     */
    public IssueEtcVO createIssueEtc(List<IssueEtcItemVO> list, IssueEtcVO issueEtcVO) throws Exception;

    /**
     *기타출고  정보를 등록한다.(수불발생X)
     * @param issueEtcVO - 등록할 정보가 담긴 IssueEtcVO
     * @return 등록된 목록수
     */
    public IssueEtcVO createIssueEtcReg(List<IssueEtcItemVO> list, IssueEtcVO issueEtcVO) throws Exception;


    /**
     *기타출고  정보를 확정한다.
     * @param issueEtcVO - 등록할 정보가 담긴 IssueEtcVO
     * @return 등록된 목록수
     */
    public IssueEtcVO createIssueEtcCnfm(List<IssueEtcItemVO> list, IssueEtcVO issueEtcVO) throws Exception;


    /**
     *기타출고  정보를 수정한다.
     * @param issueEtcVO - 수정할 정보가 담긴 IssueEtcVO
     * @return 수정된 목록수
     */
    public void multiIssueEtcs(BaseSaveVO<IssueEtcItemVO> issueEtcSaveVO, IssueEtcVO issueEtcVO) throws Exception;

    /**
     *기타출고(차출등기출고) 정보를 취소한다.
     * @param issueEtcVO - 취소할 정보가 담긴 IssueEtcVO
     * @return 취소된 내용
     */
    public void regCancIssueEtcs(IssueEtcVO regIssueEtcVO) throws Exception;

    /**
     * 기타출고  정보를 수정한다.
     * @param issueEtcVO - 수정할 정보가 담긴 IssueEtcVO
     * @return 취소된 목록수
     */
    public int updateIssueEtc(IssueEtcVO issueEtcVO) throws Exception;


    /**
     * 기타출고 정보를 수정일자를 수정한다.
     * @param issueEtcVO - 수정할 정보가 담긴 IssueEtcVO
     * @return 수정된 목록수
     */
    public int updateIssueEtcUpdtDt(IssueEtcVO issueEtcVO) throws Exception;

    /**
     * 기타출고  정보를 취소한다.
     * @param issueEtcVO - 취소할 정보가 담긴 IssueEtcVO
     * @return 취소된 목록수
     */
    public int cancelIssueEtc(List<IssueEtcItemVO> list, IssueEtcVO issueEtcVO) throws Exception;

    /**
     *기타출고  정보를 수정 후 확정한다.(로컬업체 대상)
     * @param issueEtcVO - 수정할 정보가 담긴 IssueEtcVO
     * @return 수정된 목록수
     */
    public void multiConfirmIssueEtc(BaseSaveVO<IssueEtcItemVO> issueEtcSaveVO, IssueEtcVO issueEtcVO) throws Exception;

    /**
     * 기타출고  정보를 확정한다.(로컬업체 대상)
     * @param issueEtcVO - 취소할 정보가 담긴 IssueEtcVO
     * @return 확정된 목록수
     */
    public int confirmIssueEtc(IssueEtcVO issueEtcVO) throws Exception;


    /**
     * Key에 해당하는 기타출고  정보를 조회한다.
     * @param issueEtcVO - 조회할 정보가 담긴 IssueEtcVO
     * @return 조회한 기타출고  정의 정보
     */
    public IssueEtcVO selectIssueEtcByKey(IssueEtcSearchVO issueEtcSearchVO) throws Exception;

    /**
     * Key에 해당하는 기타출고 부품 정보를 조회한다.
     * @param issueEtcVO - 조회할 정보가 담긴 IssueEtcVO
     * @return 조회한 기타출고  정의 정보
     */
    public List<IssueEtcItemVO> selectIssueEtcItemByKey(IssueEtcSearchVO issueEtcSearchVO) throws Exception;

    /**
     * Key에 해당하는 차입출고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectRentalItemByKey(IssueEtcSearchVO issueEtcSearchVO) throws Exception;


    /**
     * Key에 해당하는 업로드 등록용 기타출고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcItemVO
     * @return 조회한 기타출고 부품정보
     */
    public IssueEtcItemVO selectIssueEtcItemExcelUploadByKey(IssueEtcItemVO issueEtcItemVO) throws Exception;

    /**
     * 기타출고 정보에 해당하는 기타출고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcItemVO
     * @return 조회한 기타출고 부품정보
     */
    public IssueEtcItemVO selectItemInfoByIssueEtcerInfo(IssueEtcItemVO issueEtcItemVO) throws Exception;

    /**
     * 조회조건에 해당하는 기타출고  정보를 조회한다.
     * @param issueEtcVO - 조회할 정보가 담긴 IssueEtcVO
     * @return 조회한 기타출고  정의 정보
     */
    public List<IssueEtcVO> selectIssueEtcsByCondition(IssueEtcSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 기타출고  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueEtcsByConditionCnt(IssueEtcSearchVO searchVO) throws Exception;

    public String selectNextEtcGiDocNo() throws Exception;

    public String selectIssueEtcUpdtDtByKey(IssueEtcVO issueEtcVO) throws Exception;

    /**
     * 조회조건에 해당하는 기타출고  정보를 조회한다.
     * @param issueEtcVO - 조회할 정보가 담긴 IssueEtcVO
     * @return 조회한 기타출고  정의 정보
     */
    public List<IssueEtcItemVO> selectInvcItemsByCondition(IssueEtcSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 기타출고  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectInvcItemsByConditionCnt(IssueEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타출고부품렌탈 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcItemVO> selectIssueEtcRentalPop(IssueEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타출고부품렌탈 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueEtcRentalPopCnt(IssueEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타출고(대여반환) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcItemVO> selectIssueEtcReturnPop(IssueEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타출고(대여반환) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueEtcReturnPopCnt(IssueEtcSearchVO searchVO) throws Exception;

    /**
     * 기타입고(조달출고)부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcItemVO> selectIssueEtcFundsByCondition(IssueEtcSearchVO searchVO) throws Exception;

    /**
     * 기타입고(조달출고)팝업 부품 정보 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueEtcFundsByConditionCnt(IssueEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타출고집계 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcVO> selectIssueEtcListByCondition(IssueEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타출고집계 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueEtcListByConditionCnt(IssueEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타출고명세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcItemVO> selectIssueEtcDetailListByCondition(IssueEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타출고명세 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueEtcDetailListByConditionCnt(IssueEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타출고(차출출고)명세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcItemVO> selectIssueEtcRentalDetailListByCondition(IssueEtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타출고(차출출고)명세 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueEtcRentalDetailListByConditionCnt(IssueEtcSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 기타출고의 수정일자 정보를 체크한다.
     * @param issueEtcVO - 조회 조건을 포함하는 IssueEtcVO
     * @return 체크완료여부
     */
    public boolean fnChkIssueEtcUpdateSomebody(IssueEtcVO issueEtcVO) throws Exception;

    /**
     * 조달출고에 해당하는 데이터를 인터페이스 테이블에 저장한다.
     * @param issueEtcVO - 조회 조건을 포함하는 IssueEtcVO
     * @return 완료여부
     */
    public boolean insertIssueProcureToIf(List<IssueEtcItemVO> list, IssueEtcVO issueEtcVO) throws Exception;
}
