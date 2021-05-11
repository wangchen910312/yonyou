package chn.bhmc.dms.bat.cmm.ath.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RoleIfDAO.java
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

@Mapper("roleIfDAO")
public interface RoleIfDAO {

    /**
     * 역할정보 테이블[CM_0804T]에서 역할정보 송신 테이블[CM_0804IS]에 반영한다.
     * @param day 조회기간(일)
     * @return
     */
    public int insertRoleIf(int day);

    /**
     * 역할계층정보 테이블[CM_0805T]에서 역할계층정보 송신 테이블[CM_0805IS]에 반영한다.
     * @param day 조회기간(일)
     * @return
     */
    public int insertRoleHierarchyIf(int day);

    /**
     * 역할-직무매핑정보 테이블[CM_0803T]에서 역할-직무매핑정보 송신 테이블[CM_0803IS]에 반영한다.
     * @param day 조회기간(일)
     * @return
     */
    public int insertRoleAuthoritiesIf(int day);

    /**
     * 화면계층정보 테이블[CM_0808T]에서 화면계층정보 송신 테이블[CM_0808IS]에 반영한다.
     * @param day 조회기간(일)
     * @return
     */
    public int insertViewHierarchyIf(int day);

    /**
     * 화면정보 테이블[CM_0809T]에서 화면정보 송신 테이블[CM_0809IS]에 반영한다.
     * @param day 조회기간(일)
     * @return
     */
    public int insertViewInfoIf(int day);

    /**
     * 화면정보-역할매핑정보 테이블[CM_0810T]에서 화면정보-역할매핑정보 송신 테이블[CM_0810IS]에 반영한다.
     * @param day 조회기간(일)
     * @return
     */
    public int insertViewAuthoritiesIf(int day);
}
