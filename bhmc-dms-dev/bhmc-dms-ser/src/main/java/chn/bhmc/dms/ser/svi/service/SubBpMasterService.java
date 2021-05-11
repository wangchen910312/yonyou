package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.ser.svi.vo.SubBpMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.SubBpMasterVO;

/**
 * <pre>
 * 외주거래처 관리 Service
 * </pre>
 *
 * @ClassName   : SubBpMasterService.java
 * @Description : 외주거래처 관리 Service
 * @author Yin Xueyuan
 * @since 2016. 2. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 24.   Yin Xueyuan      최초 생성
 * </pre>
 */

public interface SubBpMasterService {

    /**
     * 외주거래처 정보를 등록한다.
     * @param subBpMasterVO - 등록할 정보가 담긴 SubBpMasterVO
     * @return 등록된 목록수
     */
    public int insertSubBpMaster(SubBpMasterVO subBpMasterVO) throws Exception;

    /**
     * 외주거래처 정보를 수정한다.
     * @param subBpMasterVO - 수정할 정보가 담긴 SubBpMasterVO
     * @return 수정된 목록수
     */
    public int updateSubBpMaster(SubBpMasterVO subBpMasterVO) throws Exception;

    /**
     * 외주거래처 정보를 삭제한다.
     * @param subBpMasterVO - 삭제할 정보가 담긴 SubBpMasterVO
     * @return 삭제된 목록수
     */
    public int deleteSubBpMaster(SubBpMasterVO subBpMasterVO) throws Exception;


    /**
     * 외주거래처 정보를 등록/수정/삭제 처리한다.
     * @param subBpMasterSaveVO
     */
    public void multiSubBpMasters(BaseSaveVO<SubBpMasterVO> subBpMasterSaveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 외주거래처 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SubBpMasterSearchVO
     * @return 조회 목록
     */
    public List<SubBpMasterVO> selectSubBpMasterByCondition(SubBpMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 외주거래처 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SubBpMasterSearchVO
     * @return
     */
    public int selectSubBpMasterByConditionCnt(SubBpMasterSearchVO searchVO) throws Exception;

}
