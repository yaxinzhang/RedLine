<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
      margin: 20px auto;
      border: 2px solid orange;
    }
	td{
      height: 40px;
      line-height: 40px;
      padding: 5px;
      width: 200px;
      background: rgba(100,50,10,0.3);
      text-align: right;
      font-size: 24px;
    }
    select,input{
      width: 200px;
      height: 40px;
      font-size: 18px;
    }
    [type=radio]{
      width: 30px;height: 30px;
    }
    [type=submit],[type=reset]{
      width: 150px;
      border-radius: 25px;
      font-size: 20px;
      outline: none;
    }
    td:first-child{
    	width: 150px
    }
	</style>
</head>
<body bgcolor="#E6E6FA">
	<form action="/user/register" method="post">
	<table>
		<tr>
			<td>用户名：</td>
			<td><input type="text"  name="name"></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><input type="text"  name="password" value="zzz"></jiutd>
		</tr>
		<tr>
			<td>昵称：</td>
			<td><input type="password"  name="nickname" value="zzz"></td>
		</tr>
		<tr>
			<td>e_mail：</td>
			<td><input type="password"  name="e_mail" onblur="check()"></td>
		</tr>
		<tr>
			<td>性别：</td>
			<td style="text-align: left;">
			 <!-- 这里name必须相同 -->
				<input type="radio" value=0 name="str" id="sex1">男
				<input type="radio" name="str" id="sex2"> 女
			</td>
		</tr>
		<tr>
			<td>学历：</td>
			<td>
				<select id="select">
					<option value="高中">高中</option>
					<option value="大专">大专</option>
          			<option value="本科">本科</option>
          			<option value="本科以上">本科以上</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" id="btn1" onclick="cs()">
        		<input type="reset" id="btn2" value="重置">
			</td>
		</tr>
	</table>
	<script type="text/javascript">
	function cs(){
		var str='';
		str+='\n性别：';
  		str+=$('sex1').checked?'男':'女';
	}
	</script>
	</form>
</body>
</html>