package chn.bhmc.dms.sal.acc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.acc.vo.AccessoryMngItemVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AccessoryMngDAO
 * @Description : 경품판매관리 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 30.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Mapper("accessoryMngDAO")
public interface AccessoryMngDAO {


    /**
     * 경품판매관리 내역을 조회한다.
     */
    public int selectAccessoryMngsByConditionCnt(AccessoryMngSearchVO searchVO) throws Exception;
    public List<AccessoryMngVO> selectAccessoryMngsByCondition(AccessoryMngSearchVO searchVO) throws Exception;


    /**
     * 경품판매관리 아이템 내역을 조회한다.
     */
    public int selectAccessoryMngItemsByConditionCnt(AccessoryMngSearchVO searchVO) throws Exception;
    public List<AccessoryMngItemVO> selectAccessoryMngItemsByCondition(AccessoryMngSearchVO searchVO) throws Exception;

    /**
     * 경품판매관리 저장
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertAccessoryMng(AccessoryMngVO saveVO) throws Exception;

    /**
     * 경품판매관리 수정
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateAccessoryMng(AccessoryMngVO saveVO) throws Exception;

    /**
     * 경품판매관리item 저장
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertAccessoryMngItem(AccessoryMngItemVO itemVO) throws Exception;

    /**
     * 경품판매관리item 수정
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateAccessoryMngItem(AccessoryMngItemVO itemVO) throws Exception;

    /**
     * 경품판매관리item 삭제
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteAccessoryMngItem(AccessoryMngItemVO itemVO) throws Exception;

}