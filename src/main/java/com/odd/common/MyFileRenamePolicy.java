package com.odd.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	// 원본 파일을 전달 받아서 파일명 수정작업후 수정된 파일을 반환시켜주는 메소드
	@Override
	public File rename(File originFile) {
	
		// 원본 파일명 ("aaa.jpg") 
		String originName = originFile.getName();
		
		// 수정 파일명 ("년월일시분초 + 랜덤5자리(10000~99999) + .jpg")
		
		// 1. 파일 업로드 시간
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 2. 5자리 랜덤값
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 3. 원본파일의 확장자 (. 포함)
		String ext = originName.substring(originName.lastIndexOf("."));
		// 											aaa.aa.jpg 같은 경우를 대비해 뒤에서부터 찾기
		
		String changeName = currentTime + ranNum + ext;
		
		return new File(originFile.getParent(), changeName);
	}
	
	

}
