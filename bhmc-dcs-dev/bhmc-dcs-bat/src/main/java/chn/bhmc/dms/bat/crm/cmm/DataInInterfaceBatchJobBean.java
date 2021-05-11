package chn.bhmc.dms.bat.crm.cmm;

import java.io.File;
import java.io.FilenameFilter;

import org.apache.commons.lang3.StringUtils;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.cmm.service.BatDmsDataInService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.core.util.DateUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionManageBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 7. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 19.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class DataInInterfaceBatchJobBean extends BaseJobBean {

	@Autowired
	BatDmsDataInService batDmsDataInService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {

        try {

            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //1.dir 목록의 file 목록을 구해온다.
            //2.file을 읽어서 DB에 insert/update 한다.
            //  tmp 테이블에 insert 하고, 프로시져도 merge 한다.
            //BatDmsDataInService batDmsDataInService = getBean(BatDmsDataInService.class);

            FilenameFilter fileNameFilter = new FilenameFilter() {
                @Override
                public boolean accept(File dir, String name) {
                   if(name.lastIndexOf('.')>0)
                   {
                      int lastIndex = name.lastIndexOf('.');// get last index for '.' char
                      String str = name.substring(lastIndex);// get extension
                      if(str.equals(".txt") && StringUtils.startsWith(name, "DMSCRMDATA_"))
                      {
                         return true;
                      }
                   }
                   return false;
                }
            };

            JobDataMap jobDataMap = context.getJobDetail().getJobDataMap();
            String fPath = jobDataMap.getString("FILE_UPLOAD_PATH");
            String todayYYYY = DateUtil.getDate("yyyy");
            String todayMM = DateUtil.getDate("MM");
            String todaydd = DateUtil.getDate("dd");

            String strYYYYMMDD = context.getJobDetail().getJobDataMap().getString("day");
            if(StringUtils.isNotBlank(strYYYYMMDD)){
                todayYYYY = strYYYYMMDD.substring(0, 4);
                todayMM = strYYYYMMDD.substring(4, 6);
                todaydd = strYYYYMMDD.substring(6);
            }
            fPath = fPath + "/Data/" + todayYYYY+"/"+ todayMM+"/"+ todaydd;
            File dir = new File(fPath);

            if(dir.isDirectory() && dir.exists()){
                File[] paths = dir.listFiles(fileNameFilter);
                for(File path:paths)
                {
                    batDmsDataInService.readFilesUpsert(path);
                    path.renameTo(new File(path.getPath()+".bak"));
                }
            }


        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }

    }
}
