<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<h4>지역별 코치 찾기</h4>
	<div class="well" style="background-color: lightgray;">
		<div class="coachloc">
		서울 > &nbsp;&nbsp;&nbsp;
		<input type="radio" value="강남구" name="local">강남구&nbsp; 
		<input type="radio" value="노원구" name="local">노원구&nbsp;
		<input type="radio" value="서초구" name="local">서초구&nbsp;
		<input type="radio" value="용산구" name="local">용산구&nbsp;
		<input type="radio" value="은평구" name="local">은평구
		<br>
		경기 > &nbsp;&nbsp;&nbsp;
		<input type="radio" value="성남시" name="local">성남시&nbsp;
		<input type="radio" value="안양시" name="local">안양시&nbsp;
		<input type="radio" value="양평시" name="local">양평시&nbsp;
		<input type="radio" value="용인시" name="local">용인시&nbsp;
		<input type="radio" value="의정부시" name="local">의정부시
		<br>
		</div>
		 
	</div>

    <!-- Page Content -->

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
       
            <div class="col-lg-12">
                <h1 class="page-header"> Health人 코치진 소개
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a>
                    </li>
                    <li class="active">One Column Portfolio</li>
                </ol>
            </div>
        </div>

        <!-- 강사 리스트  -->
        <div class="row">
            <div class="col-sm-3 text-center">
                    <a href="#">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/트레이너1.jpg" width="750"  height="450">
                    </a>
                </div>
            <div class="col-md-9">
                <h3>Project One</h3>
                <h4>Subheading</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.</p>
                <a class="btn btn-primary" href="portfolio-item.html">View Project</a>
            </div>
        </div>
        <hr>
 <!-- 강사 리스트  -->
        <div class="row">
            <div class="col-sm-3 text-center">
                    <a href="#">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/트레이너1.jpg" width="750"  height="450">
                    </a>
                </div>
            <div class="col-md-9">
                <h3>Project One</h3>
                <h4>Subheading</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.</p>
                <a class="btn btn-primary" href="portfolio-item.html">View Project</a>
            </div>
        </div>
        <hr>
         <!-- 강사 리스트  -->
        <div class="row">
            <div class="col-sm-3 text-center">
                    <a href="#">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/트레이너1.jpg" width="750"  height="450">
                    </a>
                </div>
            <div class="col-md-9">
                <h3>Project One</h3>
                <h4>Subheading</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.</p>
                <a class="btn btn-primary" href="portfolio-item.html">View Project</a>
            </div>
        </div>
        <hr>
        <!-- 강사 리스트  -->
        <div class="row">
            <div class="col-sm-3 text-center">
                    <a href="#">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/resources/img/트레이너1.jpg" width="750"  height="450">
                    </a>
                </div>
            <div class="col-md-9">
                <h3>Project One</h3>
                <h4>Subheading</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.</p>
                <a class="btn btn-primary" href="portfolio-item.html">View Project</a>
            </div>
        </div>
        <hr>
        
        <p class="paging">
					<c:set var="pb" value="${requestScope.listVo.pagingBean}"></c:set>
					
					<c:if test="${pb.previousPageGroup}">
						<a href="DispatcherServlet?command=storeAllList&pageNo=${pb.startPageOfPageGroup-1}">◀&nbsp;
						</a>
					</c:if>
					<c:forEach var="pageNo" begin="${pb.startPageOfPageGroup}"
						end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage!=pageNo}">
								<a href="DispatcherServlet?command=storeAllList&pageNo=${pageNo}">${pageNo}</a>
							</c:when>
							<c:otherwise>${pageNo}</c:otherwise>
						</c:choose>&nbsp;
						</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<a href="DispatcherServlet?command=storeAllList&pageNo=${pb.endPageOfPageGroup+1}">▶</a>
					</c:if>
				</p>
        
        </div>