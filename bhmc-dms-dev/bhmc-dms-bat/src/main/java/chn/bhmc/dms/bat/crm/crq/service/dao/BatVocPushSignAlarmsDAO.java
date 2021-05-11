package chn.bhmc.dms.bat.crm.crq.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.crm.crq.vo.BatVocMgmtVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : batVocPushSignAlarmsBatchDAO
 * @Description : VOC PushAlarm
 * @author LEE IN MOON
 * @since 2016.12.15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016.12.15.     LEE IN MOON     최초 생성
 *  </pre>
 */

@Mapper("batVocPushSignAlarmsDAO")
public interface BatVocPushSignAlarmsDAO {

    /**
     * VOC PushAlarm
     *
     * @return
     */
    public List<BatVocMgmtVO> selectVocPushSignAlarmList() throws Exception;

}
