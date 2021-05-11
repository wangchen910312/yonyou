package chn.bhmc.dms.sal.acc.service.dao;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.sal.acc.vo.AccessoryItemPriceVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AccessoryItemPriceDao.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 2. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 1.     Kang Seok Han     최초 생성
 * </pre>
 */
@Mapper("accessoryItemPriceDAO")
public interface AccessoryItemPriceDAO {

    /**
     * 용품가격 정보를 입력한다.
     * @param accessoryItemPriceVO
     * @return
     */
    public int insertAccessoryItemPrice(AccessoryItemPriceVO accessoryItemPriceVO);

    /**
     * 용품가격 정보를 수정한다.
     * @param accessoryItemPriceVO
     * @return
     */
    public int updateAccessoryItemPrice(AccessoryItemPriceVO accessoryItemPriceVO);

    /**
     * 용품가격 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param strgeCd - 창고코드
     * @param itemCd - 품목코드
     * @return
     */
    public AccessoryItemPriceVO selectAccessoryItemPriceByKey(@Param("dlrCd") String dlrCd, @Param("pltCd") String pltCd, @Param("strgeCd") String strgeCd, @Param("itemCd") String itemCd);

}
