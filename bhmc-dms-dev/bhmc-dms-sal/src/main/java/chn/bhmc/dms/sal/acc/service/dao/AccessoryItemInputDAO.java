package chn.bhmc.dms.sal.acc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.pcm.service.dao.InvcDAO;
import chn.bhmc.dms.par.pcm.vo.InvcItemVO;
import chn.bhmc.dms.par.pcm.vo.InvcVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemInputSearchVO;

/**
 * 용품입고 관리 DAO
 *
 * @ClassName   : AccessoryItemInputDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 2. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 9.     Kang Seok Han     최초 생성
 * </pre>
 */
@Mapper("accessoryItemInputDAO")
public interface AccessoryItemInputDAO extends InvcDAO {

    /**
     * 용품입고 문서 목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<InvcVO> selectAccessoryItemInputDocsByCondition(AccessoryItemInputSearchVO searchVO);

    /**
     * 용품입고 문서 목록수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAccessoryItemInputDocsByConditionCnt(AccessoryItemInputSearchVO searchVO);

    /**
     * 용품입고 품목을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<InvcItemVO> selectAccessoryItemInputItemsByCondition(AccessoryItemInputSearchVO searchVO);

    /**
     * 용품입고 품목수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAccessoryItemInputItemsByConditionCnt(AccessoryItemInputSearchVO searchVO);
}
