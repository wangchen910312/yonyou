package chn.bhmc.dms.crm.css.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService;
import chn.bhmc.dms.crm.css.service.SatisFactionPresentService;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionPresentServiceImpl.java
 * @Description : 만족도 조사결과 현황 서비스 구현체
 * @author Kim Hyun Ho
 * @since 2016. 5. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 31.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Service("satisFactionPresentService")
public class SatisFactionPresentServiceImpl extends HService implements SatisFactionPresentService{

    /**
     *
     */
    @Resource(name="satisFactionMobileResultService")
    SatisFactionMobileResultService satisFactionMobileResultService;


    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionPresentService#updateSatisFactionPresent(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiSatisFactionPresent(BaseSaveVO<SatisFactionMobileResultVO> obj) throws Exception {
        // TODO Auto-generated method stub
        for(SatisFactionMobileResultVO saveVO : obj.getInsertList()){
            /*
             * dlrCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(saveVO.getDlrCd())){saveVO.setDlrCd(LoginUtil.getDlrCd());}
            satisFactionMobileResultService.updateSatisFactionPresent(saveVO);
        }
    }

}
