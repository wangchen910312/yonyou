package chn.bhmc.dms.crm.slm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.crm.slm.vo.LeadInfoSearchVO;
import chn.bhmc.dms.crm.slm.vo.LeadInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CutomerInfoDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     Kyo Jin Lee     최초 생성
 * </pre>
 */

@Mapper("leadInfoDAO")
public interface LeadInfoDAO {

    public int selectLeadInfoByConditionCnt(LeadInfoSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<LeadInfoVO> selectLeadInfoByCondition(LeadInfoSearchVO searchVO);


    /**
     * 리드정보를 입력 한다.
     *
     * @param LeadInfoVO - 등록 정보가 담긴 LeadInfoVO
     * @return 등록된 목록수
     */
    public int insertLead(LeadInfoVO leadInfoVO);

    /**
     * 리드정보를 수정한다.
     *
     * @param LeadInfoVO - 등록 정보가 담긴 LeadInfoVO
     * @return 등록된 목록수
     */
    public int updateLead(LeadInfoVO leadInfoVO);

    /**
     * Key에 해당하는 리드 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param hpNo - 이동전화번호
     * @param telNo - 전화번호
     * @return 조회한 리드 정보
     */
    public LeadInfoVO selectLeadByKey(@Param("dlrCd") String dlrCd, @Param("pltCd") String pltCd, @Param("hpNo") String hpNo, @Param("telNo") String telNo);

    /**
     * Key에 해당하는 리드 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param custNo - 고객번호
     * @return 조회한 리드 정보
     */
    public int selectLeadDupByKey(@Param("dlrCd") String dlrCd, @Param("custNo") String custNo, @Param("leadTp") String leadTp, @Param("leadDupConfigDay") String leadDupConfigDay);

    /**
     * 리드번호를 채번한다.
     *
     * @param null
     * @return 리드번호
     */
    public String selectNextLeadNo();

}
