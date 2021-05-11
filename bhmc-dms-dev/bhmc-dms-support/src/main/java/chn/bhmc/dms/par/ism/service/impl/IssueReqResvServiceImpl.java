package chn.bhmc.dms.par.ism.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssueReqDetailService;
import chn.bhmc.dms.par.ism.service.IssueReqResvService;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.par.ism.service.dao.IssueReqDetailResvDAO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqResvSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;

/**
 * 부품수령 헤더 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 8. 12.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 8. 12.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("issueReqResvService")
public class IssueReqResvServiceImpl extends HService implements IssueReqResvService {

    @Resource(name="issueReqService")
    IssueReqService issueReqService;

    @Resource(name="issueReqDetailService")
    IssueReqDetailService issueReqDetailService;

    /**
     * 부품예약상세 DAO
     */
    @Resource(name="issueReqDetailResvDAO")
    private IssueReqDetailResvDAO issueReqDetailResvDAO;

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqResvService#updateIssuePartsResves(chn.bhmc.dms.par.ism.vo.IssueReqSaveVO)
     */
    @Override
    public void updateIssuePartsResves(IssueReqResvSaveVO issueReqResvSaveVO) throws Exception {

        //IssueReq update

        IssueReqVO issueReqVO = new IssueReqVO();
        issueReqVO.setParReqDocNo(issueReqResvSaveVO.getIssueReqResvVO().getParReqDocNo());
        issueReqVO.setParGiTp(issueReqResvSaveVO.getIssueReqResvVO().getParGiTp());
        issueReqVO.setParReqStatCd(issueReqResvSaveVO.getIssueReqResvVO().getParReqStatCd());
        issueReqVO.setReadyStatCd(issueReqResvSaveVO.getIssueReqResvVO().getReadyStatCd());
        issueReqVO.setCancYn(issueReqResvSaveVO.getIssueReqResvVO().getCancYn());
        issueReqVO.setRoDocNo(issueReqResvSaveVO.getIssueReqResvVO().getRoDocNo());
        issueReqVO.setResvDocNo(issueReqResvSaveVO.getIssueReqResvVO().getResvDocNo());
        issueReqVO.setPltCd(issueReqResvSaveVO.getIssueReqResvVO().getPltCd());
        issueReqVO.setSerPrsnId(issueReqResvSaveVO.getIssueReqResvVO().getSerPrsnId());
        issueReqVO.setCustCd(issueReqResvSaveVO.getIssueReqResvVO().getCustCd());
        issueReqVO.setCustNm(issueReqResvSaveVO.getIssueReqResvVO().getCustNm());
        issueReqVO.setVinNo(issueReqResvSaveVO.getIssueReqResvVO().getVinNo());
        issueReqVO.setCarNo(issueReqResvSaveVO.getIssueReqResvVO().getCarNo());
        issueReqVO.setCarlineCd(issueReqResvSaveVO.getIssueReqResvVO().getCarlineCd());
        issueReqVO.setGiDocNo(issueReqResvSaveVO.getIssueReqResvVO().getGiDocNo());
        issueReqVO.setGiDocTp(issueReqResvSaveVO.getIssueReqResvVO().getGiDocTp());
        issueReqVO.setGiDocStatCd(issueReqResvSaveVO.getIssueReqResvVO().getGiDocStatCd());
        issueReqVO.setGiStatCd(issueReqResvSaveVO.getIssueReqResvVO().getGiStatCd());
        issueReqVO.setDlrCd(LoginUtil.getDlrCd());
        issueReqVO.setUpdtUsrId(LoginUtil.getUserId());

        issueReqService.updateIssueReq(issueReqVO);

        //IssueReqDetail update
        for(IssueReqDetailVO issueReqDetailVO : issueReqResvSaveVO.getIssueReqDetailVO()){
            issueReqDetailService.updateIssueReqDetail(issueReqDetailVO);
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqResvService#multiIssuePartsResves(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiIssuePartsResves(BaseSaveVO<IssueReqVO> issueReqSaveVO) throws Exception {

        String[] lblList = new String[1];

        for(IssueReqVO issueReqVO : issueReqSaveVO.getUpdateList()){

            IssueReqSearchVO searchVO = new IssueReqSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsParReqDocNo(issueReqVO.getParReqDocNo());
            searchVO.setsReadyStatCd("RE03");

            if(issueReqDetailResvDAO.selectIssueReqDetailResvesByConditionCnt(searchVO) == 0){
                issueReqVO.setDlrCd(LoginUtil.getDlrCd());
                issueReqVO.setUpdtUsrId(LoginUtil.getUserId());
                issueReqService.updateIssueReq(issueReqVO);

                IssueReqDetailVO issueReqDetailVO = new IssueReqDetailVO();
                issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
                issueReqDetailVO.setUpdtUsrId(LoginUtil.getUserId());
                issueReqDetailVO.setParReqDocNo(issueReqVO.getParReqDocNo());
                issueReqDetailVO.setReadyStatCd(issueReqVO.getReadyStatCd());

                issueReqDetailResvDAO.updateIssueReqDetailResv(issueReqDetailVO);
            }else{
                if(issueReqVO.getParGiTp().equals("SR")){
                    lblList[0] = messageSource.getMessage("par.lbl.invResvDocNo", null, LocaleContextHolder.getLocale());//예약처리번호
                }else if(issueReqVO.getParGiTp().equals("RO")){
                    lblList[0] = messageSource.getMessage("par.lbl.invRoDocNo", null, LocaleContextHolder.getLocale()); // 부품번호
                }
                //예약처리번호/정비위탁번호 부품예류준비중입니다.
                throw processException("par.info.issueResvInfoForDelete", lblList);
            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqResvService#selectIssueReqDetailsResvByCondition(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public List<IssueReqDetailVO> selectIssueReqDetailResvesByCondition(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDetailResvDAO.selectIssueReqDetailResvesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqResvService#selectIssueReqDetailsResvByConditionCnt(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public int selectIssueReqDetailResvesByConditionCnt(IssueReqSearchVO searchVO) throws Exception {
        return issueReqDetailResvDAO.selectIssueReqDetailResvesByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqResvService#selectIssueReqDetailsResvByKey(chn.bhmc.dms.par.ism.vo.IssueReqSearchVO)
     */
    @Override
    public IssueReqVO selectIssueReqResvByKey(IssueReqSearchVO searchVO) throws Exception {
        return issueReqService.selectIssueReqByKey(LoginUtil.getDlrCd(), searchVO.getsParReqDocNo(), null, searchVO.getsParGiTp());
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqResvService#updateIssuePartsReadyStatus(chn.bhmc.dms.par.ism.vo.IssueReqDetailVO)
     */
    @Override
    public void updateIssuePartsReadyStatus(IssueReqDetailVO issueReqDetailVO) throws Exception {
        issueReqDetailResvDAO.updateIssuePartsReadyStatus(issueReqDetailVO);
    }


}
