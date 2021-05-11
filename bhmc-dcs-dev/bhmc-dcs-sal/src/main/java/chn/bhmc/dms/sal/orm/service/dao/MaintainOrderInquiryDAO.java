package chn.bhmc.dms.sal.orm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.orm.vo.MaintainOrderInquirySearchVO;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderInquiryVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MaintainOrderInquiryDAO
 * @Description : 오더유지 및 조회 DAO
 * @author Bong
 * @since 2016. 4. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.18         Bong            최초 생성
 * </pre>
 */

@Mapper("maintainOrderInquiryDAO")
public interface MaintainOrderInquiryDAO {

    /**
     * 년월의 초기값을 조회한다.
     */
    public String selectSysDt();

    /**
      * 조회 조건에 해당하는  정보를 조회한다.
      */
    public List<MaintainOrderInquiryVO> selectMaintainOrderInquiryByCondition(MaintainOrderInquirySearchVO searchVO);

    /**
     *  조회 조건에 해당하는  총 갯수를 조회한다.
     */
    public int selectMaintainOrderInquiryByConditionCnt(MaintainOrderInquirySearchVO searchVO);


    /**
     * 취소 가능일정을 체크한다.
     */
    public List<MaintainOrderInquiryVO> selectCheckCancelDt(MaintainOrderInquiryVO searchVO);

    /**
     * 위약오더 취소 가능여부를 조회한다.
     */
    public List<MaintainOrderInquiryVO> selectCheckCancelYn(MaintainOrderInquiryVO searchVO);

    /**
     * 오더 유지 및 조회 연장/취소 여부를 업데이트한다.
     * @param MaintainOrderInquiryVO
     * @return
     */
    public int updateMaintainOrderInquiry(MaintainOrderInquiryVO saveVO);


}
