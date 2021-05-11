package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.ser.svi.vo.ServiceSettingSaveVO;
import chn.bhmc.dms.ser.svi.vo.ServiceSettingSearchVO;
import chn.bhmc.dms.ser.svi.vo.ServiceSettingVO;

/**
 * <pre>
 * 서비스 설정 관리 Service
 * </pre>
 *
 * @ClassName   : ServiceSettingService.java
 * @Description : 서비스 설정 관리 Service
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

public interface ServiceSettingService {

    /**
     * 서비스 설정 정보를 등록한다.
     * @param serviceSettingVO - 등록할 정보가 담긴 ServiceSettingVO
     * @return 등록된 목록수
     */
    public int insertServiceSetting(ServiceSettingVO serviceSettingVO) throws Exception;

    /**
     * 서비스 설정 정보를 수정한다.
     * @param serviceSettingVO - 수정할 정보가 담긴 ServiceSettingVO
     * @return 수정된 목록수
     */
    public int updateServiceSetting(ServiceSettingVO serviceSettingVO) throws Exception;

    /**
     * 서비스 설정 정보를 삭제한다.
     * @param serviceSettingVO - 삭제할 정보가 담긴 ServiceSettingVO
     * @return 삭제된 목록수
     */
    public int deleteServiceSetting(ServiceSettingVO serviceSettingVO) throws Exception;


    /**
     * 서비스 설정 정보를 등록/수정/삭제 처리한다.
     * @param serviceSettingSaveVO
     */
    public void multiServiceSettings(ServiceSettingSaveVO saveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 서비스 설정 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceSettingSearchVO
     * @return 조회 목록
     */
    public List<ServiceSettingVO> selectServiceSettingByCondition(ServiceSettingSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 서비스 설정 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceSettingSearchVO
     * @return
     */
    public int selectServiceSettingByConditionCnt(ServiceSettingSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 서비스 설정을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceSettingSearchVO
     * @return
     */
    public ServiceSettingVO selectServiceSettingByKey(ServiceSettingSearchVO searchVO) throws Exception;

    /**
     * 서비스 설정값에 프린트지역타입에 따라 적절한 리포트네임을 가져온다.
     * @param pageNo - (1:RO문서, 2:정비정산서)
     * @return 리포트네임
     */
    public String getRptNm(int pageNo) throws Exception;
}
