package chn.bhmc.dms.crm.cmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;

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

public interface AddressInfoService {

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

    /**
     * 주소정보를 정보를 등록/수정/삭제 처리한다.
     * @param AddressInfoVO
     */
    public void multiAddressInfo(BaseSaveVO<AddressInfoVO> addressInfoVO) throws Exception;

    /**
     * 주소정보를 입력 한다.
     *
     * @param AddressInfoVO
     * @return Inserte Count
     */
    public int insertAddressInfo(AddressInfoVO addressInfoVO) throws Exception;

    /**
     * 주소정보를 수정한다.
     *
     * @param AddressInfoVO
     * @return Update Count
     */
    public int updateAddressInfo(AddressInfoVO addressInfoVO) throws Exception;

    /**
     * 주소정보를 삭제한다.
     *
     * @param AddressInfoVO
     * @return Delete Count
     */
    public int deleteAddressInfo(AddressInfoVO addressInfoVO) throws Exception;

    /**
     * Key에 해당하는 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param refTableNm - 참조테이블
     * @param refKeyNm - 참조키
     * @param addrTp - 주소유형
     * @param sFlagYn - Y : 주요주소, N : 주요 주소 아닌것, null : 전체
     * @param sUseYn - Y : 유효한 주소 , N : 유효하지 않은 주소, null : 전체
     * @return AddressInfoVO
     */
    public AddressInfoVO selectAddressInfoByKey(String dlrCd, String pltCd, String refTableNm, String refKeyNm, String addrTp, String fullYn) throws Exception;

    /**
     * 고객번호로 주소 정보의 대표 주소 정보를 변경한다.
     *
     * @param AddressInfoVO
     * refTableNm = 'CR0101T'
     * refKeyNm = CUST_NO
     * sFlagYn = 'Y'
     * @return Update Count
     */
    public int updateAddressInfoOnCustNo(AddressInfoVO addressInfoVO) throws Exception;
}
