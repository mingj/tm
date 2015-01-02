<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="dataTables_paginate paging_bootstrap pagination pagination-centered">
	<ul>
		<c:if test="${pageVo.totalPage!=0}">
			<c:choose>
				<c:when test="${pageVo.currentPage>1}">
					<li>
						<a href="#" onclick="goPage('${pageVo.lastPage}')">&laquo;</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="disabled">
						<a>&laquo;</a>
					</li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="1" end="${pageVo.totalPage}">
				<c:choose>
					<c:when test="${pageVo.currentPage==i}">
						<li class="active">
							<a href="#">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="#" onclick="goPage('${i}')">${i}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when	test="${pageVo.currentPage < pageVo.totalPage}">
					<li>
						<a href="javascript:void(0)" onclick="goPage('${pageVo.nextPage}')">&raquo;</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="disabled">
						<a>&raquo;</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:if>
	</ul>
</div>
