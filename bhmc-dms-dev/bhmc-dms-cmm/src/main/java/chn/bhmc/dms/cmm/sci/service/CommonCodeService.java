package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupTxtSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupTxtSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupTxtVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeTxtSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeTxtSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeTxtVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.cmm.sci.vo.PcaVo;

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

public interface CommonCodeService {

    /**
     * 공통코드 그룹을 조회조건으로 검색한다.
     *
     * @param CommonCodeGroupSearchVO - 조회조건이 포함된 CommonCodeGroupSearchVO
     * @return 조회 조건으로 검색된 목록수
     */
    public int selectCommonCodeGroupsByConditionCnt(CommonCodeGroupSearchVO searchVO) throws Exception;

    /**
     * 공통코드 그룹을 조회조건으로 검색한다.
     *
     * @param CommonCodeGroupSearchVO - 조회조건이 포함된 CommonCodeGroupSearchVO
     * @return 조회 조건으로 검색된 목록
     */
    public List<CommonCodeGroupVO> selectCommonCodeGroupsByCondition(CommonCodeGroupSearchVO searchVO) throws Exception;

    /**
     * 공통코드를 조회조건으로 검색한다.
     *
     * @param CommonCodeGroupSearchVO - 조회조건이 포함된 CommonCodeGroupSearchVO
     * @return 조회 조건으로 검색된 목록수
     */
    public int selectCommonCodesByConditionCnt(CommonCodeSearchVO searchVO) throws Exception;

    /**
     * 공통코드 그룹에 포함된 공통코드 목록을 검색한다.
     *
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
     * 공통코드를 조회조건으로 검색한다.
     *
     * @param CommonCodeSearchVO - 조회조건이 포함된 CommonCodeSearchVO
     * @return 조회 조건으로 검색된 목록
     */
    public List<CommonCodeVO> selectCommonCodesByCondition(CommonCodeSearchVO searchVO) throws Exception;

    /**
     * 입력, 수정, 삭제를 한꺼번에 수행한다.
     *
     * @param saveVO - 입력, 수정, 삭제 데이터가 포함된 CommonCodeSaveVO
     * @return
     */
    public void multiCommonCodes(CommonCodeSaveVO saveVO) throws Exception;

    /**
     * 공통코드 정보를 등록한다.
     * @param CommonCodeVO - 등록할 정보가 담긴 CommonCodeVO
     * @return 등록된 목록수
     */
    public int insertCommonCode(CommonCodeVO codeVO) throws Exception;

    /**
     * 공통코드 정보를 수정한다.
     * @param CommonCodeVO - 수정할 정보가 담긴 CommonCodeVO
     * @return 수정된 목록수
     */
    public int updateCommonCode(CommonCodeVO codeVO) throws Exception;

    /**
     * 공통코드 정보를 삭제한다.
     * @param CommonCodeVO - 삭제할 정보가 담긴 CommonCodeVO
     * @return 삭제된 목록수
     */
    public int deleteCommonCode(CommonCodeVO codeVO) throws Exception;

    /**
     * Key에 해당하는  공통코드 정보를 조회한다.
     * @param cmmGrpCd,cmmCd - 공통코드그룹코드, 공통코드
     * @return 조회한 공통코드 정보
     */
    public CommonCodeVO selectCommonCodeByKey(String cmmGrpCd, String cmmCd) throws Exception;

    /**
     * Key에 해당하는  공통코드 정보를 조회한다.
     * @param cmmGrpCd,cmmCd - 공통코드그룹코드, 공통코드, 비고10
     * @return 조회한 공통코드 정보
     */
    public CommonCodeVO selectCommonCodeByService(String cmmGrpCd, String remark10) throws Exception;

    /**
     * 공통코드명을 반환한다.
     * @param cmmGrpCd 공통코드 그룹코드
     * @param cmmCd 공통코드
     * @param langCd 언어코드
     * @return 공통코드명
     * @throws Exception
     */
   public String selectCommonCodeName(String cmmGrpCd, String cmmCd, String langCd) throws Exception;

    /**
     * 입력, 수정, 삭제를 한꺼번에 수행한다.
     *
     * @param saveVO - 입력, 수정, 삭제 데이터가 포함된 CommonCodeGroupSaveVO
     * @return
     */
    public void multiCommonCodeGroups(CommonCodeGroupSaveVO saveVO) throws Exception;

