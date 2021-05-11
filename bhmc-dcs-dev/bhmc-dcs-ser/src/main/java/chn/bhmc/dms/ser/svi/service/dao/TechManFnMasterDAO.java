package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.svi.vo.TechManFnMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.TechManFnMasterVO;

/**
 * <pre>
 * 테크멘 기능관리 처리에 대한 mapper class
 * </pre>
 *
 * @ClassName   : TechManFnMasterDAO.java
 * @Description : 테크멘 기능관리 DAO
 * @author Yin Xueyuan
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Mapper("techManFnMasterDAO")
public interface TechManFnMasterDAO {

    /**
     * 테크멘 기능관리 정보를 등록한다.
     * @param techManFnMasterVO - 등록할 정보가 담긴 TechManFnMasterVO
     * @return 등록된 목록수
     */
    public int insertTechManFnMaster(TechManFnMasterVO techManFnMasterVO);

    /**
     * 테크멘 기능관리 정보를 수정한다.
     * @param techManFnMasterVO - 수정할 정보가 담긴 TechManFnMasterVO
     * @return 수정된 목록수
     */
    public int updateTechManFnMaster(TechManFnMasterVO techManFnMasterVO);

    /**
     * 테크멘 기능관리 정보를 삭제한다.
     * @param techManFnMasterVO - 삭제할 정보가 담긴 TechManFnMasterVO
     * @return 삭제된 목록수
     */
    public int deleteTechManFnMaster(TechManFnMasterVO techManFnMasterVO);

    /**
     * 조회 조건에 해당하는 테크멘 기능관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TechManFnMasterSearchVO
     * @return 조회 목록
     */
    public List<TechManFnMasterVO> selectTechManFnMasterByCondition(TechManFnMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 테크멘 기능관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TechManFnMasterSearchVO
     * @return
     */
    public int selectTechManFnMasterByConditionCnt(TechManFnMasterSearchVO searchVO);

}
