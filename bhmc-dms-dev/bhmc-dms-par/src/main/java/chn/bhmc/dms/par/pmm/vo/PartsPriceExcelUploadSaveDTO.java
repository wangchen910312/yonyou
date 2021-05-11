package chn.bhmc.dms.par.pmm.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

public class PartsPriceExcelUploadSaveDTO extends BaseSaveVO<PartsVenderSalPriceTargetExcelVO> {

	/**
	 *
	 */
	private static final long serialVersionUID = -1210745396214803853L;

	public List<PartsVenderSalPriceTargetExcelVO> partsPriceList = new ArrayList<PartsVenderSalPriceTargetExcelVO>();

    /**
     * @return the partsPriceList
     */
    public List<PartsVenderSalPriceTargetExcelVO> getPartsPriceList() {
        return partsPriceList;
    }
    /**
     * @param partsPriceList the partsPriceList to set
     */
    public void setPartsPriceList(List<PartsVenderSalPriceTargetExcelVO> partsPriceList) {
        this.partsPriceList = partsPriceList;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }




}
