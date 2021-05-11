package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.SatisFactionManageSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SatisFactionManageVO;
import chn.bhmc.dms.mob.api.crm.vo.SatisFactionMobileSearchVO;

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

@Mapper("CrmsatisFactionManageDAO")
public interface CrmSatisFactionManageDAO {

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

}
