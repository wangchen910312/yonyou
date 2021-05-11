package chn.bhmc.dms.cmm.mig.service.impl;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.ProcessBuilder.Redirect;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.xml.transform.stream.StreamSource;

import able.com.service.HService;

import org.apache.commons.io.FileUtils;
import org.springframework.oxm.XmlMappingException;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.mig.service.PatchService;
import chn.bhmc.dms.cmm.mig.vo.PatchInfoSearchVO;
import chn.bhmc.dms.cmm.mig.vo.PatchInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PatchServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 12. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 7.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("patchService")
public class PatchServiceImpl extends HService implements PatchService {

    @Resource(name="jaxb2Marshaller")
    Jaxb2Marshaller unmarshaller;

    /*
     * @see chn.bhmc.dms.cmm.mig.service.PatchService#selectPatchInfo(chn.bhmc.dms.cmm.mig.vo.PatchInfoSearchVO)
     */
    @Override
    public PatchInfoVO selectPatchInfo(PatchInfoSearchVO patchInfoSearchVO) throws Exception {

        PatchInfoVO patchInfoVO = null;
        String xmlString = selectUrlContentsToString(patchInfoSearchVO.getRepositoryUrl(), patchInfoSearchVO.getPatchFileName());

        ByteArrayInputStream in = new ByteArrayInputStream(xmlString.getBytes());
        StreamSource streamSource = new StreamSource(in);

        try {
            patchInfoVO = (PatchInfoVO)unmarshaller.unmarshal(streamSource);
        } catch (XmlMappingException e) {
            e.printStackTrace();
            throw e;
        }

        return patchInfoVO;
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.PatchService#selectPatchFileDownload(java.lang.String, java.lang.String)
     */
    @Override
    public void selectPatchFileDownload(String sourceUrl, String destPath) throws Exception {
        FileUtils.copyURLToFile(new URL(sourceUrl), new File(destPath));
    }

    private String selectUrlContentsToString(String repositoryUrl, String patchFileName) throws MalformedURLException, IOException {
        URL url = null;
        InputStream is = null;

        try {

            url = new URL(repositoryUrl + "/" + patchFileName);
            is = url.openStream();

            InputStreamReader isr = new InputStreamReader(is);

            int numCharsRead;
            char[] charArray = new char[1024];
            StringBuffer sb = new StringBuffer();
            while ((numCharsRead = isr.read(charArray)) > 0) {
                sb.append(charArray, 0, numCharsRead);
            }

            return sb.toString();

        } catch (MalformedURLException e) {
            e.printStackTrace();
            throw e;
        } catch (IOException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if(is != null){
                try {
                    is.close();
                 } catch (IOException ioe) {}
            }
        }
    }

    @Override
    public void updatePatchDeploy(String patchScript, String patchTempFolder, String webappsFolder) throws Exception {

        List<String> commands = new ArrayList<String>();
        commands.add(patchScript);
        /*commands.add("jeusadmin -host localhost:9936 -domain jeus_domain -u administrator -p jeusadmin local-shutdown");
        commands.add(String.format("Xcopy /S /I /E %s %s", patchTempFolder, webappsFolder));
        commands.add("startManagedServer -dasurl localhost:9736 -domain jeus_domain -server bhmc-dms-web  -u administrator -p jeusadmin &");*/

        ProcessBuilder processBuilder  = new ProcessBuilder(commands);
        processBuilder.directory(new File("D:/"));
        processBuilder.redirectErrorStream(true);
        processBuilder.redirectOutput(Redirect.appendTo(new File("D:/apps/bhmc-dms-patch/deploy.log")));

        Process p = processBuilder.start();
        p.waitFor();
        p.destroy();

        File f = new File("D:/apps/bhmc-dms-patch/patch.lock");
        f.createNewFile();
    }

}
