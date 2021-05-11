package chn.bhmc.dms.par.ism.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.ism.vo.PartsSaleEstimateItemVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleEstimateSearchVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleEstimateVO;

/**
 * 부품판매견적 데이타 매퍼 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 2. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 23.     Ju Won Lee      최초 생성
 * </pre>
 */

@Mapper("partsSaleEstimateDAO")
public interface PartsSaleEstimateDAO {

    /**
     * 부품판매 헤더 정보를 등록한다.
     * @param issuePartsOut - 등록할 정보가 담긴 IssuePartsOutVO
     * @return 등록된 목록수
     */
    public int insertPartsSaleEstimate(PartsSaleEstimateVO partsSaleEstimateVO);

    /**
     * 부품판매 부품 정보를 등록한다.
     * @param issuePartsOut - 등록할 정보가 담긴 IssuePartsOutVO
     * @return 등록된 목록수
     */
    public int insertPartsSaleEstimateItem(PartsSaleEstimateItemVO partsSaleEstimateItemVO);

    /**
     * Key에 해당하는 부품판매  정보를 조회한다.
     * @param partsSaleEstimateSearchVO - 조회할 정보가 담긴 PartsSaleEstimateSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public PartsSaleEstimateVO selectPartsSaleEstimateByKey(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO);

    /**
     * Key에 해당하는 부품판매 부품 정보를 조회한다.
     * @param partsSaleEstimateSearchVO - 조회할 정보가 담긴 PartsSaleEstimateSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleEstimateItemVO> selectPartsSaleEstimateItemByKey(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO);

    /**
     * 조건에 해당하는 부품판매 리스트 정보를 조회한다.
     * @param partsSaleEstimateSearchVO - 조회할 정보가 담긴 PartsSaleEstimateSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleEstimateVO> selectPartsSaleEstimateList(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO);

    /**
     * 조건에 해당하는 부품판매 리스트 정보 Count를 조회한다.
     * @param partsSaleEstimateSearchVO - 조회할 정보가 담긴 PartsSaleEstimateSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public int selectPartsSaleEstimateListCnt(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO);

    /**
     * 조건에 해당하는 부품판매 품목리스트 정보를 조회한다.
     * @param partsSaleEstimateSearchVO - 조회할 정보가 담긴 PartsSaleEstimateSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleEstimateItemVO> selectPartsSaleEstimateItemList(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO);

    /**
     * 조건에 해당하는 부품판매 품목리스트 정보 Count를 조회한다.
     * @param partsSaleEstimateSearchVO - 조회할 정보가 담긴 PartsSaleEstimateSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public int selectPartsSaleEstimateItemListCnt(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO);

    /**
     * 판매번호에 해당하는 판매라인 Max값을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsSaleEstimateSearchVO
     * @return 조회 목록 수
     */
    public int selectPartsSaleEstimateMaxLineNo(PartsSaleEstimateVO partsSaleEstimateVO);

    /**
     * 조회조건에 해당하는 구매오더  정보를 조회한다.
     * @param purcOrdVO - 조회할 정보가 담긴 PurcOrdVO
     * @return 조회한 구매오더  정의 정보
     */
    public List<PartsSaleEstimateVO> selectEstimatesByCondition(PartsSaleEstimateSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 구매오더  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectEstimatesByConditionCnt(PartsSaleEstimateSearchVO searchVO);


    /**
     * 부품판매 정보를 수정한다.
     * @param PartsSaleEstimateItemVO - 수정할 정보가 담긴 PartsSaleEstimateVO
     * @return 수정된 목록수
     */
    public int updatePartsSaleEstimate(PartsSaleEstimateVO partsSaleEstimateVO);


    /**
     * 부품판매 부품 정보를 수정한다.
     * @param partsSaleEstimateItemVO - 등록할 정보가 담긴 PartsSaleEstimateItemVO
     * @return 수정된 목록수
     */
    public int updatePartsSaleEstimateItem(PartsSaleEstimateItemVO partsSaleEstimateItemVO);


    /**
     * 부품판매 부품 정보를 삭제한다.
     * @param partsSaleEstimateItemVO - 전송할 정보가 담긴 PartsSaleEstimateItemVO
     * @return 삭제된 목록수
     */
    public int deletePartsSaleEstimateItem(PartsSaleEstimateItemVO partsSaleEstimateItemVO);

    /**
     * 헤더 번호에 해당하는 모든 부품 정보를 삭제한다.
     * @param partsSaleEstimateVO - 전송할 정보가 담긴 PartsSaleEstimateVO
     * @return 삭제된 목록수
     */
    public int cancelPartsSaleEstimateItem(PartsSaleEstimateVO partsSaleEstimateVO);

    /**
     * 부품판매 정보 상태를 변경한다.
     * @param partsSaleEstimateVO - 전송할 정보가 담긴 PartsSaleEstimateVO
     * @return 변경된 목록수
     */
    public int modifyPartsSaleEstimateStat(PartsSaleEstimateVO partsSaleEstimateVO);

    /**
     * 부품판매 부품 정보를 확정한다.
     * @param partsSaleEstimateItemVO - 확정할 정보가 담긴 PartsSaleEstimateItemVO
     * @return 수정된 목록수
     */
    public int cnfmPartsSaleEstimateItem(PartsSaleEstimateItemVO partsSaleEstimateItemVO);


    /**
     * 부품판매견적Key에 해당하는 수정일자  정보를 조회한다.
     * @param partsSaleEstimateVO - 조회할 정보가 담긴 PartsSaleEstimateVO
     * @return 조회한 부품판매  정의 정보
     */
    public String selectPartsSaleEstimateUpdtDtByKey(PartsSaleEstimateVO partsSaleEstimateVO);

}
