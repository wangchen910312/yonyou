package chn.bhmc.dms.sal.veh.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.veh.vo.LocalOptionSearchVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LocalOptionDAO
 * @Description : 로컬옵션 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("localOptionDAO")
public interface LocalOptionDAO {


    /**
      * 조회 조건에 해당하는  정보를 조회한다.
      */
    public List<LocalOptionVO> selectLocalOptionsByCondition(LocalOptionSearchVO searchVO) throws Exception;

    /**
     *  조회 조건에 해당하는  총 갯수를 조회한다.
     */
    public int selectLocalOptionsByConditionCnt(LocalOptionSearchVO searchVO) throws Exception;

    /**
     * 로컬옵션을 저장한다.
     * @param LocalOptionVO
     * @return
     */
    public int insertLocalOptions(LocalOptionVO LocalVO) throws Exception;

    /**
     * 로컬옵션을 수정한다.
     * @param LocalOptionVO
     * @return
     */
    public int updateLocalOptions(LocalOptionVO LocalVO) throws Exception;

    /**
     * 로컬옵션 을 삭제한다.
     * @param LocalOptionVO
     * @return
     */
    public int deleteLocalOptions(LocalOptionVO LocalVO) throws Exception;

}
