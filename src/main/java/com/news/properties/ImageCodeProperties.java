package com.news.properties;


/**
 * Created on 2018/410.
 *
 * @author pxq
 * @since 1.0
 */

public class ImageCodeProperties extends SmsCodeProperties {
    public ImageCodeProperties() {

    }
    /**
     * 图片宽
     */
    private int width = 87;
    /**
     * 图片高
     */
    private int height = 23;

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }
}
