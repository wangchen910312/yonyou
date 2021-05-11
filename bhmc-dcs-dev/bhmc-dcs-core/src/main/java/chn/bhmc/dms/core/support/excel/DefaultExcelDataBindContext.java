package chn.bhmc.dms.core.support.excel;

import java.util.HashMap;
import java.util.Map;

public class DefaultExcelDataBindContext implements ExcelDataBindContext {

	private int row;
	private Map<String, Object> dataMap = new HashMap<String, Object>();

	public void setRow(int row){
		this.row = row;
	}

	@Override
	public int getRow() {
		return this.row;
	}

	@Override
	public Map<String, Object> getDataMap() {
		return this.dataMap;
	}

}
