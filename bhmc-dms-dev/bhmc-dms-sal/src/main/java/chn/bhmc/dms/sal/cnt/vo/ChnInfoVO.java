package chn.bhmc.dms.sal.cnt.vo;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * @ClassName   : ChnInfoVO
 * @Description : 채널/2급딜러 정보조회 VO
 * @author Kim Jin Suk
 * @since 2018. 2. 21
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2018. 2. 21.    Kim Jin Suk           최초 생성
 * </pre>
 */

public class ChnInfoVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6043538647914946282L;

    /**
     * 사용자의 채널유형 조회
     */
    private  String             tskCd;       //직무
    private  String             tskDetl;     //세부직무
    private  String             dstbChnCd;   //유통채널코드
    private  String             dstbChnNm;   //채널유형명

    /**
     * 2급딜러 정보 조회
     */
    private  String             sdlrCd;
    private  String             sdlrNm;
    private  String             sdlrNms;
    private  String             sdlrTp;
    /**
     * @return the tskCd
     */
    public String getTskCd() {
        return tskCd;
    }
    /**
     * @param tskCd the tskCd to set
     */
    public void setTskCd(String tskCd) {
        this.tskCd = tskCd;
    }
    /**
     * @return the tskDetl
     */
    public String getTskDetl() {
        return tskDetl;
    }
    /**
     * @param tskDetl the tskDetl to set
     */
    public void setTskDetl(String tskDetl) {
        this.tskDetl = tskDetl;
    }
    /**
     * @return the dstbChnCd
     */
    public String getDstbChnCd() {
        return dstbChnCd;
    }
    /**
     * @param dstbChnCd the dstbChnCd to set
     */
    public void setDstbChnCd(String dstbChnCd) {
        this.dstbChnCd = dstbChnCd;
    }
    /**
     * @return the dstbChnNm
     */
    public String getDstbChnNm() {
        return dstbChnNm;
    }
    /**
     * @param dstbChnNm the dstbChnNm to set
     */
    public void setDstbChnNm(String dstbChnNm) {
        this.dstbChnNm = dstbChnNm;
    }
    /**
     * @return the sdlrCd
     */
    public String getSdlrCd() {
        return sdlrCd;
    }
    /**
     * @param sdlrCd the sdlrCd to set
     */
    public void setSdlrCd(String sdlrCd) {
        this.sdlrCd = sdlrCd;
    }
    /**
     * @return the sdlrNm
     */
    public String getSdlrNm() {
        return sdlrNm;
    }
    /**
     * @param sdlrNm the sdlrNm to set
     */
    public void setSdlrNm(String sdlrNm) {
        this.sdlrNm = sdlrNm;
    }
    /**
     * @return the sdlrNms
     */
    public String getSdlrNms() {
        return sdlrNms;
    }
    /**
     * @param sdlrNms the sdlrNms to set
     */
    public void setSdlrNms(String sdlrNms) {
        this.sdlrNms = sdlrNms;
    }
    /**
     * @return the sdlrTp
     */
    public String getSdlrTp() {
        return sdlrTp;
    }
    /**
     * @param sdlrTp the sdlrTp to set
     */
    public void setSdlrTp(String sdlrTp) {
        this.sdlrTp = sdlrTp;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}