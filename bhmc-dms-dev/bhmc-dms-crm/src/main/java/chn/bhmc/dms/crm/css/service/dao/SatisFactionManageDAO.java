package chn.bhmc.dms.crm.css.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileSearchVO;

/**
 * 만족도 조사 관리에 관한 데이터처리 매퍼 클래스
 *
 * @author hyun ho kim
 * @since 2016. 03. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.11         hyun ho kim            최초 생성
 * </pre>
 */

@Mapper("satisFactionManageDAO")
public interface SatisFactionManageDAO {

    /**
     * 조회 조건에 해당하는 만족도 조사 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionManageSearchVO
     * @return
     */
    public int selectSatisFactionManagesByConditionCnt(SatisFactionManageSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 만족도 조사 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionManageSearchVO
     * @return 조회 목록
     */
    public List<SatisFactionManageVO> selectSatisFactionManagesByCondition(SatisFactionManageSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사  정보를 등록한다.
     * @param satisFactionManageVO - 등록할 정보가 담긴 SatisFactionManageVO
     * @return 등록된 목록수
     */
    public int insertSatisFactionManage(SatisFactionManageVO satisFactionManageVO) throws Exception;

    /**
     * 만족도 조사 정보를 수정한다.
     * @param satisFactionManageVO - 수정할 정보가 담긴 SatisFactionManageVO
     * @return 수정된 목록수
     */
    public int updateSatisFactionManage(SatisFactionManageVO satisFactionManageVO) throws Exception;

    /**
     * 만족도 조사 정보를 삭제한다.
     * @param satisFactionManageVO - 삭제할 정보가 담긴 SatisFactionManageVO
     * @return 삭제된 목록수
     */
    public int deleteSatisFactionManage(SatisFactionManageVO SatisFactionManageVO) throws Exception;

    /**
     * 조회 조건에 해당하는 만족도 조사명 kendoDropDownList 구성목록을 조회한다.
     * 조회시 쿼리조건에 조사수단이 전시장/고객휴게소방문, 기타 인것으로 한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionManageSearchVO
     * @return 조회 목록
     */
    public List<SatisFactionManageVO> selectStsfIvstNmsByCondition(SatisFactionManageSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 설문조사 key 정보를 조회한다.
     * @param sSeq - 만족도 일련번호
     * @return 조회한 설문조사 key 정보
     */
    public SatisFactionManageVO selectSurveyCdByKey(SatisFactionMobileSearchVO schMobileVO) throws Exception;

    /**
     * 만족도 조사 마지막 추출 정보를 수정한다.
     * @param satisFactionManageVO - 수정할 정보가 담긴 SatisFactionManageVO
     * @return 수정된 목록수
     */
    public int updateLastExtrDt(SatisFactionManageVO satisFactionManageVO) throws Exception;

    /**
     * 오늘 고객 추출 수량 조회 ( 배치에서 사용 )
     * @param searchVO - sDlrCd / sCurruntDt
     * @return 오늘 고객 추출 수량
     */
    public int selectSatisFactionBatchCnt(SatisFactionManageSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 관리 상세정보를 조회한다.
     * @param SatisFactionManageSearchVO - 만족도 조사 번호
     * @return 만족도 조사 정보
     */
    public SatisFactionManageVO selectSatisFactionManageByKey(SatisFactionManageSearchVO searchVO) throws Exception;

    /**
     * 만족도 유형 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조사타입 공통코드
     * @return 만족도 유형 공통코드 목록
     */
    public List<CommonCodeVO> selectStsfIvstMthCdList(SatisFactionManageSearchVO searchVO) throws Exception;

}
