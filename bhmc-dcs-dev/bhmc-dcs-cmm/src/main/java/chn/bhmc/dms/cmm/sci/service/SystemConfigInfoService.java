package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.SystemConfigInfoVO;

/**
 * 시스템설정정보 관리 서비스
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

public interface SystemConfigInfoService {

    /**
     * 인터페이스 전송 테이블에 반영한다.
     * @throws Exception
     */
    public int insertOrUpdateSystemConfigInfoIf() throws Exception;

    /**
     * 시스템 설정정보를 수정한다.
     * @param systemConfigInfoVO - 등록할 정보가 담긴 SystemConfigInfoVO
     * @return 수정된 목록수
     */
    public int updateSystemConfigInfo(SystemConfigInfoVO systemConfigInfoVO) throws Exception;

    /**
     * 시스템 설정정보를 수정한다.
     * @param list - 수정할 정보가 담긴 List<SystemConfigInfoVO>
     */
    public void updateSystemConfigInfo(List<SystemConfigInfoVO> list) throws Exception;

    /**
     * Key에 해당하는 시스템설정 정보를 조회한다.
     * @param prefKey - 시스템 설정 정보 키
     * @return 조회한 시스템설정 정보
     */
    public SystemConfigInfoVO selectSystemConfigInfoByKey(String prefKey) throws Exception;

    /**
     * 시스템설정정보 목록을 조회한다.
     * @return 조회 목록
     */
    public List<SystemConfigInfoVO> selectSystemConfigInfos() throws Exception;

    /**
     * Key에 해당하는 시스템설정 정보를 문자열로 반환한다.
     * @param prefKey - 시스템 설정 정보 키
     * @return 조회한 시스템설정 정보를 문자열로 반환한다.
     */
    public String selectStrValueByKey(String prefKey) throws Exception;

    /**
     * Key에 해당하는 시스템설정 정보를 String 배열로 반환한다.
     * @param prefKey - 시스템 설정 정보 키
     * @return 조회한 시스템설정 정보를 String 배열로 반환한다.
     */
    public String[] selectStrValuesByKey(String prefKey) throws Exception;

}
