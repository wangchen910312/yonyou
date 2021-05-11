package chn.bhmc.dms.sal.fin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.fin.service.PayInfoOutBoundService;
import chn.bhmc.dms.sal.fin.service.dao.PayInfoOutBoundDAO;
import chn.bhmc.dms.sal.fin.vo.PayInfoOutBoundDetailVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoOutBoundSearchVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoOutBoundVO;

/**
 * 수납관리 서비스
 *
 * @ClassName   : PayInfoServiceImpl
 * @Description : 수납관리
 * @author
 * @since 2017. 1. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 09.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Service("payInfoOutBoundService")
public class PayInfoOutBoundServiceImpl extends HService implements PayInfoOutBoundService {

    /**
     * 계약 DAO 선언
     */
    @Resource(name="payInfoOutBoundDAO")
    PayInfoOutBoundDAO payInfoOutBoundDAO;

    /**
     * 수납관리 header목록을 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    @Override
    public List<PayInfoOutBoundVO> selectPayInfosByCondition(PayInfoOutBoundSearchVO searchVO) throws Exception{
        return payInfoOutBoundDAO.selectPayInfosByCondition(searchVO);
    }


    
    /**
     * 수납관리 HEADER 정보 생성한다.
     */
    @Override
    public int insertPayInfoHeader(PayInfoOutBoundVO saveVO) throws Exception{
        return payInfoOutBoundDAO.insertPayInfoHeader(saveVO);
    }
    /**
     * 수납관리 HEADER 정보 생성한다.
     */
    @Override
    public int updatePayInfoHeader(PayInfoOutBoundVO saveVO) throws Exception{
        return payInfoOutBoundDAO.updatePayInfoHeader(saveVO);
    }

    /**
     * 수납정산상태를 변경한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    @Override
    public int changePayInfo(PayInfoOutBoundDetailVO saveVO) throws Exception{
        if(StringUtils.isEmpty(saveVO.getFinDocNo())){
            // 관련업무 문서번호를 넣어주세요.
            throw processException("sal.info.docNoMsg"); 
        }
        
        if(StringUtils.isBlank(saveVO.getDlrCd())){
            saveVO.setDlrCd(LoginUtil.getDlrCd());
        }
        
        if("01".equals(saveVO.getPaymentTp())){
            saveVO.setCompYn("N");
        }else if("02".equals(saveVO.getPaymentTp())){ 
            saveVO.setCompYn("Y");
        }
        
        payInfoOutBoundDAO.updatePayInfoTotHeader(saveVO);
        return 1;
    }
    
    
}
