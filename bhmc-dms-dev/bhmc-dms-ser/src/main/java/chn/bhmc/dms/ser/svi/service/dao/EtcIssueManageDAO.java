package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.svi.vo.EtcIssueManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.EtcIssueManageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InsuranceManageDAO.java
 * @Description : 기타사항관리 DAO
 * @author Kyung Mok Kim
 * @since 2016. 9. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 14.   Kyung Mok Kim     최초 생성
 * </pre>
 */
@Mapper("etcIssueManageDAO")
public interface EtcIssueManageDAO {

    /**
     * 조회조건에 해당하는 기타사항 정보 목록을 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 EtcIssueManageSearchVO
     * @return 보험 정보 목록
     */
    public List<EtcIssueManageVO> selectEtcIssueManagesByCondition(EtcIssueManageSearchVO searchVO);

    /**
     * 조회조건에 해당하는 기타사항 정보 목록 총 갯수를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 EtcIssueManageSearchVO
     * @return 보험 정보 목록 갯수
     */
    public int selectEtcIssueManagesByConditionCnt(EtcIssueManageSearchVO searchVO);

    /**
     * 기타사항 정보를 등록한다.
     *
     * @param insuMgtVO - 등록할 정보가 담긴 EtcIssueManageVO
     * @return
     */
    public int insertEtcIssueManage(EtcIssueManageVO insuMgtVO);

    /**
     * 기타사항 정보를 수정한다.
     *
     * @param insuMgtVO - 수정할 정보가 담긴 EtcIssueManageVO
     * @return
     */
    public int updateEtcIssueManage(EtcIssueManageVO insuMgtVO);

    /**
     * 기타사항 정보를 삭제한다.
     *
     * @param insuMgtVO - - 삭제할 정보가 담긴 EtcIssueManageVO
     * @return
     */
    public int deleteEtcIssueManage(EtcIssueManageVO insuMgtVO);

}
