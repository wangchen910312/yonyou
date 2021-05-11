package chn.bhmc.dms.crm.cso.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.ContactHistoryService;
import chn.bhmc.dms.crm.cso.service.dao.ContactHistoryDAO;
import chn.bhmc.dms.crm.cso.vo.ContactHistorySearchVO;
import chn.bhmc.dms.crm.cso.vo.ContactHistoryVO;

/**
 * 영업 스케줄 관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.02.24.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.24         in moon lee            최초 생성
 * </pre>
 */

@Service("contactHistoryService")
public class ContactHistoryServiceImpl extends HService implements ContactHistoryService {

    /**
     * 컨택히스토리 등록 DAO
     */
	@Resource(name="contactHistoryDAO")
	ContactHistoryDAO contactHistoryDAO;


	/**
	 * 컨택히스토리 등록
	 */
    @Override
    public int insertContactHistory(ContactHistoryVO contactHistoryVO) throws Exception {

        if( (contactHistoryVO.getDlrCd() == null) || (contactHistoryVO.getDlrCd().isEmpty())){
            //딜러  존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.dlrCd", null, LocaleContextHolder.getLocale())});
        }
        if( (contactHistoryVO.getCustNo() == null) || (contactHistoryVO.getCustNo().isEmpty())){
            //고객번호 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
        }
        if( (contactHistoryVO.getContactStatCd() == null) || (contactHistoryVO.getContactStatCd().isEmpty())){
            //접촉상태 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.contactStatCd", null, LocaleContextHolder.getLocale())});
        }
        if( (contactHistoryVO.getContactTp() == null) || (contactHistoryVO.getContactTp().isEmpty())){
            //접촉유형 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.contactTp", null, LocaleContextHolder.getLocale())});
        }
        if( (contactHistoryVO.getContactBizCd() == null) || (contactHistoryVO.getContactBizCd().isEmpty())){
            //업무유형 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.wrkTp", null, LocaleContextHolder.getLocale())});
        }
        if( (contactHistoryVO.getRefTableNm() == null) || (contactHistoryVO.getRefTableNm().isEmpty())){
            //출처테이블 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.refTableNm", null, LocaleContextHolder.getLocale())});
        }
        if( (contactHistoryVO.getRefKeyNm() == null) || (contactHistoryVO.getRefKeyNm().isEmpty())){
            //출처키 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.refKeyNm", null, LocaleContextHolder.getLocale())});
        }



        return contactHistoryDAO.insertContactHistory(contactHistoryVO);
    }

    /**
     * [그룹전송] 컨택히스토리 등록 ( SMS 전송 대상자 임시 테이블에서 select insert )
     */
    @Override
    public int insertGroupContactHistory(ContactHistoryVO contactHistoryVO) throws Exception {

        if( contactHistoryVO.getSmsTmplUserSeq() < 0 ){
            // {메시지전송 대상자번호} 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("crm.lbl.smsTmplUserSeq", null, LocaleContextHolder.getLocale())});
        }
        if( (contactHistoryVO.getDlrCd() == null) || (contactHistoryVO.getDlrCd().isEmpty())){
            //딜러  존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.dlrCd", null, LocaleContextHolder.getLocale())});
        }
//        if( (contactHistoryVO.getCustNo() == null) || (contactHistoryVO.getCustNo().isEmpty())){
//            //고객번호 존재하지 않습니다.
//            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
//        }
        if( (contactHistoryVO.getContactStatCd() == null) || (contactHistoryVO.getContactStatCd().isEmpty())){
            //접촉상태 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.contactStatCd", null, LocaleContextHolder.getLocale())});
        }
        if( (contactHistoryVO.getContactTp() == null) || (contactHistoryVO.getContactTp().isEmpty())){
            //접촉유형 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.contactTp", null, LocaleContextHolder.getLocale())});
        }
        if( (contactHistoryVO.getContactBizCd() == null) || (contactHistoryVO.getContactBizCd().isEmpty())){
            //업무유형 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.wrkTp", null, LocaleContextHolder.getLocale())});
        }
        if( (contactHistoryVO.getRefTableNm() == null) || (contactHistoryVO.getRefTableNm().isEmpty())){
            //출처테이블 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.refTableNm", null, LocaleContextHolder.getLocale())});
        }

        //if( (contactHistoryVO.getRefKeyNm() == null) || (contactHistoryVO.getRefKeyNm().isEmpty())){
            //출처키 존재하지 않습니다.
            //throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.refKeyNm", null, LocaleContextHolder.getLocale())});
        //}


        return contactHistoryDAO.insertGroupContactHistory(contactHistoryVO);
    }

    /**
     * 컨택히스토리 목록 수량
     */
    @Override
    public int selectMsgHistorysByConditionCnt(ContactHistorySearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}

        return contactHistoryDAO.selectMsgHistorysByConditionCnt(searchVO);
    }


    /**
     * 컨택히스토리 목록
     */
    @Override
    public List<ContactHistoryVO> selectMsgHistorysByCondition(ContactHistorySearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}

        return contactHistoryDAO.selectMsgHistorysByCondition(searchVO);
    }


}
