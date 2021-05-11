package chn.bhmc.dms.sal.ond.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.ond.service.ReceiveAuthorityDocPrintService;
import chn.bhmc.dms.sal.ond.service.dao.ReceiveAuthorityDocPrintDAO;
import chn.bhmc.dms.sal.ond.vo.ReceiveAuthorityDocPrintSearchVO;
import chn.bhmc.dms.sal.ond.vo.ReceiveAuthorityDocPrintVO;

/**
 * <pre>
 * 수령권한문서출력 서비스 구현 클래스
 * </pre>
 *
 * @ClassName   : ReceiveAuthorityDocPrintServiceImpl.java
 * @Description : ReceiveAuthorityDocPrintServiceImpl
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

@Service("receiveAuthorityDocPrintService")
public class ReceiveAuthorityDocPrintServiceImpl extends HService implements ReceiveAuthorityDocPrintService{

    /**
     * 수령권한문서출력 DAO
     */
    @Resource(name = "receiveAuthorityDocPrintDAO")
    ReceiveAuthorityDocPrintDAO receiveAuthorityDocPrintDAO;

    /**
     * 수령권한문서출력 수를 조회한다.
     */
    @Override
    public int selectReceiveAuthorityDocPrintListByCnt(ReceiveAuthorityDocPrintSearchVO searchVO) throws Exception {
        if (StringUtil.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };
        // ★ DLRCD???????
        return receiveAuthorityDocPrintDAO.selectReceiveAuthorityDocPrintListByCnt(searchVO);
    }

    /**
     * 수령권한문서출력 목록을 조회한다.
     */
    @Override
    public List<ReceiveAuthorityDocPrintVO> selectReceiveAuthorityDocPrintList(ReceiveAuthorityDocPrintSearchVO searchVO)
            throws Exception {
        return receiveAuthorityDocPrintDAO.selectReceiveAuthorityDocPrintList(searchVO);
    }




}
