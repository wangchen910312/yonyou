package chn.bhmc.dms.ser.ro.service.dao;

import able.com.mybatis.Mapper;
import able.com.vo.HMap;

import chn.bhmc.dms.ser.ro.vo.ServiceAccountSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceAccountDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 10. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 22.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Mapper("serviceAccountDAO")
public interface ServiceAccountDAO {


    /**
     *
     * RO 건수
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public HMap selectServiceRoByConditionCnt(ServiceAccountSearchVO searchVO)throws Exception;

    /**
     *
     * 총매출액
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public Integer selectServiceRcvByConditionCnt(ServiceAccountSearchVO searchVO)throws Exception;

    /**
     *
     * 클레임 금액
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public HMap selectServiceClaimByConditionCnt(ServiceAccountSearchVO searchVO)throws Exception;
}
