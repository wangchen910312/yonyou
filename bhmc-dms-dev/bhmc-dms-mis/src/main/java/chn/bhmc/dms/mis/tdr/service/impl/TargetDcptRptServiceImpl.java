package chn.bhmc.dms.mis.tdr.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.mis.tdr.service.TargetDcptRptService;
import chn.bhmc.dms.mis.tdr.service.dao.TargetDcptRptDAO;

/**
 * <pre>
 * 목표분해 보고서
 * </pre>
 *
 * @ClassName   : TargetDcptRptServiceImpl.java
 * @Description : 목표분해 보고서
 * @author chibeom.song
 * @since 2016. 9. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 21.   chibeom.song     최초 생성
 * </pre>
 */
@Service("targetDcptRptService")
public class TargetDcptRptServiceImpl extends HService implements TargetDcptRptService {

    /**
     * 목표분해 보고서
     */
    @Resource(name="targetDcptRptDAO")
    TargetDcptRptDAO targetDcptRptDAO;

}
