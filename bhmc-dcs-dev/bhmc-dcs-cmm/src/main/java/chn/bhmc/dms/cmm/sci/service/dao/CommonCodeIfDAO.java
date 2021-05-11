package chn.bhmc.dms.cmm.sci.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupTxtVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeTxtVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;

/**
 * 공통코드 IF 관리 DAO
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
@Mapper("commonCodeIfDAO")
public interface CommonCodeIfDAO {

    /**
     * 공통코드 그룹 정보를 인터페이스 테이블에 반영한다.
     * @param commonCodeGroupVO 등록/수정할 정보가 담긴 CommonCodeGroupVO
     * @return 반영된 목록수
     */
    public int mergeCommonCodeGroup(CommonCodeGroupVO commonCodeGroupVO);

    /**
     * 공통코드 그룹 정보를 인터페이스 테이블에 반영한다 사용여부 필드(USE_YN)값을 'N'로 변경한다.
     * @param commonCodeGroupVO 삭제할 정보가 담긴 CommonCodeGroupVO
     * @return 삭제된 목록수
     */
    int deleteCommonCodeGroup(CommonCodeGroupVO commonCodeGroupVO);

    /**
     * 공통코드 그룹 텍스트 정보를 인터페이스 테이블에 반영한다.
     * @param commonCodeGroupTxtVO 등록/수정할 정보가 담긴 CommonCodeGroupTxtVO
     * @return 반영된 목록수
     */
    public int mergeCommonCodeGroupTxt(CommonCodeGroupTxtVO commonCodeGroupTxtVO);

    /**
     * 공통코드 그룹 텍스트 정보를 인터페이스 테이블에서 삭제한다.
     * @param commonCodeGroupTxtVO 삭제할 정보가 담긴 CommonCodeGroupTxtVO
     * @return 삭제된 목록수
     */
    int deleteCommonCodeGroupTxt(CommonCodeGroupTxtVO commonCodeGroupTxtVO);

    /**
     * 공통코드 정보를 인터페이스 테이블에 반영한다.
     * @param commonCodeVO - 등록/수정할 정보가 담긴 CommonCodeVO
     * @return 반영된 목록수
     */
    public int mergeCommonCode(CommonCodeVO commonCodeVO);

    /**
     * 공통코드 정보를 인터페이스 테이블에 반영한다 사용여부 필드(USE_YN)값을 'N'으로 변경한다.
     * @param commonCodeVO - 삭제할 정보가 담긴 CommonCodeVO
     * @return 삭제된 목록수
     */
    public int deleteCommonCode(CommonCodeVO commonCodeVO);

    /**
     * 공통코드 텍스트 정보를 인터페이스 테이블에 반영한다.
     * @param commonCodeTxtVO - 등록/수정할 정보가 담긴 CommonCodeTxtVO
     * @return 반영된 목록수
     */
    public int mergeCommonCodeTxt(CommonCodeTxtVO commonCodeTxtVO);

    /**
     * 공통코드 텍스트 정보를 인터페이스 테이블에 반영한다 사용여부 필드(USE_YN)값을 'N'으로 변경한다.
     * @param commonCodeTxtVO - 삭제할 정보가 담긴 CommonCodeTxtVO
     * @return 삭제된 목록수
     */
    public int deleteCommonCodeTxt(CommonCodeTxtVO commonCodeTxtVO);


    /**
     * 공통코드 그룹 정보를 인터페이스 테이블에 등록한다.
     * @param commonCodeGroupVO - 등록할 정보가 담긴 CommonCodeGroupVO
     * @return 등록된 목록수
     */
    //int insertCommonCodeGroup(CommonCodeGroupVO commonCodeGroupVO);

    /**
     * 공통코드 그룹 정보를 인터페이스 테이블에 수정한다.
     * @param commonCodeGroupVO - 수정할 정보가 담긴 CommonCodeGroupVO
     * @return 수정된 목록수
     */
    //int updateCommonCodeGroup(CommonCodeGroupVO commonCodeGroupVO);

    /**
     * 공통코드 그룹 텍스트 정보를 인터페이스 테이블에 등록한다.
     * @param commonCodeGroupTxtVO - 등록할 정보가 담긴 CommonCodeGroupTxtVO
     * @return 등록된 목록수
     */
    //int insertCommonCodeGroupTxt(CommonCodeGroupTxtVO commonCodeGroupTxtVO);

    /**
     * 공통코드 그룹 텍스트 정보를 인터페이스 테이블에 수정한다.
     * @param commonCodeGroupTxtVO - 수정할 정보가 담긴 CommonCodeGroupTxtVO
     * @return 수정된 목록수
     */
    //int updateCommonCodeGroupTxt(CommonCodeGroupTxtVO commonCodeGroupTxtVO);



    /**
     * 공통코드 정보를 인터페이스 테이블에 등록한다.
     * @param commonCodeVO - 등록할 정보가 담긴 CommonCodeVO
     * @return 등록된 목록수
     */
    //public int insertCommonCode(CommonCodeVO commonCodeVO);

    /**
     * 공통코드 정보를 인터페이스 테이블에 수정한다.
     * @param commonCodeVO - 수정할 정보가 담긴 CommonCodeVO
     * @return 수정된 목록수
     */
    //public int updateCommonCode(CommonCodeVO commonCodeVO);



    /**
     * 공통코드 텍스트 정보를 인터페이스 테이블에 등록한다.
     * @param commonCodeTxtVO - 등록할 정보가 담긴 CommonCodeTxtVO
     * @return 등록된 목록수
     */
    //public int insertCommonCodeTxt(CommonCodeTxtVO commonCodeTxtVO);

    /**
     * 공통코드 텍스트 정보를 인터페이스 테이블에 수정한다.
     * @param commonCodeTxtVO - 수정할 정보가 담긴 CommonCodeTxtVO
     * @return 수정된 목록수
     */
    //public int updateCommonCodeTxt(CommonCodeTxtVO commonCodeTxtVO);



}
