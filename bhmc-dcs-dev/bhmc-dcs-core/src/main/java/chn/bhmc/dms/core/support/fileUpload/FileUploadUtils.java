package chn.bhmc.dms.core.support.fileUpload;

import java.io.File;
import java.io.IOException;

import org.apache.commons.lang3.RandomStringUtils;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FileUploadUtils.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 4.     Kang Seok Han     최초 생성
 * </pre>
 */

public class FileUploadUtils {

    /**
     * 파일저장 디렉토리를 생성한다.
     * @param dir 디렉토리
     */
    public static void mkdirs(String dir){
        File f = new File(dir);
        if(!f.exists()){
            f.mkdirs();
        }
    }

    /**
     * Empty 파일을 생성한다.
     * @param dir 파일저장 디렉토리
     * @param fileName 파일명
     * @throws IOException
     */
    public static void createEmptyFile(String dir, String fileName) throws IOException{
        mkdirs(dir);

        File f = new File(dir + "/" + fileName);
        f.createNewFile();
    }

    /**
     * 파일명을 생성한다.
     * @param dir 디렉토리
     * @return 파일명
     */
    public static String randomFileName(String dir){
        mkdirs(dir);

        String fileName = RandomStringUtils.randomAlphanumeric(20);
        File f = new File(dir + "/" + fileName);
        if(f.exists()){
            randomFileName(dir);
        }

        return fileName;
    }
}
