package chn.bhmc.dms.par.ism.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailItemVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailSearchVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailVO;

/**
 * 부품출고 품목 데이타 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 2. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 23.     In Bo Shim      최초 생성
 * </pre>
 */

@Mapper("issuePartsOutDetailDAO")
public interface IssuePartsOutDetailDAO {

    /**
     * 부품출고 품목 정보를 등록한다.
     * @param issuePartsOutDetail - 등록할 정보가 담긴 IssuePartsOutDetailVO
     * @return 등록된 목록수
     */
    public int insertIssuePartsOutDetail(IssuePartsOutDetailVO issuePartsOutDetailVO);

    /**
     * 부품출고 품목 정보를 수정한다.
     * @param issuePartsOutDetail - 수정할 정보가 담긴 IssuePartsOutDetailVO
     * @return 수정된 목록수
     */
    public int updateIssuePartsOutDetail(IssuePartsOutDetailVO issuePartsOutDetailVO);

    /**
     * 부품출고 품목 정보를 삭제한다.
     * @param issuePartsOutDetail - 삭제할 정보가 담긴 IssuePartsOutDetailVO
     * @return 삭제된 목록수
     */
    public int deleteIssuePartsOutDetail(IssuePartsOutDetailVO issuePartsOutDetailVO);

    /**
     * Key에 해당하는 부품출고 품목 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param giDocNo - 출고문서번호
     * * @param giDocLineNo - 출고문서라인번호
     * @return 조회한 부품출고 품목 정보
     */
    public IssuePartsOutDetailVO selectIssuePartsOutDetailByKey(@Param("dlrCd") String dlrCd, @Param("giDocNo") String giDocNo, @Param("giDocLineNo") int giDocLineNo);

    /**
     * Key에 해당하는 부품출고 품목 세부정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param itemCd - 부품번호
     * @return 조회한 부품출고 품목 정보
     */
    public IssuePartsOutDetailItemVO selectIssuePartsOutDetailInfoByKey(@Param("dlrCd") String dlrCd, @Param("itemCd") String itemCd);

    /**
     * 조회 조건에 해당하는 부품출고 품목 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssuePartsOutDetailSearchVO
     * @return 조회 목록
     */
    public List<IssuePartsOutDetailVO> selectIssuePartsOutDetailsByCondition(IssuePartsOutDetailSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 부품출고 품목 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssuePartsOutDetailSearchVO
     * @return 조회 목록 수
     */
    public int selectIssuePartsOutDetailsByConditionCnt(IssuePartsOutDetailSearchVO searchVO);

    /**
     * 조회 조건에 해당하는  부품출고 마지막 출고번호정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssuePartsOutSearchVO
     * @return 조회한 부품출고 품목 정보
     */
    public IssuePartsOutDetailVO selectIssuePartsOutDetailMaxGiDocNoByKey(IssuePartsOutDetailSearchVO searchVO) throws Exception;


}
