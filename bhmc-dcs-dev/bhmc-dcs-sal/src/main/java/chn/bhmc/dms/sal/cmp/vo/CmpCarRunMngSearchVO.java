package chn.bhmc.dms.sal.cmp.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CmpCarRunMngSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 4. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 149.      Kim yewon              최초 생성
 * </pre>
 */

public class CmpCarRunMngSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUseStartDt;                                  //대행일자 - 시작일시
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUseEndDt;                                    //대행일자 - 종료일시
    private String sVinNo;                                     //VIN NO
    private String sCarRegNo;                                  //차량번호
    private String sCmpCarDstinCd;                             //회사차유형




    /**
     * @return the sCmpCarDstinCd
     */
    public String getsCmpCarDstinCd() {
        return sCmpCarDstinCd;
    }
    /**
     * @param sCmpCarDstinCd the sCmpCarDstinCd to set
     */
    public void setsCmpCarDstinCd(String sCmpCarDstinCd) {
        this.sCmpCarDstinCd = sCmpCarDstinCd;
    }
    /**
     * @return the sUseStartDt
     */
    public Date getsUseStartDt() {
        return sUseStartDt;
    }
    /**
     * @param sUseStartDt the sUseStartDt to set
     */
    public void setsUseStartDt(Date sUseStartDt) {
        this.sUseStartDt = sUseStartDt;
    }
    /**
     * @return the sUseEndDt
     */
    public Date getsUseEndDt() {
        return sUseEndDt;
    }
    /**
     * @param sUseEndDt the sUseEndDt to set
     */
    public void setsUseEndDt(Date sUseEndDt) {
        this.sUseEndDt = sUseEndDt;
    }
    /**
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }
    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }
    /**
     * @return the sCarRegNo
     */
    public String getsCarRegNo() {
        return sCarRegNo;
    }
    /**
     * @param sCarRegNo the sCarRegNo to set
     */
    public void setsCarRegNo(String sCarRegNo) {
        this.sCarRegNo = sCarRegNo;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }






}
