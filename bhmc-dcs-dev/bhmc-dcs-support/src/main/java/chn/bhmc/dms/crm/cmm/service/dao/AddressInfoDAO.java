package chn.bhmc.dms.crm.cmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.crm.cmm.vo.AddressInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AddressInfoDAO.java
 * @Description : 클래스 설명을 기술합니다.
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

@Mapper("addressInfoDAO")
public interface AddressInfoDAO {

    /**
     * Statements
     *
     * @param searchVO
     * @return Select Count
     */
    public int selectAddressInfoByConditionCnt(AddressInfoSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return List<AddressInfoVO>
     */
    public List<AddressInfoVO> selectAddressInfoByCondition(AddressInfoSearchVO searchVO);


    /**
     * 주소정보를 입력 한다.
     *
     * @param AddressInfoVO
     * @return Inserte Count
     */
    public int insertAddressInfo(AddressInfoVO addressInfoVO);

    /**
     * 주소정보를 수정한다.
     *
     * @param AddressInfoVO
     * @return Update Count
     */
    public int updateAddressInfo(AddressInfoVO addressInfoVO);

    /**
     * 주소정보를 삭제한다.
     *
     * @param AddressInfoVO
     * @return Delete Count
     */
    public int deleteAddressInfo(AddressInfoVO addressInfoVO);

    /**
     * Key에 해당하는 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param refTableNm - 참조테이블
     * @param refKeyNm - 참조키
     * @param addrTp - 주소유형
     * @param sFlagYn - Y : 주요주소, N : 주요 주소 아닌것, null : 전체
     * @param sUseYn - Y : 유효한 주소 , N : 유효하지 않은 주소, null : 전체
     */
    public AddressInfoVO selectAddressInfoByKey(@Param("dlrCd") String dlrCd, @Param("pltCd") String pltCd, @Param("refTableNm") String refTableNm, @Param("refKeyNm") String refKeyNm, @Param("addrTp") String addrTp, @Param("fullYn") String fullYn);


}
