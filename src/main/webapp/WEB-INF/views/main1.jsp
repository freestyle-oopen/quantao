<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="jp-pc w1200" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${pageContext.request.contextPath}/js/main/plugin.js" async="" charset="utf-8"
            mod_name="tkapi-plugin"></script>
    <script src="${pageContext.request.contextPath}/js/main/click.js" async="" charset="utf-8"
            mod_name="tkapi-click"></script>
    <script charset="gbk" async="" src="${pageContext.request.contextPath}/js/main/tkapi.js"></script>
    <title>领卷淘</title>
    <meta content="" name="keywords">
    <meta content="聚九块邮官网-九块邮旗下9.9包邮专区，汇集全网九块九包邮商品，每天10点更新，全场9.9元包邮准时开抢，九块九包邮，精彩不断！" name="description">
    <link rel="shortcut icon" type="image/ico" href="http://www.jujiukuaiyou.com/favicon.ico">
    <link rel="bookmark" href="http://www.jujiukuaiyou.com/favicon.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/alert.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main/global.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main/md-list.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/main/pg-index.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main/sea-debug.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main/jquerya.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main/fun.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main/jquery.cookie.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main/header.js"></script>
    <script type="text/javascript">    SITEURL = "http://www.jujiukuaiyou.com";
    CURURL = "http://www.jujiukuaiyou.com";
    WEBNICK = "九块邮";
    URL_COOKIE = 0;
    </script>
    <script src="${pageContext.request.contextPath}/js/main/md-totop.js" type="text/javascript"></script>
</head>
<body _hover-ignore="1">
<div id="afp" class="totop-tips" style="display: none;" _hover-ignore="1"><p>请按键盘 <strong>CTRL + D</strong>
    把九块邮放入收藏夹，折扣信息一手掌握！<label id="nlraf" onclick="CloseNLRAF(true)" for="check_nlraf"><input style="display:none;"
                                                                                             type="checkbox"
                                                                                             id="check_nlraf"><a
            href="javascript:void(0)">不再提醒</a></label><a id="cafp" href="javascript:void(0)"
                                                         onclick="CloseNLRAF(false)"></a><a id="cafp1"
                                                                                            href="javascript:void(0)"
                                                                                            onclick="CloseNLRAF(false)"><span
            class="closet"><em>x</em>关闭</span></a></p></div>
<script type="text/javascript">$("#show-qcodes").hover(function () {
    $("#new-qcodes").css('display', 'block');
}, function () {
    $("#new-qcodes").css('display', 'none');
});
(function ($) {
    var F_gdwin = function () {
        var gdwin_close = function () {
            $("#tan_chuang_div").hide();
            $.cookie("gdwin", "1", {
                expires: 0.5,
                path: "/"
            });
        }
        if ($.cookie("gdwin") == null) {
            $("#tan_chuang_div").show();
            $("div.gdwin-box a.btn-close").on("click", gdwin_close);
            $("div.gdwin-box a.a_close").on("click", gdwin_close);
        } else {
            $("#tan_chuang_div").hide();
        }
        $("div.gdwin-bg").on("click mousedown", function (e) {
            return false;
        })
    }
    F_gdwin();
})(jQuery);
</script>
<%--<div id="toolbar">
    <div class="bar-con">
        <ul class="topNav fl">
            <li><a class="active" href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=index">网站首页</a></li>
            <li></li>
            <li><a href="http://www.jujiukuaiyou.com/index.php?m=tehui&amp;a=index">特惠精选</a></li>
            <li></li>
            <li><a href="http://www.jujiukuaiyou.com/?m=huodong">店铺活动</a></li>
            <li></li>
            <li><a href="http://www.jujiukuaiyou.com/index.php?g=m" target="_blank" _hover-ignore="1"><em
                    class="icon-normal icon-phone"></em>手机版</a></li>
        </ul>
        <div class="right-show fr">
            <div class="union-login"><a
                    href="http://www.jujiukuaiyou.com/index.php?m=oauth&amp;a=index&amp;mod=qq"><span style="background:url(/static/newpi/images/new-alert-total.gif) no-repeat;
		width: 22px;
		height: 25px;
		display: inline-block;
		z-index: 99;
		background-position: 0px -28px;
		vertical-align: middle;
		margin: 0 0px 0 8px;"></span>QQ登录</a><a
                    href="http://www.jujiukuaiyou.com/index.php?m=oauth&amp;a=index&amp;mod=sina"><span style="background:url(/static/newpi/images/new-alert-total.gif) no-repeat;
		width: 22px;
		height: 25px;
		display: inline-block;
		z-index: 99;
		background-position:0px -55px;
		vertical-align: middle;
		margin: 0 0px 0 8px;"></span>新浪微博登录</a>　|
            </div>
            <div class="login-show"><a href="http://www.jujiukuaiyou.com/index.php?m=user&amp;a=login">登录</a><a
                    href="http://www.jujiukuaiyou.com/index.php?m=user&amp;a=register">免费注册</a>　|
            </div>
            <div class="other-show"><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=792833137&amp;site=qq&amp;menu=yes">在线客服</a><a
                    href="http://www.jujiukuaiyou.com/index.php?m=bao&amp;a=index">卖家报名</a></div>
        </div>
    </div>
</div>--%>
<div class="header">
    <div class="area" _hover-ignore="1">
        <div class="logo logo1">
            <div class="fl"><a class="juan-logo fl" href="http://www.jujiukuaiyou.com/" title="九块邮"><img
                    src="${pageContext.request.contextPath}/js/main/TB2CJl4qrplpuFjSspiXXcdfFXa_!!97720815.png"></a>
            </div>
        </div>
        <div class="search">
            <form name="search" action="http://www.jujiukuaiyou.com/" method="get" id="search">
               <%-- <input type="hidden" name="m" value="search">
                <input type="hidden" name="a" value="index">--%>
                <span class="search-area fl">
                    <input x-webkit-speech="" name="k" id="k" autocomplete="off" onblur="this.value==&#39;&#39;?this.value=this.title:null" onfocus="this.value==this.title?this.value=&#39;&#39;:null"
                       title="懒得找了，我搜..."  value="懒得找了，我搜..."  class="txt">
                </span>
                <input type="submit" value="" class="smt fr"></form>
        </div>
    </div>
    <div class="mainNav">
        <div class="nav">
            <ul class="navigation fl">
                <li class="current first"><a href="http://www.jujiukuaiyou.com/" _hover-ignore="1">所有分类<em
                        class="cur"></em></a></li>
                <li><a href="http://www.jujiukuaiyou.com/index.php?m=shijiu&amp;a=index" _hover-ignore="1">20封顶</a></li>
                <li><a href="http://www.jujiukuaiyou.com/index.php?m=jiu&amp;a=index" _hover-ignore="1">九块邮</a></li>
                <li><a href="http://www.jujiukuaiyou.com/?m=quan" _hover-ignore="1">优惠券</a></li>
                <li><a href="http://jujiukuaiyou.com/index.php?m=yugao&amp;a=index">明日预告</a></li>
                <li><a href="http://www.jujiukuaiyou.com/index.php?g=m" target="_blank" id="show-qcodes"><em
                        class="icon-normal icon-phone" id="new-phone"></em> 手机APP
                </a>
                    <div id="new-qcodes" class="code-tips" style="display: none;">
                        <div class="code-box"><p class="code"><img
                                src="${pageContext.request.contextPath}/js/main/5ada0505a393a.png" width="148px"
                                height="148px"></p>
                            <p class="txt" style="text-align:center;font-size: 14px">随时逛 及时抢</p></div>
                    </div>
                </li>
            </ul>
            <div class="state-show fr"><span id="signinid"><a href="http://www.jujiukuaiyou.com/#"
                                                              class="sign_btn signin normal-a dosign"><em
                    class="icon-normal icon-sign"></em><em class="text">签到领积分</em></a><div class="normal-side-box"><div
                    class="box-tips"><p>登陆后 签到奖励</p><p>首次签到可得：<span><b>5</b> 积分</span></p><p>连续签到 <span>8</span> 天</p><p>每日递增 <span>5</span> 积分</p></div></div></span>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">$("#show-qcodes , #new-qcodes").hover(function () {
    $("#new-qcodes").css('display', 'block');
}, function () {
    $("#new-qcodes").css('display', 'none');
})
</script>
<div class="top_bar">
    <ul id="banner_list" class="banner" style="">
        <li style="background-image: url(/data/upload/banner/1803/25/5ab74b382309f.png); z-index: 1; opacity: 1; background-position: 50% 50%; background-repeat: no-repeat no-repeat;">
            <a target="_blank" title="特惠团" href="http://www.tehuituan.com/ling.php" class="pic center"
               _hover-ignore="1"></a></li>
    </ul>
