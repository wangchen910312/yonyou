package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.AwayCustomerSaveVO;
import chn.bhmc.dms.cmm.sci.vo.AwayCustomerSearchVO;
import chn.bhmc.dms.cmm.sci.vo.AwayCustomerVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AwayCustomerService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public interface AwayCustomerService {
    int insertAwayCustomer(AwayCustomerVO awayCustomerVO) throws Exception;

    int updateAwayCustomer(AwayCustomerVO awayCustomerVO) throws Exception;

    boolean deleteAwayCustomer(AwayCustomerVO awayCustomerVO) throws Exception;

    List<AwayCustomerVO> selectAwayCustomerByCondition(AwayCustomerSearchVO searchVO) throws Exception;

    int selectAwayCustomerByConditionCnt(AwayCustomerSearchVO searchVO) throws Exception;

    AwayCustomerVO selectAwayCustomerByPk(AwayCustomerSearchVO searchVO) throws Exception;

    int selectAwayCustomerByOverLap(AwayCustomerSearchVO searchVO) throws Exception;

    int selectAwayCustomerDelByConditionCnt(AwayCustomerSearchVO searchVO) throws Exception;

    boolean multiAwayCustomer(AwayCustomerSaveVO saveVO) throws Exception;
}