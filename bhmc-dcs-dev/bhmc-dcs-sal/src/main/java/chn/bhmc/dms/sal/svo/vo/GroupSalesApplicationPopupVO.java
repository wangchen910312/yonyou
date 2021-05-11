package chn.bhmc.dms.sal.svo.vo;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GroupSalesApplicationPopupVO
 * @Description : 집단판매 신청 팝업 VO
 * @author Bong
 * @since 2016. 3. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016.03.20      Bong               최초 생성
 * </pre>
 */
@ValidDescriptor({

   })
public class GroupSalesApplicationPopupVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3803903197096391491L;

    private  String          carlineCd;   //차종
    private  String          modelCd;     //모델
    private  String          ocnCd;       //OCN
    private  String          extColorCd;  //외장색
    private  String          intColorCd;  //내장색
    private  String          vinNo;       //Vin No
    private  String 		 carId;	      //CAR ID 추가.
    private  String          enginNo;    //Engine No

    private  String          carlineNm;   //차종
    private  String          modelNm;     //모델
    private  String          ocnNm;       //OCN
    private  String          extColorNm;  //외장색
    private  String          intColorNm;  //내장색
    private  int             reqQty;
    
    
    
    
    public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	/**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }
    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }
    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }
    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }
    /**
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }
    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }
    /**
     * @return the extColorCd
     */
    public String getExtColorCd() {
        return extColorCd;
    }
    /**
     * @param extColorCd the extColorCd to set
     */
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }
    /**
     * @return the intColorCd
     */
    public String getIntColorCd() {
        return intColorCd;
    }
    /**
     * @param intColorCd the intColorCd to set
     */
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
    }
    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }
    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }
    /**
     * @return the engineNo
     */
    public String getEnginNo() {
        return enginNo;
    }
    /**
     * @param engineNo the engineNo to set
     */
    public void setEnginNo(String enginNo) {
        this.enginNo = enginNo;
    }
    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }
    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }
    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }
    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }
    /**
     * @return the ocnNm
     */
    public String getOcnNm() {
        return ocnNm;
    }
    /**
     * @param ocnNm the ocnNm to set
     */
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
    }
    /**
     * @return the extColorNm
     */
    public String getExtColorNm() {
        return extColorNm;
    }
    /**
     * @param extColorNm the extColorNm to set
     */
    public void setExtColorNm(String extColorNm) {
        this.extColorNm = extColorNm;
    }
    /**
     * @return the intColorNm
     */
    public String getIntColorNm() {
        return intColorNm;
    }
    /**
     * @param intColorNm the intColorNm to set
     */
    public void setIntColorNm(String intColorNm) {
        this.intColorNm = intColorNm;
    }

    /**
     * @return the reqQty
     */
    public int getReqQty() {
        return reqQty;
    }
    /**
     * @param reqQty the reqQty to set
     */
    public void setReqQty(int reqQty) {
        this.reqQty = reqQty;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


}
