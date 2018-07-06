package com.news.validate.code.image;




import com.news.validate.code.ValidateCode;

import java.awt.image.BufferedImage;
import java.time.LocalDateTime;


public class ImageCode extends ValidateCode {
    private static final long serialVersionUID = -3157935668300472492L;

    private BufferedImage image;

    public ImageCode(BufferedImage image, String code, int expireIn) {
        super(code, expireIn);
        this.image = image;
    }

    public ImageCode(BufferedImage image, String code, LocalDateTime expireTime){
        super(code, expireTime);
        this.image = image;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public BufferedImage getImage() {
        return image;
    }

    public void setImage(BufferedImage image) {
        this.image = image;
    }
}
