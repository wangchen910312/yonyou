package chn.bhmc.dms.bat.crm.cif.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerGroupSearchVO;
import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerGroupVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : batCustomerGroupDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Kyo Jin Lee     최초 생성
 * </pre>
 */

@Mapper("batCustomerGroupDAO")
public interface BatCustomerGroupDAO {

    /**
     * 조회 조건에 해당하는 고객그룹 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CustomerGrouopSearchVO
     * @return
     */
    public int selectCustomerGroupByConditionCnt(BatCustomerGroupSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 고객그룹 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CustomerGrouopSearchVO
     * @return
     */
    public List<BatCustomerGroupVO> selectCustomerGroupByCondition(BatCustomerGroupSearchVO searchVO);

    /**
     * 그룹 정보를 등록한다.
     * @param BatCustomerGroupVO - 등록할 정보가 담긴 BatCustomerGroupVO
     * @return 등록된 목록수
     */
    public int insertCustomerGroup(BatCustomerGroupVO batCustomerGroupVO);

    /**
     * 그룹 정보를 수정한다.
     * @param BatCustomerGroupVO - 수정할 정보가 담긴 BatCustomerGroupVO
     * @return 수정된 목록수
     */
    public int updateCustomerGroup(BatCustomerGroupVO batCustomerGroupVO);


    /**
     * 그룹 정보를 삭제한다.
     * @param BatCustomerGroupVO - 삭제할 정보가 담긴 BatCustomerGroupVO
     * @return 삭제된 목록수
     */
    public int deleteCustomerGroup(BatCustomerGroupVO batCustomerGroupVO);

    /**
     * 고객의 그룹 정보를 수정한다.
     * @param BatCustomerGroupVO - 수정할 정보가 담긴 BatCustomerGroupVO
     * @return 수정된 목록수
     */
    public int updateCustomerGroupChg(BatCustomerGroupVO batCustomerGroupVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustomerInGroupByConditionCnt(BatCustomerGroupSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<BatCustomerGroupVO> selectCustomerInGroupByCondition(BatCustomerGroupSearchVO searchVO);

    /**
     * 고객의 그룹 정보를 등록한다.
     * @param BatCustomerGroupVO - 등록할 정보가 담긴 BatCustomerGroupVO
     * @return 등록된 목록수
     */
    public int insertCustomerGroupInfo(BatCustomerGroupVO batCustomerGroupVO);

    /**
     * 고객의 그룹 정보를 삭제한다.
     * @param BatCustomerGroupVO - 등록할 정보가 담긴 BatCustomerGroupVO
     * @return 삭제 수
     */
    public int deleteCustomerGroupInfo(@Param("custNo") String custNo, @Param("grpTp") String grpTp, @Param("dlrCd") String dlrCd, @Param("pltCd") String pltCd);

    /**
     * 고객의 그룹 목록을 조회한다.
     * @param BatCustomerGroupVO - 등록할 정보가 담긴 BatCustomerGroupVO
     * @return 목록
     */
    public List<BatCustomerGroupVO> selectCustomerGroupByKey(BatCustomerGroupVO batCustomerGroupVO);
}
