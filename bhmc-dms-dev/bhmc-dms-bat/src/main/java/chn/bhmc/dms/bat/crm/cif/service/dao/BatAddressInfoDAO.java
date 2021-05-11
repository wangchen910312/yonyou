package chn.bhmc.dms.bat.crm.cif.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.crm.cif.vo.BatAddressInfoSearchVO;
import chn.bhmc.dms.bat.crm.cmm.vo.BatAddressInfoVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatAddressInfoDAO
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

@Mapper("batAddressInfoDAO")
public interface BatAddressInfoDAO {

    /**
     * 인터페이스 테이블
     */
    public int selectAddressInfoIfByConditionCnt(BatAddressInfoSearchVO searchVO);
    public List<BatAddressInfoVO> selectAddressInfoIfByCondition(BatAddressInfoSearchVO searchVO);
    public int updateAddressInfoIf(BatAddressInfoVO batAddressInfoVO);

    /**
     * 주소 테이블
     */
    //public int selectAddressInfoByConditionCnt(BatAddressInfoSearchVO searchVO);
    //public List<BatAddressInfoVO> selectAddressInfoByCondition(BatAddressInfoSearchVO searchVO);

    public int insertAddressInfo(BatAddressInfoVO batAddressInfoVO);


}
