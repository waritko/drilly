<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- <link rel="icon" href="./static/ingress.svg"> -->

    <title>Drilly</title>

    <!-- Bootstrap core CSS -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">

    <!-- My Design CSS -->
    <link href="./css/design.css" rel="stylesheet">


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./js/ie10-viewport-bug-workaround.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    {block name=head}{/block}
</head>

<body>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Drilly</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          {if !$externalId}
          <ul class="nav navbar-nav">
            {* <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li> *}
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Přidat nový drill <span class="caret"></span></a>
              <ul class="dropdown-menu">
                  {foreach $sets as $set}
                    <li><a href="./index.php?action=new-drill&amp;set={$set.id}">{$set.name}</a></li>
                  {/foreach}
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Zobrazit seznam<span class="caret"></span></a>
              <ul class="dropdown-menu">
                  {foreach $sets as $set}
                    <li><a href="./index.php?action=drill-list&amp;set={$set.id}">{$set.name}</a></li>
                  {/foreach}
              </ul>
            </li>
          </ul>
          {else}
          <ul class="nav navbar-nav">
            <li class="active"><a href="index.php">Přihlášení</a></li>
          </ul>
          {/if}
          <ul class="nav navbar-nav navbar-right">
            <!-- <li><a href="../navbar/">Default</a></li>
            <li><a href="../navbar-static-top/">Static top</a></li>
            <li class="active"><a href="./">Fixed top <span class="sr-only">(current)</span></a></li> -->
	    <li>{$mail}</li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
<div style="height: 50px;"></div>

<div class="container">
    <!-- Example row of columns -->
    <div id="rows-end" style="padding-top: 20px;">
        {block name=content}{/block}
    </div>
    <hr>

    <footer>
        <p>&copy; Waritko 2016</p>
    </footer>
</div>
<!-- /container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="./js/stringformat.min.js"></script>
<script src="./js/jquery-1.11.1.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
{block name=foot}{/block}
</body>
</html>
