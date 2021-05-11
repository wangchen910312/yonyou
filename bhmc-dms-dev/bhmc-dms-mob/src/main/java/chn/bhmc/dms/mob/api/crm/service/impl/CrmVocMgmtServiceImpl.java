package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.dao.CrmVocMgmtDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmVocMgmtService;
import chn.bhmc.dms.mob.api.crm.vo.CommonCodeVO;
import chn.bhmc.dms.mob.api.crm.vo.VocActiveVO;
import chn.bhmc.dms.mob.api.crm.vo.VocMgmtSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.VocMgmtVO;

/**
 * VOC 관리 서비스 구현 클래스
 *
 * @author hyoung jun an
 * @since 2016. 3. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.04         hyoung jun an            최초 생성
 *
 * 20160926 : VOC 작업 반영 -> sieble 과 동일하게 개발
 * 20161102 : 제조사처리배정 팝업 추가
 * 20170201 : 딜러 입력인경우 접수 완료(03) 상태 삭제후 바로 배정으로 처리 (1103 : 19, 20 참고) / 딜러 처리인 선택시 처리인의 부서 자동선택(1103 : 18 참고) / 등록시 바로 처리대기 상태로
 * 20170210 : VOC 관리 수정 - 1103 : 13, 18- 처리부문 자동 설정 추가
 * 20170210 : 처리 결과 등.. 처리할때 text append service 처리 에서 jsp 처리로 변경.
 * 20170317 : 딜러는 알람 삭제, 제조사는 IF 배치돌때만 알람, 대상자를 정책에서 등록한 사람으로 지정
 * 20170319 : 고객번호가 없을경우 고객명/전화번호로 회원자동가입 / 20170227 VOC에서 연계인 등록 삭제
 * 20170606 : [제] 클레임 > 고객내방대기방안 > 검토중인방안 에도 입력
 * 20170606 : [제] 문/평/요 저장시 활동에 입력하도록 수정 ( 기존 appen jsp에서 하던걸 service 에서 하도록 로 다시 원복)
 * 20170922 : VOC 처리 결과 입력시 VOC 활동 - [활동결과,활동내용]에 입력 -> [활동결과] 로 수정
 * </pre>
 */

@Service("CrmvocMgmtService")
public class CrmVocMgmtServiceImpl extends HService implements CrmVocMgmtService {



    /**
     * VOC 관리 DAO
     */
    @Resource(name="CrmvocMgmtDAO")
    CrmVocMgmtDAO CrmvocMgmtDAO;

    /**
     * SUB 유형 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    @Override
    public List<CommonCodeVO> selectVocTpSubCdListByCondition(VocMgmtSearchVO searchVO) throws Exception {
        searchVO.setLangCd(LoginUtil.getLangCd());
        return CrmvocMgmtDAO.selectVocTpSubCdListByCondition(searchVO);
    }

    /**
     * 성코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    @Override
    public List<CommonCodeVO> selectSungCdListByCondition(VocMgmtSearchVO searchVO) throws Exception {
        return CrmvocMgmtDAO.selectSungCdListByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<VocActiveVO> selectActivesByCondition(VocMgmtSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        searchVO.setLangCd(LoginUtil.getLangCd());

        return CrmvocMgmtDAO.selectActivesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectActivesByConditionCnt(VocMgmtSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return CrmvocMgmtDAO.selectActivesByConditionCnt(searchVO);
    }

    /**
      * VOC 목록 수량 조회
      */
     @Override
     public int selectVocMgmtsByConditionCnt(VocMgmtSearchVO searchVO) throws Exception {

         /*
          * dlrCd 체크해서 기본 셋팅 시작
          */
         if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

         return CrmvocMgmtDAO.selectVocMgmtsByConditionCnt(searchVO);
     }

     /**
      * VOC 목록 조회
      */
     @Override
     public List<VocMgmtVO> selectVocMgmtsByCondition(VocMgmtSearchVO searchVO) throws Exception {

         /*
          * dlrCd 체크해서 기본 셋팅 시작
          */
         if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

         String langCd = LocaleContextHolder.getLocale().getLanguage();
         searchVO.setLangCd(langCd);

         return CrmvocMgmtDAO.selectVocMgmtsByCondition(searchVO);
     }


     /**
      * VOC 상세 정보를 조회한다.
      * @param VocMgmtSearchVO - VOC_NO, DLR_CD
      * @return
      */
     @Override
     public VocMgmtVO selectVocMgmtByKey(VocMgmtSearchVO searchVO) throws Exception{

         /*
          * dlrCd 체크해서 기본 셋팅 시작
          */
         if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
         if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}

         if( StringUtils.isEmpty(searchVO.getsVocNo()) ){
             // [VOC 번호]을(를) 확인하여 주세요.
             throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.vocNo", null, LocaleContextHolder.getLocale())});
         }

         return CrmvocMgmtDAO.selectVocMgmtByKey(searchVO);
     }


}