</div>
<div class="top_wrap">
    <div class="top_box">
        <div class="banner_l" _hover-ignore="1">
            <dl>
                <dd><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=1"><i
                        class="ct-icon ct-icon-nvzhuang"></i>女装<em class="ct-line"></em></a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=2"><i
                        class="ct-icon ct-icon-nanzhuang"></i>男装</a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=3"><i
                        class="ct-icon ct-icon-xiezi"></i>鞋子<em class="ct-line"></em></a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=4"><i
                        class="ct-icon ct-icon-muying"></i>母婴</a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=5"><i
                        class="ct-icon ct-icon-jujia"></i>居家<em class="ct-line"></em></a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=6"><i
                        class="ct-icon ct-icon-meizhuang"></i>美妆</a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=7"><i
                        class="ct-icon ct-icon-shuma"></i>数码<em class="ct-line"></em></a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=8"><i
                        class="ct-icon ct-icon-meishi"></i>美食</a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=9"><i
                        class="ct-icon ct-icon-wenti"></i>文体<em class="ct-line"></em></a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=13"><i
                        class="ct-icon ct-icon-neiyi"></i>内衣</a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=22"><i
                        class="ct-icon ct-icon-xiangbao"></i>箱包<em class="ct-line"></em></a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=25"><i
                        class="ct-icon ct-icon-"></i>9.9包邮</a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=26"><i
                        class="ct-icon ct-icon-"></i>19.9包邮<em class="ct-line"></em></a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=27"><i
                        class="ct-icon ct-icon-dianqi"></i>电器</a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=32"><i
                        class="ct-icon ct-icon-peishi"></i>其他<em class="ct-line"></em></a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=33"><i
                        class="ct-icon ct-icon-jiafang"></i>家纺</a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=34"><i
                        class="ct-icon ct-icon-"></i>优惠券<em class="ct-line"></em></a></dd>
            </dl>
        </div>
        <div class="banner_r" style="background:#f7f7f7;box-shadow:none">
            <dl>
                <dd>
                    <a href="https://item.taobao.com/item.htm?id=545473645240&amp;ali_trackid=2:mm_29839046_11908362_42140309:1525046840_226_1176690888&amp;spm=a2e2e.10720394%2Fc.90100100.002&amp;pvid=cd_cdll"
                       target="_blank" class="&#39;right" title="右一"><img
                            src="${pageContext.request.contextPath}/js/main/TB2mFWhiJ0opuFjSZFxXXaDNVXa_!!2652275516.jpg_310x310.jpg"
                            alt=""></a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/#" target="_blank" class="&#39;right" title="右二"><img
                        src="${pageContext.request.contextPath}/js/main/549f9289deb32.jpg" alt=""></a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/#" target="_blank" class="&#39;right" title="右三"><img
                        src="${pageContext.request.contextPath}/js/main/549f929a550f2.jpg" alt=""></a></dd>
                <dd><a href="http://www.jujiukuaiyou.com/#" target="_blank" class="&#39;right" title="右四"><img
                        src="${pageContext.request.contextPath}/js/main/549f92b11aa33.jpg" alt=""></a></dd>
                <dd class="last"><a href="http://www.jujiukuaiyou.com/yhq.php?r=nine&amp;u=538291" target="_blank"
                                    class="&#39;right" title="新版轮播右下长方形广告位"><img
                        src="${pageContext.request.contextPath}/js/main/TB22azZuXXXXXbjXpXXXXXXXXXX_!!97720815.jpg"
                        alt=""></a></dd>
            </dl>
        </div>
        <div class="round">
            <div class="adType"></div>
        </div>
        <div style="display: none;" class="banner_arrow" data-banner="arrow"><a href="javascript:;" class="arrow_prev"
                                                                                data-arrow="prev"><i></i></a><a
                href="javascript:;" class="arrow_next" data-arrow="next"><i></i></a></div>
    </div>
