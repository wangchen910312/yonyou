package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.svi.vo.ServiceSettingSearchVO;
import chn.bhmc.dms.ser.svi.vo.ServiceSettingVO;

/**
 * <pre>
 * 서비스 설정 처리에 대한 mapper class
 * </pre>
 *
 * @ClassName   : ServiceSettingDAO.java
 * @Description : 서비스 설정 DAO
 * @author Yin Xueyuan
 * @since 2016. 7. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 7.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Mapper("serviceSettingDAO")
public interface ServiceSettingDAO {

    /**
     * 서비스 설정 정보를 등록한다.
     * @param serviceSettingVO - 등록할 정보가 담긴 ServiceSettingVO
     * @return 등록된 목록수
     */
    public int insertServiceSetting(ServiceSettingVO serviceSettingVO);

    /**
     * 서비스 설정 정보를 수정한다.
     * @param serviceSettingVO - 수정할 정보가 담긴 ServiceSettingVO
     * @return 수정된 목록수
     */
    public int updateServiceSetting(ServiceSettingVO serviceSettingVO);

    /**
     * 서비스 설정 정보를 삭제한다.
     * @param serviceSettingVO - 삭제할 정보가 담긴 ServiceSettingVO
     * @return 삭제된 목록수
     */
    public int deleteServiceSetting(ServiceSettingVO serviceSettingVO);

    /**
     * 조회 조건에 해당하는 서비스 설정 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceSettingSearchVO
     * @return 조회 목록
     */
    public List<ServiceSettingVO> selectServiceSettingByCondition(ServiceSettingSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 서비스 설정 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceSettingSearchVO
     * @return
     */
    public int selectServiceSettingByConditionCnt(ServiceSettingSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 서비스 설정을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceSettingSearchVO
     * @return
     */
    public ServiceSettingVO selectServiceSettingByKey(ServiceSettingSearchVO searchVO);


    /**
     * 정비딜러 정보를 수정한다.
     * @param serviceSettingVO - 수정할 정보가 담긴 ServiceSettingVO
     * @return 수정된 목록수
     */
    public int updateSerDlrInfo(ServiceSettingVO serviceSettingVO);
}
