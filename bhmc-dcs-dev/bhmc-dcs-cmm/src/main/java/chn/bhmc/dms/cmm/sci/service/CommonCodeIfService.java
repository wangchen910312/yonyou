package chn.bhmc.dms.cmm.sci.service;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupTxtSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeTxtSaveVO;

/**
 * 공통코드 IF 관리 서비스
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

public interface CommonCodeIfService {

    /**
     * 공통코드 그룹 정보를 인터페이스 테이블에 등록/수정/삭제 한다.
     * @param saveVO - 등록/수정/삭제 데이터가 포함된 CommonCodeGroupSaveVO
     * @return
     */
    public void multiCommonCodeGroups(CommonCodeGroupSaveVO saveVO) throws Exception;

    /**
     * 공통코드 그룹 텍스트 정보를 인터페이스 테이블에 등록/수정/삭제 한다.
     * @param saveVO - 등록/수정/삭제 데이터가 포함된 CommonCodeGroupTxtSaveVO
     * @return
     */
    public void multiCommonCodeGroupTxts(CommonCodeGroupTxtSaveVO saveVO) throws Exception;

    /**
     * 공통코드 정보를 인터페이스 테이블에 등록/수정/삭제 한다.
     * @param saveVO - 등록/수정/삭제 데이터가 포함된 CommonCodeSaveVO
     * @return
     */
    public void multiCommonCodes(CommonCodeSaveVO saveVO) throws Exception;

    /**
     * 공통코드 텍스트 정보를 인터페이스 테이블에 등록/수정/삭제 한다.
     * @param saveVO - 등록/수정/삭제 데이터가 포함된 CommonCodeTxtSaveVO
     * @return
     */
    public void multiCommonCodeTxts(CommonCodeTxtSaveVO saveVO) throws Exception;

    /**
     * 공통코드 그룹 정보를 인터페이스 테이블에 등록한다.
     * @param commonCodeGroupVO - 등록할 정보가 담긴 CommonCodeGroupVO
     * @return 등록된 목록수
     */
    //int insertCommonCodeGroup(CommonCodeGroupVO commonCodeGroupVO) throws Exception;

    /**
     * 공통코드 그룹 정보를 인터페이스 테이블에 수정한다.
     * @param commonCodeGroupVO - 수정할 정보가 담긴 CommonCodeGroupVO
     * @return 수정된 목록수
     */
    //int updateCommonCodeGroup(CommonCodeGroupVO commonCodeGroupVO) throws Exception;

    /**
     * 공통코드 그룹 정보를 인터페이스 테이블에 반영한다 사용여부 필드(USE_YN)값을 'N'로 변경한다.
     * @param cmmGrpCd - 공통코드 그룹 코드
     * @return 삭제된 목록수
     */
    //int deleteCommonCodeGroup(String cmmGrpCd) throws Exception;



    /**
     * 공통코드 그룹 텍스트 정보를 인터페이스 테이블에 등록한다.
     * @param commonCodeGroupTxtVO - 등록할 정보가 담긴 CommonCodeGroupTxtVO
     * @return 등록된 목록수
     */
    //int insertCommonCodeGroupTxt(CommonCodeGroupTxtVO commonCodeGroupTxtVO) throws Exception;

    /**
     * 공통코드 그룹 텍스트 정보를 인터페이스 테이블에 수정한다.
     * @param commonCodeGroupTxtVO - 수정할 정보가 담긴 CommonCodeGroupTxtVO
     * @return 수정된 목록수
     */
    //int updateCommonCodeGroupTxt(CommonCodeGroupTxtVO commonCodeGroupTxtVO) throws Exception;

    /**
     * 공통코드 그룹 텍스트 정보를 인터페이스 테이블에서 삭제한다.
     * @param cmmGrpCd - 공통코드 그룹코드
     * @param langCd - 언어코드
     * @return 삭제된 목록수
     */
    //int deleteCommonCodeGroupTxt(String cmmGrpCd, String langCd) throws Exception;

    /**
     * 공통코드 정보를 인터페이스 테이블에 등록한다.
     * @param commonCodeVO - 등록할 정보가 담긴 CommonCodeVO
     * @return 등록된 목록수
     */
    //public int insertCommonCode(CommonCodeVO commonCodeVO) throws Exception;

    /**
     * 공통코드 정보를 인터페이스 테이블에 수정한다.
     * @param commonCodeVO - 수정할 정보가 담긴 CommonCodeVO
     * @return 수정된 목록수
     */
    //public int updateCommonCode(CommonCodeVO commonCodeVO) throws Exception;

    /**
     * 공통코드 정보를 인터페이스 테이블에 반영한다 사용여부 필드(USE_YN)값을 'N'으로 변경한다.
     * @param commonCodeVO - 삭제할 정보가 담긴 CommonCodeVO
     * @return 삭제된 목록수
     */
    //public int deleteCommonCode(CommonCodeVO commonCodeVO) throws Exception;



    /**
     * 공통코드 텍스트 정보를 인터페이스 테이블에 등록한다.
     * @param commonCodeTxtVO - 등록할 정보가 담긴 CommonCodeTxtVO
     * @return 등록된 목록수
     */
    //public int insertCommonCodeTxt(CommonCodeTxtVO commonCodeTxtVO) throws Exception;

    /**
     * 공통코드 텍스트 정보를 인터페이스 테이블에 수정한다.
     * @param commonCodeTxtVO - 수정할 정보가 담긴 CommonCodeTxtVO
     * @return 수정된 목록수
     */
    //public int updateCommonCodeTxt(CommonCodeTxtVO commonCodeTxtVO) throws Exception;

    /**
     * 공통코드 텍스트 정보를 인터페이스 테이블에 반영한다 사용여부 필드(USE_YN)값을 'N'으로 변경한다.
     * @param commonCodeTxtVO - 삭제할 정보가 담긴 CommonCodeTxtVO
     * @return 삭제된 목록수
     */
    //public int deleteCommonCodeTxt(CommonCodeTxtVO commonCodeTxtVO) throws Exception;



}
