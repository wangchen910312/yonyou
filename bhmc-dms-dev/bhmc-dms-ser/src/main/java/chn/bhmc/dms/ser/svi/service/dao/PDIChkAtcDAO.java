package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.svi.vo.PDIChkAtcSearchVO;
import chn.bhmc.dms.ser.svi.vo.PDIChkAtcVO;

/**
 * <pre>
 * PDI점검항목 처리에 대한 mapper class
 * </pre>
 *
 * @ClassName   : PDIChkAtcDAO.java
 * @Description : PDI점검항목 DAO
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

@Mapper("pDIChkAtcDAO")
public interface PDIChkAtcDAO {

    /**
     * PDI점검항목 정보를 등록한다.
     * @param pDIChkAtcVO - 등록할 정보가 담긴 pDIChkAtcVO
     * @return 등록된 목록수
     */
    public int insertPDIChkAtc (PDIChkAtcVO pDIChkAtcVO);

    /**
     * PDI점검항목 정보를 수정한다.
     * @param pDIChkAtcVO - 수정할 정보가 담긴 pDIChkAtcVO
     * @return 수정된 목록수
     */
    public int updatePDIChkAtc(PDIChkAtcVO pDIChkAtcVO);

    /**
     * PDI점검항목 정보를 삭제한다.
     * @param pDIChkAtcVO - 삭제할 정보가 담긴 pDIChkAtcVO
     * @return 삭제된 목록수
     */
    public int deletePDIChkAtc(PDIChkAtcVO pDIChkAtcVO);

    /**
     * 조회 조건에 해당하는 PDI점검항목 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PDIChkAtcSearchVO
     * @return 조회 목록
     */
    public List<PDIChkAtcVO> selectPDIChkAtcByCondition(PDIChkAtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 PDI점검항목 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PDIChkAtcSearchVO
     * @return
     */
    public int selectPDIChkAtcByConditionCnt(PDIChkAtcSearchVO searchVO);

}
