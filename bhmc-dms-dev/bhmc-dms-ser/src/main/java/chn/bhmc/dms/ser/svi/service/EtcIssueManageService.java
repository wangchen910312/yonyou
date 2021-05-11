package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.ser.svi.vo.EtcIssueManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.EtcIssueManageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @Description : 기타사항관리 서비스
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

public interface EtcIssueManageService {

    /**
     * 조회조건에 해당하는 기타사항목록 총 갯수를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 EtcIssueManageSearchVO
     * @return
     */
    public int selectEtcIssueManagesByConditionCnt(EtcIssueManageSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기타사항 정보를 조회한다
     *
     * @param searchVO - 조회 조건을 포함하는 EtcIssueManageSearchVO
     * @return
     */
    public List<EtcIssueManageVO> selectEtcIssueManagesByCondition(EtcIssueManageSearchVO searchVO)throws Exception;

    /**
     * 기타사항 정보를 등록/수정/삭제 처리한다.
     *
     * @param insuMgtVO
     */
    public void multiEtcIssueMangages(BaseSaveVO<EtcIssueManageVO> insuMgtVO)throws Exception;

    /**
     * 기타사항 정보를 등록한다.
     * @param insuMgtVO - 등록할 정보가 담긴 EtcIssueManageVO
     * @return 등록된 목록수
     */
    public int insertEtcIssueManage(EtcIssueManageVO insuMgtVO)throws Exception;

    /**
     * 기타사항 정보를 수정한다.
     * @param insuMgtVO - 수정할 정보가 담긴 EtcIssueManageVO
     * @return 수정된 목록수
     */
    public int updateEtcIssueManage(EtcIssueManageVO insuMgtVO)throws Exception;

    /**
     * 기타사항 정보를 삭제한다.
     * @param insuMgtVO - 삭제할 정보가 담긴 EtcIssueManageVO
     * @return 삭제된 목록수
     */
    public int deleteEtcIssueManage(EtcIssueManageVO insuMgtVO)throws Exception;


}
