package chn.bhmc.dms.sal.dsc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.dsc.service.JudgeStepFixService;
import chn.bhmc.dms.sal.dsc.service.dao.JudgeStepFixDAO;
import chn.bhmc.dms.sal.dsc.vo.JudgeStepFixSearchVO;
import chn.bhmc.dms.sal.dsc.vo.JudgeStepFixVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : JudgeStepFixServiceImpl
 * @Description : 일상업무등급관리(심사단계설정)
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.21          최초 생성
 * </pre>
 */

@Service("judgeStepFixService")
public class JudgeStepFixServiceImpl extends HService implements JudgeStepFixService {

    /**
     * 심사단계설정 DAO 선언
     */
    @Resource(name="judgeStepFixDAO")
    JudgeStepFixDAO judgeStepFixDAO;


    /**
     * 심사단계설정 조회
     */
    @Override
    public List<JudgeStepFixVO> selectJudgeStepFixsByCondition() throws Exception{
        JudgeStepFixSearchVO vo = new JudgeStepFixSearchVO();
        vo.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return judgeStepFixDAO.selectJudgeStepFixsByCondition(vo);
    }

    /**
     * 심사단계설정 저장
     */
    @Override
    public int multiJudgeStepFixs(BaseSaveVO<JudgeStepFixVO> saveVO) throws Exception{


        // 심사단계설정 저장/수정
        for(JudgeStepFixVO fixVO : saveVO.getInsertList()){
            fixVO.setUpdtUsrId(LoginUtil.getUserId());
            fixVO.setRegUsrId(LoginUtil.getUserId());

            if(judgeStepFixDAO.selectJudgeStepFixCnt(fixVO) > 0){
                judgeStepFixDAO.updateJudgeStepFix(fixVO);
            }else{
                judgeStepFixDAO.insertJudgeStepFix(fixVO);
            }
        }

        for(JudgeStepFixVO fixVO : saveVO.getUpdateList()){
            fixVO.setUpdtUsrId(LoginUtil.getUserId());
            fixVO.setRegUsrId(LoginUtil.getUserId());

            if(judgeStepFixDAO.selectJudgeStepFixCnt(fixVO) > 0){
                judgeStepFixDAO.updateJudgeStepFix(fixVO);
            }else{
                judgeStepFixDAO.insertJudgeStepFix(fixVO);
            }
        }

        return 1;
    }

}