</div>
<div class="main w1200">
    <div class="codeArea sameh" style="width: 1920px; overflow: hidden; height: 226px; margin: 0px auto;"><img
            border="0" usemap="#map1511062249"
            src="${pageContext.request.contextPath}/js/main/TB29.AddILJ8KJjy0FnXXcFDpXa_!!97720815.jpg">
        <map name="map1511062249">
            <area target="_blank" shape="rect" coords="3.90625,36.919647216796875,377,203" title=""
                  href="https://item.taobao.com/item.htm?id=546738543421&amp;price=49&amp;original_price=59&amp;sourceType=item&amp;sourceType=item&amp;suid=3f03b96c-bac8-4268-9e72-d75576c508b3&amp;ut_sk=1.WNKHfJdohSIDAPf6Z%2BsA4fS9_21646297_1510976287639.Copy.1&amp;cpp=1&amp;shareurl=true&amp;spm=a313p.22.12s.79429899754&amp;short_name=h.wydxPT&amp;app=chrome&amp;qq-pf-to=pcqq.c2c">
            <area target="_blank" shape="rect" coords="406.9375,38.921875,779,214" title=""
                  href="http://www.jujiukuaiyou.com/yhq.php?r=nine&amp;u=538291">
            <area target="_blank" shape="rect" coords="808.9375,37.84375,1184,209" title=""
                  href="http://www.jujiukuaiyou.com/yhq.php?r=ddq&amp;u=538291">
        </map>
    </div>
    <div data-title="" style="height:379px;">
        <div class="footer-more-trigger sn-simple-logo abs qzz"
             style="width:1197px;height:379px;top:auto;padding:0;border:0;line-height:1;left:50%;z-index:1;">
            <div class="footer-more-trigger sn-simple-logo abs qzz"
                 style="width:1197px;height:379px;top:0;padding:0;border:0;line-height:1;left:-598.5px;text-align:center;overflow:hidden;display:block;">
                <img usemap="#map1514563082"
                     src="${pageContext.request.contextPath}/js/main/TB27TgbjY5YBuNjSspoXXbeNFXa_!!97720815.jpg">
                <map name="map1514563082">
                    <area shape="rect" coords="7.7901787757873535,47.96875,228,354"
                          href="https://item.taobao.com/item.htm?&amp;id=564132773179" target="_blank" title=""
                          style="outline:none;">
                    <area shape="rect" coords="246.71875,51.9140625,458,356"
                          href="https://item.taobao.com/item.htm?spm=a1z38n.10677092.0.0.1e3c1debfbEFzu&amp;id=565780456087"
                          target="_blank" title="" style="outline:none;">
                    <area shape="rect" coords="487.70091009140015,48.638397216796875,708,361"
                          href="https://s.click.taobao.com/bQVyIYw" target="_blank" title="" style="outline:none;">
                    <area shape="rect" coords="968.8393378257751,47.56697082519531,1188,370"
                          href="https://s.click.taobao.com/3NhyIYw" target="_blank" title="" style="outline:none;">
                    <area shape="rect" coords="724.9777045249939,45.9375,948,365"
                          href="https://s.click.taobao.com/2XWyIYw" target="_blank" title="" style="outline:none;">
                </map>
            </div>
        </div>
    </div>
    <%--
    广告位
    <div class="codeArea sameh" style="width: 1920px; overflow: hidden; height: 80px; margin: 0px auto;"><img border="0" usemap="#map1502082436" src="${pageContext.request.contextPath}/js/main/TB2AWgPz.hnpuFjSZFEXXX0PFXa_!!97720815.jpg">
        <map name="map1502082436">
            <area target="_blank" shape="rect" coords="1.921875,0,1195,77" title=""
                  href="http://www.jujiukuaiyou.com/yhq.php">
        </map>
    </div>--%>
    <p style="text-align: center;"><img src="${pageContext.request.contextPath}/js/main/1448293616823433.png" title="" alt="32.png"></p>
    <div class="main pr mt25 clear">
        <ul class="goods-list clear">
            <li class="" gtype="1" id="70076">
                <div class="list-good buy">
                    <div class="good-pic"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=jump&amp;a=index&amp;id=70076" class="pic-img"
                            target="_blank"><img alt="mars18夏日碎花印花露肩荷叶边吊带沙滩雪纺连衣裙中长款仙气"
                                                 src="${pageContext.request.contextPath}/js/main/TB1VUQxn4SYBuNjSsphXXbGvVXa_!!2-item_pic.png_310x310.jpg"
                                                 class="J_lazy lazy good-pic"
                                                 d-src="http://img.alicdn.com/bao/uploaded/i4/22013310/TB1VUQxn4SYBuNjSsphXXbGvVXa_!!2-item_pic.png_310x310.jpg"
                                                 data-bimg="http://img.alicdn.com/bao/uploaded/i4/22013310/TB1VUQxn4SYBuNjSsphXXbGvVXa_!!2-item_pic.png"
                                                 style="display: inline;"></a></div>
                    <div class="lingquan"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=568644107886"
                            target="_blank" rel="external nofollow"><span
                            class="get_cupon"><em>20元</em></span><b></b></a></div>
                    <h3 class="good-title">[包邮]<a
                            href="http://www.jujiukuaiyou.com/index.php?m=item&amp;a=index&amp;id=70076"
                            target="_blank">mars18夏日碎花印花露肩荷叶边吊带沙滩雪纺连衣裙中长款仙气</a>
                        <div class="icon-all" style="display:none;"></div>
                        <span class="sold">已售<em>889</em></span></h3>
                    <div class="good-price"><span class="price-current"><em>￥</em>65.0</span><span
                            class="des-other"><strong><div class="ljpx" _hover-ignore="1"></div></strong><p><span
                            class="price-old"><em>￥</em>170.0</span><span
                            class="discount">(<em>3.8</em>折)</span></p></span>
                        <div class="btn buy m-buy"><a
                                href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=568644107886"
                                target="_blank" rel="external nofollow"><em class="t-icon"></em><span>淘宝</span></a>
                        </div>
                    </div>
                    <a class="y-like my-like" data-pid="568644107886" href="javascript:;" title="加入收藏"><i
                            class="like-ico"><span class="heart_left"></span><span class="heart_right"></span></i></a>
                </div>
            </li>
            <li class="" gtype="1" id="70074">
                <div class="list-good buy">
                    <div class="good-pic"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=jump&amp;a=index&amp;id=70074" class="pic-img"
                            target="_blank"><img alt="形象美玻尿酸补水蚕丝面膜保湿控油收缩毛孔清洁提亮肤色正品免洗"
                                                 src="${pageContext.request.contextPath}/js/main/TB2314VnGmWBuNjy1XaXXXCbXXa_!!273960545.jpg_310x310.jpg"
                                                 class="J_lazy lazy good-pic"
                                                 d-src="http://img.alicdn.com/bao/uploaded/i3/273960545/TB2314VnGmWBuNjy1XaXXXCbXXa_!!273960545.jpg_310x310.jpg"
                                                 data-bimg="http://img.alicdn.com/bao/uploaded/i3/273960545/TB2314VnGmWBuNjy1XaXXXCbXXa_!!273960545.jpg"
                                                 style="display: inline;"></a></div>
                    <div class="lingquan"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=568140936297"
                            target="_blank" rel="external nofollow"><span
                            class="get_cupon"><em>10元</em></span><b></b></a></div>
                    <h3 class="good-title">[包邮]<a
                            href="http://www.jujiukuaiyou.com/index.php?m=item&amp;a=index&amp;id=70074"
                            target="_blank">形象美玻尿酸补水蚕丝面膜保湿控油收缩毛孔清洁提亮肤色正品免洗</a>
                        <div class="icon-all" style="display:none;"></div>
                        <span class="sold">已售<em>208</em></span></h3>
                    <div class="good-price"><span class="price-current"><em>￥</em>19.9</span><span
                            class="des-other"><strong><div class="ljpx" _hover-ignore="1"></div></strong><p><span
                            class="price-old"><em>￥</em>129.0</span><span
                            class="discount">(<em>1.5</em>折)</span></p></span>
                        <div class="btn buy m-buy"><a
                                href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=568140936297"
                                target="_blank" rel="external nofollow"><em class="t-icon"></em><span>淘宝</span></a>
                        </div>
                    </div>
                    <a class="y-like my-like" data-pid="568140936297" href="javascript:;" title="加入收藏"><i
                            class="like-ico"><span class="heart_left"></span><span class="heart_right"></span></i></a>
                </div>
            </li>
            <li class="" gtype="1" id="99826">
                <div class="list-good buy">
                    <div class="good-pic"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=jump&amp;a=index&amp;id=99826" class="pic-img"
                            target="_blank"><img alt="流光夏刺绣网纱性感内裤女蕾丝低腰火辣透明大码透气三角裤纯棉裆"
                                                 src="${pageContext.request.contextPath}/js/main/TB2bsbzpv9TBuNjy1zbXXXpepXa_!!1051474214.jpg_310x310.jpg"
                                                 class="J_lazy lazy good-pic"
                                                 d-src="http://img.alicdn.com/imgextra/i3/1051474214/TB2bsbzpv9TBuNjy1zbXXXpepXa_!!1051474214.jpg_310x310.jpg"
                                                 data-bimg="http://img.alicdn.com/imgextra/i3/1051474214/TB2bsbzpv9TBuNjy1zbXXXpepXa_!!1051474214.jpg"
                                                 style="display: inline;"></a></div>
                    <div class="lingquan"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=520812857479"
                            target="_blank" rel="external nofollow"><span
                            class="get_cupon"><em>3元</em></span><b></b></a></div>
                    <h3 class="good-title">[包邮]<a
                            href="http://www.jujiukuaiyou.com/index.php?m=item&amp;a=index&amp;id=99826"
                            target="_blank">流光夏刺绣网纱性感内裤女蕾丝低腰火辣透明大码透气三角裤纯棉裆</a>
                        <div class="icon-all" style="display:none;"></div>
                        <span class="sold">已售<em>7795</em></span></h3>
                    <div class="good-price"><span class="price-current"><em>￥</em>8.5</span><span
                            class="des-other"><strong><div class="ljpx" _hover-ignore="1"></div></strong><p><span
                            class="price-old"><em>￥</em>11.5</span><span
                            class="discount">(<em>7.4</em>折)</span></p></span>
                        <div class="btn buy m-buy"><a
                                href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=520812857479"
                                target="_blank" rel="external nofollow"><em class="t-icon"></em><span>淘宝</span></a>
                        </div>
                    </div>
                    <a class="y-like my-like" data-pid="520812857479" href="javascript:;" title="加入收藏"><i
                            class="like-ico"><span class="heart_left"></span><span class="heart_right"></span></i></a>
                </div>
            </li>
            <li class="last" gtype="1" id="99825">
                <div class="list-good buy">
                    <div class="good-pic"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=jump&amp;a=index&amp;id=99825" class="pic-img"
                            target="_blank"><img alt="夏新款真皮女凉拖人字拖软拖鞋外穿百搭平跟女凉拖韩版沙滩皮凉鞋"
                                                 src="${pageContext.request.contextPath}/js/main/TB25ubybJsmyKJjSZFvXXcE.FXa_!!2117952135.jpg_310x310.jpg"
                                                 class="J_lazys lazy good-pic"
                                                 d-src="http://img.alicdn.com/imgextra/i2/2117952135/TB25ubybJsmyKJjSZFvXXcE.FXa_!!2117952135.jpg_310x310.jpg"
                                                 data-bimg="http://img.alicdn.com/imgextra/i2/2117952135/TB25ubybJsmyKJjSZFvXXcE.FXa_!!2117952135.jpg"
                                                 style="display: inline;"></a></div>
                    <div class="lingquan"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=548932504861"
                            target="_blank" rel="external nofollow"><span
                            class="get_cupon"><em>40元</em></span><b></b></a></div>
                    <h3 class="good-title">[包邮]<a
                            href="http://www.jujiukuaiyou.com/index.php?m=item&amp;a=index&amp;id=99825"
                            target="_blank">夏新款真皮女凉拖人字拖软拖鞋外穿百搭平跟女凉拖韩版沙滩皮凉鞋</a>
                        <div class="icon-all" style="display:none;"></div>
                        <span class="sold">已售<em>2419</em></span></h3>
                    <div class="good-price"><span class="price-current"><em>￥</em>39.0</span><span
                            class="des-other"><strong><div class="ljpx" _hover-ignore="1"></div></strong><p><span
                            class="price-old"><em>￥</em>79.0</span><span
                            class="discount">(<em>4.9</em>折)</span></p></span>
                        <div class="btn buy m-buy"><a
                                href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=548932504861"
                                target="_blank" rel="external nofollow"><em class="m-icon"></em><span>天猫</span></a>
                        </div>
                    </div>
                    <a class="y-like my-like" data-pid="548932504861" href="javascript:;" title="加入收藏"><i
                            class="like-ico"><span class="heart_left"></span><span class="heart_right"></span></i></a>
                </div>
            </li>
            <li class="" gtype="1" id="99824">
                <div class="list-good buy">
                    <div class="good-pic"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=jump&amp;a=index&amp;id=99824" class="pic-img"
                            target="_blank"><img alt="孕妇连衣裙夏长裙孕妇装夏装套装时尚款2018新款春装雪纺孕妇裙子"
                                                 src="${pageContext.request.contextPath}/js/main/TB2jszqppuWBuNjSszbXXcS7FXa_!!1956907662.jpg_310x310.jpg"
                                                 class="J_lazy lazy good-pic"
                                                 d-src="http://img.alicdn.com/imgextra/i2/1956907662/TB2jszqppuWBuNjSszbXXcS7FXa_!!1956907662.jpg_310x310.jpg"
                                                 data-bimg="http://img.alicdn.com/imgextra/i2/1956907662/TB2jszqppuWBuNjSszbXXcS7FXa_!!1956907662.jpg"
                                                 style="display: inline;"></a></div>
                    <div class="lingquan"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=567422166207"
                            target="_blank" rel="external nofollow"><span
                            class="get_cupon"><em>15元</em></span><b></b></a></div>
                    <h3 class="good-title">[包邮]<a
                            href="http://www.jujiukuaiyou.com/index.php?m=item&amp;a=index&amp;id=99824"
                            target="_blank">孕妇连衣裙夏长裙孕妇装夏装套装时尚款2018新款春装雪纺孕妇裙子</a>
                        <div class="icon-all" style="display:none;"></div>
                        <span class="sold">已售<em>189</em></span></h3>
                    <div class="good-price"><span class="price-current"><em>￥</em>123.0</span><span
                            class="des-other"><strong><div class="ljpx" _hover-ignore="1"></div></strong><p><span
                            class="price-old"><em>￥</em>138.0</span><span
                            class="discount">(<em>8.9</em>折)</span></p></span>
                        <div class="btn buy m-buy"><a
                                href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=567422166207"
                                target="_blank" rel="external nofollow"><em class="m-icon"></em><span>天猫</span></a>
                        </div>
                    </div>
                    <a class="y-like my-like" data-pid="567422166207" href="javascript:;" title="加入收藏"><i
                            class="like-ico"><span class="heart_left"></span><span class="heart_right"></span></i></a>
                </div>
            </li>
            <li class="" gtype="1" id="99823">
                <div class="list-good buy">
                    <div class="good-pic"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=jump&amp;a=index&amp;id=99823" class="pic-img"
                            target="_blank"><img alt="小心机无壳免剥夏威夷果仁原味195g 办公室休闲孕妇零食罐装坚果"
                                                 src="${pageContext.request.contextPath}/js/main/TB2pgwfXa285uJjSZFkXXbHopXa_!!387100192.jpg_310x310.jpg"
                                                 class="J_lazy lazy good-pic"
                                                 d-src="http://img.alicdn.com/imgextra/i1/387100192/TB2pgwfXa285uJjSZFkXXbHopXa_!!387100192.jpg_310x310.jpg"
                                                 data-bimg="http://img.alicdn.com/imgextra/i1/387100192/TB2pgwfXa285uJjSZFkXXbHopXa_!!387100192.jpg"
                                                 style="display: inline;"></a></div>
                    <div class="lingquan"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=547502855003"
                            target="_blank" rel="external nofollow"><span
                            class="get_cupon"><em>30元</em></span><b></b></a></div>
                    <h3 class="good-title">[包邮]<a
                            href="http://www.jujiukuaiyou.com/index.php?m=item&amp;a=index&amp;id=99823"
                            target="_blank">小心机无壳免剥夏威夷果仁原味195g 办公室休闲孕妇零食罐装坚果</a>
                        <div class="icon-all" style="display:none;"></div>
                        <span class="sold">已售<em>2568</em></span></h3>
                    <div class="good-price"><span class="price-current"><em>￥</em>39.0</span><span
                            class="des-other"><strong><div class="ljpx" _hover-ignore="1"></div></strong><p><span
                            class="price-old"><em>￥</em>69.0</span><span
                            class="discount">(<em>5.7</em>折)</span></p></span>
                        <div class="btn buy m-buy"><a
                                href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=547502855003"
                                target="_blank" rel="external nofollow"><em class="m-icon"></em><span>天猫</span></a>
                        </div>
                    </div>
                    <a class="y-like my-like" data-pid="547502855003" href="javascript:;" title="加入收藏"><i
                            class="like-ico"><span class="heart_left"></span><span class="heart_right"></span></i></a>
                </div>
            </li>
            <li class="" gtype="1" id="99822">
                <div class="list-good buy">
                    <div class="good-pic"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=jump&amp;a=index&amp;id=99822" class="pic-img"
                            target="_blank"><img alt="chic破洞高腰阔腿牛仔短裤女夏2018新款韩版宽松显瘦拼色卷边热裤"
                                                 src="${pageContext.request.contextPath}/js/main/TB2usnFdsIrBKNjSZK9XXagoVXa_!!2634784326.jpg_310x310.jpg"
                                                 class="J_lazy lazy good-pic"
                                                 d-src="http://img.alicdn.com/imgextra/i3/2634784326/TB2usnFdsIrBKNjSZK9XXagoVXa_!!2634784326.jpg_310x310.jpg"
                                                 data-bimg="http://img.alicdn.com/imgextra/i3/2634784326/TB2usnFdsIrBKNjSZK9XXagoVXa_!!2634784326.jpg"
                                                 style="display: inline;"></a></div>
                    <div class="lingquan"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=566272676484"
                            target="_blank" rel="external nofollow"><span
                            class="get_cupon"><em>30元</em></span><b></b></a></div>
                    <h3 class="good-title">[包邮]<a
                            href="http://www.jujiukuaiyou.com/index.php?m=item&amp;a=index&amp;id=99822"
                            target="_blank">chic破洞高腰阔腿牛仔短裤女夏2018新款韩版宽松显瘦拼色卷边热裤</a>
                        <div class="icon-all" style="display:none;"></div>
                        <span class="sold">已售<em>269</em></span></h3>
                    <div class="good-price"><span class="price-current"><em>￥</em>49.0</span><span
                            class="des-other"><strong><div class="ljpx" _hover-ignore="1"></div></strong><p><span
                            class="price-old"><em>￥</em>79.0</span><span
                            class="discount">(<em>6.2</em>折)</span></p></span>
                        <div class="btn buy m-buy"><a
                                href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=566272676484"
                                target="_blank" rel="external nofollow"><em class="t-icon"></em><span>淘宝</span></a>
                        </div>
                    </div>
                    <a class="y-like my-like" data-pid="566272676484" href="javascript:;" title="加入收藏"><i
                            class="like-ico"><span class="heart_left"></span><span class="heart_right"></span></i></a>
                </div>
            </li>
            <li class="last" gtype="1" id="99821">
                <div class="list-good buy">
                    <div class="good-pic"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=jump&amp;a=index&amp;id=99821" class="pic-img"
                            target="_blank"><img alt="苗王古宝乳膏止痒抑菌顽固手足藓水泡型皮肤过敏瘙痒成人儿童外用"
                                                 src="${pageContext.request.contextPath}/js/main/TB20TPNXb_EK1JjSZFBXXa0HVXa_!!3082854494.jpg_310x310.jpg"
                                                 class="J_lazys lazy good-pic"
                                                 d-src="http://img.alicdn.com/imgextra/i2/3082854494/TB20TPNXb_EK1JjSZFBXXa0HVXa_!!3082854494.jpg_310x310.jpg"
                                                 data-bimg="http://img.alicdn.com/imgextra/i2/3082854494/TB20TPNXb_EK1JjSZFBXXa0HVXa_!!3082854494.jpg"
                                                 style="display: inline;"></a></div>
                    <div class="lingquan"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=544702944588"
                            target="_blank" rel="external nofollow"><span
                            class="get_cupon"><em>10元</em></span><b></b></a></div>
                    <h3 class="good-title">[包邮]<a
                            href="http://www.jujiukuaiyou.com/index.php?m=item&amp;a=index&amp;id=99821"
                            target="_blank">苗王古宝乳膏止痒抑菌顽固手足藓水泡型皮肤过敏瘙痒成人儿童外用</a>
                        <div class="icon-all" style="display:none;"></div>
                        <span class="sold">已售<em>600</em></span></h3>
                    <div class="good-price"><span class="price-current"><em>￥</em>5.8</span><span
                            class="des-other"><strong><div class="ljpx" _hover-ignore="1"></div></strong><p><span
                            class="price-old"><em>￥</em>15.8</span><span
                            class="discount">(<em>3.7</em>折)</span></p></span>
                        <div class="btn buy m-buy"><a
                                href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=544702944588"
                                target="_blank" rel="external nofollow"><em class="m-icon"></em><span>天猫</span></a>
                        </div>
                    </div>
                    <a class="y-like my-like" data-pid="544702944588" href="javascript:;" title="加入收藏"><i
                            class="like-ico"><span class="heart_left"></span><span class="heart_right"></span></i></a>
                </div>
            </li>
            <li class="" gtype="1" id="99820">
                <div class="list-good buy">
                    <div class="good-pic"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=jump&amp;a=index&amp;id=99820" class="pic-img"
                            target="_blank"><img alt="客厅挂钟时钟卧室钟表办公壁钟静音北欧创意挂表简约万年历石英钟"
                                                 src="${pageContext.request.contextPath}/js/main/TB21122iHYI8KJjy0FaXXbAiVXa_!!3012913363.jpg_310x310.jpg"
                                                 class="J_lazy lazy good-pic"
                                                 d-src="http://img.alicdn.com/imgextra/i4/3012913363/TB21122iHYI8KJjy0FaXXbAiVXa_!!3012913363.jpg_310x310.jpg"
                                                 data-bimg="http://img.alicdn.com/imgextra/i4/3012913363/TB21122iHYI8KJjy0FaXXbAiVXa_!!3012913363.jpg"
                                                 style="display: inline;"></a></div>
                    <div class="lingquan"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=530618972369"
                            target="_blank" rel="external nofollow"><span
                            class="get_cupon"><em>15元</em></span><b></b></a></div>
                    <h3 class="good-title">[包邮]<a
                            href="http://www.jujiukuaiyou.com/index.php?m=item&amp;a=index&amp;id=99820"
                            target="_blank">客厅挂钟时钟卧室钟表办公壁钟静音北欧创意挂表简约万年历石英钟</a>
                        <div class="icon-all" style="display:none;"></div>
                        <span class="sold">已售<em>3771</em></span></h3>
                    <div class="good-price"><span class="price-current"><em>￥</em>12.9</span><span
                            class="des-other"><strong><div class="ljpx" _hover-ignore="1"></div></strong><p><span
                            class="price-old"><em>￥</em>27.9</span><span
                            class="discount">(<em>4.6</em>折)</span></p></span>
                        <div class="btn buy m-buy"><a
                                href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=530618972369"
                                target="_blank" rel="external nofollow"><em class="m-icon"></em><span>天猫</span></a>
                        </div>
                    </div>
                    <a class="y-like my-like" data-pid="530618972369" href="javascript:;" title="加入收藏"><i
                            class="like-ico"><span class="heart_left"></span><span class="heart_right"></span></i></a>
                </div>
            </li>
            <li class="" gtype="1" id="99819">
                <div class="list-good buy">
                    <div class="good-pic"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=jump&amp;a=index&amp;id=99819" class="pic-img"
                            target="_blank"><img alt="欧美蕾丝超薄文胸无钢圈透明性感薄款胸罩无海绵透气女士内衣夏季"
                                                 src="${pageContext.request.contextPath}/js/main/TB2gjKicbslyKJjSZJiXXb1tFXa_!!2127801198.jpg_310x310.jpg"
                                                 class="J_lazy lazy good-pic"
                                                 d-src="http://gd2.alicdn.com/imgextra/i1/2127801198/TB2gjKicbslyKJjSZJiXXb1tFXa_!!2127801198.jpg_310x310.jpg"
                                                 data-bimg="http://gd2.alicdn.com/imgextra/i1/2127801198/TB2gjKicbslyKJjSZJiXXb1tFXa_!!2127801198.jpg"
                                                 style="display: inline;"></a></div>
                    <div class="lingquan"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=551371850515"
                            target="_blank" rel="external nofollow"><span
                            class="get_cupon"><em>10元</em></span><b></b></a></div>
                    <h3 class="good-title">[包邮]<a
                            href="http://www.jujiukuaiyou.com/index.php?m=item&amp;a=index&amp;id=99819"
                            target="_blank">欧美蕾丝超薄文胸无钢圈透明性感薄款胸罩无海绵透气女士内衣夏季</a>
                        <div class="icon-all" style="display:none;"></div>
                        <span class="sold">已售<em>157</em></span></h3>
                    <div class="good-price"><span class="price-current"><em>￥</em>22.8</span><span
                            class="des-other"><strong><div class="ljpx" _hover-ignore="1"></div></strong><p><span
                            class="price-old"><em>￥</em>32.8</span><span
                            class="discount">(<em>7</em>折)</span></p></span>
                        <div class="btn buy m-buy"><a
                                href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=551371850515"
                                target="_blank" rel="external nofollow"><em class="t-icon"></em><span>淘宝</span></a>
                        </div>
                    </div>
                    <a class="y-like my-like" data-pid="551371850515" href="javascript:;" title="加入收藏"><i
                            class="like-ico"><span class="heart_left"></span><span class="heart_right"></span></i></a>
                </div>
            </li>
            <li class="" gtype="1" id="99814">
                <div class="list-good buy">
                    <div class="good-pic"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=jump&amp;a=index&amp;id=99814" class="pic-img"
                            target="_blank"><img alt="性感蕾丝无钢圈裹胸美背文胸内衣女小胸聚拢交叉带抹胸加厚防走光"
                                                 src="${pageContext.request.contextPath}/js/main/TB2RZVGbA9WBuNjSspeXXaz5VXa_!!59836142.jpg_310x310.jpg"
                                                 class="J_lazy lazy good-pic"
                                                 d-src="http://gd4.alicdn.com/imgextra/i4/59836142/TB2RZVGbA9WBuNjSspeXXaz5VXa_!!59836142.jpg_310x310.jpg"
                                                 data-bimg="http://gd4.alicdn.com/imgextra/i4/59836142/TB2RZVGbA9WBuNjSspeXXaz5VXa_!!59836142.jpg"
                                                 style="display: inline;"></a></div>
                    <div class="lingquan"><a
                            href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=565395971218"
                            target="_blank" rel="external nofollow"><span
                            class="get_cupon"><em>10元</em></span><b></b></a></div>
                    <h3 class="good-title">[包邮]<a
                            href="http://www.jujiukuaiyou.com/index.php?m=item&amp;a=index&amp;id=99814"
                            target="_blank">性感蕾丝无钢圈裹胸美背文胸内衣女小胸聚拢交叉带抹胸加厚防走光</a>
                        <div class="icon-all" style="display:none;"></div>
                        <span class="sold">已售<em>285</em></span></h3>
                    <div class="good-price"><span class="price-current"><em>￥</em>29.9</span><span
                            class="des-other"><strong><div class="ljpx" _hover-ignore="1"></div></strong><p><span
                            class="price-old"><em>￥</em>39.9</span><span
                            class="discount">(<em>7.5</em>折)</span></p></span>
                        <div class="btn buy m-buy"><a
                                href="http://www.jujiukuaiyou.com/index.php?m=quanjump&amp;a=index&amp;id=565395971218"
                                target="_blank" rel="external nofollow"><em class="t-icon"></em><span>淘宝</span></a>
                        </div>
                    </div>
                    <a class="y-like my-like" data-pid="565395971218" href="javascript:;" title="加入收藏"><i
                            class="like-ico"><span class="heart_left"></span><span class="heart_right"></span></i></a>
                </div>
            </li>
        </ul>
        <div class="page"><em></em>
            <div><span class="pg-prev">上一页</span> <span>1</span> <a
                    href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=index&amp;p=2">&nbsp;2&nbsp;</a> <a
                    href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=index&amp;p=3">&nbsp;3&nbsp;</a> <a
                    href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=index&amp;p=4">&nbsp;4&nbsp;</a> <a
                    href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=index&amp;p=5">&nbsp;5&nbsp;</a>
                <i>...</i> <a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=index&amp;p=36">36</a> <a
                        href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=index&amp;p=2"
                        class="pg-next">下一页<em></em></a></div>
        </div>
    </div><!--文章系统start--><!--文章系统end--></div>