    /**
     * 공통코드 그룹 정보를 삭제한다.
     * @param CommonCodeGroupVO - 삭제할 정보가 담긴 CommonCodeGroupVO
     * @return 삭제된 목록수
     */
    int deleteCommonCodeGroup(CommonCodeGroupVO codeVO) throws Exception;

    /**
     * 공통코드 그룹 정보를 수정한다.
     * @param CommonCodeGroupVO - 수정할 정보가 담긴 CommonCodeGroupVO
     * @return 수정된 목록수
     */
    int updateCommonCodeGroup(CommonCodeGroupVO codeVO) throws Exception;

    /**
     * 공통코드 그룹 정보를 등록한다.
     * @param CommonCodeGroupVO - 등록할 정보가 담긴 CommonCodeGroupVO
     * @return 등록된 목록수
     */
    int insertCommonCodeGroup(CommonCodeGroupVO codeVO) throws Exception;

    /**
     * Key에 해당하는  공통코드 그룹 정보를 조회한다.
     * @param cmmGrpCd - 공통코드그룹코드
     * @return 조회한 공통코드 정보
     */
    public CommonCodeGroupVO selectCommonCodeGroupByKey(String cmmGrpCd) throws Exception;

    /**
     * 공통코드 그룹 텍스트를 조회조건으로 검색한다.
     *
     * @param searchVO - 조회조건이 포함된 CommonCodeGroupTxtSearchVO
     * @return 조회 조건으로 검색된 목록수
     */
    public int selectCommonCodeGroupTxtsByConditionCnt(CommonCodeGroupTxtSearchVO searchVO) throws Exception;

    /**
     * 공통코드 그룹 텍스트를 조회조건으로 검색한다.
     *
     * @param searchVO - 조회조건이 포함된 CommonCodeGroupTxtSearchVO
     * @return 조회 조건으로 검색된 목록
     */
    public List<CommonCodeGroupTxtVO> selectCommonCodeGroupTxtsByCondition(CommonCodeGroupTxtSearchVO searchVO) throws Exception;

    /**
     * 공통코드그룹텍스트 입력, 수정, 삭제를 한꺼번에 수행한다.
     *
     * @param saveVO - 입력, 수정, 삭제 데이터가 포함된 CommonCodeGroupTxtSaveVO
     * @return
     */
    public void multiCommonCodeGroupTxts(CommonCodeGroupTxtSaveVO saveVO) throws Exception;

    /**
     * 공통코드  텍스트를 조회조건으로 검색한다.
     *
     * @param searchVO - 조회조건이 포함된 CommonCodeTxtSearchVO
     * @return 조회 조건으로 검색된 목록수
     */
    public int selectCommonCodeTxtsByConditionCnt(CommonCodeTxtSearchVO searchVO) throws Exception;

    /**
     * 공통코드 텍스트를 조회조건으로 검색한다.
     *
     * @param searchVO - 조회조건이 포함된 CommonCodeTxtSearchVO
     * @return 조회 조건으로 검색된 목록
     */
    public List<CommonCodeTxtVO> selectCommonCodeTxtsByCondition(CommonCodeTxtSearchVO searchVO) throws Exception;

    /**
     * 공통코드텍스트 입력, 수정, 삭제를 한꺼번에 수행한다.
     *
     * @param saveVO - 입력, 수정, 삭제 데이터가 포함된 CommonCodeTxtSaveVO
     * @return
     */
    void multiCommonCodeTxts(CommonCodeTxtSaveVO saveVO) throws Exception;

    /**
     * 공통코드 비고정보를 수정한다.(정비사용)
     * @param CommonCodeVO - 수정할 정보가 담긴 CommonCodeVO
     * @return 수정된 목록수
     */
    public int updateRemarkByService(CommonCodeVO codeVO) throws Exception;

    /**
     * 공통코드 비고정보를 초기화한다.(정비사용)
     * @param CommonCodeVO - 수정할 정보가 담긴 CommonCodeVO
     * @return 수정된 목록수
     */
    public int updateInitRemarkByService(CommonCodeVO codeVO) throws Exception;
    
    /**
     * 查询省数据
     */
    public List<PcaVo> selectProvinceList() throws Exception;
    /**
     * 查询市数据
     */
    public List<PcaVo> selectCityList() throws Exception;
    /**
     * 查询区数据
     */
    public List<PcaVo> selectAreaList() throws Exception;
    
    /**
     * 修改支付方式是否使用
     * @param CommonCodeVO 
     * @return int
     */
    public int updateUseYn(CommonCodeVO codeVO) throws Exception;
    
}
