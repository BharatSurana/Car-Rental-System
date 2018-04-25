package net.CRS;

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javazoom.upload.*;


public class UploadFiles {
	
	public static String upload(HttpServletRequest req,String fileText){
		String file="";
		try{
			if(MultipartFormDataRequest.isMultipartFormData(req)){	
				MultipartFormDataRequest mReq = new MultipartFormDataRequest(req);
				Hashtable files = mReq.getFiles();
				System.out.println ("Hashtable : "+files);
				if((files!=null) && (!files.isEmpty())){
					UploadFile uFile = (UploadFile)files.get(fileText);
					if(uFile!=null){
						file =uFile.getFileName();
						UploadBean upBean = new UploadBean();
						upBean.setFolderstore(req.getRealPath("images"));
						upBean.store(mReq,fileText); 
					}
					
				}//if
				else {
					System.out.println ("No Uploaded Files");
				}
			}//if
			else {
				System.out.println ("Request is not MutliPart...");
			}
		}catch(Exception exception){
			System.out.println ("Upload Exception :"+exception);
		}
		return file;		
	}//upload
	
}//class 