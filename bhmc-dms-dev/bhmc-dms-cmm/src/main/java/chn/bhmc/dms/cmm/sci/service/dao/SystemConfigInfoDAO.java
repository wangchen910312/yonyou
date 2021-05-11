package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.SystemConfigInfoVO;

/**
 * 시스템설정에 관한 데이터처리 매퍼 클래스
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

@Mapper("systemConfigInfoDAO")
public interface SystemConfigInfoDAO {
    
    /**
     * 시스템 설정 정보를 수정한다.
     * @param systemConfigInfoVO - 등록할 정보가 담긴 SystemConfigInfoVO
     * @return 수정된 목록수
     */
    public int updateSystemConfigInfo(SystemConfigInfoVO systemConfigInfoVO);
    
    /**
     * Key에 해당하는 시스템설정 정보를 조회한다.
     * @param prefKey - 시스템 설정 정보 키
     * @return 조회한 시스템설정 정보
     */
    public SystemConfigInfoVO selectSystemConfigInfoByKey(String prefKey);
    
    /**
     * 시스템설정정보 목록을 조회한다.
     * @return 조회 목록
     */
    public List<SystemConfigInfoVO> selectSystemConfigInfos();    
}
