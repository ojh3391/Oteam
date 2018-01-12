<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
    		//중복체크 버튼
	    	function checkId() {
		    	//한글 아이디 받아오기위해 url에서도 인코딩
		    	url = "/CFK/user/user_checkID.jsp?user_id="+encodeURIComponent(document.userInfo.user_id.value);
		    	//open(주소, 이름, 설정)
		    	open(url, "check", "menubar=no, top=400,left=800,width=300,height=100");
		    	
		    	return true;
	    	}
	    	 
	    	//비어있는 값이 있는지 체크
	    	function checkValue() {
		    	var form = document.userInfo;
		    	//이메일 패턴 지정
		    	var email=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
		    	if(!form.user_id.value) {
		    		alert("아이디를 입력하세요.");
		    		return false;
		    	} else if(form.idReduplication.value !="check_id"){ 	//아이디 중복체크 여부를 받아와서 처리
		    		alert("아이디 중복체크를 해주세요.");
		    		return false;
		    	} else if(!form.user_passwd.value) {
			    	alert("비밀번호를 입력하세요.");
			    	return false;
	    		} else if(!form.user_name.value) {
			    	alert("이름을 입력하세요.");
			    	return false;
	    		} else if(!form.user_addr.value) {
			    	alert("주소를 입력하세요.");
			    	return false;
	    		} else if(!form.user_tel.value) {
			    	alert("전화번호를 입력하세요.");
			    	return false;
	    		} else if(!form.user_age.value) {
			    	alert("나이를 입력하세요.");
			    	return false;
	    		} else if(!form.user_email.value) {
			    	alert("이메일을 입력하세요.");
			    	return false;
	    		} else if(isNaN(form.user_age.value)){
				    alert("나이는 숫자만 입력가능합니다.");
				    return false;
		    	} else if(email.test(form.user_email.value) == false){
		    		alert("잘못된 이메일 형식입니다.")
		    	} else {
		    		form.submit();
		    	}
			}

	    	//중복체크 후 아이디를 새로 입력하는 걸 방지
	    	function CheckInputId() {
	    		document.userInfo.idReduplication.value="uncheck_id";
	    	}
    	</script>
    </head>
    <body>
    	<jsp:include page="../board_top.jsp"></jsp:include>
    	
        <div class="section secondary-section" id="service">
            <div class="container">
       			<div class="title">
        		<h1>회원가입</h1>            	
                <p>회원가입 하시면 많은 혜택을 누리실 수 있습니다.</p>                
        		</div>
        		<form action="../insert.do" method="post" name="userInfo">
					<table align="center">
						<tr>
							<td>
								<p><font color="black">아이디</font></p>
							</td>
							<td>
								<!-- 중복체크 후 아이디 다시 입력 방지를 위해 user_id는 onkeydown, idReduplication은 hidden으로  -->
								<input type="text" name="user_id" size="10" maxlength="12" onkeydown="CheckInputId()">
								<input type="button" value="중복확인" onClick="checkId(); "/>
								<input type="hidden" name="idReduplication" value="uncheck_id" >
							</td>
						</tr>
						<tr>
							<td><p><font color="black">비밀번호</font></p></td>
							<td><input class="span5" type="password" name="user_passwd" maxlength="12"></td>
						</tr>
						<tr>
							<td><p><font color="black">이름</font></p></td>
							<td><input class="span5" type="text" name="user_name" maxlength="12"></td>
						</tr>
						<tr>
							<td><p><font color="black">지역</font></p></td>
							<td>
								<select name="user_area" class="span5">
								<option >서울.경기</option>
								<option >강원도</option>
								<option >충청권</option>
								<option >호남.제주</option>
								<option >영남권</option>			
								</select>
							</td>
						</tr>
						<tr>
							<td><p><font color="black">주소</font></p></td>
							<td><input class="span5" type="text" name="user_addr" maxlength="12"></td>
						</tr>
						<tr>
							<td><p><font color="black">전화번호</font></p></td>
							<td><input class="span5" type="text" name="user_tel" maxlength="30"></td>
						</tr>
						<tr>
							<td><p><font color="black">나이</font></p></td>
							<td><input class="span5" type="text" name="user_age" maxlength="3"></td>
						</tr>
						<tr>
							<td><p><font color="black">이메일</font></p></td>
							<td><input class="span5" type="email" name="user_email" placeholder="username@example.com" maxlength="30"></td>
						</tr>
						<tr>
							<td><p><font color="black">성별</font></p></td>
							<td align="center">
								<input type="radio" name="user_gender" value="남" checked><font color="black">남</font>
								<input type="radio" name="user_gender" value="여"><font color="black">여</font>
							</td>
						</tr>
						<tr>
							<td align="center" colspan="2" class="btn_align">
								<input class="message-btn" type="button" value="가입하기" onclick="checkValue();">
								<input class="message-btn" type="reset" value="새로입력">
								<input class="message-btn" type="button" value="취소" onclick="javascript:history.back();">
							</td>
						</tr>
					</table>
				</form>
        	</div>
        </div>
        
        <jsp:include page="../board_bottom.jsp"></jsp:include>
    </body>
</html>