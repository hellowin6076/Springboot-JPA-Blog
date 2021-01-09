<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">

	<button class="btn btn-secondary" onclick="history.back()">back</button>
	<c:if test="${board.user.id== principal.user.id}">
		<a href="/board/${board.id}/updateForm" class="btn btn-warning">rewrite</a>
		<button id="btn-delete" class="btn btn-danger">delete</button>
	</c:if>
	<br /> <br />
	<div>
		글 번호 : <span id="id"><i>${board.id}</i></span> 작 성 자: <span><i>${board.user.username}</i></span>
	</div>
	<br /> <br />
	<div>
		<h3>${board.title}</h3>
	</div>
	<hr />
	<div>
		<div>${board.content}</div>
	</div>
	<hr />
	<div class="card">
		<form>
			<input type="hidden" id="userId" value="${principal.user.id}" />
			<input type="hidden" id="boardId" value="${board.id}" />
			<div class="card-body">
				<textarea id="reply-content" class="form-control" rows="1"></textarea>
			</div>
			<div class="card-footer">
				<button type="button" id="btn-reply-save" class="btn btn-primary">comment</button>
			</div>
		</form>
	</div>
	<br />
	<div class="card">
		<div class="card-header">commet list</div>
		<ul id="reply-box" class="list-group">
			<c:forEach var="reply" items="${board.replys}">
				<li id="reply-${reply.id}"
					class="list-group-item d-flex justify-content-between">
					<div>${reply.content}</div>
					<div class="d-flex">
						<div class="font-italic">writer : ${reply.user.username}
							&nbsp;</div>
						<button onClick="index.replyDelete(${board.id},${reply.id})" class="badge">delete</button>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>

</div>

<script>
	$('.summernote').summernote({
		tabsize : 2,
		height : 300
	});
</script>
<br />
<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>

