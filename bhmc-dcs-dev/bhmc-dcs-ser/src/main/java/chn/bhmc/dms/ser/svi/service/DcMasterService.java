package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.ser.svi.vo.DcMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.DcMasterVO;

/**
 * <pre>
 * 할인관리 관리 Service
 * </pre>
 *
 * @ClassName   : DcMasterService.java
 * @Description : 할인관리 관리 Service
 * @author Yin Xueyuan
 * @since 2016. 2. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 16.   Yin Xueyuan      최초 생성
 * </pre>
 */

public interface DcMasterService {

    /**
     * 할인관리 정보를 등록한다.
     * @param dcMasterVO - 등록할 정보가 담긴 DcMasterVO
     * @return 등록된 목록수
     */
    public int insertDcMaster (DcMasterVO dcMasterVO) throws Exception;

    /**
     * 할인관리 정보를 수정한다.
     * @param dcMasterVO - 수정할 정보가 담긴 DcMasterVO
     * @return 수정된 목록수
     */
    public int updateDcMaster(DcMasterVO dcMasterVO) throws Exception;

    /**
     * 할인관리 정보를 삭제한다.
     * @param dcMasterVO - 삭제할 정보가 담긴 DcMasterVO
     * @return 삭제된 목록수
     */
    public int deleteDcMaster(DcMasterVO dcMasterVO) throws Exception;

    /**
     * 할인관리 정보를 등록/수정/삭제 처리한다.
     * @param dcMasterSearchVO
     */
    public void multiDcMasters(BaseSaveVO<DcMasterVO> dcMasterSearchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 할인관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 dcMasterSearchVO
     * @return 조회 목록
     */
    public List<DcMasterVO> selectDcMasterByCondition(DcMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 할인관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 dcMasterSearchVO
     * @return
     */
    public int selectDcMasterByConditionCnt(DcMasterSearchVO searchVO) throws Exception;

}
