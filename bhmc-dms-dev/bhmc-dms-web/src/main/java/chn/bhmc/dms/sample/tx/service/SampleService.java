package chn.bhmc.dms.sample.tx.service;
import java.util.Map;

public interface SampleService {
	public void selectProcedureTest(Map<String, String> params);
    
    public int insertSample(String aaa, int id);
    
    public int updateSample(String aaa, int id);
    
    public int deleteSample(String aaa, int id);
    
    public void updateInsertSample() throws Exception;
}
