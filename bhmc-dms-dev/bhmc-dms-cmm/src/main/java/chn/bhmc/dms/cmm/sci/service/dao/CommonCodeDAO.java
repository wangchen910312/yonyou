package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupTxtSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupTxtVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeTxtSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeTxtVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.cmm.sci.vo.PcaVo;

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

@Mapper("commonCodeDAO")
public interface CommonCodeDAO {

    /**
     * 조회 조건에 해당하는 공통코드 그룹 정보를 조회한다.
     *
     * @param 조회 조건을 포함하는 CommonCodeGroupSearchVO
     * @return 조회목록
     */
    public List<CommonCodeGroupVO> selectCommonCodeGroupsByCondition(CommonCodeGroupSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 공통코드 그룹 카운트를 조회한다.
     *
     * @param 조회 조건을 포함하는 CommonCodeGroupSearchVO
     * @return 조회 카운트
     */
    public int selectCommonCodeGroupsByConditionCnt(CommonCodeGroupSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 공통코드 카운트  정보를 조회한다.
     *
     * @param 조회 조건을 포함하는 CommonCodeSearchVO
     * @return 조회 카운트
     */
    public int selectCommonCodesByConditionCnt(CommonCodeSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 공통코드   정보를 조회한다.
     *
     * @param 조회 조건을 포함하는 CommonCodeSearchVO
     * @return 조회목록
     */
    public List<CommonCodeVO> selectCommonCodesByCondition(CommonCodeSearchVO searchVO);

    /**
     * 공통코드 정보를 등록한다.
     * @param CommonCodeVO - 등록할 정보가 담긴 CommonCodeVO
     * @return 등록된 목록수
     */
    public int insertCommonCode(CommonCodeVO codeVO);

    /**
     * 공통코드 정보를 수정한다.
     * @param CommonCodeVO - 등록할 정보가 담긴 CommonCodeVO
     * @return 수정된 목록수
     */
    public int updateCommonCode(CommonCodeVO codeVO);

    /**
     * 공통코드 정보를 삭제한다.
     * @param CommonCodeVO - 등록할 정보가 담긴 CommonCodeVO
     * @return 삭제된 목록수
     */
    public int deleteCommonCode(CommonCodeVO codeVO);

    /**
     * 공통코드 정보를 주키로 검색한다.
     * @param CommonCodeVO - 등록할 정보가 담긴 CommonCodeVO
     * @return 검색된 목록수
     */
    public CommonCodeVO selectCommonCodeByKey(@Param("cmmGrpCd") String cmmGrpCd, @Param("cmmCd") String cmmCd);

    /**
     * 공통코드 정보를 주키로 검색한다.
     * @param CommonCodeVO - 등록할 정보가 담긴 CommonCodeVO
     * @return 검색된 목록수
     */
    public CommonCodeVO selectCommonCodeByService(@Param("cmmGrpCd") String cmmGrpCd, @Param("remark10") String remark10);

    /**
     * 공통코드명을 반환한다.
     * @param cmmGrpCd 공통코드 그룹코드
     * @param cmmCd 공통코드
     * @param langCd 언어코드
     * @return 공통코드명
     * @throws Exception
     */
    public String selectCommonCodeName(@Param("cmmGrpCd") String cmmGrpCd, @Param("cmmCd") String cmmCd, @Param("langCd") String langCd);

    /**
     * 공통코드 그룹 정보 를 주키로 검색한다.
     *
     * @param CommonCodeGroupVO - 등록할 정보가 담긴 CommonCodeGroupVO
     * @return 검색된 목록수
     */
    public CommonCodeGroupVO selectCommonCodeGroupByKey(String cmmGrpCd);

    /**
     * 공통코드 그룹을 삭제한다.
     *
     * @param CommonCodeGroupVO - 삭제할 정보가 담긴 CommonCodeGroupVO
     * @return 삭제된 목록수
     */
    public int deleteCommonCodeGroup(CommonCodeGroupVO codeVO);

    /**
     * 공통코드 그룹을 수정한다.
     *
     * @param CommonCodeGroupVO - 수정될 정보가 담긴 CommonCodeGroupVO
     * @return 수정된 목록수
     */
    public int updateCommonCodeGroup(CommonCodeGroupVO codeVO);

    /**
     * 공통코드 그룹을 등록한다.
     *
     * @param CommonCodeGroupVO - 등록될 정보가 담긴 CommonCodeGroupVO
     * @return 등록된 목록수
     */
    public int insertCommonCodeGroup(CommonCodeGroupVO codeVO);

    /**
     * 공통코드 그룹 텍스트를 등록한다.
     *
     * @param CommonCodeGroupTxtVO - 등록할할 정보가 담긴 CommonCodeGroupTxtVO
     * @return 등록된 목록수
     */
    public int insertCommonCodeGroupTxt(CommonCodeGroupTxtVO codeGroupVO);

    /**
     * 공통코드 그룹 텍스트를 수정한다.
     *
     * @param CommonCodeGroupTxtVO - 수정할 정보가 담긴 CommonCodeGroupTxtVO
     * @return 수정된 목록수
     */
    public int updateCommonCodeGroupTxt(CommonCodeGroupTxtVO codeGroupVO);

    /**
     * 공통코드 그룹 텍스트를 삭제한다.
     *
     * @param CommonCodeGroupTxtVO - 삭제할 정보가 담긴 CommonCodeGroupTxtVO
     * @return 삭제된 목록수
     */
    public int deleteCommonCodeGroupTxt(CommonCodeGroupTxtVO codeGroupVO);

    /**
     * 공통코드 그룹 텍스트를 프라머리키로 조회한다.
     *
     * @param cmmGrpCd - 공통코드 그룹코드
     * @param langCd - 언어코드
     * @return CommonCodeGroupTxtVO 조회된 목록
     */
    public CommonCodeGroupTxtVO selectCommonCodeGroupTxtByKey(String cmmGrpCd, String langCd);

    /**
     * 조회 조건에 해당하는 공통코드 그룹 텍스트 정보를 조회한다.
     *
     * @param 조회 조건을 포함하는 CommonCodeGroupSearchVO
     * @return 조회목록
     */
    public List<CommonCodeGroupTxtVO> selectCommonCodeGroupTxtsByCondition(CommonCodeGroupTxtSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 공통코드 그룹 정보를 조회한다.
     *
     * @param 조회 조건을 포함하는 CommonCodeGroupSearchVO
     * @return 조회목록
     */
    public int selectCommonCodeGroupTxtsByConditionCnt(CommonCodeGroupTxtSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCommonCodeTxtsByConditionCnt(CommonCodeTxtSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CommonCodeTxtVO> selectCommonCodeTxtsByCondition(CommonCodeTxtSearchVO searchVO);

    /**
     * Statements
     *
     * @param codeGroupVO
     * @return
     */
    public int insertCommonCodeTxt(CommonCodeTxtVO codeVO);

    /**
     * Statements
     *
     * @param codeGroupVO
     * @return
     */
    public int updateCommonCodeTxt(CommonCodeTxtVO codeVO);

    /**
     * Statements
     *
     * @param codeGroupVO
     * @return
     */
    public int deleteCommonCodeTxt(CommonCodeTxtVO codeVO);

    /**
     *
     * @param cmmGrpCd
     * @param cmmCd
     * @param langCd
     * @return
     * @throws Exception
     */
    public CommonCodeGroupTxtVO selectCommonCodeTxtByKey(String cmmGrpCd, String cmmCd, String langCd);

    /**
     * Statements
     *
     * @param searchVO
     * @param lang
     * @return
     */
    public List<CommonCodeVO> selectCommonCodesByCmmGrpCd(CommonCodeSearchVO searchVO);

    /**
     * 공통코드 비고정보를 수정한다.(정비사용)
     * @param CommonCodeVO - 수정할 정보가 담긴 CommonCodeVO
     * @return 수정된 목록수
     */
    public int updateRemarkByService(CommonCodeVO codeVO);

    /**
     * 공통코드 비고정보를 초기화한다.(정비사용)
     * @param CommonCodeVO - 수정할 정보가 담긴 CommonCodeVO
     * @return 수정된 목록수
     */
    public int updateInitRemarkByService(CommonCodeVO codeVO);
    
    /**
     * 查询省市区
     * @return
     */
	public List<PcaVo> selectProvinceList();
	public List<PcaVo> selectCityList();
	public List<PcaVo> selectAreaList();
	public int updateUseYn(CommonCodeVO codeVO);
}
