package chn.bhmc.dms.par.ism.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.ism.vo.IssuePartsResvSearchVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsResvVO;

/**
 * 부품예약 데이타 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 2. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 18.     In Bo Shim      최초 생성
 * </pre>
 */

@Mapper("issuePartsResvDAO")
public interface IssuePartsResvDAO {

    /**
     * 부품예약 정보를 등록한다.
     * @param issuePartsResv - 등록할 정보가 담긴 IssuePartsResvVO
     * @return 등록된 목록수
     */
    public int insertIssuePartsResv(IssuePartsResvVO issuePartsResvVO);

    /**
     * 부품예약 정보를 수정한다.
     * @param issuePartsResv - 수정할 정보가 담긴 IssuePartsResvVO
     * @return 수정된 목록수
     */
    public int updateIssuePartsResv(IssuePartsResvVO issuePartsResvVO);

    /**
     * 부품예약 정보를 삭제한다.
     * @param issuePartsResv - 삭제할 정보가 담긴 IssuePartsResvVO
     * @return 삭제된 목록수
     */
    public int deleteIssuePartsResv(IssuePartsResvVO issuePartsResvVO);

    /**
     * Key에 해당하는 부품예약 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 부품예약 정보
     */
    public IssuePartsResvVO selectIssuePartsResvByKey(@Param("dlrCd") String dlrCd, @Param("pltCd") String pltCd, @Param("strgeCd") String strgeCd, @Param("itemCd") String itemCd, @Param("resvDocNo") String resvDocNo, @Param("resvDocLineNo") int resvDocLineNo);

    /**
     * 조회 조건에 해당하는 부품예약 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssuePartsResvSearchVO
     * @return 조회 목록
     */
    public List<IssuePartsResvVO> selectIssuePartsResvesByCondition(IssuePartsResvSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 부품예약 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssuePartsResvSearchVO
     * @return 조회 목록 수
     */
    public int selectIssuePartsResvesByConditionCnt(IssuePartsResvSearchVO searchVO);
}
