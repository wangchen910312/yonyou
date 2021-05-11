package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.ser.svi.vo.InsuranceManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.InsuranceManageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @Description : 보험관리 서비스
 * @author Ki Hyun Kwon
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

public interface InsuranceManageService {

    /**
     * 조회조건에 해당하는 보험목록 총 갯수를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 InsuranceManageSearchVO
     * @return
     */
    public int selectInsuranceManagesByConditionCnt(InsuranceManageSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 보험 정보를 조회한다
     *
     * @param searchVO - 조회 조건을 포함하는 InsuranceManageSearchVO
     * @return
     */
    public List<InsuranceManageVO> selectInsuranceManagesByCondition(InsuranceManageSearchVO searchVO)throws Exception;

    /**
     * 보험 정보를 등록/수정/삭제 처리한다.
     *
     * @param insuMgtVO
     */
    public void multiInsuranceMangages(BaseSaveVO<InsuranceManageVO> insuMgtVO)throws Exception;

    /**
     * 보험 정보를 등록한다.
     * @param insuMgtVO - 등록할 정보가 담긴 InsuranceManageVO
     * @return 등록된 목록수
     */
    public int insertInsuranceManage(InsuranceManageVO insuMgtVO)throws Exception;

    /**
     * 보험 정보를 수정한다.
     * @param insuMgtVO - 수정할 정보가 담긴 InsuranceManageVO
     * @return 수정된 목록수
     */
    public int updateInsuranceManage(InsuranceManageVO insuMgtVO)throws Exception;

    /**
     * 보험 정보를 삭제한다.
     * @param insuMgtVO - 삭제할 정보가 담긴 InsuranceManageVO
     * @return 삭제된 목록수
     */
    public int deleteInsuranceManage(InsuranceManageVO insuMgtVO)throws Exception;


    /**
     * Key에 해당하는 보험관리 정보를 조회한다.
     * @param mesgKey - 보험관리 저장 정보
     * @return 조회한 보험관리 정보
     */
    public InsuranceManageVO selectInsuranceManageByKey(InsuranceManageVO insuVO)throws Exception;



}
