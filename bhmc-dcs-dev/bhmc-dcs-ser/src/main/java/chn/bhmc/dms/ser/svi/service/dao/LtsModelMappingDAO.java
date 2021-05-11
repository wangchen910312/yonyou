package chn.bhmc.dms.ser.svi.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.svi.vo.LtsModelMappingVO;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LtsModelMappingDAO.java
 * @Description : LTS MODEL 매핑 DAO
 * @author Ki Hyun Kwon
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.     Ki Hyun Kwon     최초 생성
 * </pre>
 */
@Mapper("ltsModelMappingDAO")
public interface LtsModelMappingDAO {

    /**
     * VIN 별 LTS MODEL 매핑 데이터를 조회한다.
     *
     * @param ltsModel
     * @return
     */
    public List<LtsModelMappingVO> selectLtsModelByKey(String vinNo) throws Exception;

    /**
     * 
     * LTS MODEL 정보 를 가져온다.
     *
     * @param searchVO - lts model code
     * @return
     * @throws Exception
     */
    public LtsModelMappingVO selectLtsModelInfosByCondition(LtsModelSearchVO searchVO) throws Exception;
    /**
     * 
     * LTS MODEL 정보 LIST 를 가져온다.
     *
     * @param searchVO - lts model code
     * @return
     * @throws Exception
     */
    public List<LtsModelMappingVO> selectLtsModelsByCondition(LtsModelSearchVO searchVO) throws Exception;

}
