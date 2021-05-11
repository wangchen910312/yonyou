package chn.bhmc.dms.core.support.excel;

import java.util.Map;

public interface ExcelDataBindContext {
	public int getRow();
	public Map<String, Object> getDataMap();
}
