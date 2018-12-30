exports.add = function(page, perpagenum, totalCount){
    
     if(page <= 0 ){
        page = 1; // 페이지번호
    } else {
        page = page;
    }
    
    if(perpagenum < 0 || perpagenum > 100){
        perpagenum = 10; // 보여줄 페이지 수 10
    } else {
        perpagenum = perpagenum; 
    }
                    
    var startpage = (page - 1) * perpagenum; // 시작글
    var pageCount = Math.ceil(totalCount / perpagenum); //보여줄 페이지 수
    var sizepage = 10; // 보여줄 링크 수
                    
    var startPage = Math.floor((page-1) / sizepage) * sizepage + 1; // 시작페이지
                                
    var endPage = startPage + (sizepage - 1); // 마지막 페이지
    
        if (endPage > pageCount) { 
				endPage = pageCount;
        }

    var context = {
        page : parseInt(page),
        pageCount : pageCount,
        perPage : parseFloat(perpagenum),
        startpage : startpage,
        startPage : startPage,
        endPage : endPage                
    }
    
    return context; // 페이징 데이터 객체 반환
}
