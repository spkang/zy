<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<!DOCTYPE html>
<html>
<head>


    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Multi-page template</title>
    <link rel="stylesheet" href="/css/themes/default/jquery.mobile-1.3.1.min.css">
    <link rel="shortcut icon" href="../../favicon.ico">
    <script src="/js/jquery-1.7.2.min.js"></script>
    <script src="/js/jquery.mobile-1.3.1.min.js"></script>
    <script type="text/javascript">

        function jumpToPlayer(typeid) {
            window.location.href = "listVid.html?typeString=" + typeid;
        }
        function goHome() {
            window.location.href = "123.htm";
        }
    </script>
</head>


<body>

<div style="height: 0px; width: 0px;display: none" id="titleS">
    <s:property value="titleString"/>,'
</div>
<div>

    <%--<div data-role="page" id="one">--%>
        <%--<div data-role="header">--%>

            <%--&lt;%&ndash;<a class="ui-btn-left" href="Login.aspx" data-icon="home">退出</a>&ndash;%&gt;--%>
            <%--<input type="button" data-icon="home" value="返回" data-mini="true"   class="ui-btn-left"--%>
                   <%--onclick="javascript:goHome();" />--%>
            <%--<h1 id="headerInfo"><s:property value="titleString"/> </h1>--%>
            <%--&lt;%&ndash;<a class="ui-btn-right" href="RequestEdit.aspx" data-icon="arrow-r">下一个</a>&ndash;%&gt;--%>
            <%--<input type="button" data-icon="arrow-r" value="下一个" data-mini="true"  data-iconpos="right" class="ui-btn-right"--%>
                   <%--onclick="javascript:playNext();" />--%>
        <%--</div>--%>
        <!-- /header -->

        <div  data-role="content" style="height: 80%">
            <div id="youkuplayer"></div>

            <script type="text/javascript" charset="utf-8">
                var vidArrays = [ <s:property value="idStrings"/>  ];
                var splitString = document.getElementById('titleS').innerHTML.trim().substr(1);
                var titleArrays =splitString.split("','");
//                var titleArrays =document.getElementById('titleS').innerHTML.split(',');
//                var titleArrays =new Array( document.getElementById('titleS').innerHTML );

                var vidCur = vidArrays[0];
                var titleCur = titleArrays[0];
                var vidIndex = 0;
                var isready = false;
                var timerName;
                var isEnd = false;
                function onYoukuPlayerReady() {

                    isready = true;
                    var changeTitleUrl = "listVid.htmls#title="+titleCur;
                    window.location.href =  encodeURI(changeTitleUrl );

//                    $("tt").attr('src',changeTitleUrl ) ;
//                    document.getElementById("tt").location.reload();
                    player.playVideoById(vidCur);

//                    $("#headerInfo").html(titleCur);
                    delayCall();
                }
                //        // call js api(pause video)
                //        function pauseVideo() {
                ////            alert(player.currentTime());
                //            if (!isready) return false;
                //            player.pauseVideo();
                //        }
                function delayCall() {

//            alert( player.totalTime()+ "e========"+((player.totalTime()-1) == player.currentTime())+"=========nd" + player.currentTime());
                    if ((player.currentTime() >= player.totalTime() - 1)) {
                        playNext();
                    }
                    timerName = setTimeout(delayCall, 1000);
                }

                function playNext() {
                    if (vidIndex == (vidArrays.length - 1)) {

                        if (!isEnd) {
                            alert("播放完毕");
                            isEnd = true;
                        }
                        clearTimeout(timerName);
                    } else {
                        vidIndex++;
                        vidCur = vidArrays[vidIndex];
                        titleCur  = titleArrays[vidIndex];
                        var changeTitleUrl = "listVid.htmls#title="+titleCur;
                        window.location.href =  encodeURI(changeTitleUrl );

                        player.playVideoById(vidCur)
                    }
                }
                function playPre() {
                    if (vidIndex == 0) {
                        alert("已是第一个视频");
                    } else {
                        vidIndex--;
                        vidCur = vidArrays[vidIndex];
                        player.playVideoById(vidCur)
                    }
                }
            </script>
            <script type="text/javascript" src="http://player.youku.com/jsapi">
                player = new YKU.Player('youkuplayer', {
                            client_id: 'YOUR YOUKUOPENAPI APPID',
                            vid: vidCur,
                            autoplay: true,
                            events: {
                                'onPlayerReady': onYoukuPlayerReady
                            }
                        }
                );
            </script>
        </div>

    </div>

</div>


</body>
</html>