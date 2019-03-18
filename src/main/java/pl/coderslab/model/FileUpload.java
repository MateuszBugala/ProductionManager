package pl.coderslab.model;

import javax.persistence.*;
import java.util.Arrays;

@Entity
@Table(name = "files_upload")
public class FileUpload {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="file_id")
    private int id;

    @Lob
    @Column(name="file_data")
    private byte[] data;

    @Column(name="file_name")
    private String fileName;

    @Column(name="file_description")
    private String fileDescription;

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileDescription() {
        return fileDescription;
    }

    public void setFileDescription(String fileDescription) {
        this.fileDescription = fileDescription;
    }

    public byte[] getData() {
        return data;
    }

    public void setData(byte[] data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "FileUpload{" +
                "id=" + id +
                ", data=" + Arrays.toString(data) +
                ", fileName='" + fileName + '\'' +
                ", fileDescription='" + fileDescription + '\'' +
                '}';
    }
}
