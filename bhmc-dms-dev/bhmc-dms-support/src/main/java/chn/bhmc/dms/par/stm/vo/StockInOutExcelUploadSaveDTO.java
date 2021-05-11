package chn.bhmc.dms.par.stm.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

public class StockInOutExcelUploadSaveDTO extends BaseSaveVO<StockInOutVO> {

	/**
	 *
	 */
	private static final long serialVersionUID = -1210745396214803853L;

	public List<StockInOutVO> stockInOutList = new ArrayList<StockInOutVO>();


    /**
     * @return the stockInOutList
     */
    public List<StockInOutVO> getStockInOutList() {
        return stockInOutList;
    }
    /**
     * @param stockInOutList the stockInOutList to set
     */
    public void setStockInOutList(List<StockInOutVO> stockInOutList) {
        this.stockInOutList = stockInOutList;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
