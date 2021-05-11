package chn.bhmc.dms.bat.ser.rev.vo;
import chn.bhmc.dms.core.datatype.BaseVO;

public class ReseReceiptVO extends BaseVO {
	

	private static final long serialVersionUID = -5356061573566734557L;
		private String saId;
	    private String saNm;
	    
	    
	    private String serResvStartDt;
	    
	    private String carRegNo;
	    
	    private String driverNm;
	    private String dlrCd;
        private String resvDocNo;
        
        public static long getSerialversionuid() {
			return serialVersionUID;
		}
		public String getSaId() {
			return saId;
		}

		public void setSaId(String saId) {
			this.saId = saId;
		}

		public String getSaNm() {
			return saNm;
		}

		public void setSaNm(String saNm) {
			this.saNm = saNm;
		}

		public String getSerResvStartDt() {
			return serResvStartDt;
		}

		public void setSerResvStartDt(String serResvStartDt) {
			this.serResvStartDt = serResvStartDt;
		}

		public String getCarRegNo() {
			return carRegNo;
		}

		public void setCarRegNo(String carRegNo) {
			this.carRegNo = carRegNo;
		}

		public String getDriverNm() {
			return driverNm;
		}

		public void setDriverNm(String driverNm) {
			this.driverNm = driverNm;
		}

		

		public String getDlrCd() {
			return dlrCd;
		}

		public void setDlrCd(String dlrCd) {
			this.dlrCd = dlrCd;
		}

		public String getResvDocNo() {
			return resvDocNo;
		}

		public void setResvDocNo(String resvDocNo) {
			this.resvDocNo = resvDocNo;
		}

}