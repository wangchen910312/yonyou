package chn.bhmc.dms.sal.dsc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.dsc.service.AuthorityFixService;
import chn.bhmc.dms.sal.dsc.service.dao.AuthorityFixDAO;
import chn.bhmc.dms.sal.dsc.vo.AuthorityFixSaveVO;
import chn.bhmc.dms.sal.dsc.vo.AuthorityFixSearchVO;
import chn.bhmc.dms.sal.dsc.vo.AuthorityFixVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalesAllowanceServiceImpl
 * @Description : Sales Allowance
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.26       최초 생성
 * </pre>
 */

@Service("authorityFixService")
public class AuthorityFixServiceImpl extends HService implements AuthorityFixService {

    /**
     * Sales Allowance 현황 DAO 선언
     */
    @Resource(name="authorityFixDAO")
    AuthorityFixDAO authorityFixDAO;


    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesAllowanceSearchVO
     * @return
     */
    @Override
    public int selectAuthorityFixMainsByConditionCnt(AuthorityFixSearchVO searchVO) throws Exception{
        return authorityFixDAO.selectAuthorityFixMainsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesAllowanceSearchVO
     * @return 조회 목록
     */
    @Override
    public List<AuthorityFixVO> selectAuthorityFixMainsByCondition(AuthorityFixSearchVO searchVO) throws Exception{
        return authorityFixDAO.selectAuthorityFixMainsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesAllowanceSearchVO
     * @return
     */
    @Override
    public int selectAuthorityFixSubsByConditionCnt(AuthorityFixSearchVO searchVO) throws Exception{
        return authorityFixDAO.selectAuthorityFixSubsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesAllowanceSearchVO
     * @return 조회 목록
     */
    @Override
    public List<AuthorityFixVO> selectAuthorityFixSubsByCondition(AuthorityFixSearchVO searchVO) throws Exception{
        return authorityFixDAO.selectAuthorityFixSubsByCondition(searchVO);
    }

    /**
     * User 리스트 조회
     */
    @Override
    public List<AuthorityFixVO> selectAuthorityFixUsrIdList(AuthorityFixSearchVO searchVO) throws Exception{
        return authorityFixDAO.selectAuthorityFixUsrIdList(searchVO);
    }

    /**
     * 저장
     */
    @Override
    public int multiAuthorityFixs(AuthorityFixSaveVO saveVO) throws Exception{

        // 저장/수정
        for(AuthorityFixVO fixVO : saveVO.getSubGridVO().getInsertList()){
            fixVO.setUpdtUsrId(LoginUtil.getUserId());
            fixVO.setRegUsrId(LoginUtil.getUserId());

            if(authorityFixDAO.selectAuthorityFixCnt(fixVO) > 0){
                authorityFixDAO.updateAuthorityFix(fixVO);
            }else{
                authorityFixDAO.insertAuthorityFix(fixVO);
            }

            // 권한복사
            if( !"".equals(saveVO.getCopyUsrId())){
                fixVO.setUsrId(saveVO.getCopyUsrId());

                if(authorityFixDAO.selectAuthorityFixCnt(fixVO) > 0){
                    authorityFixDAO.updateAuthorityFix(fixVO);
                }else{
                    authorityFixDAO.insertAuthorityFix(fixVO);
                }
            }
        }

        for(AuthorityFixVO fixVO : saveVO.getSubGridVO().getUpdateList()){
            fixVO.setUpdtUsrId(LoginUtil.getUserId());
            fixVO.setRegUsrId(LoginUtil.getUserId());

            if(authorityFixDAO.selectAuthorityFixCnt(fixVO) > 0){
                authorityFixDAO.updateAuthorityFix(fixVO);
            }else{
                authorityFixDAO.insertAuthorityFix(fixVO);
            }

            // 권한복사
            if( !"".equals(saveVO.getCopyUsrId())){
                fixVO.setUsrId(saveVO.getCopyUsrId());

                if(authorityFixDAO.selectAuthorityFixCnt(fixVO) > 0){
                    authorityFixDAO.updateAuthorityFix(fixVO);
                }else{
                    authorityFixDAO.insertAuthorityFix(fixVO);
                }
            }
        }

        return 1;
    }

}