<div class="nav-main">
    <div class="main e-nav w1200">
        <div class="nav-item fl">
            <div class="item-list">
                <ul>
                    <li><a href="http://www.jujiukuaiyou.com/" class="active">全部</a></li>
                    <li><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=1" title="女装">女装</a>
                    </li>
                    <li><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=2" title="男装">男装</a>
                    </li>
                    <li><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=3" title="鞋子">鞋子</a>
                    </li>
                    <li><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=4" title="母婴">母婴</a>
                    </li>
                    <li><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=5" title="居家">居家</a>
                    </li>
                    <li><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=6" title="美妆">美妆</a>
                    </li>
                    <li><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=7" title="数码">数码</a>
                    </li>
                    <li><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=8" title="美食">美食</a>
                    </li>
                    <li><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=9" title="文体">文体</a>
                    </li>
                    <li><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=13" title="内衣">内衣</a>
                    </li>
                    <li><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=22" title="箱包">箱包</a>
                    </li>
                    <li><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=25" title="9.9包邮">9.9包邮</a>
                    </li>
                    <li><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=26" title="19.9包邮">19.9包邮</a>
                    </li>
                    <li><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=27" title="电器">电器</a>
                    </li>
                    <li><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=32" title="其他">其他</a>
                    </li>
                    <li><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=33" title="家纺">家纺</a>
                    </li>
                    <li><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=cate&amp;cid=34"
                           title="优惠券">优惠券</a></li>
                </ul>
            </div>
        </div>
        <div class="nav-other fl">
            <ul>
                <li><a href="http://www.jujiukuaiyou.com/index.php?m=xinpin&amp;a=index"><i
                        class="today"></i><span>今日新品</span></a></li>
                <li><a href="http://www.jujiukuaiyou.com/index.php?m=yugao&amp;a=index"><i
                        class="tw"></i><span>明日预告</span></a></li>
            </ul>
        </div>
        <div class="n_h"><span>排序：</span><a href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=index"
                                            class=" active ">默认</a><a
                href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=index&amp;sort=new" class="  ">最新</a><a
                href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=index&amp;sort=hot" class="  ">销量</a><a
                href="http://www.jujiukuaiyou.com/index.php?m=index&amp;a=index&amp;sort=low" class="  ">券额</a></div>
    </div>
