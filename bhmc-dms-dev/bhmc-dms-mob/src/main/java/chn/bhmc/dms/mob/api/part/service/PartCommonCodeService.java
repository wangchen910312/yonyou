package chn.bhmc.dms.mob.api.part.service;

import java.util.List;

import chn.bhmc.dms.mob.api.part.vo.CommonCodeSearchVO;
import chn.bhmc.dms.mob.api.part.vo.CommonCodeVO;



/**
 * 공통코드 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

public interface PartCommonCodeService {

    /**
     * 공통코드 그룹에 포함된 공통코드 목록을 검색한다.
     * 配件资金查询(页面加载)
     * @param cmmGrpCd 공통코드 그룹코드
     * @param useYn 사용여부
     * @param langCd 언어코드
     * @return
     * @throws Exception
     */
    public List<CommonCodeVO> selectCommonCodesByCmmGrpCd(String cmmGrpCd, String useYn, String langCd) throws Exception;

    /**
     * 공통코드를 얼어별로 조회한다.
     *
     * @param searchVO 조회조건이 포함된  CommonCodeSearchVO
     * @return
     * @throws Exception
     */
    public List<CommonCodeVO> selectCommonCodesByCmmGrpCd(CommonCodeSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는  공통코드 정보를 조회한다.
     * @param cmmGrpCd,cmmCd - 공통코드그룹코드, 공통코드
     * @return 조회한 공통코드 정보
     */
    public CommonCodeVO selectCommonCodeByKey(String cmmGrpCd, String cmmCd) throws Exception;


    /**
     * 공통코드를 조회조건으로 검색한다.
     *
     * @param CommonCodeSearchVO - 조회조건이 포함된 CommonCodeSearchVO
     * @return 조회 조건으로 검색된 목록
     */
    public List<CommonCodeVO> selectCommonCodesByCondition(CommonCodeSearchVO searchVO) throws Exception;

    
}
