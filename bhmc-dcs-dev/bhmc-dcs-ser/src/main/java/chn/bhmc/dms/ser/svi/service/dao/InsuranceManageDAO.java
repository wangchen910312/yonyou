package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.svi.vo.InsuranceManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.InsuranceManageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InsuranceManageDAO.java
 * @Description : 보험관리 DAO
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
@Mapper("insuranceManageDAO")
public interface InsuranceManageDAO {

    /**
     * 조회조건에 해당하는 보험 정보 목록을 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 InsuranceManageSearchVO
     * @return 보험 정보 목록
     */
    public List<InsuranceManageVO> selectInsuranceManagesByCondition(InsuranceManageSearchVO searchVO);

    /**
     * 조회조건에 해당하는 보험 정보 목록 총 갯수를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 InsuranceManageSearchVO
     * @return 보험 정보 목록 갯수
     */
    public int selectInsuranceManagesByConditionCnt(InsuranceManageSearchVO searchVO);

    /**
     * 보험 정보를 등록한다.
     *
     * @param insuMgtVO - 등록할 정보가 담긴 InsuranceManageVO
     * @return
     */
    public int insertInsuranceManage(InsuranceManageVO insuMgtVO);

    /**
     * 보험 정보를 수정한다.
     *
     * @param insuMgtVO - 수정할 정보가 담긴 InsuranceManageVO
     * @return
     */
    public int updateInsuranceManage(InsuranceManageVO insuMgtVO);

    /**
     * 보험 정보를 삭제한다.
     *
     * @param insuMgtVO - - 삭제할 정보가 담긴 InsuranceManageVO
     * @return
     */
    public int deleteInsuranceManage(InsuranceManageVO insuMgtVO);

    /**
     * Key에 해당하는 보험관리 정보를 조회한다.
     * @param mesgKey - 보험관리 저장 정보
     * @return 조회한 보험관리 정보
     */
    public InsuranceManageVO selectInsuranceManageByKey(InsuranceManageVO insuVO);

}
