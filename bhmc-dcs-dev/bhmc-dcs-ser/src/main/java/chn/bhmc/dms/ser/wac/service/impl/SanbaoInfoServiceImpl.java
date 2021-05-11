package chn.bhmc.dms.ser.wac.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.ser.wac.service.SanbaoInfoService;
import chn.bhmc.dms.ser.wac.service.dao.SanbaoInfoDAO;
import chn.bhmc.dms.ser.wac.vo.SanbaoAlarmVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoBasePartVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoClaimInfoVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoWorkInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 7. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 25.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service("sanbaoInfoService")
public class SanbaoInfoServiceImpl extends HService implements SanbaoInfoService{

    @Resource(name = "sanbaoInfoDAO")
    SanbaoInfoDAO sanbaoInfoDAO;

    /**
     * 삼보 알람 정보
     *
     * @param searchVO
     * @return 삼보알람 정보
     */
    public SanbaoAlarmVO selectSanbaoAlarmInfoByKey(SanbaoSearchVO searchVO) throws Exception {

        SanbaoAlarmVO sanBaoAlarmVO = sanbaoInfoDAO.selectSanbaoAlarmInfoByKey(searchVO);
        if( sanBaoAlarmVO == null) sanBaoAlarmVO = new SanbaoAlarmVO();

        return sanBaoAlarmVO;
    }

    /**
     * 동일하자 리스트 갯수 정보
     *
     * @param searchVO
     * @return 동일하자 리스트 정보
     */
    public int selectSanbaoItemsByConditionCnt(SanbaoSearchVO searchVO)throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        
        return sanbaoInfoDAO.selectSanbaoItemsByConditionCnt(searchVO);
    }
    
    /**
     * 동일하자 리스트 정보
     *
     * @param searchVO
     * @return 동일하자 리스트 정보
     */
    public List<SanbaoBasePartVO> selectSanbaoItemsByCondition(SanbaoSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        
        return sanbaoInfoDAO.selectSanbaoItemsByCondition(searchVO);
    }

    /**
     * 삼포 작업  리스트 정보
     *
     * @param searchVO
     * @return 삼포 작업  리스트 정보
     */
    @Override
    public List<SanbaoWorkInfoVO> selectSanbaoWorkInfoByCondition(SanbaoSearchVO searchVO) throws Exception {

        return sanbaoInfoDAO.selectSanbaoWorkInfoByCondition(searchVO);
    }

    /**
     * 삼포 클레임  리스트 정보
     *
     * @param searchVO
     * @return 삼포 클레임  리스트 정보
     */
    public List<SanbaoClaimInfoVO> selectSanbaoClaimInfoByCondition(SanbaoSearchVO searchVO) throws Exception {

        return sanbaoInfoDAO.selectSanbaoClaimInfoByCondition(searchVO);
    }

    public List<SanbaoClaimInfoVO> selectSanbaoCustInfoByCondition(SanbaoSearchVO searchVO)throws Exception{
        
        return sanbaoInfoDAO.selectSanbaoCustInfoByCondition(searchVO);
    }




}
