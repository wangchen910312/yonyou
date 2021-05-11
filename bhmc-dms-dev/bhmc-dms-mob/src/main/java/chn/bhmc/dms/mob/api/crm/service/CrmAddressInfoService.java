package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.AddressInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.AddressInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AddressInfoService.java
 * @Description : 관심차종 Service
 * @author Kyo Jin Lee
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     Kyo Jin Lee     최초 생성
 * </pre>
 */

public interface CrmAddressInfoService {

    /**
     * Statements
     *
     * @param searchVO (AddressInfoSearchVO)
     *   sDlrCd : 딜러시디
     *   sRefTableNm : 조회 할 기준 테이블 (없으면 CR_0101T 고객마스터)
     *   sRefKeyNm : 조회 할 기준 테이블 KEY (고객의 경우 고객번호)
     *   sFlagYn : 대표주소 ( 대표주소는 : Y)
     * @return List<AddressInfoVO>
     */
    public int selectAddressInfoByConditionCnt(AddressInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO (AddressInfoSearchVO)
     *   sDlrCd : 딜러시디
     *   sRefTableNm : 조회 할 기준 테이블 (없으면 CR_0101T 고객마스터)
     *   sRefKeyNm : 조회 할 기준 테이블 KEY (고객의 경우 고객번호)
     *   sFlagYn : 대표주소 ( 대표주소는 : Y)
     * @return List<AddressInfoVO>
     */
    public List<AddressInfoVO> selectAddressInfoByCondition(AddressInfoSearchVO searchVO) throws Exception;
}
