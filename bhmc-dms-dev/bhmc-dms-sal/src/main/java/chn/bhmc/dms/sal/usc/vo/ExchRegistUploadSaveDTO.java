package chn.bhmc.dms.sal.usc.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

public class ExchRegistUploadSaveDTO extends BaseSaveVO<ExchResultVO> {

	/**
	 *
	 */
	private static final long serialVersionUID = -1210745396214803853L;

	public List<ExchResultVO> exchRegistList = new ArrayList<ExchResultVO>();

    /**
     * @return the exchRegistList
     */
    public List<ExchResultVO> getExchRegistList() {
        return exchRegistList;
    }

    /**
     * @param exchRegistList the exchRegistList to set
     */
    public void setExchRegistList(List<ExchResultVO> exchRegistList) {
        this.exchRegistList = exchRegistList;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }



}
