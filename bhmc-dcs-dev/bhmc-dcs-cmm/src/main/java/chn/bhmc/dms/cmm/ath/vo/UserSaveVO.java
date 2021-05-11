package chn.bhmc.dms.cmm.ath.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 22.     Kang Seok Han     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="usrId", mesgKey="global.lbl.usrId")
    ,@ValidField(field="usrNm", mesgKey="global.lbl.usrNm")
    ,@ValidField(field="usrPw", mesgKey="global.lbl.usrPw")
    ,@ValidField(field="enabledYn", mesgKey="global.lbl.enabledYn")
    ,@ValidField(field="langCd", mesgKey="global.lbl.langCd")
    ,@ValidField(field="empNo", mesgKey="global.lbl.empNo")
    ,@ValidField(field="delYn", mesgKey="global.lbl.delYn")
    ,@ValidField(field="themeId", mesgKey="global.lbl.themeId")
    ,@ValidField(field="cmpnId", mesgKey="global.lbl.cmpnId")
    ,@ValidField(field="dlrCd", mesgKey="global.lbl.dlrCd")
    ,@ValidField(field="deptCd", mesgKey="global.lbl.deptCd")
    ,@ValidField(field="deptNm", mesgKey="global.lbl.deptNm")
    ,@ValidField(field="pstnCd", mesgKey="global.lbl.pstnCd")
    ,@ValidField(field="dutyCd", mesgKey="global.lbl.dutyCd")
    ,@ValidField(field="email", mesgKey="global.lbl.email")
    ,@ValidField(field="hpNo", mesgKey="global.lbl.hpNo")
    ,@ValidField(field="telNo1", mesgKey="global.lbl.telNo1")
    ,@ValidField(field="telNo2", mesgKey="global.lbl.telNo2")
    ,@ValidField(field="usrPwdChgDt", mesgKey="global.lbl.usrPwdChgDt")
    ,@ValidField(field="usrIdNo", mesgKey="global.lbl.usrIdNo")
    ,@ValidField(field="joinDt", mesgKey="global.lbl.joinDt")
    ,@ValidField(field="retireDt", mesgKey="global.lbl.retireDt")
    ,@ValidField(field="zipNo", mesgKey="global.lbl.zipNo")
    ,@ValidField(field="addr1", mesgKey="global.lbl.addr1")
    ,@ValidField(field="addr2", mesgKey="global.lbl.addr2")
    ,@ValidField(field="addr3", mesgKey="global.lbl.addr3")
    ,@ValidField(field="bizCd", mesgKey="global.lbl.bizCd")
    ,@ValidField(field="servYn", mesgKey="global.lbl.servYn")
    ,@ValidField(field="saleYn", mesgKey="global.lbl.saleYn")
    ,@ValidField(field="corpCd", mesgKey="global.lbl.corpCd")
    ,@ValidField(field="tskCd", mesgKey="global.lbl.tskCd")
    ,@ValidField(field="tskNm", mesgKey="global.lbl.tskNm")
    ,@ValidField(field="claimReqPermYn", mesgKey="global.lbl.claimReqPermYn")
    ,@ValidField(field="birthday", mesgKey="global.lbl.birthday")
    ,@ValidField(field="gndrCd", mesgKey="global.lbl.gndrCd")
    ,@ValidField(field="tskDetl", mesgKey="global.lbl.tskDetl")
    ,@ValidField(field="dssUsrYn", mesgKey="global.lbl.dssUsrYn")
})
public class UserSaveVO extends BaseSaveVO<UserVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5595323297268066103L;

}
