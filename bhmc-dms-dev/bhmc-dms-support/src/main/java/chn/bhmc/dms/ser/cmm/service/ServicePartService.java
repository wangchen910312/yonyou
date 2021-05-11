package chn.bhmc.dms.ser.cmm.service;

import java.util.List;

import chn.bhmc.dms.ser.cmm.vo.ServiceCmmVO;
import chn.bhmc.dms.ser.cmm.vo.ServicePartVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServicePartService.java
 * @Description : 공통 부품 Service
 * @author KyungMok Kim
 * @since 2016. 8. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 23.   KyungMok Kim     최초 생성
 * </pre>
 */

public interface ServicePartService {

    /**
     * 조회 조건에 해당하는 부품 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectServicePartsByConditionCnt(TabInfoSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServicePartVO> selectServicePartsByCondition(TabInfoSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품 히스토리 을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServicePartVO> selectServicePartsHistByCondition(TabInfoSearchVO searchVO) throws Exception ;

    /**
     * 부품을 등록/수정한다.
     * @param servicePartSaveVO - 부품정보를 포함하는 ServicePartVO
     * @return
     */
    public void multiServicePart(List<ServicePartVO> servicePartSaveVO, ServiceCmmVO serviceCmmVO) throws Exception;

    /**
     * 부품을 등록/수정한다.(부품요청 인터페이스용)
     * @param servicePartSaveVO - 부품정보를 포함하는 ServicePartVO
     * @return
     */
    public void multiServicePart(List<ServicePartVO> servicePartSaveVO, ServiceCmmVO serviceCmmVO, boolean partIfYn) throws Exception;

    /**
     * 부품을 삭제한다.
     * @param servicePartVO
     * @return
     */
    public void deleteServicePart(ServicePartVO servicePartVO) throws Exception;

    /**
     * 부품을 추가한다.
     * @param servicePartVO
     * @return
     */
    public void insertServicePart(ServicePartVO servicePartVO) throws Exception;

    /**
     * 부품을 수정한다.
     * @param servicePartVO
     * @return
     */
    public void updateServicePart(ServicePartVO servicePartVO) throws Exception;

    /**
     * 정비수령에서 부품을 수정한다.
     * @param servicePartVO
     * @return
     */
    public void updateServicePartItemWork(ServicePartVO servicePartVO) throws Exception;

    /**
     * 부품 단일 조회한다.
     * @param resvDocNo
     * @return
     */
    public ServicePartVO selectServicePartByKey(TabInfoSearchVO tabInfoSearchVO) throws Exception;

    /**
     * 공임을 등록/수정/삭제한다(부품 요청 인터페이스용).
     * @param servicePartSaveVO - 공임정보를 포함하는 ServicePartVO
     * @return
     */
    public void udpateServiceParts(List<ServicePartVO> servicePartSaveVO, ServiceCmmVO serviceCmmVO) throws Exception;

    /**
     * Statements
     *
     * @param tabInfoSearchVO
     * @return
     * @throws Exception
     */
    boolean partGiQtyCheck(TabInfoSearchVO tabInfoSearchVO) throws Exception;

    /**
    *
    * Max Line No
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   public int selectServicePartMaxLineNo(TabInfoSearchVO searchVO) throws Exception;



}