package com.tr.join.common;

import java.util.Map;

public class PageFactoryEdms {

public static String getPage(int cPage, int numPerpage, int totalData, String url,Map<String,Object> param) {
		
		//매개변수값을 이용해서 pageBar를 만들어주는 함수
		StringBuffer pageBar=new StringBuffer();
		
		//전체 페이지수
		int totalPage=(int)(Math.ceil((double)totalData/numPerpage));
		//페이지바 길이
		int pageBarSize=5;
		//페이지바 길이
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		pageBar.append("<ul class='pagination justify-content-center mt-5'>");
		
		if(pageNo==1) {
			pageBar.append("<li class='page-item disabled'>");
			pageBar.append("<a class='page-link' href='#'>&laquo;");
			pageBar.append("</a>");
			pageBar.append("</li>");
		}else {
			pageBar.append("<li class='page-item'>");
			pageBar.append("<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&laquo;");
			pageBar.append("</a>");
			pageBar.append("</li>");
		}
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar.append("<li class='page-item disabled'>");
				pageBar.append("<a class='page-link' href='#'>"+pageNo);
				pageBar.append("</a>");
				pageBar.append("</li>");				
			}else {
				pageBar.append("<li class='page-item'>");
				pageBar.append("<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo);
				pageBar.append("</a>");
				pageBar.append("</li>");
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar.append("<li class='page-item disabled '>");
			pageBar.append("<a class='page-link' href='#'>&raquo;");
			pageBar.append("</a>");
			pageBar.append("</li>");
		}else {
			pageBar.append("<li class='page-item'>");
			pageBar.append("<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>&raquo;");
			pageBar.append("</a>");
			pageBar.append("</li>");
		}
		pageBar.append("</ul>");
		
		//스크립트문 추가
		pageBar.append("<script>");
		pageBar.append("function fn_paging(no){");
		pageBar.append("location.assign('"+url+"?cPage='+no+'&numPerpage="+numPerpage+"');");
		pageBar.append("}");
		pageBar.append("</script>");
		
		return new String(pageBar);
		
	}
	
	public static String getAjaxPageNo(int cPage, int numPerpage, int totalData, String url,Map<String,Object> param) {
		
		//매개변수값을 이용해서 pageBar를 만들어주는 함수
		StringBuffer pageBar=new StringBuffer();
		String category=(String)param.get("category");
		String keyword=(String)param.get("keyword");
	
		
		//전체 페이지수
		int totalPage=(int)(Math.ceil((double)totalData/numPerpage));
		//페이지바 길이
		int pageBarSize=5;
		//페이지바 길이
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		pageBar.append("<ul class='pagination justify-content-center mt-5'>");
		
		if(pageNo==1) {
			pageBar.append("<li class='page-item disabled'>");
			pageBar.append("<a class='page-link' href='#'>&laquo;");
			pageBar.append("</a>");
			pageBar.append("</li>");
		}else {
			pageBar.append("<li class='page-item'>");
			pageBar.append("<a class='page-link' href=\"javascript:fn_paging("+(pageNo-1)+","+numPerpage+",'"+category+"','"+keyword+"')\">&laquo;");
			pageBar.append("</a>");
			pageBar.append("</li>");
		}
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar.append("<li class='page-item disabled'>");
				pageBar.append("<a class='page-link' href='#'>"+pageNo);
				pageBar.append("</a>");
				pageBar.append("</li>");				
			}else {
				pageBar.append("<li class='page-item'>");
				pageBar.append("<a class='page-link' href=\"javascript:fn_paging("+(pageNo)+","+numPerpage+",'"+category+"','"+keyword+"')\">"+pageNo);
				pageBar.append("</a>");
				pageBar.append("</li>");
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar.append("<li class='page-item disabled '>");
			pageBar.append("<a class='page-link' href='#'>&raquo;");
			pageBar.append("</a>");
			pageBar.append("</li>");
		}else {
			pageBar.append("<li class='page-item'>");
			pageBar.append("<a class='page-link' href=\"javascript:fn_paging("+(pageNo)+","+numPerpage+",'"+category+"','"+keyword+"')\">&raquo;");
			pageBar.append("</a>");
			pageBar.append("</li>");
		}
		pageBar.append("</ul>");
		
		
		return new String(pageBar);
		
	}
	
	public static String getAjaxPaging(int cPage, int numPerpage, int totalData, String url, Map<String, Object> ajaxParam) {
	    // 매개변수값을 이용해서 pageBar를 만들어주는 함수
	    StringBuffer pageBar = new StringBuffer();

	    // 전체 페이지수
	    int totalPage = (int) (Math.ceil((double) totalData / numPerpage));
	    // 페이지바 길이
	    int pageBarSize = 5;
	    // 페이지바 길이
	    int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
	    int pageEnd = pageNo + pageBarSize - 1;

	    pageBar.append("<ul class='pagination justify-content-center mt-5'>");

	    if (pageNo == 1) {
	        pageBar.append("<li class='page-item disabled'>");
	        pageBar.append("<a class='page-link' href='javascript:void(0);' onclick='fn_paging(" + pageNo + "," + numPerpage + "," + ajaxParam.get("searchNum") + ");'>" + pageNo);
	        pageBar.append("</a>");
	        pageBar.append("</li>");
	    } else {
	        pageBar.append("<li class='page-item'>");
	        pageBar.append("<a class='page-link' href='javascript:void(0);' onclick='fn_paging(" + pageNo + "," + numPerpage + "," + ajaxParam.get("searchNum") + ");'>" + pageNo);
	        pageBar.append("</a>");
	        pageBar.append("</li>");
	    }
	    
	    while (!(pageNo > pageEnd || pageNo > totalPage)) {
	        if (pageNo == cPage) {
	            pageBar.append("<li class='page-item disabled'>");
	            pageBar.append("<a class='page-link' href='javascript:void(0);' onclick='fn_paging(" + pageNo + "," + numPerpage + "," + ajaxParam.get("searchNum") + ");'>" + pageNo);
	            pageBar.append("</a>");
	            pageBar.append("</li>");
	        } else {
	            pageBar.append("<li class='page-item'>");
	            pageBar.append("<a class='page-link' href='javascript:void(0);' onclick='fn_paging(" + pageNo + "," + numPerpage + "," + ajaxParam.get("searchNum") + ");'>" + pageNo);
	            pageBar.append("</a>");
	            pageBar.append("</li>");
	        }
	        pageNo++;
	    }

	    if (pageNo > totalPage) {
	        pageBar.append("<li class='page-item disabled'>");
	        pageBar.append("<a class='page-link' href='javascript:void(0);' onclick='fn_paging(" + pageNo + "," + numPerpage + "," + ajaxParam.get("searchNum") + ");'>" + pageNo);
	        pageBar.append("</a>");
	        pageBar.append("</li>");
	    } else {
	        pageBar.append("<li class='page-item'>");
	        pageBar.append("<a class='page-link' href='javascript:void(0);' onclick='fn_paging(" + pageNo + "," + numPerpage + "," + ajaxParam.get("searchNum") + ");'>" + pageNo);
	        pageBar.append("</a>");
	        pageBar.append("</li>");
	    }
	    pageBar.append("</ul>");

	    return new String(pageBar);
	}
	
}
