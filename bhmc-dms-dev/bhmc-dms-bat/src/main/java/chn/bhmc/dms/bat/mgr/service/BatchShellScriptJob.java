package chn.bhmc.dms.bat.mgr.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.SequenceInputStream;

import org.apache.commons.lang3.StringUtils;
import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 프로그램 명 : 쉘 스크립트 실행 배치 JOB 구현 클래스
 * 프로그램 개요 :
 * 비고 :
 * 개정이력 : 2015-07-28 (한강석), V1.0, 최초작성
 *
 * @author 한강석
 * @version 1.0
 * @see
 *
 */
public class BatchShellScriptJob implements Job {

	private static final Logger logger = LoggerFactory.getLogger(BatchShellScriptJob.class);

	/**
	 *
	 * @see org.quartz.Job#execute(org.quartz.JobExecutionContext)
	 */
	public void execute(JobExecutionContext jobContext) throws JobExecutionException {

		JobDataMap dataMap = jobContext.getJobDetail().getJobDataMap();

		logger.debug("job[{}] Trigger이름 : {}", jobContext.getJobDetail().getKey().getName(), jobContext.getTrigger().getKey().getName());
		logger.debug("job[{}] BatchOpert이름 : {}", jobContext.getJobDetail().getKey().getName(), dataMap.getString("batOperId"));
		logger.debug("job[{}] BatchProgram이름 : {}", jobContext.getJobDetail().getKey().getName(), dataMap.getString("batPrgmNm"));
		logger.debug("job[{}] Parameter이름 : {}", jobContext.getJobDetail().getKey().getName(), dataMap.getString("batParamVal"));

		int result = executeProgram(dataMap.getString("batPrgmNm"), dataMap.getString("batParamVal"));

		jobContext.setResult(result);
	}

	/**
	 * 시스템에서 특정 쉘 프로그램을 실행한다.
	 * @param batPrgmNm 배치실행 파일
	 * @param batParamVal 배치실행 파일에 전달될 파라미터
	 * @return 배치실행 파일 리턴값
	*/
	public int executeProgram(String batPrgmNm, String batParamVal) {

		int result = 0;
		BufferedReader br = null;

		try {

			Process p = null;
			String cmdStr = batPrgmNm + " " + StringUtils.defaultString(batParamVal, "");
			p = Runtime.getRuntime().exec(cmdStr);

			br = new BufferedReader(
	            new InputStreamReader(
                    new SequenceInputStream(p.getInputStream(), p.getErrorStream())
	            )
		    );

			String line="";
			while((line = br.readLine()) != null){
			    logger.debug(line);
			}

			p.waitFor();
			result = p.exitValue();


			logger.debug("배치실행화일 - {} 실행완료, 결과값: {}", cmdStr, result);

		} catch (IOException e) {
			logger.error("배치스크립트 실행 에러 : {}", e.getMessage());
		} catch (InterruptedException e) {
			logger.error("배치스크립트 실행 에러 : {}", e.getMessage());
		} finally {
		    try{ if(br != null) br.close(); } catch (Exception e){};
		}

		return result;
	}

}

