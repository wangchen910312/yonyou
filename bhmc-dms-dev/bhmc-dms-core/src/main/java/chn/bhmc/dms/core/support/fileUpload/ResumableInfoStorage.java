package chn.bhmc.dms.core.support.fileUpload;

import java.util.HashMap;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ResumableInfoStorage.java
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

public class ResumableInfoStorage {
    private static ResumableInfoStorage sInstance;
    private HashMap<String, ResumableInfo> mMap = new HashMap<String, ResumableInfo>();

    private ResumableInfoStorage() {
    }

    public static synchronized ResumableInfoStorage getInstance() {
        if (sInstance == null) {
            sInstance = new ResumableInfoStorage();
        }
        return sInstance;
    }

    /**
     * Get ResumableInfo from mMap or Create a new one.
     * @param resumableSessionId
     * @param resumableChunkSize
     * @param resumableTotalSize
     * @param resumableIdentifier
     * @param resumableFilename
     * @param resumableFileContentType
     * @param resumableRelativePath
     * @param resumableFilePath
     * @return
     */
    public synchronized ResumableInfo get(String resumableSessionId, int resumableChunkSize, long resumableTotalSize,
                             String resumableIdentifier, String resumableFilename, String resumableFileContentType,
                             String resumableRelativePath, String resumableFilePath) {

        ResumableInfo info = mMap.get(resumableIdentifier);

        if (info == null) {
            info = new ResumableInfo();

            info.resumableSessionId     = resumableSessionId;
            info.resumableChunkSize     = resumableChunkSize;
            info.resumableTotalSize     = resumableTotalSize;
            info.resumableIdentifier    = resumableIdentifier;
            info.resumableFilename      = resumableFilename;
            info.resumableFileContentType = resumableFileContentType;
            info.resumableRelativePath  = resumableRelativePath;
            info.resumableFilePath      = resumableFilePath;

            mMap.put(resumableIdentifier, info);
        }
        return info;
    }

    /**
     * Remove ResumableInfo from mMap
     * @param info
     */
    public void remove(ResumableInfo info) {
       mMap.remove(info.resumableIdentifier);
    }
}
