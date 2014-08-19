<?php
$tips_url = "https://raw.githubusercontent.com/amussey/blog-posts/master/2014/08_Dinosaur-Protips/tips.txt";


$tips = @file_get_contents($tips_url);
if (! $tips) {
    die("Failed to load tips file.");
}

$tips = explode("\n", trim($tips));
$tip = $tips[rand(0, count($tips)-1)];

?>
<!DOCTYPE html>
<html>
<head>
    <title>Dinosaur Protips</title>
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;subset=latin" rel="stylesheet">
    <style>
    @font-face {
        font-family: 'Open Sans';
        font-style: normal;
        font-weight: 400;
        src: local('Open Sans'), local('OpenSans'), url('http://themes.googleusercontent.com/static/fonts/opensans/v5/cJZKeOuBrn4kERxqtaUH3T8E0i7KZn-EPnyo3HZu7kw.woff') format('woff');
    }
    body {
        background-color:#000;
        color: #fff;
    }
    #leftbox {
        float:left;
        margin-top: 10%;
    }
    #rightbox {
        float:right;
    }
    .box {
        width: 48%;
        font-family: 'open sans',arial,sans-serif;
        font-style: italic;
        font-size: 50px;
        text-align: center;
    }
    </style>
</head>
<body>
    <div id="leftbox" class="box"><?=$tip ?></div>
    <img id="rightbox" class="box" src="http://i.imgur.com/ftCSAX2.gif">
</body>
</html>
