package chn.bhmc.dms.cmm.ath.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RoleMappingSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 28.     Kang Seok Han     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="sysCd", mesgKey="global.lbl.sysCd")
    ,@ValidField(field="refTp", mesgKey="global.lbl.refTp")
    ,@ValidField(field="refId", mesgKey="global.lbl.refId")
    ,@ValidField(field="roles", mesgKey="global.lbl.role")
})
public class RoleMappingSaveVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -614726202144724789L;

    /**
     * 시스템구분
     * 'D':딜러
     * 'I':법인
     */
    @NotBlank
    private String sysCd;

    /**
     * 참조유형
     * 'U':사용자
     */
    @NotBlank
    private String refTp;

    /**
     * 참조ID
     */
    @NotBlank
    private String refId;

    /**
     * 역할 목록
     */
    private List<String> roles;

    /**
     * 추가목록
     */
    @Valid
    private List<RoleMappingVO> insertList = new ArrayList<RoleMappingVO>();

    /**
     * 삭제목록
     */
    private List<RoleMappingVO> deleteList = new ArrayList<RoleMappingVO>();

    /**
     * @return the sysCd
     */
    public String getSysCd() {
        return sysCd;
    }

    /**
     * @param sysCd the sysCd to set
     */
    public void setSysCd(String sysCd) {
        this.sysCd = sysCd;
    }

    /**
     * @return the refTp
     */
    public String getRefTp() {
        return refTp;
    }

    /**
     * @param refTp the refTp to set
     */
    public void setRefTp(String refTp) {
        this.refTp = refTp;
    }

    /**
     * @return the refId
     */
    public String getRefId() {
        return refId;
    }

    /**
     * @param refId the refId to set
     */
    public void setRefId(String refId) {
        this.refId = refId;
    }

    /**
     * @return the roles
     */
    public List<String> getRoles() {
        return roles;
    }

    /**
     * @param roles the roles to set
     */
    public void setRoles(List<String> roles) {
        this.roles = roles;
    }

    /**
     * @return the insertList
     */
    public List<RoleMappingVO> getInsertList() {
        return insertList;
    }

    /**
     * @param insertList the insertList to set
     */
    public void setInsertList(List<RoleMappingVO> insertList) {
        this.insertList = insertList;
    }

    /**
     * @return the deleteList
     */
    public List<RoleMappingVO> getDeleteList() {
        return deleteList;
    }

    /**
     * @param deleteList the deleteList to set
     */
    public void setDeleteList(List<RoleMappingVO> deleteList) {
        this.deleteList = deleteList;
    }
}
