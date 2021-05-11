package chn.bhmc.dms.par.pmm.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CertificationSaveVO.java
 * @Description : CertificationSaveVO Class
 * @author Eun Jung Jang
 * @since 2016. 5. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 26.     Eun Jung Jang      최초 생성
 * </pre>
 */

@ValidDescriptor({
     @ValidField(field="dlrCd"                , mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="certNo"               , mesgKey="par.lbl.certNo")
    ,@ValidField(field="certStatCd"           , mesgKey="par.lbl.certStatCd")
    ,@ValidField(field="certTp"               , mesgKey="par.lbl.certTp")
    ,@ValidField(field="telNo"                , mesgKey="par.lbl.telNo")
    ,@ValidField(field="hpNo"                 , mesgKey="par.lbl.hpNo")
    ,@ValidField(field="custNo"               , mesgKey="par.lbl.custNo")
    ,@ValidField(field="custNm"               , mesgKey="par.lbl.custNm")
    ,@ValidField(field="itemCd"               , mesgKey="par.lbl.itemCd")
    ,@ValidField(field="itemNm"               , mesgKey="par.lbl.itemNm")
    ,@ValidField(field="baseVinNo"            , mesgKey="par.lbl.baseVinNo")
    ,@ValidField(field="newVinNo"             , mesgKey="par.lbl.newVinNo")
    ,@ValidField(field="carBodyVinNo"         , mesgKey="par.lbl.carBodyVinNo")
    ,@ValidField(field="detlCont"             , mesgKey="par.lbl.detlCont")
    ,@ValidField(field="evalRsltNm"           , mesgKey="par.lbl.evalRsltNm")
    ,@ValidField(field="evalOpnCont"          , mesgKey="par.lbl.evalOpnCont")
    ,@ValidField(field="zipCd"                , mesgKey="par.lbl.zipCd")
    ,@ValidField(field="zipSendDt"            , mesgKey="par.lbl.zipSendDt")
    ,@ValidField(field="procRsltDetlCont"     , mesgKey="par.lbl.procRsltDetlCont")
    ,@ValidField(field="trsfCmpCd"            , mesgKey="par.lbl.trsfCmpCd")
    ,@ValidField(field="oldEnginCylPhotoNm"   , mesgKey="par.lbl.oldEnginCylPhotoNm")
    ,@ValidField(field="oldEnginCylNo"        , mesgKey="par.lbl.oldEnginCylNo")
    ,@ValidField(field="newEnginCylPhotoNm"   , mesgKey="par.lbl.newEnginCylPhotoNm")
    ,@ValidField(field="newEnginCylNo"        , mesgKey="par.lbl.newEnginCylNo")
    ,@ValidField(field="fileDocNo"            , mesgKey="par.lbl.fileDocNo")
    ,@ValidField(field="regUsrId"             , mesgKey="par.lbl.regUsrId")
    ,@ValidField(field="regDt"                , mesgKey="par.lbl.regDt")
    ,@ValidField(field="updtUsrId"            , mesgKey="par.lbl.updtUsrId")
    ,@ValidField(field="updtDt"               , mesgKey="par.lbl.updtDt")
})

public class CertificationSaveVO extends BaseSaveVO<CertificationVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2746407352044173429L;

    private CertificationVO certificationVO;

    private List<CertificationFileVO> certificationFileList;

    private String ifSendYn = "N"; // BMP interface save Type N : save Y : save after send

    /**
     * @return the certificationVO
     */
    public CertificationVO getCertificationVO() {
        return certificationVO;
    }

    /**
     * @param certificationVO the certificationVO to set
     */
    public void setCertificationVO(CertificationVO certificationVO) {
        this.certificationVO = certificationVO;
    }

    /**
     * @return the certificationFileList
     */
    public List<CertificationFileVO> getCertificationFileList() {
        return certificationFileList;
    }

    /**
     * @param certificationFileList the certificationFileList to set
     */
    public void setCertificationFileList(List<CertificationFileVO> certificationFileList) {
        this.certificationFileList = certificationFileList;
    }

    /**
     * @return the ifSendYn
     */
    public String getIfSendYn() {
        return ifSendYn;
    }

    /**
     * @param ifSendYn the ifSendYn to set
     */
    public void setIfSendYn(String ifSendYn) {
        this.ifSendYn = ifSendYn;
    }

}
