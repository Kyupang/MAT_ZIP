<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        var sentimentResults = [];
        var positiveCount = 0;
        var negativeCount = 0;
        var totalReviews = 0;

        function fetchReview() {
            var storeId = '<%= session.getAttribute("store_id") %>';
            var encodedStoreId = encodeURIComponent(storeId);
            $.ajax({
                url: 'review/' + encodedStoreId,
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    totalReviews = response.length;
                    sentimentResults = [];
                    console.log('받아온 리뷰데이터: ' + JSON.stringify(response));
                    for (var i = 0; i < response.length; i++) {
                        var reviewContent = response[i];
                        analyzeSentiment(reviewContent);
                        console.log("reviewContent: " + JSON.stringify(reviewContent));
                    }
                },
                error: function(error) {
                    alert('네트워크 오류가 발생했습니다. 다시 시도해주세요.');
                }
            });
        }

        function decodeBase64Content(contentBase64) {
            try {
                return decodeURIComponent(escape(window.atob(contentBase64)));
            } catch (e) {
                console.error('Base64 decoding failed: ', e);
                return contentBase64;
            }
        }

        function analyzeSentiment(reviewContent) {
            var data = { "content": reviewContent };
            console.log("성공전 디코딩리뷰: "+ JSON.stringify(data));
            $.ajax({
                url: 'analyze',
                type: 'POST',
                data: JSON.stringify(data),
                contentType: 'application/json; charset=UTF-8',
                success: function(response) {
                    var sentences = response.sentences;
                    for (var i = 0; i < sentences.length; i++) {
                        sentences[i].content = decodeBase64Content(sentences[i].content);
                    }

                    console.log("성공시 응답받은 데이터: " + JSON.stringify(response, null, 2));
                    var sentiment = response.document.sentiment;
                    var confidence = response.document.confidence;

                    sentimentResults.push(sentiment);

                    $("body").append("<p>리뷰: " + sentences[0].content + ", 감정: " + sentiment + "</p>");

                    if (confidence.positive > confidence.negative) {
                        positiveCount++;
                    } else if (confidence.negative > confidence.positive) {
                        negativeCount++;
                    }

                    if (sentimentResults.length === totalReviews) {
                        calculateAndDisplayStatistics();
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert('감정 분석 중 오류가 발생했습니다. 다시 시도해주세요.');
                }
            });
        }

        function calculateAndDisplayStatistics() {
            var totalCount = positiveCount + negativeCount;
            var positivePercentage = (positiveCount / totalCount) * 100;
            var negativePercentage = (negativeCount / totalCount) * 100;

            $("body").append("<p>긍정 리뷰: " + positivePercentage.toFixed(2) + "%</p>");
            $("body").append("<p>부정 리뷰: " + negativePercentage.toFixed(2) + "%</p>");
        }

        $(document).ready(function() {
            $("#positiveReviewButton").click(function() {
                fetchReview();
            });
        });
    </script>
</head>
<body>
    긍정부정 리뷰 분석
    <div id="result"></div>
    <button id="positiveReviewButton">차트보기</button>
</body>
</html>
