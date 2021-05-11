package chn.bhmc.dms.crm.cso.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtVO;

/**
 * IDCC 역활 관리 서비스
 *
 * @author kyo jin lee
 * @since 2016.03.07.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.07         kyo jin lee            최초 생성
 * </pre>
 */

public interface IdccRoleMgmtService {

    /**
     * 조회 조건에 해당하는 IDCC 역활 관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IdccRoleMgmtSearchVO
     * @return int
     */
    public int selectIdccRoleAssigedMgmtsByConditionCnt(IdccRoleMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 IDCC 역활 관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IdccRoleMgmtSearchVO
     * @return int
     */
    public int selectIdccRoleMgmtsByConditionCnt(IdccRoleMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 IDCC 역활 관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IdccRoleMgmtSearchVO
     * @return List<IdccRoleMgmtVO> 조회 목록
     */
    public List<IdccRoleMgmtVO> selectIdccRoleMgmtsByCondition(IdccRoleMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 IDCC 역활 관리 정보의 role을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IdccRoleMgmtSearchVO
     * @return List<IdccRoleMgmtVO> 조회 목록
     */
    public List<IdccRoleMgmtVO> selectIdccRoleMgmtsByRole(IdccRoleMgmtSearchVO searchVO) throws Exception;


   /**
    * IDCC 역활 관리 정보를 등록한다. ( 판매기회유입유형 + 주소 )
    * @param IdccRoleMgmtVO
    * @return 등록된 목록수
    */
   public void multiIdccRole(BaseSaveVO<IdccRoleMgmtVO> saveVO) throws Exception;

   /**
    *  판매기회유입유형 정보를 등록한다.
    * @param idccRoleMgmtVO
    * @return 등록된 목록수
    */
   public int insertIdccRole(IdccRoleMgmtVO idccRoleMgmtVO) throws Exception;

   /**
    *  판매기회유입유형 정보를 수정한다.
    * @param idccRoleMgmtVO
    * @return 수정된 목록수
    */
   public int updateIdccRole(IdccRoleMgmtVO idccRoleMgmtVO) throws Exception;

}
