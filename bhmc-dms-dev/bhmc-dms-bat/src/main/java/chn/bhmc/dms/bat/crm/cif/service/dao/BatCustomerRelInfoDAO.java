package chn.bhmc.dms.bat.crm.cif.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerRelInfoVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatCustomerRelInfoDAO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin LEE
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kyo Jin LEE     최초 생성
 * </pre>
 */

@Mapper("batCustomerRelInfoDAO")
public interface BatCustomerRelInfoDAO {

    /**
     * 인터페이스 테이블
     */
    public int selectCustomerRelIfByConditionCnt(BatCustomerRelInfoVO searchVO);
    public List<BatCustomerRelInfoVO> selectCustomerRelIfByCondition(BatCustomerRelInfoVO searchVO);
    public int updateCustomerRelInfoIf(BatCustomerRelInfoVO batCustomerRelInfoVO);

    /**
     * 연계인 테이블
     */
    //public int selectCustomerRelByConditionCnt(BatCustomerRelInfoVO searchVO);
    //public List<BatCustomerRelInfoVO> selectCustomerRelByCondition(BatCustomerRelInfoVO searchVO);

    public int insertCustomerRel(BatCustomerRelInfoVO batCustomerRelInfoVO);


}
