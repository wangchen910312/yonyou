package chn.bhmc.dms.bat.cmm.sms.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.cmm.sms.vo.SendSmsAmountVO;
import chn.bhmc.dms.bat.cmm.sms.vo.SmsAmountResultVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SendSmsAmountDAO
 * @Description : DCS - SMS Relay 서버간 Amount 금액 조회 ServiceImpl
 * @author Choi KyungYong
 * @since 2017. 3. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author              description
 *  ===========    ===============    ===========================
 *  2017. 3. 28.     Choi KyungYong            최초 생성
 * </pre>
 */

@Mapper("sendSmsAmountDAO")
public interface SendSmsAmountDAO {

    /**
     * 예치금 잔액 조회 딜러 리스트 조회
     * @param null
     * @return Count
     */
    public List<SendSmsAmountVO> selectDlrAllList() throws Exception;

    /**
     * 딜러별 예치금 잔액 저장
     * @param null
     * @return Count
     */
    public void updateSmsDlrAmount(SmsAmountResultVO smsAmountResultVO) throws Exception;

    /**
     * 딜러별 예치금 잔액 저장
     * @param null
     * @return Count
     */
    public void updateSmsDlrAmountIF(SmsAmountResultVO smsAmountResultVO) throws Exception;

}