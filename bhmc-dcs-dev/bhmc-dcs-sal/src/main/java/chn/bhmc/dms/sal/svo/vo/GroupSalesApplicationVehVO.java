package chn.bhmc.dms.sal.svo.vo;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GroupSalesApplicationVehVO
 * @Description : 집단판매신청 상세 차량정보 조회 VO
 * @author Bong
 * @since 2016. 3. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016.03.25      Bong              최초 생성
 * </pre>
 */
@ValidDescriptor({

   })
public class GroupSalesApplicationVehVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2396054457495152808L;

    private  int          reqSeq;         //요청번호
    private  int          reqLowerSeq;    //요청 하위번호
    private  int          reqNo;          //요청 하위 일련번호

    private  String       dlrCd;          //딜러코드
    private  String       usrId;          //사용자ID

    private  String       carlineCd;      //차종
    private  String       modelCd;        //모델
    private  String       ocnCd;          //OCN
    private  String       extColorCd;     //외장색
    private  String       intColorCd;     //내장색

    private  String       carlineNm;      //차종
    private  String       modelNm;        //모델
    private  String       ocnNm;          //OCN
    private  String       extColorNm;     //외장색
    private  String       intColorNm;     //내장색

    private  int          reqQty;         //수량
    private  String       vinNo;          //Vin No
    private  String       carId;	      //CAR ID추가
    private  String       enginNo;        //Engine No

    private  String       regUsrId;
    private  String       updtUsrId;

    private  int          receiptPrcssCnt;  //영수증 처리 수
    private  String       addFile1;
    private  String       addFile2;


    private  String       _currentVehCd;
    private  String       _display;
    private  int          cnt;
    private  String       fileDocId;
    private  int          fileDocCnt;
    private  String       stockVinNo1;
    private  String       stockVinNo2;
    private  String       whPrc;
    private  String       msPrc;

    private  String       addFileNo;
    private  double       dcRate;
    private  double       aamt;
    private  double       damt;

    /**
     * @return the addFileNo
     */
    public String getAddFileNo() {
        return addFileNo;
    }
    /**
     * @param addFileNo the addFileNo to set
     */
    public void setAddFileNo(String addFileNo) {
        this.addFileNo = addFileNo;
    }
    public String getWhPrc() {
		return whPrc;
	}
	public void setWhPrc(String whPrc) {
		this.whPrc = whPrc;
	}
	/**
     * @return the msPrc
     */
    public String getMsPrc() {
        return msPrc;
    }
    /**
     * @param msPrc the msPrc to set
     */
    public void setMsPrc(String msPrc) {
        this.msPrc = msPrc;
    }
    public String getCarId() {
		return carId;
	}
	public void setCarId(String carId) {
		this.carId = carId;
	}
	/**
     * @return the stockVinNo1
     */
    public String getStockVinNo1() {
        return stockVinNo1;
    }
    /**
     * @param stockVinNo1 the stockVinNo1 to set
     */
    public void setStockVinNo1(String stockVinNo1) {
        this.stockVinNo1 = stockVinNo1;
    }
    /**
     * @return the stockVinNo2
     */
    public String getStockVinNo2() {
        return stockVinNo2;
    }
    /**
     * @param stockVinNo2 the stockVinNo2 to set
     */
    public void setStockVinNo2(String stockVinNo2) {
        this.stockVinNo2 = stockVinNo2;
    }
    /**
     * @return the fileDocId
     */
    public String getFileDocId() {
        return fileDocId;
    }
    /**
     * @param fileDocId the fileDocId to set
     */
    public void setFileDocId(String fileDocId) {
        this.fileDocId = fileDocId;
    }


    /**
     * @return the fileDocCnt
     */
    public int getFileDocCnt() {
        return fileDocCnt;
    }
    /**
     * @param fileDocCnt the fileDocCnt to set
     */
    public void setFileDocCnt(int fileDocCnt) {
        this.fileDocCnt = fileDocCnt;
    }
    /**
     * @return the cnt
     */
    public int getCnt() {
        return cnt;
    }
    /**
     * @param cnt the cnt to set
     */
    public void setCnt(int cnt) {
        this.cnt = cnt;
    }
    /**
     * @return the reqSeq
     */
    public int getReqSeq() {
        return reqSeq;
    }
    /**
     * @param reqSeq the reqSeq to set
     */
    public void setReqSeq(int reqSeq) {
        this.reqSeq = reqSeq;
    }
    /**
     * @return the reqLowerSeq
     */
    public int getReqLowerSeq() {
        return reqLowerSeq;
    }
    /**
     * @param reqLowerSeq the reqLowerSeq to set
     */
    public void setReqLowerSeq(int reqLowerSeq) {
        this.reqLowerSeq = reqLowerSeq;
    }
    /**
     * @return the reqNo
     */
    public int getReqNo() {
        return reqNo;
    }
    /**
     * @param reqNo the reqNo to set
     */
    public void setReqNo(int reqNo) {
        this.reqNo = reqNo;
    }
    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }
    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }
    /**
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }
    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
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
     * @return the enginNo
     */
    public String getEnginNo() {
        return enginNo;
    }
    /**
     * @param enginNo the enginNo to set
     */
    public void setEnginNo(String enginNo) {
        this.enginNo = enginNo;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }
    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }
    /**
     * @return the receiptPrcssCnt
     */
    public int getReceiptPrcssCnt() {
        return receiptPrcssCnt;
    }
    /**
     * @param receiptPrcssCnt the receiptPrcssCnt to set
     */
    public void setReceiptPrcssCnt(int receiptPrcssCnt) {
        this.receiptPrcssCnt = receiptPrcssCnt;
    }
    /**
     * @return the addFile1
     */
    public String getAddFile1() {
        return addFile1;
    }
    /**
     * @param addFile1 the addFile1 to set
     */
    public void setAddFile1(String addFile1) {
        this.addFile1 = addFile1;
    }
    /**
     * @return the addFile2
     */
    public String getAddFile2() {
        return addFile2;
    }
    /**
     * @param addFile2 the addFile2 to set
     */
    public void setAddFile2(String addFile2) {
        this.addFile2 = addFile2;
    }
    /**
     * @return the _currentVehCd
     */
    public String get_currentVehCd() {
        return _currentVehCd;
    }
    /**
     * @param _currentVehCd the _currentVehCd to set
     */
    public void set_currentVehCd(String _currentVehCd) {
        this._currentVehCd = _currentVehCd;
    }
    /**
     * @return the _display
     */
    public String get_display() {
        return _display;
    }
    /**
     * @param _display the _display to set
     */
    public void set_display(String _display) {
        this._display = _display;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the dcRate
     */
    public double getDcRate() {
        return dcRate;
    }
    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(double dcRate) {
        this.dcRate = dcRate;
    }
    /**
     * @return the aamt
     */
    public double getAamt() {
        return aamt;
    }
    /**
     * @return the damt
     */
    public double getDamt() {
        return damt;
    }
    /**
     * @param aamt the aamt to set
     */
    public void setAamt(double aamt) {
        this.aamt = aamt;
    }
    /**
     * @param damt the damt to set
     */
    public void setDamt(double damt) {
        this.damt = damt;
    }


}
