package chn.bhmc.dms.crm.css.service.impl;

import java.util.List;
import java.util.StringTokenizer;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractVO;
import chn.bhmc.dms.crm.css.service.SatisFactionTargExtractService;
import chn.bhmc.dms.crm.css.service.dao.SatisFactionTargExtractDAO;
import chn.bhmc.dms.crm.css.vo.SatisFactionCrmTargExtractSaveVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionCrmTargExtractSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionCrmTargExtractVO;

/**
 * 만족도조사 대상자 추출조건 (조사타입이 서비스인경우) 서비스구현 클래스
 *
 * @author lee in moon
 * @since 2017.08.01.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.08.01.         lee in moon            최초 생성
 * </pre>
 */

@Service("satisFactionTargExtractService")
public class SatisFactionTargExtractServiceImpl extends HService implements SatisFactionTargExtractService {

    /**
     * 설문 템플릿 관리 DAO
     */
	@Resource(name="satisFactionTargExtractDAO")
	SatisFactionTargExtractDAO satisFactionTargExtractDAO;

    /**
     * 만족도 조사 대상자 추출 조건 저장
     */
    @Override
    public void multiTargExtractExs(SatisFactionCrmTargExtractSaveVO saveVO, int seq) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        SatisFactionCrmTargExtractSearchVO searvhVO = new SatisFactionCrmTargExtractSearchVO();
        searvhVO.setsDlrCd(dlrCd);
        searvhVO.setsSeq(seq);

        //if ( satisFactionTargExtractDAO.selectCrmTargExtractDetailsByConditionCnt(searvhVO) > 0 ) {

            List<SatisFactionCrmTargExtractVO>  obj = saveVO.getExtractSaveList();

            SatisFactionCrmTargExtractVO tempVO = new SatisFactionCrmTargExtractVO();
            tempVO.setDlrCd(dlrCd);
            tempVO.setSeq(seq);

            //추출조건번호에 해당하는 데이터를 삭제한다
            satisFactionTargExtractDAO.deleteCrmTargExtractDetail(tempVO);

            for(SatisFactionCrmTargExtractVO satisFactionCrmTargExtractVO : obj){

                /*
                 * dlrCd, pltCd 체크해서 기본 셋팅 시작
                 */
                if (StringUtils.isEmpty(satisFactionCrmTargExtractVO.getDlrCd())){satisFactionCrmTargExtractVO.setDlrCd(dlrCd);}

                if (
                        !"CRM7500319".equals(satisFactionCrmTargExtractVO.getDetlExtrTermCd()) &&
                        !"CRM7500323".equals(satisFactionCrmTargExtractVO.getDetlExtrTermCd()) &&
                        !"CRM7500355".equals(satisFactionCrmTargExtractVO.getDetlExtrTermCd()) &&
                        !"CRM7500351".equals(satisFactionCrmTargExtractVO.getDetlExtrTermCd()) &&
                        !"CRM7500352".equals(satisFactionCrmTargExtractVO.getDetlExtrTermCd()) &&
                        !"CRM7500359".equals(satisFactionCrmTargExtractVO.getDetlExtrTermCd())
                ){

                    StringTokenizer st = new StringTokenizer(satisFactionCrmTargExtractVO.getTermVal1(),"|");
                    while(st.hasMoreTokens()){
                        satisFactionCrmTargExtractVO.setTermVal1(st.nextToken());
                        satisFactionCrmTargExtractVO.setTermVal2(st.nextToken());
                    }

                }

                satisFactionCrmTargExtractVO.setSeq(seq);
                satisFactionCrmTargExtractVO.setRegUsrId(userId);
                satisFactionCrmTargExtractVO.setUpdtUsrId(userId);

                //추출조건번호에 해당하는 조건데이터를 신규생성한다.
                satisFactionTargExtractDAO.insertCrmTargExtractDetail(satisFactionCrmTargExtractVO);

            }

        //}

    }


    /**
     * 고객추출 상세 페이지 값 조회
     */
    @Override
    public List<CrmTargExtractVO> selectCrmTargExtractDetails(SatisFactionCrmTargExtractSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionTargExtractDAO.selectCrmTargExtractDetails(searchVO);
    }

}