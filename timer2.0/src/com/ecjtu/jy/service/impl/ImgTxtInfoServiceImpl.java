package com.ecjtu.jy.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ecjtu.jy.dao.IImgTxtInfoDao;
import com.ecjtu.jy.dao.impl.ImgTxtInfoDaoImpl;
import com.ecjtu.jy.pojo.ImgTxtInfo;
import com.ecjtu.jy.service.IImgTxtInfoService;

public class ImgTxtInfoServiceImpl implements IImgTxtInfoService {

	private IImgTxtInfoDao iImgTxtInfoDao = new ImgTxtInfoDaoImpl();
	
	@Override
	public int insertImgTxtInfo(ImgTxtInfo imgTxt) {
		int result = 0;
		result = iImgTxtInfoDao.insertImgTxtInfo(imgTxt);
		return result;
	}

	@Override
	public int deleteImgTxtInfoById(int id) {
		int result = 0;
		result = iImgTxtInfoDao.deleteImgTxtInfoById(id);
		return result;
	}

	@Override
	public List<ImgTxtInfo> selectImgTxtByPageNum(int pageNum, int id) {
		List<ImgTxtInfo> imgTxtInfos = new ArrayList<>();
		imgTxtInfos = iImgTxtInfoDao.selectImgTxtByPageNum(pageNum, id);
		return imgTxtInfos;
	}

	@Override
	public int selectImgTxtSum(int id) {
		int sum = 0;
		sum = iImgTxtInfoDao.selectImgTxtSum(id);
		return sum;
	}

	@Override
	public List<ImgTxtInfo> selectImgTxtByHot(int pageNum, int id) {
		List<ImgTxtInfo> imgTxtInfos = new ArrayList<>();
		imgTxtInfos = iImgTxtInfoDao.selectImgTxtByHot(pageNum, id);
		return imgTxtInfos;
	}

	@Override
	public List<ImgTxtInfo> selectImgTxtByComment(int pageNum, int id) {
		List<ImgTxtInfo> imgTxtInfos = new ArrayList<>();
		imgTxtInfos = iImgTxtInfoDao.selectImgTxtByComment(pageNum, id);
		return imgTxtInfos;
	}

	@Override
	public ImgTxtInfo selectImgTxtById(int id) {
		ImgTxtInfo imgTxtInfo = new ImgTxtInfo();
		imgTxtInfo = iImgTxtInfoDao.selectImgTxtById(id);
		return imgTxtInfo;
	}

}
