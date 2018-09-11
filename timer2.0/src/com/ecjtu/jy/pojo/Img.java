package com.ecjtu.jy.pojo;

/**
 * 图片表实体类
 * @author 建伟
 * @date 20180724
 * @version 1.0
 */
public class Img {

	private Integer imgId;	 //图片Id
	private Integer belongId;//所属相册Id
	private String ImgUrl;	 //图片URL
	public Img(Integer imgId, Integer belongId, String imgUrl) {
		super();
		this.imgId = imgId;
		this.belongId = belongId;
		ImgUrl = imgUrl;
	}
	public Img() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getImgId() {
		return imgId;
	}
	public void setImgId(Integer imgId) {
		this.imgId = imgId;
	}
	public Integer getBelongId() {
		return belongId;
	}
	public void setBelongId(Integer belongId) {
		this.belongId = belongId;
	}
	public String getImgUrl() {
		return ImgUrl;
	}
	public void setImgUrl(String imgUrl) {
		ImgUrl = imgUrl;
	}
	@Override
	public String toString() {
		return "Img [imgId=" + imgId + ", belongId=" + belongId + ", ImgUrl=" + ImgUrl + "]";
	}
	
	
	
	
	
}
