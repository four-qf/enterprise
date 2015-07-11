package com.cengze.util;

import java.util.List;
import javax.servlet.http.HttpSession;

public class PageUtil {
	
	private Integer pageNow=1 ;
	
	private Integer pageSize =4;
	
	private Integer pageCount;
	
	private Integer rowCount;
	
    public void getPageCount(List list, HttpSession session) {
    	rowCount = list.size();
    	pageCount = (rowCount -1) / pageSize + 1;
        session.setAttribute("pageNow", pageNow);
        session.setAttribute("pageCount", pageCount);
        session.setAttribute("pageSize", pageSize);
    }	
	
}