</div>
<div class="foot">
    <div class="white_bg">
        <div class="foot-con">
            <div class="con-box-n clear">
                <div class="app-side-box fl"><p class="app-show"><img
                        src="${pageContext.request.contextPath}/js/main/5ada050c25609.png"></p>
                    <p class="app-txt">扫描二维码打开</p></div>
                <div class="con-left-info fl">
                    <dl class="update">
                        <dt>获取更新</dt>
                        <dd><a href="http://www.jujiukuaiyou.com/index.php?m=apps&amp;a=index" target="_blank"
                               rel="nofollow"><i></i>iPhone/Android</a></dd>
                        <dd><a href="http://www.jujiukuaiyou.com/" target="_blank" rel="nofollow"><i></i>QQ空间</a></dd>
                        <dd><a href="http://www.jujiukuaiyou.com/" target="_blank" rel="nofollow"><i></i>新浪微博</a></dd>
                        <dd><a href="http://www.jujiukuaiyou.com/" target="_blank" rel="nofollow"><i></i>腾讯微博</a></dd>
                    </dl>
                    <dl class="cooperation">
                        <dt>商务合作</dt>
                        <dd><a href="http://www.jujiukuaiyou.com/index.php?m=bao&amp;a=index" target="_blank"><i></i>卖家免费报名</a>
                        </dd>
                        <dd><a href="http://www.jujiukuaiyou.com/index.php?m=help&amp;a=read&amp;id=2" target="_blank"
                               rel="nofollow"><i></i>商务合作</a></dd>
                        <dd><a href="http://www.jujiukuaiyou.com/index.php?m=help&amp;a=read&amp;id=2" target="_blank"
                               rel="nofollow"><i></i>广告合作</a></dd>
                        <dd><a href="http://www.jujiukuaiyou.com/index.php?m=help&amp;a=read&amp;id=5" target="_blank"
                               rel="nofollow"><i></i>免责声明</a></dd>
                    </dl>
                    <dl class="cor-info">
                        <dt>用户帮助</dt>
                        <dd><a href="http://www.jujiukuaiyou.com/index.php?m=help&amp;a=read&amp;id=6" target="_blank"
                               rel="nofollow"><i></i>常见问题</a></dd>
                        <dd><a href="http://www.jujiukuaiyou.com/index.php?m=help&amp;a=xiaobao" target="_blank"
                               rel="nofollow"><i></i>消费保障</a></dd>
                        <dd><a href="http://www.jujiukuaiyou.com/index.php?m=forget&amp;a=index" target="_blank"
                               rel="nofollow"><i></i>忘记密码</a></dd>
                        <dd><a href="http://www.jujiukuaiyou.com/index.php?m=user&amp;a=register" target="_blank"
                               rel="nofollow"><i></i>免费注册</a></dd>
                    </dl>
                    <dl class="help-info">
                        <dt>用户中心</dt>
                        <dd><a href="http://www.jujiukuaiyou.com/index.php?m=user&amp;a=like" target="_blank"
                               rel="nofollow"><i></i>我的收藏</a></dd>
                        <dd><a href="http://www.jujiukuaiyou.com/index.php?m=help&amp;a=read&amp;id=6" target="_blank"
                               rel="nofollow"><i></i>积分攻略</a></dd>
                        <dd><a href="http://www.jujiukuaiyou.com/index.php?m=sitemap&amp;a=index"
                               target="_blank"><i></i>网站地图</a></dd>
                    </dl>
                </div>
                <div class="con-menu fr"><a
                        href="http://wpa.qq.com/msgrd?v=3&amp;uin=792833137&amp;site=qq&amp;menu=yes"
                        class="service-add fl" target="_blank"></a><span class="service-time fl"><p>周一至周六 </p><p>9:00-22:00 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></span>
                </div>
            </div>
            <div class="links"><span>友情链接：</span>
                <div class="links_list_box">
                    <ul class="links_list" style="margin-top: 0px;">
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>
            <p class="ft-company">九块邮&nbsp;&nbsp;<a href="http://www.miibeian.gov.cn/"
                                                    target="_blank">湘ICP备14002391号</a>　　Copyright © 2010 - 2016
                http://www.jujiukuaiyou.com All Rights Reserved
                <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
                document.write(unescape("%3Cspan id='cnzz_stat_icon_5838842'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s5.cnzz.com/stat.php%3Fid%3D5838842%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
                <span id="cnzz_stat_icon_5838842"><a href="http://www.cnzz.com/stat/website.php?web_id=5838842"
                                                     target="_blank" title="站长统计"><img border="0" hspace="0" vspace="0"
                                                                                       src="${pageContext.request.contextPath}/js/main/pic.gif"></a></span>
                <script src="${pageContext.request.contextPath}/js/main/stat.php" type="text/javascript"></script>
                <script src="${pageContext.request.contextPath}/php/core.php" charset="utf-8"
                        type="text/javascript"></script>


            </p>
            <div align="center"><a id="_pingansec_bottomimagelarge_shiming"
                                   href="https://ss.knet.cn/verifyseal.dll?sn=e16110443010065103g9bw000000&amp;ct=df&amp;a=1&amp;pa=0.7875768630521469"
                                   target="_blank"><img
                    src="${pageContext.request.contextPath}/js/main/TB2zltmamXlpuFjy0FeXXcJbFXa_!!97720815.png"></a><a
                    id="_pingansec_bottomimagelarge_shiming"
                    href="https://www.yunaq.com/analytics/login/?site=www.jujiukuaiyou.com" target="_blank"><img
                    src="${pageContext.request.contextPath}/js/main/TB2lWQpbRaM.eBjSZFMXXcypVXa_!!97720815.png"></a>
                <a key="581849d6efbfb014cd56883f" logo_size="124x47" logo_type="realname"
                   href="https://v.pinpaibao.com.cn/authenticate/cert/?site=www.jujiukuaiyou.com&amp;at=realname"
                   target="_blank">
                    <script src="${pageContext.request.contextPath}/js/main/aq_auth.js"></script>
                    <b id="aqLogoEJZME" style="display: none;"></b><img
                        src="${pageContext.request.contextPath}/js/main/sm_124x47.png" alt="安全联盟认证" width="124"
                        height="47"
                        style="border: none;">

                </a><a id="_pingansec_bottomimagelarge_shiming"
                       href="https://www.so.com/s?q=site%3Awww.jujiukuaiyou.com&amp;src=srp&amp;fr=360sou_home&amp;psid=9a5d7e80c4c50b8dae60089aa0c6d474"
                       target="_blank"><img
                        src="${pageContext.request.contextPath}/js/main/TB23nj7bQ1M.eBjSZFFXXc3vVXa_!!97720815.jpg"></a>


                <script src="${pageContext.request.contextPath}/dll/seallogo.dll"></script>
                <span style="display:inline-block;position:relative;width:auto;"><a
                        href="https://ss.knet.cn/verifyseal.dll?sn=e16110443010065103g9bw000000&amp;ct=df&amp;a=1&amp;pa=0.45231911876998754"
                        id="kx_verify" tabindex="-1" target="_blank" kx_type="图标式" style="display:inline-block;"><img
                        src="${pageContext.request.contextPath}/js/main/cnnic.png" style="border:none;"
                        oncontextmenu="return false;" alt="可信网站"></a></span>


                <a id="_pingansec_bottomimagelarge_shiming"
                   href="https://www.yunaq.com/analytics/login/?site=www.jujiukuaiyou.com" target="_blank"><img
                        src="${pageContext.request.contextPath}/js/main/TB2lfphXCFmpuFjSZFrXXayOXXa_!!97720815.png"></a>
                <p></p></div>
        </div>
    </div>
    <div id="J_sidebar" class="side_right">
        <div class="side-box">
            <ul class="side-oper">
                <li class="normal side-user"><a class="links" id="J_user" target="_blank"
                                                href="http://www.jujiukuaiyou.com/index.php?m=user&amp;a=index"><i
                        class="normal-icon i-user"></i></a>
                    <div id="side-login" class="tab-tips tab-login" style="opacity: 0; display: none; right: 62px;">
                        <div class="user-box">
                            <div class="pic"><img src="${pageContext.request.contextPath}/js/main/default_64.jpg"></div>
                            <p class="txt"></p></div>
                        <i class="close">×</i>
                        <div class="arr-icon">◆</div>
                    </div>
                </li>
                <li class="normal side-cart"><a class="links links-cart" id="J_cart" href="javascript:;"><i
                        class="normal-icon i-cart"></i><em class="num cartnum">0</em></a>
                    <div class="tab-tips tab-tag" style="opacity: 0; display: none; right: 62px;">
                        <div class="carttime"></div>
                        <div class="arr-icon">◆</div>
                    </div>
                </li>
                <li class="normal side-love"><a class="links" id="J_love" target="_blank"
                                                href="http://www.jujiukuaiyou.com/index.php?m=user&amp;a=like"><i
                        class="normal-icon i-love"></i></a>
                    <div class="tab-tips" style="opacity: 0; display: none; right: 62px;">我的收藏
                        <div class="arr-icon">◆</div>
                    </div>
                </li>
                <li class="normal side-quan"><a class="links" id="J_quan" target="_blank"
                                                href="http://www.jujiukuaiyou.com/index.php?m=user&amp;a=gift"><i
                        class="normal-icon i-quan"></i></a>
                    <div class="tab-tips" style="opacity: 0; display: none; right: 62px;">我的礼品
                        <div class="arr-icon">◆</div>
                    </div>
                </li>
            </ul>
            <ul class="side-oper other">
                <li class="normal side-ad"><a class="links links_ad" href="http://www.jujiukuaiyou.com/#"
                                              target="_blank"><img
                        src="${pageContext.request.contextPath}/js/main/style-nav.jpg"></a>
                    <div class="tab-tips" style="opacity: 0; display: none; right: 62px;"><a
                            href="http://www.jujiukuaiyou.com/#" target="_blank"><img
                            src="${pageContext.request.contextPath}/js/main/style.png" width="130" height="248px;"></a>
                    </div>
                </li>
                <li class="normal side-complain"><a class="links" id="J_complain" target="_blank"
                                                    href="http://www.jujiukuaiyou.com/index.php?m=user&amp;a=msg&amp;do=send"><i
                        class="normal-icon i-complain"></i></a>
                    <div class="tab-tips" style="opacity: 0; display: none; right: 62px;">意见反馈
                        <div class="arr-icon">◆</div>
                    </div>
                </li>
                <li class="normal side-code"><a class="links" id="J_code" href="javascript:;"><i
                        class="normal-icon i-code"></i></a>
                    <div class="tab-tips" style="opacity: 0; display: none; right: 62px;">
                        <div class="code-box"><p class="code"><img
                                src="${pageContext.request.contextPath}/js/main/5ada050c25609.png" width="90px"></p>
                            <p class="txt">扫描下载二维码</p></div>
                        <div class="arr-icon">◆</div>
                    </div>
                </li>
                <li class="normal side-backtop"><a class="links" id="J_backtop" href="javascript:;"
                                                   style="display: none;"><i class="normal-icon i-backtop"></i></a>
                    <div class="tab-tips" style="opacity: 0; display: none; right: 62px;">返回顶部
                        <div class="arr-icon">◆</div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/main/init.js" type="text/javascript"></script>
    <script type="text/javascript">
    var lang = {};
    lang.tips = "友情提示";
    lang.please_input = "请输入";
    lang.username = "帐号";
    lang.password = "密码";
    lang.login_title = "用户登陆";
    lang.correct_itemurl = "正确的商品地址";
    lang.title = "标题";
    lang.card_loading = "正在获取用户信息";
    lang.wait = "请稍后......";
    lang.chaxun = "报名查询系统";
    lang.please_select = "请选择分类";</script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/main/ba4c2923a19d816e6cae46e3984d0269.js"></script>
    <script src="${pageContext.request.contextPath}/js/main/lightbox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/main/goodlist.js" type="text/javascript"></script>
    <script type="text/javascript">    $("img.lazy").lazyload({threshold: 200, failure_limit: 30});
    </script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main/pg-index.js"></script>
    <script type="text/javascript">
        (function (win, doc) {
            var s = doc.createElement("script"), h = doc.getElementsByTagName("head")[0];
            if (!win.alimamatk_show) {
                s.charset = "gbk";
                s.async = true;
                s.src = "http://a.alimama.cn/tkapi.js";
                h.insertBefore(s, h.firstChild);
            }
            ;
            var o = {
                pid: "mm_29839046_11908362_42140309", /*推广单元ID，用于区分不同的推广渠道*/
                appkey: "", /*通过TOP平台申请的appkey，设置后引导成交会关联appkey*/
                unid: "", /*自定义统计字段*/
                type: "click" /* click 组件的入口标志 （使用click组件必设）*/
            };
            win.alimamatk_onload = win.alimamatk_onload || [];
            win.alimamatk_onload.push(o);
        })(window, document);
    </script>
</div>
<div class="backToTop" style="display: none;"></div>
</body>
</html>