package chn.bhmc.dms.ser.cmm.vo;
import chn.bhmc.dms.core.datatype.BaseVO;


public class SpeVehiWarrDeadVO extends BaseVO{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7478177750888440679L;
	
	
	/**
	 * vin_no
	 */
	private String vinNo;
	
	/**
	 * Normal warranty period 正常保修保修期
	 */
	private int normWarrPer;
	
	/**
	 * Normal warranty mileage 正常保修里程
	 */
	private int normWarrMil;
	
	/**
	 * Sheet Spray Warranty Period 钣喷保修期
	 */
	private int sheetSprWarrPer;
	/**
	 * Sheet metal mileage 钣喷里程
	 */
	private int sheetMetalMil;
	/**
	 * 售后配件保修期
	 */
	private int serParPer;
	
	/**
	 * 售后配件里程
	 */
	private int serParPerMil;

	public String getVinNo() {
		return vinNo;
	}

	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}

	public int getNormWarrPer() {
		return normWarrPer;
	}

	public void setNormWarrPer(int normWarrPer) {
		this.normWarrPer = normWarrPer;
	}

	public int getNormWarrMil() {
		return normWarrMil;
	}

	public void setNormWarrMil(int normWarrMil) {
		this.normWarrMil = normWarrMil;
	}

	public int getSheetSprWarrPer() {
		return sheetSprWarrPer;
	}

	public void setSheetSprWarrPer(int sheetSprWarrPer) {
		this.sheetSprWarrPer = sheetSprWarrPer;
	}

	public int getSheetMetalMil() {
		return sheetMetalMil;
	}

	public void setSheetMetalMil(int sheetMetalMil) {
		this.sheetMetalMil = sheetMetalMil;
	}

	public int getSerParPer() {
		return serParPer;
	}

	public void setSerParPer(int serParPer) {
		this.serParPer = serParPer;
	}

	public int getSerParPerMil() {
		return serParPerMil;
	}

	public void setSerParPerMil(int serParPerMil) {
		this.serParPerMil = serParPerMil;
	}
	
	
	

}
