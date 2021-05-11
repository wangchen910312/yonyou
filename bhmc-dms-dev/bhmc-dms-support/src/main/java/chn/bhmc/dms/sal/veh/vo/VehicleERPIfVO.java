package chn.bhmc.dms.sal.veh.vo;

import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleMasterIfVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 9. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 26.     Lee Seungmin     최초 생성
 * </pre>
 */

public class VehicleERPIfVO extends BaseVO {

    
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 1991691488465815065L;

    @JsonProperty("VIN_NO")
    private String vinNo;
    
    @SuppressWarnings("rawtypes")
    @JsonProperty("IR_VIN")
    private ArrayList irVin;
    
    @JsonProperty("IR_RESULT")
    private String irResult;

    public String getVinNo() {
        return vinNo;
    }

    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    @SuppressWarnings("rawtypes")
    public ArrayList getIrVin() {
        return irVin;
    }

    @SuppressWarnings("rawtypes")
    public void setIrVin(ArrayList irVin) {
        this.irVin = irVin;
    }

    public String getIrResult() {
        return irResult;
    }

    public void setIrResult(String irResult) {
        this.irResult = irResult;
    }



}