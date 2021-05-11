package chn.bhmc.dms.ser.svi.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.ser.svi.vo.PDIChkAtcSearchVO;
import chn.bhmc.dms.ser.svi.vo.PDIChkAtcVO;

/**
 * <pre>
 * PDI점검항목 관리 Service
 * </pre>
 *
 * @ClassName   : PDIChkAtcService.java
 * @Description : PDI점검항목 관리 Service
 * @author Yin Xueyuan
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.   Yin Xueyuan      최초 생성
 * </pre>
 */

public interface PDIChkAtcService {

    /**
     * PDI점검항목 정보를 등록한다.
     * @param pDIChkAtcVO - 등록할 정보가 담긴 PDIChkAtcVO
     * @return 등록된 목록수
     */
    public int insertPDIChkAtc (PDIChkAtcVO pDIChkAtcVO) throws Exception;

    /**
     * PDI점검항목 정보를 수정한다.
     * @param pDIChkAtcVO - 수정할 정보가 담긴 PDIChkAtcVO
     * @return 수정된 목록수
     */
    public int updatePDIChkAtc(PDIChkAtcVO pDIChkAtcVO) throws Exception;

    /**
     * PDI점검항목 정보를 삭제한다.
     * @param pDIChkAtcVO - 삭제할 정보가 담긴 PDIChkAtcVO
     * @return 삭제된 목록수
     */
    public int deletePDIChkAtc(PDIChkAtcVO pDIChkAtcVO) throws Exception;

    /**
     * PDI점검항목 정보를 등록/수정/삭제 처리한다.
     * @param pDIChkAtcSaveVO
     */
    public void multiPDIChkAtcs(BaseSaveVO<PDIChkAtcVO> pDIChkAtcSaveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 PDI점검항목 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PDIChkAtcSearchVO
     * @return 조회 목록
     */
    public List<PDIChkAtcVO> selectPDIChkAtcByCondition(PDIChkAtcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 PDI점검항목 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PDIChkAtcSearchVO
     * @return
     */
    public int selectPDIChkAtcByConditionCnt(PDIChkAtcSearchVO searchVO) throws Exception;

}
