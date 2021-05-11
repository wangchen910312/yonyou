package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.apr.service.DocService;
import chn.bhmc.dms.cmm.apr.service.SignService;
import chn.bhmc.dms.cmm.apr.vo.DocLineSearchVO;
import chn.bhmc.dms.cmm.apr.vo.DocLineVO;
import chn.bhmc.dms.cmm.apr.vo.DocSearchVO;
import chn.bhmc.dms.cmm.apr.vo.DocVO;
import chn.bhmc.dms.cmm.apr.vo.SignLineVO;
import chn.bhmc.dms.cmm.apr.vo.SignVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.PackageCouponStandbyService;
import chn.bhmc.dms.crm.dmm.service.dao.PackageCouponStandbyDAO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponStandbySearchVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponStandbyVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageCouponStandbyServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 7. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 21.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Service("packageCouponStandbyService")
public class PackageCouponStandbyServiceImpl extends HService implements PackageCouponStandbyService{

    /**
     * 패키지쿠폰 승인대기 DAO
     */
    @Resource(name="packageCouponStandbyDAO")
    PackageCouponStandbyDAO packageCouponStandbyDAO;

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * 결재 관리 서비스
     */
    @Resource(name="signService")
    SignService signService;

    @Resource(name="signDocNoIdgenService")
    EgovIdGnrService signDocNoIdgenService;

    /**
     * 보호자원 관리 서비스
     */
    @Resource(name="docService")
    DocService docService;

    /*  // 20130318 삭제
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponStandbyService#multiPackageCouponStandbys(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiPackageCouponStandbys(BaseSaveVO<PackageCouponStandbyVO> obj) throws Exception {

        //1.결재양식 ID가 존재하는지 확인
        String signDocId = "CRM-0003";
        DocSearchVO docSchVO = new DocSearchVO();
        docSchVO.setsSignDocId(signDocId);
        List<DocVO> listDocVO = docService.selectDocsByCondition(docSchVO);
        if(listDocVO == null){
            //등록된 결재양식이 존재하지 않습니다.
            throw processException("crm.err.noSignDocId");
        }

        //2. 결재 양식이 존재할 경우 해당 결재양식에 대한 결재선 존재여부 확인
        DocLineSearchVO docLineSchVO = new DocLineSearchVO();
        docLineSchVO.setsDlrCd(LoginUtil.getDlrCd());
        docLineSchVO.setsSignDocId(signDocId);
        List<DocLineVO> docLineVO = docService.selectDocLinesByCondition(docLineSchVO);
        if(docLineVO == null){
            //등록된 결재양식에 대한 결재선이 존재하지 않습니다.
            throw processException("crm.err.noSignLine");
        }

        //3. signDocNo 생성
        String signDocNo = signDocNoIdgenService.getNextStringId();

        String membershipNo = "";//멤버십 번호
        String reqCont = ""; //결재요청상세정보
        //4. 패키지쿠폰 값이 0원일 경우 쿠폰 결재대기 테이블로 insert함
        for(PackageCouponStandbyVO packageCouponStandbyVO : obj.getInsertList()){

            packageCouponStandbyVO.setRegUsrId(LoginUtil.getUserId());
            packageCouponStandbyVO.setSignDocNo(signDocNo);
            insertPackageCouponStandby(packageCouponStandbyVO);
            membershipNo = packageCouponStandbyVO.getMembershipNo();
            reqCont += packageCouponStandbyVO.getPkgNm() + " : " + packageCouponStandbyVO.getCupnNm() + "\n";
        }
        //message(승인을 요청합니다.);
        reqCont += messageSource.getMessage("crm.info.approvalStandby",null, LocaleContextHolder.getLocale());

        //5. 결재양식에따라 결재선 및 결재정보 data Insert
        SignVO  signVO = new SignVO();
        signVO.setSignDocNo(signDocNo);
        signVO.setTempSaveYn("N");//임시저장 안함(실제저장함)
        signVO.setReqEmpNo(LoginUtil.getEmpNo());
        signVO.setSignDocId(signDocId);
        signVO.setReqUsrId(LoginUtil.getUserId()); //기안자ID
        signVO.setReqUsrNm(LoginUtil.getUserNm()); //기안자명
        signVO.setRefDocParams("membershipNo="+membershipNo);//무료쿠폰 증정은 멤버십 번호로 넣는것으로 한다.,
        signVO.setReqTitleNm(listDocVO.get(0).getSignDocNm());
        signVO.setReqCont(reqCont);//결재요청상세정보

        List<SignLineVO> insertedSignLienVO = new ArrayList<SignLineVO>();
        for(int i = 0; i < docLineVO.size(); i++ ){

            SignLineVO slineVO = new SignLineVO();
            slineVO.setSignDocNo(signDocNo);
            slineVO.setSignDocId(signDocId);
            slineVO.setSignDocLineNo(docLineVO.get(i).getSignDocLineNo());
            slineVO.setLastSignYn(docLineVO.get(i).getLastSignYn());
            slineVO.setSignTp(docLineVO.get(i).getSignTp());
            slineVO.setSignUsrNm(docLineVO.get(i).getSignUsrNm());
            slineVO.setSignUsrId(docLineVO.get(i).getSignUsrId());
            slineVO.setSignEmpNo(docLineVO.get(i).getSignEmpNo());

            //signVO.setInsertedSignLienVO(slineVO)
            insertedSignLienVO.add(slineVO);
            //insertedSignLienVO.s
        }
        signVO.setSignLines(insertedSignLienVO);

        signService.insertSign(signVO);

    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponStandbyService#insertPackageCouponStandby(chn.bhmc.dms.crm.dmm.vo.PackageCouponStandbyVO)
     */
    @Override
    public int insertPackageCouponStandby(PackageCouponStandbyVO packageCouponStandbyVO) throws Exception {
        return packageCouponStandbyDAO.insertPackageCouponStandby(packageCouponStandbyVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.PackageCouponStandbyService#selectPackageCouponStandbyCondition(chn.bhmc.dms.crm.dmm.vo.PackageCouponStandbySearchVO)
     */
    @Override
    public List<PackageCouponStandbyVO> selectPackageCouponStandbyCondition(PackageCouponStandbySearchVO searchVO)
            throws Exception {
        return packageCouponStandbyDAO.selectPackageCouponStandbyCondition(searchVO);
    }

}
