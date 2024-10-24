package com.example.demo.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PagingVO<T> {
	private int pageStartNo=1;
	private int pageStart;
	private int pageSize; 
	private int pageBottom;
	private int pageEndNo;
	private int totalPage; 
	
	private List<T> list;
	private int totalCount;
	private int startNo;
	private int endNo;
	
	private String title;
	public PagingVO(int pageStart,int pageSize,int pageBottom,int total,String title){
		this.pageStart=pageStart;
		this.pageSize=pageSize;
		this.pageBottom=pageBottom;
		this.totalCount=total;
		this.title=title;
		calc();
	}

	private void calc() {
		if(totalCount>0) {
			totalPage = (totalCount-1)/pageSize+1;
			pageStartNo = (pageStart-1)/pageBottom*pageBottom+1;
			pageEndNo = pageStartNo+pageBottom-1;
			if(pageEndNo>totalPage)pageEndNo=totalPage;
			startNo = (pageStart-1)*pageSize;
		}
	}
	public String getPagination() {
		StringBuilder sb = new StringBuilder("<div class='container'>");
		String pageLink2="";
		if(title!=null && !title.isEmpty()) {
			try {
				pageLink2+="&title="+URLEncoder.encode(title,"utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(pageStartNo>pageBottom) {
			sb.append("<div class='item'><a href='notice.jsp?p=1"+pageLink2+"'>&laquo;</a></div>");
			sb.append("<div class='item'><a href='notice.jsp?p="+(pageStartNo-1)+pageLink2+"'>&lt;</a></div>");
		}
		for(int i=pageStartNo;i<=pageEndNo;i++) {
			String pageLink="p="+i;
			if(title!=null && !title.isEmpty()) {
				try {
					pageLink+="&title="+URLEncoder.encode(title,"utf-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(i==pageStart)sb.append("<div class='item selected'><a href='javascript:void(0)' onclick='getData("+i+",3,3)'>"+i+"</a></div>");
			else sb.append("<div class='item'><a href='javascript:void(0)' onclick='getData("+i+",3,3)'>"+i+"</a></div>");
		}
		if(pageEndNo<totalPage) {
			
			sb.append("<div class='item'><a href='notice.jsp?p="+(pageStartNo+pageBottom)+pageLink2+"'>&gt;</a></div>");
			sb.append("<div class='item'><a href='notice.jsp?p="+(totalPage)+pageLink2+"'>&raquo;</a></div>");
		}
		sb.append("</div>");		
		return sb.toString();
	}
}
