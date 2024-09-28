$('#searchKeyword').on('keydown', function(event) {
    if (event.key === 'Enter') {  // Enter 키가 눌렸을 때
        event.preventDefault();  // 기본 동작 방지 (Enter로 인한 폼 제출 방지)
        let keyword = $('#searchKeyword').val();

        // URL에 keyword를 쿼리 파라미터로 추가하여 페이지 이동
        location.href = '/Inbeomstagram/searchPage/subjectSearchPage.do?keyword=' + encodeURIComponent(keyword);
    }
});

function resizeGridItems() {
    $('.grid-item').each(function() {
        var $gridItem = $(this);
        imagesLoaded(this, function() {
            var $grid = $('.gallery');
            var rowHeight = parseInt($grid.css('grid-auto-rows'));
            var rowGap = parseInt($grid.css('grid-gap'));
            var rowSpan = Math.floor(($gridItem.find('img').outerHeight() + rowGap) / (rowHeight + rowGap));
            $gridItem.css('grid-row-end', 'span ' + rowSpan);
        });
    });

    var $gallery = $('.gallery');
    imagesLoaded($gallery[0], function() {
        $('.grid-item').css('visibility', 'visible');
    });
}

$(window).on('load', resizeGridItems);
$(window).on('resize', resizeGridItems);

$(document).ready(function() {
    let currentPage = 1;
    const pageSize = 10;
    let loading = false;
    let keyword = new URLSearchParams(window.location.search).get('keyword'); // URL에서 키워드 가져오기

    // 첫 페이지 데이터 로드
    loadMoreData(currentPage, keyword);

    // 스크롤 이벤트 감지
    $(window).scroll(function() {
        // 스크롤이 페이지 끝에 도달했을 때 추가 데이터 요청
        if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100 && !loading) {
            loading = true;
            loadMoreData(currentPage, keyword);
        }
    });

    function loadMoreData(page, keyword) {
        $.ajax({
            url: 'subjectSearchPage.do',
            type: 'GET',
            data: { page: page, keyword: keyword },  // 페이지 번호와 키워드 전달
            dataType: 'json',
            success: function(data) {
                if (data.length > 0) {
                    renderData(data);
                    currentPage++;  // 데이터 로드 후 다음 페이지를 준비
                    loading = false;
                }
            },
            error: function() {
                console.log("데이터를 불러오는 중 오류가 발생했습니다.");
            }
        });
    }

    function renderData(data) {
        data.forEach(function(boardDTO) {
            const newItem = `
                <div class="grid-item">
                    <a href="board/boardView.do?seq_board=${boardDTO.seq_board}">
                        <img src="storage/${boardDTO.image}" alt="${boardDTO.imageSubject}" />
                        <span class="hit">${boardDTO.hit}</span>
                    </a>
                </div>`;
            $('.gallery').append(newItem);
        });
    }
});