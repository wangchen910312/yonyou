package chn.bhmc.dms.crm.css.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionResultMgmtSearchVO
 * @Description : 클래스 설명을 기술합니다.
 * @author LEE Kyo Jin
 * @since 2016. 03. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 11.     LEE Kyo Jin     최초 생성
 * </pre>
 */
public class SatisFactionResultMgmtSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7521872008386211140L;

    /**
     * 일련번호
     **/

    private  String     sSeq;

    /**
     * 제목명
     **/

    private  String     sTitleNm;

    /**
     * 배포일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       sDistDt;

    /**
     * 출력여부
     **/

    private  String     sDisplayYn;

    /**
     * 등록자ID
     **/

    private  String     sRegUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       sRegDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       sRegDtFrom;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       sRegDtTo;

    /**
     * 수정자ID
     **/

    private  String     sUpdtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       sUpdtDt;

    /**
     * 딜러코드
     **/

    private  String     sDlrCd;

    /**
     * @return the sSeq
     */
    public String getsSeq() {
        return sSeq;
    }

    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(String sSeq) {
        this.sSeq = sSeq;
    }

    /**
     * @return the sTitleNm
     */
    public String getsTitleNm() {
        return sTitleNm;
    }

    /**
     * @param sTitleNm the sTitleNm to set
     */
    public void setsTitleNm(String sTitleNm) {
        this.sTitleNm = sTitleNm;
    }

    /**
     * @return the sDistDt
     */
    public Date getsDistDt() {
        return sDistDt;
    }

    /**
     * @param sDistDt the sDistDt to set
     */
    public void setsDistDt(Date sDistDt) {
        this.sDistDt = sDistDt;
    }

    /**
     * @return the sDisplayYn
     */
    public String getsDisplayYn() {
        return sDisplayYn;
    }

    /**
     * @param sDisplayYn the sDisplayYn to set
     */
    public void setsDisplayYn(String sDisplayYn) {
        this.sDisplayYn = sDisplayYn;
    }

    /**
     * @return the sRegUsrId
     */
    public String getsRegUsrId() {
        return sRegUsrId;
    }

    /**
     * @param sRegUsrId the sRegUsrId to set
     */
    public void setsRegUsrId(String sRegUsrId) {
        this.sRegUsrId = sRegUsrId;
    }

    /**
     * @return the sRegDt
     */
    public Date getsRegDt() {
        return sRegDt;
    }

    /**
     * @param sRegDt the sRegDt to set
     */
    public void setsRegDt(Date sRegDt) {
        this.sRegDt = sRegDt;
    }

    /**
     * @return the sUpdtUsrId
     */
    public String getsUpdtUsrId() {
        return sUpdtUsrId;
    }

    /**
     * @param sUpdtUsrId the sUpdtUsrId to set
     */
    public void setsUpdtUsrId(String sUpdtUsrId) {
        this.sUpdtUsrId = sUpdtUsrId;
    }

    /**
     * @return the sUpdtDt
     */
    public Date getsUpdtDt() {
        return sUpdtDt;
    }

    /**
     * @param sUpdtDt the sUpdtDt to set
     */
    public void setsUpdtDt(Date sUpdtDt) {
        this.sUpdtDt = sUpdtDt;
    }

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sRegDtFrom
     */
    public Date getsRegDtFrom() {
        return sRegDtFrom;
    }

    /**
     * @param sRegDtFrom the sRegDtFrom to set
     */
    public void setsRegDtFrom(Date sRegDtFrom) {
        this.sRegDtFrom = sRegDtFrom;
    }

    /**
     * @return the sRegDtTo
     */
    public Date getsRegDtTo() {
        return sRegDtTo;
    }

    /**
     * @param sRegDtTo the sRegDtTo to set
     */
    public void setsRegDtTo(Date sRegDtTo) {
        this.sRegDtTo = sRegDtTo;
    }



}
