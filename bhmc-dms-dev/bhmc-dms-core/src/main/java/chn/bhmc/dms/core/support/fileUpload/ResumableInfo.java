package chn.bhmc.dms.core.support.fileUpload;

import java.io.File;
import java.util.HashSet;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ResumableInfo.java
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

public class ResumableInfo {

    public String   resumableSessionId;
    public int      resumableChunkSize;
    public long     resumableTotalSize;
    public String   resumableIdentifier;
    public String   resumableFilename;
    public String   resumableFileContentType;
    public String   resumableRelativePath;
    public int      resumableFileNo;

    public HashSet<ResumableChunkNumber> uploadedChunks = new HashSet<ResumableChunkNumber>();
    public String resumableFilePath;

    private boolean finished = false;
    public Map<String, Object> saveFileInfo;

    public FileUploadSaveHandler dataSaveStrategy = new FileUploadSaveHandler(){

        @Override
        public Map<String, Object> save(File file) {
            String new_path = file.getAbsolutePath().substring(0, file.getAbsolutePath().length() - ".temp".length());
            file.renameTo(new File(new_path));

            return null;
        }

    };

    public static class ResumableChunkNumber {
        public ResumableChunkNumber(int number) {
            this.number = number;
        }

        public int number;

        @Override
        public boolean equals(Object obj) {
            return obj instanceof ResumableChunkNumber
                    ? ((ResumableChunkNumber)obj).number == this.number : false;
        }

        @Override
        public int hashCode() {
            return number;
        }
    }


    public boolean vaild(){
        if (StringUtils.isEmpty(resumableSessionId)
                || resumableChunkSize < 0
                || resumableTotalSize < 0
                || StringUtils.isEmpty(resumableIdentifier)
                || StringUtils.isEmpty(resumableFilename)
                || StringUtils.isEmpty(resumableRelativePath)) {
            return false;
        } else {
            return true;
        }
    }

    public boolean checkIfUploadFinished() {
        int count = (int) Math.ceil(((double) resumableTotalSize) / ((double) resumableChunkSize));
        for(int i = 1; i < count; i ++) {
            if (!uploadedChunks.contains(new ResumableChunkNumber(i))) {
                return false;
            }
        }

        if(!finished){

            finished = true;

            File file = new File(resumableFilePath);

            try{
                this.saveFileInfo = dataSaveStrategy.save(file);
                if(this.saveFileInfo != null){
                    this.resumableFileNo = (Integer)this.saveFileInfo.get("FILE_NO");
                }
            }catch(Exception e){}
        }

        return true;
    }

    public void setDataSaveStrategy(FileUploadSaveHandler dataSaveStrategy) {
        this.dataSaveStrategy = dataSaveStrategy;
    }
}
