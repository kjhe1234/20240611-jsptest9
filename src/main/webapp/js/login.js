/**
 * 
 */

 function loginCheck() {
	if(document.LoginForm.adminID.value.length == 0) {
		alert("아이디를 입력해야 합니다.")
		document.LoginForm.adminID.focus();
		return false;
	}
	
	if(document.LoginForm.adminPW.value.length == 0) {
		alert("비밀번호를 입력해야 합니다.")
		documentLoginForm.adminPW.focus();
		return false;
	}
	
	return true;
 }
 
 
 
 
 
 
 
 