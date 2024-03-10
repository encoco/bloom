<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>
<script>
	var msg = "${msg}";
	var url = "${url}";
	alert(msg);
	location.href = url;
</script>
</body>
</html>