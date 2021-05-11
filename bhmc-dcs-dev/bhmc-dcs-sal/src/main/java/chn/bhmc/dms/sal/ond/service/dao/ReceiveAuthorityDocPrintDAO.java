package chn.bhmc.dms.sal.ond.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.ond.vo.ReceiveAuthorityDocPrintSearchVO;
import chn.bhmc.dms.sal.ond.vo.ReceiveAuthorityDocPrintVO;

/**
 * <pre>
 * 수령권한문서출력 관리에 관한 데이터처리 매퍼 클래스
 * </pre>
 *
 * @ClassName   : ReceiveAuthorityDocPrintDAO.java
 * @Description : ReceiveAuthorityDocPrintDAO
 * @author Jin Choi
 * @since 2017. 3. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 6.     Jin Choi     최초 생성
 * </pre>
 */

@Mapper("receiveAuthorityDocPrintDAO")
public interface ReceiveAuthorityDocPrintDAO {

    /**
     * 수령권한문서출력 정보 목록 수를 조회한다.
     */
    public int selectReceiveAuthorityDocPrintListByCnt(ReceiveAuthorityDocPrintSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 수령권한문서출력 정보를 조회한다.
     */
    public List<ReceiveAuthorityDocPrintVO> selectReceiveAuthorityDocPrintList(ReceiveAuthorityDocPrintSearchVO searchVO) throws Exception;

}
