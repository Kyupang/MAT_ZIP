<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>
	<section class="client_section layout_padding-bottom">
		<div class="container">
			<div
				class="heading_container heading_center psudo_white_primary mb_45">
				<h2>또슐랭 가이드</h2>
			</div>
			<div id="result" class="carousel-wrap row ">
				<div class="owl-carousel client_owl-carousel">
					<c:forEach items="${list}" var="bag">
						<div class="item">
							<div class="box">
								<div class="detail-box">
									<img src="resources/images/food1.png" alt="" class="box-img">
									<p>1</p>
									<p>${bag.name}</p>
									<h6>${bag.total}</h6>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
</body>
</html>