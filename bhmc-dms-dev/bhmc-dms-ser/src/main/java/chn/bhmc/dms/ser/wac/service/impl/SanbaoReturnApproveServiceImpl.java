package chn.bhmc.dms.ser.wac.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.wac.service.SanbaoReturnApproveService;
import chn.bhmc.dms.ser.wac.service.dao.SanbaoReturnApproveDAO;
import chn.bhmc.dms.ser.wac.vo.SanbaoReturnSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoReturnVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoReturnApproveServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 7. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 26.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service("sanbaoReturnApproveService")
public class SanbaoReturnApproveServiceImpl extends HService implements SanbaoReturnApproveService{

    @Resource(name="sanbaoReturnApproveDAO")
    SanbaoReturnApproveDAO sanbaoReturnApproveDAO;

    @Resource(name="sanbaoReturnApproveNoIdGenService")
    TableIdGenService sanbaoReturnApproveNoIdGenService;


    /**
    *
    * 삼포반품 승인 상세
    *
    * @return
    * @throws Exeption
    */
    public SanbaoReturnVO selectSanbaoReturnApproveByKey(SanbaoReturnSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return sanbaoReturnApproveDAO.selectSanbaoReturnApproveByKey(searchVO);
    }

    /**
    *
    * 삼포 반품승인 그리드 목록수 조회
    *
    * @return
    * @throws Exception
    */
    public int selectSanbaoReturnApproveByConditionCnt(SanbaoReturnSearchVO searchVO) throws Exception {


        return sanbaoReturnApproveDAO.selectSanbaoReturnApproveByConditionCnt(searchVO);
    }

    /**
    *
    * 삼포 반품승인 그리드 조회
    *
    * @return
    * @throws Exception
    */
    public List<SanbaoReturnVO> selectSanbaoReturnApproveByCondition(SanbaoReturnSearchVO searchVO) throws Exception {

        return sanbaoReturnApproveDAO.selectSanbaoReturnApproveByCondition(searchVO);
    }

    /**
    *
    * 삼포 반품 승인 수정.
    *
    * @param sanbaoReturnVO
    * @return
    * @throws Exception
    */
    public String updateSanbaoReturnApprove(SanbaoReturnVO sanbaoReturnVO) throws Exception {

        String userId = LoginUtil.getUserId();
        sanbaoReturnVO.setUpdtUsrId(userId);
        String returnApproveNo = "";

        //반품승인 번호 생성
        if( StringUtil.nullConvert(sanbaoReturnVO.getReturnStatCd()).equals("A")){
            returnApproveNo = sanbaoReturnApproveNoIdGenService.getNextStringId();
            sanbaoReturnVO.setReturnApproveNo(returnApproveNo);
        }

        sanbaoReturnApproveDAO.updateSanbaoReturnApprove(sanbaoReturnVO);

        return sanbaoReturnVO.getReturnApproveNo();
    }

    /**
    *
    * 삼포 반품 승인 사용 여부 수정.
    *
    * @param sanbaoReturnVO
    * @return
    * @throws Exception
    */
    public int updateSanbaoReturnApprovePWA(SanbaoReturnVO sanbaoReturnVO)throws Exception{

        if( StringUtil.nullConvert(sanbaoReturnVO.getDlrCd()).equals("")){
            sanbaoReturnVO.setDlrCd(LoginUtil.getDlrCd());
        }
        return sanbaoReturnApproveDAO.updateSanbaoReturnApprovePWA(sanbaoReturnVO);
    };



}
