package ns.paging;

import org.springframework.stereotype.Component;

@Component(value = "myGoodsTotalListPaging")
public class MyGoodsTotalListPaging {
	// 공통 적용
	private int currentPage; // 현재 페이지
	private int pageBlock; // 페이지 수
	private int pageSize; // 한 페이지 당 게시글 수
	private int totalList; // 총 게시글 수
	private StringBuffer pagingHTML; // jsp 페이징 소스

	// 검색옵션 추가 (2개)
	private String keyword; // 검색어
	private String goodsTstatus; // 상품 판매상태

	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		int totalP = (totalList / pageSize) + (totalList % pageSize == 0 ? 0 : 1); // 전체 페이지 수
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1; // 시작 페이지
		int endPage = startPage + pageBlock - 1; // 끝 페이지
		if (endPage > totalP)
			endPage = totalP;
		pagingHTML.append("<ul class='pagination justify-content-center'>");
		// href 뒤에는 각각 요청 할 mapperURL과 파라미터를 get방식으로 작성한다
		if (startPage > pageBlock)
			pagingHTML.append("<li class='page-item'><a class='page-link' href='/ns/myShop?goodsTstatus=" + goodsTstatus
					+ "&pg=" + (startPage - 1) + "&keyword=" + keyword
					+ "'><span aria-hidden='true'>&laquo;</span></a></li>");

		for (int i = startPage; i <= endPage; i++) {
			if (i == currentPage) {
				pagingHTML
						.append("<li class='page-item active'><a class='page-link' href='" + "/ns/myShop?goodsTstatus="
								+ goodsTstatus + "&pg=" + i + "&keyword=" + keyword + "'>" + i + "</a></li>");
			} else {
				pagingHTML.append("<li class='page-item'><a class='page-link' href='/ns/myShop?goodsTstatus="
						+ goodsTstatus + "&pg=" + i + "&keyword=" + keyword + "'>" + i + "</a></li>");
			}
		}

		if (endPage < totalP) {
			pagingHTML.append("<li class='page-item'><a class='page-link' href='/ns/myShop?goodsTstatus=" + goodsTstatus
					+ "&pg=" + (endPage + 1) + "&keyword=" + keyword
					+ "'><span aria-hidden='true'>&raquo;</span></a></li>");
		}
		pagingHTML.append("</ul>");
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalList() {
		return totalList;
	}

	public void setTotalList(int totalList) {
		this.totalList = totalList;
	}

	public StringBuffer getPagingHTML() {
		return pagingHTML;
	}

	public void setPagingHTML(StringBuffer pagingHTML) {
		this.pagingHTML = pagingHTML;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getGoodsTstatus() {
		return goodsTstatus;

	}

	public void setGoodsTstatus(String goodsTstatus) {
		this.goodsTstatus = goodsTstatus;
	}

}
