package chn.bhmc.dms.bat.cmm.sci.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ZipCodeIfDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 10. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 6.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("zipCodeIfDAO")
public interface ZipCodeIfDAO {

    /**
     * 현재일자 - 조회기간(일) 이후에 등록/수정된 우편번호 목록을 우편번호 송신 테이블[CM_0205IS]에 반영한다.
     * @param day 조회기간(일)
     * @return
     */
    public int insertZipCodeIf(int day);
}
