package chn.bhmc.dms.core.i18n;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FilenameProperties.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19.     Kang Seok Han     최초 생성
 * </pre>
 */

public class FilenameProperties {
    private String basename = null;
    private String language = null;
    private String country = null;
    private String variant = null;

    private String[] properties = null;

    public FilenameProperties(String filename){
        extractProperties(filename);
    }

    private void extractProperties(String filename){
        if(filename != null){
            String[] prop = filename.split("_");
            this.properties = prop;

            switch(prop.length){
                case 1 :
                    this.basename = prop[0];
                    break;
                case 2 :
                    this.basename = prop[0];
                    this.language = prop[1];
                    break;
                case 3 :
                    this.basename = prop[0];
                    this.language = prop[1];
//                    this.country = prop[2];
                    break;
                case 4 :
                    this.basename = prop[0];
                    this.language = prop[1];
//                    this.country = prop[2];
//                    this.variant = prop[3];
                    break;
            }
        }
    }

    public String[] getProperties(){
        return this.properties;
    }

    public String getBasename() {
        return basename;
    }

    public void setBasename(String basename) {
        this.basename = basename;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getVariant() {
        return variant;
    }

    public void setVariant(String variant) {
        this.variant = variant;
    }

    public String toString(){
        return ReflectionToStringBuilder.toString(this);
    }
}
