﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Home</title>

    <!-- Bootstrap -->
    <link href="./bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- My CSS -->
    <link href="./StyleSheets/splash.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="icon" type="image/png" href="./img/favicon.ico" />

</head>
<body>
    <form id="form1" runat="server" class="header">
        <div class="text-vertical-center">
            <h1>Banking Application</h1>
            <h3>Made by Rhyne Vlaservich</h3>
            <br />
            <a href="Pages/Login.aspx" class="btn btn-dark btn-lg">Admin Login</a>
        </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    </form>

</body>
</html>
