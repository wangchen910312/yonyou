package chn.bhmc.dms.par.pcm.service.dao;

import java.util.Map;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.par.pcm.vo.PurcOrdItemSendVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdItemVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdVO;

/**
 * 구매오더 데이타 매퍼 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Ju Won Lee     최초 생성
 * </pre>
 */
@Mapper("purcOrdInterfaceDAO")
public interface PurcOrdInterfaceDAO {

    /**
     * 구매오더 인터페이스 부품 정보를 등록한다.
     * @param purcOrdVO - 등록할 정보가 담긴 PurcOrdItemVO
     * @return 등록된 목록수
     */
    public int insertPurcOrdInterfaceItem(PurcOrdItemVO purcOrdItemVO);

    /**
     * Key에 해당하는 구매오더 전송정보를 조회한다.
     * @param searchVO - 검색할 정보가 담긴 SearchVO
     * @return 조회한 구매오더 정보
     */
    public PurcOrdItemSendVO selectPurcOrdInterfaceByKey(PurcOrdSearchVO purcOrdSearchVO);
    /**
     * 根据amos返回的信息更新接口明细表的结果值
     * @param map
     * @return
     */
    public int updatePurcOrdInterfaceItem(@SuppressWarnings("rawtypes") Map map);
    
    /**
     * 根据订单号和经销商删除已存在的接口表信息
     * @param purcOrdVO
     * @return
     */
    public int deleteRepeatPurcOrdInterface(PurcOrdVO purcOrdVO);
}
