package chn.bhmc.dms.mob.api.part.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.part.vo.CommonCodeSearchVO;
import chn.bhmc.dms.mob.api.part.vo.CommonCodeVO;



/**
 * 공통코드에 관한 데이터처리 매퍼 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Mapper("PartCommonCodeDAO")
public interface PartCommonCodeDAO {

   
    /**
     * Statements
     *
     * @param searchVO
     * @param lang
     * @return
     */
    public List<CommonCodeVO> selectCommonCodesByCmmGrpCd(CommonCodeSearchVO searchVO);

    /**
     * 공통코드 정보를 주키로 검색한다.
     * @param CommonCodeVO - 등록할 정보가 담긴 CommonCodeVO
     * @return 검색된 목록수
     */
    public CommonCodeVO selectCommonCodeByKey(@Param("cmmGrpCd") String cmmGrpCd, @Param("cmmCd") String cmmCd);


    /**
     * 조회 조건에 해당하는 공통코드   정보를 조회한다.
     *
     * @param 조회 조건을 포함하는 CommonCodeSearchVO
     * @return 조회목록
     */
    public List<CommonCodeVO> selectCommonCodesByCondition(CommonCodeSearchVO searchVO);

}
