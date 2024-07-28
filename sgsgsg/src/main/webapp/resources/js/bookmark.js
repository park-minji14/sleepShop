// bookmark.js

$(document).ready(function() {
    initBookmarkStatus();
    
    $(document).on('click', '.bookmark', function(e) {
        e.preventDefault();
        e.stopPropagation();
        if (!isUserLoggedIn()) {
            alert("로그인 후 이용 가능합니다.");
            return;
        }
        var productId = $(this).data('product-id');
        toggleWishlist(productId);
    });
});

function isUserLoggedIn() {
    return window.isLoggedIn === true;
}

function initBookmarkStatus() {
    if (isUserLoggedIn()) {
        $('.bookmark').each(function() {
            var $bookmark = $(this);
            var productId = $bookmark.data('product-id');
            getBookmarkStatus(productId, function(isBookmarked, count) {
                updateBookmarkUI($bookmark, isBookmarked, count);
            });
        });
    } else {
        $('.bookmark').addClass('disabled').attr('title', '로그인 후 이용 가능');
    }
}

function getBookmarkStatus(productId, callback) {
    if (!isUserLoggedIn()) {
        callback(false, 0);
        return;
    }

    $.ajax({
        url: contextPath + "/wishlist/status",
        type: "GET",
        data: {productNum: productId},
        dataType: "json",
        success: function(data) {
            if(data.state === "true") {
                callback(data.isBookmarked, data.bookmarkCount);
            } else {
                console.error(data.message);
                callback(false, 0);
            }
        },
        error: function(xhr, status, error) {
            console.error("북마크 상태 조회 실패:", status, error);
            callback(false, 0);
        }
    });
}

function updateBookmarkUI($bookmark, isBookmarked, count) {
    if (isBookmarked) {
        $bookmark.addClass('active').attr('title', '북마크 해제');
    } else {
        $bookmark.removeClass('active').attr('title', '북마크 추가');
    }
    $bookmark.find('.bookmark-count').text(count);
}

function toggleWishlist(productNum) {
    if (!isUserLoggedIn()) {
        alert("로그인 후 이용 가능합니다.");
        return;
    }

    $.ajax({
        url: contextPath + "/wishlist/toggle",
        type: "POST",
        data: {productNum: productNum},
        dataType: "json",
        success: function(data) {
            if(data.state === "true") {
                var $bookmark = $(".bookmark[data-product-id='" + productNum + "']");
                updateBookmarkUI($bookmark, data.isAdded, data.bookmarkCount);
                
                if(!data.isAdded && $('body').hasClass('mypage-wishlist')) {
                    removeProductFromWishlist(productNum);
                }
            } else {
                alert(data.message);
            }
        },
        error: function(xhr, status, error) {
            console.error("북마크 토글 실패:", error);
        }
    });
}

function removeProductFromWishlist(productNum) {
    $('.product-item[data-product-id="' + productNum + '"]').remove();
    
    if($('.product-item').length === 0) {
        showEmptyWishlistMessage();
    }
}

function showEmptyWishlistMessage() {
    $('.product-grid').html('<p class="empty-wishlist">위시리스트가 비어있습니다.</p>');
}