<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<section id="footer">

				<div class="inner">
					<form method="post" action="../board/commentPro.jsp?num=<%=request.getParameter("num")%>">
						<div class="field">
							<label for="message">Comment</label>
							<textarea name="comment"  rows="6"></textarea>
						</div>
						<ul class="actions">
							<li><input type="submit" value="댓글등록" class="alt" /></li>
						</ul>
					</form>
					<div class="copyright">
						&copy; Untitled Design: <a href="https://templated.co/">TEMPLATED</a>. Images <a href="https://unsplash.com/">Unsplash</a>
					</div>
				</div>
			</section>