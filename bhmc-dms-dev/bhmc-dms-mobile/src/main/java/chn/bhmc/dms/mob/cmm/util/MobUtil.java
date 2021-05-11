package chn.bhmc.dms.mob.cmm.util;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobUtil.java
 * @Description : 모바일 유틸 클래스
 * @author JongHee Lim
 * @since 2016. 4. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 26.     JongHee Lim     최초 생성
 * </pre>
 */
public class MobUtil {

    /**
     * 로그인정보 로드
     *
     * @return MobLoginVO
     *
     * @throws Exception
     */
    public static MobLoginVO getLoginVO() throws Exception  {
        MobLoginVO mobLoginVO = new MobLoginVO();
        mobLoginVO.setUserId(LoginUtil.getUserId());
        mobLoginVO.setUserNm(LoginUtil.getUserNm());
        mobLoginVO.setDlrCd(LoginUtil.getDlrCd());
        mobLoginVO.setDlrNm(LoginUtil.getDlrCd()); // TOBE DlrNm
        mobLoginVO.setPltCd(LoginUtil.getPltCd());

        return mobLoginVO;
    }


    /**
     * 로그인 체크
     *
     * @return boolean
     */
    public boolean isLogin(){
        if(LoginUtil.getUserId()!=null){
            return false;
        }else{
            return true;
        }
    }

}
