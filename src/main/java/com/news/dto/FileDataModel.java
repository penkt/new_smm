package com.news.dto;

import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

public class FileDataModel implements Serializable{
    private String filename;

    private MultipartFile file;

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

}
