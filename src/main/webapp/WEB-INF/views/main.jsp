<%@page import="com.founder.oss.commons.CmsGlobals"%>
<%@page import="com.founder.oss.commons.DateUtils"%>
<%@page import="java.util.UUID"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">

<%@page
        import="org.springside.modules.security.springsecurity.SpringSecurityUtils"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>商品管理</title>
    <style type="text/css">
        table td,th{
            border:0px;
        }
        #fileQueue {
            background-color: #f2f2f2;
            background-image: url("${ctx}/js/uploadify/progressBar.jpg");
            background-position: 10px;
            background-repeat: no-repeat;
            height: 60px;
            margin-bottom: 10px;
            margin-left: 0px;
            overflow: auto;
            padding: 5px 5px;
            width: 480px;
        }
    </style>
    <%@ include file="/common/meta.jsp"%>
    <link href="${ctx}/css/yui.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/css/liststyle.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/css/style.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/js/validate/jquery.validate.css" type="text/css"
          rel="stylesheet" />

    <script src="${ctx}/js/jquery-1.11.1.min.js" type="text/javascript"></script>

    <script src="${ctx}/js/jquery.form.js" type="text/javascript"></script>
    <script src="${ctx}/js/validate/jquery.validate.js"
            type="text/javascript"></script>
    <script type="text/javascript" src="${ctx}/js/datecomponent/WdatePicker.js"></script>
    <script src="${ctx}/js/thickbox.js" type="text/javascript"></script>
    <script type="text/javascript" src="${ctx}/js/lrtk.js"></script>
    <link rel="stylesheet" href="${ctx}/css/thickbox.css" type="text/css"
          media="screen" />
    <link href="${ctx }/css/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="${ctx}/css/lrtk.css" rel="stylesheet" />
    <script type="text/javascript"
            src="${ctx}/xheditor-1.1.7/xheditor-1.1.7-zh-cn.min.js"></script>
    <script src="${ctx}/js/jquery-ui-sortable/jquery-ui.min.js" type="text/javascript"></script>
    <link href="${ctx}/js/jquery-ui-sortable/jquery-ui.min.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/js/jquery-ui-sortable/jquery-ui.structure.min.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/js/jquery-ui-sortable/jquery-ui.theme.min.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
        //360浏览器不进入$(function(){})//;所以这么写兼容所有浏览器
        window.onload=function(){
            //当前预览图片地址都放在一个字段里，页面获取后拆分放置
            var val = $("#previewpicPaths").val();
            if(val != null && val != ""){
                var paths = val.split(",");
                var len = paths.length;
                for(var i = 1; i<len+1; i++){
                    var idn = "#previewImg"+i;
                    $(idn).val(paths[i-1]);
                }
            }

            //xbhEditor编辑器图片上传回调函数
            //调用下边这个方法，是上传完图片自动显示,但是设置的属性就不管用了。
            function insertUpload2(msg) {
                var _msg = msg.toString();
                var _picture_name = _msg.substring(_msg.lastIndexOf("/")+1);
                var _picture_path = Substring(_msg);
                _picture_path = "<img escape='false' src='/upload"+_picture_path+"'/>";
                $("#xh_editor").xheditor().pasteHTML("<strong>"+_picture_path+"</strong>")
            }
            //处理服务器返回到回调函数的字符串内容,格式是JSON的数据格式.
            function Substring(s){
                return s.substring(s.substring(0,s.lastIndexOf("/")).lastIndexOf("/"),s.length);
            }
            //初始化日期选框
            show($("#serviceSpanType").val());
            //初始化出版社和部门
            //var publishName = $("#publishName").val();
            var publishName = '${userLogin}';
            var departName = $("#departName").val();
            if(''!=publishName){
                initDepart(publishName,departName);
            }
        }
        function zoom(obj,size){
            $(obj).width(size);
            $(obj).height(size);
        }
        function checkpdf(val){
            photoExt=val.substr(val.lastIndexOf(".")).toLowerCase();//获得文件后缀名
            if(photoExt!='.pdf'){
                alert("请上传后缀名为pdf格式的文件!");
                var file = document.getElementById("uploadPrereadUrl");
                // for IE, Opera, Safari, Chrome
                if (file.outerHTML) {
                    file.outerHTML = file.outerHTML;
                } else { // FF(包括3.5)
                    file.value = "";
                }
            }
        }
        function setImg(obj1,obj2){
            var val = document.getElementById(obj1).value;
            if(regX(val)){
                document.getElementById(obj2).value = document.getElementById(obj1).value;
            }else{
                alert("格式错误！请上传jpg、png或bmp格式图片文件。");
            }
        }
        function setPreread(obj1,obj2){
            var val = document.getElementById(obj1).value;
            if(regX(val)){
                document.getElementById(obj2).value = document.getElementById(obj1).value;
            }else{
                alert("格式错误！请上传zip格式压缩文件。");
            }
        }
        function setGoods(){
            document.getElementById("realuploadname").value = document.getElementById("uploadGoods").value;
        }
        function regX(val){
            var patt1=new RegExp("\\.jpg$");
            var patt2=new RegExp("\\.png$");
            var patt3=new RegExp("\\.bmp$");
            return patt1.test(val) || patt2.test(val) || patt3.test(val);
        }

        function show(an){
            if(an==2){
                document.getElementById("serviceTimesId2_1").style.display = "";
                document.getElementById("serviceTimesId2_1_input").style.display = "";

            }else{
                document.getElementById("serviceTimesId2_1").style.display = "none";
                document.getElementById("serviceTimesId2_1_input").style.display = "none";
            }
        }

        function toDate(DateStr){
            var converted = Date.parse(DateStr);
            var myDate = new Date(converted);
            if (isNaN(myDate)){
                var arys= DateStr.split('-');
                myDate = new Date(arys[0],--arys[1],arys[2]);
            }
            return myDate;
        }


        function verifyValue() {
            try{
                var merchandiseName = $('#merchandiseName').val();
                var merchandiseDescription = $('#merchandiseDescription').val();
                var discountRate = $('#discountRate').val();
                var startDate1 = $('#startDate1').val();
                var startDate2 = $('#startDate2').val();
                var endDate1 = $('#endDate1').val();
                var endDate2 = $('#endDate2').val();
                var standardPrice = $('#standardPrice').val();
                var recommend = $('#recommend').val();
                var byDay = $('#byDay').val();
                var byTimes = $('#byTimes').val();
                var userLogin = $('#userLogin').val();
                var serviceSpanType = $("#serviceSpanType").val();
                var publishName = $("#publishName").val();
                var departId = $("#departId").val();
                var authDesc =  $("#authorDesc").val();
                var resource = $("#filerealname").val();
                var realfilename = "${realfilename}";
                //提交form表单校验
                if(serviceSpanType==2){
                    if(startDate1==""||endDate1==""){
                        alert("按日期计费时，日期必须选择");
                        return false;
                    }
                }
                if(''==publishName||''==departId){
                    alert('出版社和部门必须选择。');
                    return false;
                }

                if(merchandiseName==null || ""==merchandiseName){
                    alert("商品名称不能为空");
                    return false;
                }
                if(merchandiseName.length<1 || merchandiseName.length>200){
                    alert("商品名称长度必须大于1个字符并且小于200个字符");
                    return false;
                }

                var reg =/(^\d*(\.\d{1,2})?$)|(^[-+]?[0]{1}(\.\d{1,2})?$)/;
                if(standardPrice!=null && ""!=standardPrice && !reg.test(standardPrice)){
                    alert("商品价格格式错误!");
                    return false;
                }

                if(discountRate!="" && discountRate!=null && !/^(?:0|[1-9][0-9]?|100)$/.test(discountRate)){
                    alert("折扣必须为0到100的整数！");
                    return false;
                }
                if(startDate2!=null && endDate2!=null){
                    var starttime = Date.parse(startDate2.replace(/-/g,"/"));
                    var endtime = Date.parse(endDate2.replace(/-/g,"/"));
                    if(endtime <= starttime){
                        alert("折扣日期的开始时间必须早于结束时间！");
                        return false;
                    }
                }

                if(recommend!="" && recommend!=null && !/^[0-9]*[1-9][0-9]*$/.test(recommend)){
                    alert("推荐度必须数字！");
                    return false;
                }
                if(recommend!="" && recommend!=null && parseInt(recommend)>parseInt(1000000)){
                    alert("推荐度必须为大于0并且小于1000000的正整数！");
                    return false;
                }

                if(authDesc.length > 500)
                {
                    alert("输入的作者简介长度不能超过500个字符!");
                    return false;
                }
                /* if(realfilename==""){
                     if(resource==""||resource==null){
                         if(!confirm("您所上传的资源为空，确认保存吗？"))
                        return false;
                     }
                 }*/
            }catch(e){
                alert(e);
            }
            return true;
        }

        // 是否有纸书的其他信息显示
        function zhiShuShowChange(an){
            if(an == 1){
                document.getElementById("zhiShuShow").style.display = "";
            }else{
                document.getElementById("zhiShuShow").style.display = "none";
            }
        }

        // 是否免费的其他信息显示
        function priceShowFunction(an){
            if(an == 1){
                document.getElementById("priceShow1").style.display = "";
                document.getElementById("priceShow2").style.display = "";
            }else{
                $("#standardPrice").val(0.0);
                document.getElementById("priceShow1").style.display = "none";
                document.getElementById("priceShow2").style.display = "none";
            }
        }
        //是否显示目录结构
        function directoryStructureShowFunction(an){
            if(an == 1){
                document.getElementById("directoryStructureShow").style.display = "";
                document.getElementById("directoryStructureShow2").style.display = "";
            }else{
                document.getElementById("directoryStructureShow").style.display = "none";
                document.getElementById("directoryStructureShow2").style.display = "none";
            }
        }
    </script>
    <script type="text/javascript">
        function windowOpen(){
            window.open("bar-select!show.action?t=${timeStamp}", "select1","modal=yes,top=224,left=400, width=460,height=400,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no, status=no");
        }
        function windowOpen1(){
            window.open("bar-selectBuy!showBuy.action?t=${timeStamp}", "select1","modal=yes,top=224,left=400, width=460,height=400,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no, status=no");
        }
    </script>
    <script type="text/javascript">
        function windowOpen3(){
            var merchandiseId = $("#merchandiseId").val();
            var authorIds = $("#authorIds").val();
            var roleIds = $("#roleIds").val();
            var roleNames = $("#roleNames").val();
            window.open("../system/goods!showAuthor.action?merchandiseId="+merchandiseId+"&authorIds="+authorIds+"&roleIds="+roleIds+"&roleNames="+roleNames, "设置作者","fullscreen=no,modal=yes,top=224,left=400, width=460,height=400,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no, status=no");
        }
        function windowOpen4(){
            var ids = $("#ids").val();
            window.open("../system/merchandise-cat!showCatsByids.action?ids="+ids, "设置分类","fullscreen=no,modal=yes,top=224,left=400, width=460,height=400,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no, status=no");
        }
        /**
         * 初始化部门
         */
        function initDepart(publish,departName){
            $.post("goods!getDepartsByPublishName.action",{"publishName":publish},function(data){
                $("#departId").html('');
                data = eval(data+"");
                $("#departId").append('<option value=\"\">请选择</option>');
                for(var o in data){
                    if(data[o].typename==departName){
                        $("#departId").append('<option selected=\"selected\" value=\"'+data[o].id+'\">'+data[o].typename+'</option>');
                    }else{
                        $("#departId").append('<option value=\"'+data[o].id+'\">'+data[o].typename+'</option>');
                    }
                }
            });
        }
        /**
         * 设置部门，选择出版社时异步获取
         */
        function setDepart(publish){
            $.post("goods!getDepartsByPublishName.action",{"publishName":publish},function(data){
                $("#departId").html('');
                $("#departId").append('<option value=\"\">请选择</option>');
                data = eval(data+"");
                for(var o in data){
                    $("#departId").append('<option value=\"'+data[o].id+'\">'+data[o].typename+'</option>');
                }
            });

        }

        function deletefileMap(target){
            /*
            var goodsId=$("#merchandiseId").val();
            if(goodsId!=null&&(goodsId!=="")&&(fileId!=undefined)&&(fileId!=null)){//修改商品，从页面文件列表移除并从DB解除关联关系
                $.post("goods!ajaxDeleteFileMap.action",
                        {"merchandiseId":goodsId,
                         "fileId":$(target).attr("fileGoodsId")},
                         function(data){
                        if(data.status=="1"){//db成功删除,将 文件从table移除
                            $(this).parent().parent().parent().remove();
                        }
                    });
            }else{//新增文件从table移除
                $(target).parent().parent().parent().remove();
                $('#uploadify').uploadify('cancel',$(target).attr("fileId"));
            }
            */
            $(target).parent().parent().parent().remove();
            $('#uploadify').uploadify('cancel',$(target).attr("fileId"));

        }

        function modifyfileMap(url,index,merchandiseName,goodsForm,filesizeshow){
            var uuid = $("#merchandiseUuid").val();
// 	 window.open("goods!update.action?t="+uuid, "select1","modal=yes,top=224,left=400, width=858,height=400,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no, status=no");
            window.open("goods!editUploadMultiFile.action?uuid=" + uuid + "&index=" + index, "select1","modal=yes,top=224,left=400, width=858,height=400,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no, status=no");

            // alert(url+merchandiseName+goodsForm+filesizeshow);

        }

        function relateEpub(index){
            window.open("goods!uploadRelateEpub.action?isMultiFile=true&index="+index, "select1","modal=yes,top=224,left=400, width=858,height=400,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no, status=no");
        }
        function uploadEpubZip(){
            window.open("goods!uploadRelateEpub.action?isMultiFile=true&isEpubZip=true", "selectepub1","modal=yes,top=224,left=400, width=858,height=400,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no, status=no");
        }
        //更新关联epub文件
        function updateRelateEpub(index,file,data,response){
            var fileName = $("#fileShowName"+index);
            var epubFileName=file.name.substring(0,file.name.lastIndexOf("."));
            alert("");
            var filesizeshow = returnFloat(file.size / (1024*1024)) + "MB";
            if(fileName[0]){
                fileName.html(epubFileName+".epub("+filesizeshow+")");
            }else{
                $("#showEpubInfo"+index).append("<font id='fileShowName"+index+"' style='padding-left: 11px;' color='#ff0000'> "+epubFileName+".epub("+filesizeshow+")</font>");
                $("#fileGoodsButton"+index).append("<input id='deleteEpubFile"+index+"' type='button' value='删除关联'  onClick='deleteEpub("+index+")' />");
            }
            $("input[name='fileGoodsList["+index+"].epubFileName").val(epubFileName);
            $("#showEpubInfo"+index).append("<input type='hidden' id='epubFileName"+index+"' name='fileGoodsList["+index+"].epubFileName' value='"+epubFileName+"'>");
            var filesize = "<input type='hidden' id='epubFileSize"+index+"' name='fileGoodsList["+index+"].epubFileSize' value='"+file.size+"'>";
            $("#showEpubInfo"+index).append(filesize);
            var infoArr = data.split(";");
            var fileUploadpath = $("#epubFilePath"+index);
            fileUploadpath.val(infoArr[1]);
        }
        //更新关联epub文件
        function updateEpud(file,data,response){
            var epubFileName=file.name.substring(0,file.name.lastIndexOf("."));
            var filesizeshow = returnFloat(file.size / (1024*1024)) + "MB";
            var infoArr = data.split(";");
            $("#showEpubInfo_edup").html("");
            $("#showEpubInfo_edup").append("<font id='fileShowName' style='padding-left: 11px;' color='#ff0000'> "+epubFileName+".zip("+filesizeshow+")</font>");
            $("#showEpubInfo_edup").append("<input type='hidden'  name='zipPath' value='"+infoArr[1]+"'>");
            //Ajax调用处理






            $.ajax({
                type:'post',
                url:'goods!decompression.action',
                data: {"zipPath":infoArr[1]},
                cache:false,
                dataType:'json',
                success:function(data){

                    alert("-----"+data.msg);
                  var list=  ${fileGoodsList};
                    alert("===="+list.length);


                }
            });









        }

        function inputEpubFile(data){
            var indexNum=0;
            while ($("input[name='fileGoodsList["+indexNum+"].merchandiseName").val()!=null){
                var dupbNmae=
                var fileName = $("#fileShowName"+index);
                var epubFileName=file.name.substring(0,file.name.lastIndexOf("."));
                var filesizeshow = returnFloat(file.size / (1024*1024)) + "MB";
                if(fileName[0]){
                    fileName.html(epubFileName+".epub("+filesizeshow+")");
                }else{
                    $("#showEpubInfo"+index).append("<font id='fileShowName"+index+"' style='padding-left: 11px;' color='#ff0000'> "+epubFileName+".epub("+filesizeshow+")</font>");
                    $("#fileGoodsButton"+index).append("<input id='deleteEpubFile"+index+"' type='button' value='删除关联'  onClick='deleteEpub("+index+")' />");
                }
                $("input[name='fileGoodsList["+index+"].epubFileName").val(epubFileName);
                $("#showEpubInfo"+index).append("<input type='hidden' id='epubFileName"+index+"' name='fileGoodsList["+index+"].epubFileName' value='"+epubFileName+"'>");
                var filesize = "<input type='hidden' id='epubFileSize"+index+"' name='fileGoodsList["+index+"].epubFileSize' value='"+file.size+"'>";
                $("#showEpubInfo"+index).append(filesize);
                var infoArr = data.split(";");
                var fileUploadpath = $("#epubFilePath"+index);
                fileUploadpath.val(infoArr[1]);


                indexNum++;
            }

        }
        function returnFloat(value){
            var value=Math.round(parseFloat(value)*100)/100;
            var xsd=value.toString().split(".");
            if(xsd.length==1){
                value=value.toString()+".00";
                return value;
            }
            if(xsd.length>1){
                if(xsd[1].length<2){
                    value=value.toString()+"0";
                }
                return value;
            }
        }

        function deleteEpub(index){
            $("#fileShowName"+index).remove();
            $("#deleteEpubFile"+index).remove();
            $("#epubFileSize"+index).val("");
            $("#epubFilePath"+index).val("delete");//删除epub时，将删除标志暂时存放在epubFilepath中
            $("#epubFileName"+index).val("");
        }

    </script>
    <!-- 处理劳保的项目情况，对于编辑商品，仅仅显示 创建者、商品名称、审核状态、上架状态 -->
    <!-- 在下面的地方增加了  -->

</head>
<body>
<div id="edit">
    <div class="right" style="text-align: left">
		<span style="margin-left: 20px;"><img
                src="${ctx}/images/center_bt.png" />商品<s:if
                test="merchandiseId == null">创建</s:if> <s:else>编辑</s:else> </span>
    </div>
    <div class="nr">
        <div class="center_nrbg_center" style="text-align: left">
            <!--
		<form id="mainForm" name="mainForm" action="goods!save.action?t=${timeStamp}&multiFilegoods=1"
				method="post" >
				-->

            <form id="mainForm" name="mainForm" action="goods!saveMultiFileGoods.action?t=${timeStamp}"
                  enctype="multipart/form-data" method="post" ">

            <!-- 传递商品列表页面的掩藏域值， 用于在保存成功后，可以继续原来列表页面的当前页 -->
            <!-- 列表页面查询条件 -->
            <input type="hidden" id="queryMerchandiseName" name="queryMerchandiseName" value="${queryMerchandiseName}"/>
            <input type="hidden" id="queryApproveStatus" name="queryApproveStatus" value="${queryApproveStatus}"/>
            <input type="hidden" id="queryIds" name="queryIds" value="${queryIds}"/>
            <input type="hidden" id="queryServiceSpanType" name="queryServiceSpanType" value="${queryServiceSpanType}" />
            <input type="hidden" id="querySourceType" name="querySourceType" value="${querySourceType}" />
            <!-- 列表页面分页 -->
            <input type="hidden" name="page.pageNo" id="pageNo" value="${page.pageNo}" />
            <input type="hidden" name="page.orderBy" id="orderBy" value="${page.orderBy}" />
            <input type="hidden" name="page.order" id="order" value="${page.order}" />
            <input type="hidden" name="typ" id="typ" value="${typ }"/>

            <input type="hidden"
                   id="goodsForm" name="entity.goodsForm"
                   value="${goodsForm}" />
            <input type="hidden"
                   id="sourceType" name="entity.sourceType"
                   value="${sourceType}" />

            <!-- end 列表页面查询条件+分页-->

            <input type="hidden" id="merchandiseId" name="merchandiseId" value="${merchandiseId}" />
            <input type="hidden" id="merchandiseUuid" name="merchandiseUuid" value="${entity.merchandiseUuid}" />
            <input type="hidden" id="summarypicPaths" name="summarypicPaths" value="${entity.summarypicPaths }" />
            <input type="hidden" id="previewpicPaths" name="previewpicPaths" value="${entity.previewpicPaths }" />
            <input type="hidden" id="realfilename" name="realfilename" value="${entity.realfilename }">
            <input type="hidden" id="fileUpdatetime" name="fileUpdatetime" value="${entity.fileUpdatetime }">

            <table border="0" style="width:95%" align="center">

                <tr>
                    <td width="150px" align="right">上传文件</td>
                    <td colspan="3">

                        <input type="hidden" name="entity.fileUploadpath" id="filePath" value="${fileUploadpath }">
                        <input type="hidden" id="ctx" name="ctx" value="${ctx }">
                        <input type="hidden" name="filerealname" id="filerealname" />
                        <div style="background-color: #f2f2f2;">
                            <div id="fileQueue"></div>
                            <input type="file"  id="uploadify" />
                            <p style="margin-left: 0px; font-size: 14; color: #EE7600;">
                                <a id="file_doupload"
                                   href="javascript:$('#uploadify').uploadify('upload','*')"
                                   style="color: #EE7600; font-size: 14px;">上传 </a>&nbsp;&nbsp;&nbsp;
                                <a id="file_dogohistory"
                                   href="goods!editMultiFileGoods.action?merchandiseId=${merchandiseId}&t=${timeStamp}&height=340&width=750"
                                   style="color: #EE7600; font-size: 14px;">返回 </a>&nbsp;&nbsp;&nbsp;
                                <a href="javascript:$('#uploadify').uploadify('cancel','*')"
                                   id="cancelUpload"
                                   style="color: #EE7600; font-size: 14px; display: none;">取消上传</a>
                            </p>
                        </div>

                    </td>
                </tr>
                <tr>
                    <td width="150px" align="right">
                        <input type="button" value="上传Epub压缩包"  onClick="uploadEpubZip()" />
                    </td>
                    <td>
                        <div align="left" id="showEpubInfo_edup">
                            <font id="fileShowName_edup" style="padding-left: 11px;" color="#ff0000">未选择压缩文件</font>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td width="150px" align="right">&nbsp;</td>
                    <td colspan="3">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#d5e3e7" id="contentTable">
                            <tr align="center">
                                <td nowrap>文件封面</td>
                                <td nowrap>文件名称</td>
                                <td nowrap>文件类型</td>
                                <td nowrap>文件大小</td>
                                <td nowrap>操作</td>
                                <td nowrap>已上传关联epub文件</td>

                            </tr>
                            <tbody id="resBody">

                            <input type="hidden" id="filesize"  value="${fn:length(fileGoodsList)}">
                            <s:iterator value="fileGoodsList" status="i">
                                <tr class="idd" style=" background:#fff; cursor:pointer;" onmouseover="this.style.backgroundColor='#deedf2'" onmouseout="this.style.backgroundColor='#fff'">

                                    <td><div align="center">
                                        <input  type="file"  name="fileGoodsList[${i.index}].uploadimg"/>
                                        <s:if test="iconUrl != null"><span style="padding-left: 5px"><img onmouseover="zoom(this,90)" width="30px" height="30px" onmouseout="zoom(this,30)" src="${fullIconUrl}"/></span></s:if>
                                        <!--
										<img
										src="${iconUrl}"
										style="width: 75px; height: 75px; border: 0;"
										alt="${merchandiseName}" />&nbsp;
										-->
                                        <input  type="hidden"  name="fileGoodsList[${i.index}].iconUrl" value="${iconUrl}"/>
                                    </div></td>
                                    <td><div align="center">
                                        <input  type="text" name="fileGoodsList[${i.index}].merchandiseName" value="${merchandiseName}"/>
                                        <span  style="display:none;"  class="merchandiseName-fileUploadpath" >${fileUploadpath};${merchandiseName}</span>
                                    </div></td>
                                    <td><div align="center"><span>${goodsForm}&nbsp;</span>
                                        <input  type="hidden"  name="fileGoodsList[${i.index}].goodsForm" value="${goodsForm}"/>

                                    </div></td>
                                    <td><div align="center"><span>${filesizeshow}&nbsp;</span>
                                        <input  type="hidden"  name="fileGoodsList[${i.index}].filesize" value="${filesize}"/>
                                            <%-- <fmt:formatNumber type="number" value="${filesizeshow}" maxFractionDigits="2"/>  --%>
                                    </div></td>
                                    <td>
                                        <div align="center" id="fileGoodsButton${i.index}">
                                            <input  type="hidden"  name="fileGoodsList[${i.index}].merchandiseId" value="${merchandiseId}"/>
                                            <!-- 借用orders字段存放排序号 -->
                                            <input  type="hidden"  name="fileGoodsList[${i.index}].orders" />
                                            <input type="button" fileGoodsId="${merchandiseId}" value="删除"  onClick="deletefileMap(this);" />
                                                <%-- 											      <input type="button" fileGoodsId="${merchandiseId}" value="更新文件"  onClick="javascript:$('#uploadify').uploadify('settings','*')" /> --%>
                                            <input type="button" fileGoodsId="${merchandiseId}" value="更新文件"  onClick="modifyfileMap('${merchandiseUuid}','${i.index}')" />
                                            <input type="button" fileGoodsId="${merchandiseId}" value="关联epub"  onClick="relateEpub('${i.index}')" />
                                            <s:if test="epubFileName != null"><input id="deleteEpubFile${i.index}" type="button" value="删除关联"  onClick="deleteEpub('${i.index}')" /></s:if>
                                        </div>

                                    </td>
                                    <td>
                                        <div align="center" id="showEpubInfo${i.index}">
                                            <s:if test="epubFileName != null"><font id="fileShowName${i.index}" style="padding-left: 11px;" color="#ff0000">${epubFileName}.epub</font></s:if>
                                            <input  type="hidden" id="epubFilePath${i.index}"  name="fileGoodsList[${i.index}].epubFilePath" />
                                        </div>

                                    </td>
                                </tr>
                            </s:iterator>

                            <tr id="row0"  class="idd" style=" background:#fff; cursor:pointer;display:none;" onmouseover="this.style.backgroundColor='#deedf2'" onmouseout="this.style.backgroundColor='#fff'">
                                <td><div align="center">
                                    <input  type="file"  name="fileGoodsList[{index}].uploadimg"/>
                                    <!--
                                        <img
                                        src="{iconUrl}"
                                        style="width: 75px; height: 75px; border: 0;"
                                        alt="{merchandiseName}" />&nbsp;
                                        -->
                                    <input  type="hidden"  name="fileGoodsList[{index}].iconUrl" value="{iconUrl}"/>
                                    <input  type="hidden"  name="fileGoodsList[{index}].filesize" value="{filesize}"/>
                                </div></td>
                                <td><div align="center">
                                    <input  type="text"  name="fileGoodsList[{index}].merchandiseName" value="{merchandiseName}"/>
                                </div></td>
                                <td><div align="center">{goodsForm}&nbsp;</div></td>
                                <td><div align="center">{filesizeshow}&nbsp;</div></td>

                                <td>
                                    <div align="center" id="fileGoodsButton{index}">
                                        <input  type="hidden" id="fileInfo" name="fileGoodsList[{index}].merchandiseDescription" value="{data}"/>
                                        <span  style="display:none;"  class="merchandiseName-fileUploadpath" >{data}</span>
                                        <input  type="hidden"  name="fileGoodsList[{index}].orders" />
                                        <input type="button" resid="{merchandiseId}" fileId="{fileId}" value="删除"  onClick="deletefileMap(this);" />
                                        <input type="button" resid="{merchandiseId}" fileId="{fileId}" value="关联epub"  onClick="relateEpub('{index}')" />
                                    </div>
                                </td>
                                <td>
                                    <div align="center" id="showEpubInfo{index}">
                                        <input  type="hidden" id="epubFilePath{index}"  name="fileGoodsList[{index}].epubFilePath" />
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <!-- 扫描框，对当前商品已上传成功的在文件服务器上的文件进行扫描并显示 -->
                <c:if test="${merchandiseId != null && !empty merchandiseId }">
                    <tr><td width="150px" align="right"></td><td colspan="3"><input style="padding:2px 10px;display:inline;" type="button" value="扫描" onclick="checkRealFile();"><h3 style="display:inline;padding:1px 20px;">扫描当前商品已经上传到服务器的文件信息</h3></td></tr>
                    <tr id="norealfile" hidden = "hidden"><td width="150px" align="right"></td><td colspan="3"><span style="display:inline;padding:1px 40px;">未找到相关文件信息！</span></td></tr>
                    <tr id="realfiletable" hidden ="hidden">
                        <td width="150px" align="right"></td>
                        <td colspan="3">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#d5e3e7" id="contentTable">
                                <tr align="center">
                                    <td nowrap>文件名称</td>
                                    <td nowrap>文件类型</td>
                                    <td nowrap>文件大小</td>
                                    <td nowrap>上传时间</td>
                                </tr>
                                <tbody id="realfiles" style="background:rgb(255,2552,255);">
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </c:if>
                <tr>
                    <td width="150px" align="right"><font color="#ff0000">*</font>商品名称 </td>
                    <td >
                        <input type="text" id="merchandiseName" name="entity.merchandiseName" value="${entity.merchandiseName}" />
                    </td>
                    <td width="150px" align="right">是否免费</td>
                    <td><select name="entity.isFree" id="isFree" onChange="priceShowFunction(this.value);">
                        <option value="1" <s:if test="entity.isFree==1">selected</s:if>>收费</option>
                        <option value="0" <s:if test="entity.isFree==0">selected</s:if>>免费</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td align="right">计费方式</td>
                    <td ><select id="serviceSpanType"
                                 name="entity.serviceSpanType" onChange="show(this.value);">
                        <option value="2"
                                <s:if test="entity.serviceSpanType == 2">selected</s:if>>日期计费</option>
                        <option value="5"
                                <s:if test="entity.serviceSpanType == 5">selected</s:if>>永久</option>
                    </select></td>
                    <td align="right" id="serviceTimesId2_1"><font color="#ff0000">*</font>起止日期</td>
                    <td  id="serviceTimesId2_1_input"><input
                            type="text" size="12" id="startDate1" name="entity.startDate"
                            value="${entity.startDate}" onFocus="WdatePicker()" /> - <input
                            type="text" size="12" id="endDate1" name="entity.expireDate"
                            value="${entity.expireDate}" onFocus="WdatePicker()" /></td>
                </tr>
                <tr id="priceShow1">
                    <td align="right">商品价格</td>
                    <td><input type="text" id="standardPrice" name="entity.standardPrice" value="${entity.standardPrice}" /></td>
                    <td align="right">商品折扣</td>
                    <td>
                        <input type="text" id="discountRate" name="discountRate" value='<fmt:formatNumber value="${discountRate}" type="currency" pattern="0"/>'/>
                        <span style="padding-left: 10px;">0-100的整数</span>
                    </td>
                </tr>
                <tr id="priceShow2">
                    <td align="right">折扣开始日期</td>
                    <td><input type="text" id="startDate2"
                               name="entity.discountBeginDate" size="19"
                               value="<s:date name='entity.discountBeginDate' format='yyyy-MM-dd HH:mm:ss'/>"
                               onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" /></td>
                    <td align="right">折扣结束日期</td>
                    <td><input
                            type="text" size="19" id="endDate2" name="entity.discountEndDate"
                            value="<s:date name='entity.discountEndDate' format='yyyy-MM-dd HH:mm:ss'/>"
                            onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" /></td>
                </tr>
                <tr>
                    <td align="right">推荐度</td>
                    <td ><input type="hidden" id="recommend"
                                name="entity.recommend" value="${entity.recommend}">
                        <div id="xzw_starSys">
                            <div id="xzw_starBox">
                                <ul class="star" id="star">
                                    <li><a href="javascript:void(0)" title="1"
                                           class="one-star">1</a></li>
                                    <li><a href="javascript:void(0)" title="2"
                                           class="two-stars">2</a></li>
                                    <li><a href="javascript:void(0)" title="3"
                                           class="three-stars">3</a></li>
                                    <li><a href="javascript:void(0)" title="4"
                                           class="four-stars">4</a></li>
                                    <li><a href="javascript:void(0)" title="5"
                                           class="five-stars">5</a></li>
                                </ul>
                                <div class="current-rating" id="showb"></div>
                            </div>
                            <div class="description"></div>
                        </div></td>
                    <td align="right">商品分类</td>
                    <td><input type="button" value="点击设置"
                               onclick="windowOpen4();">  <input
                            type="hidden" name="ids" id="ids" value="${ids}" /><input  size="30" readonly="readonly" type="text"
                                                                                       name="subject" id="subject" value="${subject}"/><br/>
                        <!-- 资源库推送过来的商品，增加推荐分类 -->
                        <s:if test="entity.sourceType == 1">资源库推荐分类：${entity.textbookInfo }</s:if>
                    </td>
                </tr>
                <tr>
                    <td align="right">是否有纸书</td>
                    <td ><select name="hasPapers" onchange="zhiShuShowChange(this.value);">
                        <option <s:if test="hasPapers==1">selected</s:if> value="1">是</option>
                        <option <s:if test="hasPapers==2">selected</s:if>value="2">否</option>
                    </select></td>
                    <td align="right">纸书ISBN</td>
                    <td><input type="text" name="paperbookIsbn" value="${paperbookIsbn}"/></td>
                </tr>
                <tr id="zhiShuShow">
                    <td align="right">纸书定价</td>
                    <td><input type="text" name="papersPrice"    value="${papersPrice}"/></td>
                    <td align="right">纸书地址</td>
                    <td ><input type="text" name="papersUrl" value="${papersUrl}"></td>
                </tr>
                <tr>
                    <td align="right">作者</td>
                    <td ><input type="button" value="点击设置作者"
                                onclick="windowOpen3();" /> <input type="hidden" id="authorIds"
                                                                   name="authorIds" value="${authorIds}"> <input
                            type="hidden" id="roleIds" name="roleIds" value="${roleIds}">
                        <input type="hidden" id="roleNames" name="roleNames"
                               value="${roleNames}">  <input type="text"
                                                             id="myAuthorNames" name="myAuthorNames" value="${authorNames}" disabled="disabled" >  <input type="hidden"
                                                                                                                                                          id="authorNames" name="authorNames" value="${authorNames}"> </td>
                    <td align="right">作者简介</td>
                    <td ><textarea name="entity.authorDesc" id="authorDesc"
                                   style="width: 150px; height: 50px;">${entity.authorDesc}</textarea><font color="#ff0000">500个字符以内</font></td>
                </tr>
                <tr>
                    <td align="right">封面</td>
                    <td colspan="3"><input
                            type="file" id="uploadicon" name="uploadicon"/><font color="#ff0000">jpg文件，建议长高比率：246*246</font>
                        <!-- 已经上传的封面 -->
                        <s:if test="iconUrl != null">已上传封面<span style="padding-left: 5px"><img onmouseover="zoom(this,90)" width="30px" height="30px" onmouseout="zoom(this,30)" src="${fullIconUrl}"/></span></s:if>
                    </td>
                </tr>
                <tr>
                    <td align="right">预览图</td>
                    <td colspan="3"><input
                            type="file" name="uploadPreview" value="" /> <font color="#ff0000">含有jpg文件的zip包。建议jpg长高比率：484*484</font>
                        <s:if test="previewpicPaths != null">
                            <c:forEach var="preview" items="${fullPreviewpicPaths}">
                                <img src="${preview}" onmouseover="zoom(this,90)" width="30px" height="30px" onmouseout="zoom(this,30)" height="20px" />
                            </c:forEach>
                        </s:if>
                    </td>
                </tr>
                <tr>
                    <td align="right">试读</td>
                    <td colspan="3"><input
                            type="file" id="uploadPrereadUrl" name="uploadPrereadUrl" onchange="checkpdf(this.value)" value=""/>
                        <font color="#ff0000">只能上传pdf格式文件
                            <s:if test="prereadUrl != null&&prereadUrl !=''">
                                ,已上传过文件
                            </s:if><s:else>
                                请选择文件</s:else>
                        </font>
                    </td>
                <tr>
                    <td align="right">商品简介</td>
                    <td><textarea  name="merchandiseDescription"
                                   style="width: 150px; height: 50px;">${merchandiseDescription}</textarea></td>
                    <td align="right">推荐设备</td>
                    <td><input name="recommendPlat"   type="checkbox" <s:if test="recommendPlat.indexOf('0')>=0">checked="true"</s:if> value="0"/><span style="padding-left: 10px;">手机</span>
                        <input name="recommendPlat" type="checkbox" <s:if test="recommendPlat.indexOf('1')>=0">checked="true"</s:if> value="1"/><span style="padding-left: 10px;">PAD</span>
                        <input name="recommendPlat"  type="checkbox" <s:if test="recommendPlat.indexOf('2')>=0">checked="true"</s:if> value="2"/><span style="padding-left: 10px;">PC</span>
                    </td>
                </tr>
                <tr>
                    <td align="right">是否有目录结构</td>
                    <td><select name="hasMulu" onchange="directoryStructureShowFunction(this.value);" id=""hasMulu"">
                        <option <s:if test="hasMulu==1">selected</s:if> value="1">是</option>
                        <option <s:if test="hasMulu==0">selected</s:if>value="0">否</option>
                        </select> </td>
                    <td align="right" id="directoryStructureShow2">目录结构</td>
                    <td><textarea name="directoryStructure" id="directoryStructureShow"
                                  style="width: 150px; height: 50px;">${entity.directoryStructure}</textarea></td>
                </tr>
                <!-- 资源库：增加剩余需要的字段 begin -->
                <tr>
                    <td align="right">副书名</td>
                    <td><input name="subtitle" type="text" value="${subtitle}"/></td>
                    <td align="right">丛书名</td>
                    <td><input name="seriesName" type="text" value="${seriesName}"/></td>
                </tr>
                <tr>
                    <td align="right">版次</td>
                    <td><input name="bookVersion" type="text"  value="${bookVersion }"/></td>
                    <td align="right">开本</td>
                    <td><input name="format" type="text"  value="${format}"/></td>
                </tr>
                <tr>
                    <td align="right">ISBN号</td>
                    <td><input name="isbn" type="text"  value="${isbn}"/></td>
                    <td align="right">页数</td>
                    <td><input name="textNum" type="text"  value="${textNum}"/></td>
                </tr>
                <tr>
                    <td align="right">出版时间</td>
                    <td>

                        <input
                                type="text" size="19" name="pubdate"
                                value="<s:date name='pubdate' format='yyyy-MM-dd HH:mm:ss'/>"
                                onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" /></td>
                    <td align="right">支持的平台</td>
                    <td><input name="supportPlatform"  type="checkbox" <s:if test="supportPlatform.indexOf('1')>=0">checked="true"</s:if> value="1"/><span style="padding-left: 10px;">Android</span>
                        <input name="supportPlatform"  type="checkbox" <s:if test="supportPlatform.indexOf('2')>=0">checked="true"</s:if> value="2"/><span style="padding-left: 10px;">ios</span>
                        <input name="supportPlatform"  type="checkbox" <s:if test="supportPlatform.indexOf('3')>=0">checked="true"</s:if> value="3"/><span style="padding-left: 10px;">pc</span>
                    </td>
                </tr>
                <tr>
                    <td align="right">关键词</td>
                    <td ><input name="subjectTerm" type="text" size="40" value="${subjectTerm}"/>多个关键词之间逗号分隔</td>
                    <td align="right">课程代码</td>
                    <td>
                        <input type="text" id="courseCode" name="entity.courseCode" value="${entity.courseCode}" />
                    </td>
                </tr>
                <tr>
                    <td align="right">本次更新说明</td>
                    <td>
                        <textarea rows="3" cols="20" id="mark" name="entity.mark"></textarea>
                    </td>
                    <td align="right">电子书或媒体资源</td>
                    <td>
                        <select name="entity.bookOrMedia" id="bookOrMedia">
                            <option value="" <s:if test="entity.bookOrMedia==''">selected</s:if>>请选择</option>
                            <option value="1" <s:if test="entity.bookOrMedia==1">selected</s:if>>电子书</option>
                            <option value="2" <s:if test="entity.bookOrMedia==2">selected</s:if>>媒体资源</option>
                        </select>
                    </td>
                </tr>
                <!-- 资源库：增加剩余需要的字段 end -->
                <tr>
                    <td align="right"><font color="#ff0000">*</font>出版社</td>
                    <td><select id="publishName" name="publishName" onchange="setDepart(this.value);" value="${publishName}">
                        <option value="">请选择</option>
                        <s:iterator value="publishersList" var ="publish">
                            <option <s:if test="userLogin==username">selected="selected"</s:if> value="${publish.username}">${publish.realname}</option>
                        </s:iterator>
                    </select></td>
                    <td align="right"><font color="#ff0000">*</font>部门</td>
                    <td><select id="departId" name="entity.departId">
                        <option value="">请选择</option>
                    </select><input type="hidden" id="departName" value="${departName}"/></td>
                </tr>
                <!-- 20170216关联资源组 开始 -->
                <tr>
                    <td align="right">资源关联组</td>
                    <td><input type="button" value="点击单选设置" onclick="related();" />&nbsp;&nbsp;(上架后生效)</td>
                    <td align="right">资源关联课程</td>
                    <td><input type="button" value="查看及设置关联课程" onclick="relatedCourse();" />&nbsp;&nbsp;(上架后生效)</td>
                </tr>
                <tr>
                    <td align="right">已选择资源关联组：</td>
                    <td><input type="hidden" id="groupId" name="groupid" value="${groupid }"/>
                        <span id="groupName"><c:if test="${empty associateGroupName}">无</c:if><c:if test="${not empty associateGroupName}">${associateGroupName}</c:if></span>
                        <input type="button" value="删除关联资源" onclick="deleteRelated()"/>&nbsp;&nbsp;(上架后生效)</td>
                    <td align="right">已选择所属课程：</td>
                    <td><input type="hidden" id="courseid" name="courseid" value="${courseid }"/>
                        <input type="text" disabled="disabled" id="courseNames" value="${courseCode }"/></td>
                </tr>
                <!-- 20170216关联资源组 结束 -->
                <tr align="center">
                    <td colspan="4">
                        <input type="hidden" id="isuploadpack" name="isuploadpack" value="" />
                        <input type="button" id="submit0" value="保 存" class="button" onclick="saveInfo();" />
                        <input type="button" value="取 消" class="button" onClick="window.close();" />
                        <span id="suggestMessage" style="visibility: hidden;">
								<font color="orange" style="font-style: italic;"> √ 保存成功，请等待文件上传完成</font>
							</span>
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>

    <script type="text/javascript">

        // 设置上传控件的超链接按钮不可用，不可点击
        function setUploadDisable(){
            try{
                // 设置上传、取消上传、上传返回为不可编辑
                var cancelUpload = document.getElementById("cancelUpload");
                var file_doupload = document.getElementById("file_doupload");
                var file_dogohistory = document.getElementById("file_dogohistory");

                // 设置不可用
                cancelUpload.disabled='disabled';
                file_doupload.disabled='disabled';
                file_dogohistory.disabled='disabled';

                // 去掉超链接的href
                cancelUpload.removeAttribute("href");
                file_doupload.removeAttribute("href");
                file_dogohistory.removeAttribute("href");

                // 去掉点击
                cancelUpload.onclick=null;
                file_doupload.onclick=null;
                file_dogohistory.onclick=null;

                // 去掉下划线
                cancelUpload.style.textDecoration= 'none';
                file_doupload.style.textDecoration= 'none';
                file_dogohistory.style.textDecoration= 'none';
            }catch(e){
            }
        }

        //added by wangwei : 判断用户是否需要上传数据包
        function saveInfo(){
            if(!verifyValue())return;
            setUploadDisable();
            $('#mainForm').submit();
        }
    </script>

    <script type="text/javascript"
            src="${ctx }/js/uploadify/jquery.uploadify-3.1.min.js?t=${timeStamp}">
    </script>
    <style type="text/css">
        #fileQueue {
            background-color: #f2f2f2;
            background-image: url("${ctx}/js/uploadify/progressBar.jpg");
            background-position: 10px;
            background-repeat: no-repeat;
            height: 60px;
            margin-bottom: 10px;
            margin-left: 0px;
            overflow: auto;
            padding: 5px 5px;
            width: 480px;
        }
    </style>
    <!-- css/img/uploadify-cancel.png" -->
    <script type="text/javascript">
        var type = $("#resourceType").val();
        /* function check(){
            var type = $("#resourceType").val();
            alert(type);
            if (type == 0) {
                type = "*.dpub";
            }else if(type == 1){
                type = "*.zip";
            }
            var upload = $('#uploadify');
            //upload.uploadifySettings('fileExt', type);
            uploadify("settings", 'fileExt', type);
        } */

        $(document).ready(function() {
            var filesize=$("#filesize").val();
            $("#uploadify").uploadify({
                'swf' : '${ctx}/js/uploadify/uploadify.swf',
                'uploader' : '${ctx}/upload?uuid=', // 多文件不传uuid，uploadservlet自动添加
                'folder' : 'uploadFile',
                'queueID' : 'fileQueue',
                'queueSizeLimit' : '100',	// 队列里面，待上传的数量
                'removeTimeout' : '100',
                'removeCompleted' : false,
                'fileTypeDesc' : '请选择文件上传',
                'fileTypeExts' : '${canUseGoodTypes}',
                'auto' : false,
                'fileSizeLimit' : '<%=Integer.parseInt(CmsGlobals.getCmsProperty("param.dataSize"))*1024 %>',
                'multi' : true,		// 是否可以同时上传
                'onUploadStart' : function(file)
                {
                    document.getElementById("cancelUpload").style.display = "inline";
                    //document.getElementById("submit0").disabled='disabled';
                },
                'onCancel':function(file){
                    alert('文件'+file.name+'被取消了.');
                },
                'onUploadError' : function(file, errorCode, errorMsg, errorString) //文件上传失败,后调用的函数
                {
                    alert("文件上传失败");
                },
                'onUploadComplete' : function(file) { //上传文件成功后触发的事件

                },
                'onUploadSuccess':function(file,data,response){ //每一个文件上传成功后触发

                    if(data == 1){
                        alert("当前网络环境较差，请稍后再试！");
                        return;
                    }
                    var type=file.type;
                    var  fileName=file.name;
                    var  fileId=file.id;
                    var fileGoodObj={};
                    fileGoodObj.merchandiseName=fileName.substring(0,fileName.lastIndexOf("."));
                    fileGoodObj.goodsForm=type.substring(1);
                    // 这儿缺少东西。文件大小需要存成long类型。由程序自动解析如何显示。
                    fileGoodObj.filesize = file.size;
                    fileGoodObj.filesizeshow=parseFloat((file.size/(1024*1024)).toFixed(2))+"MB";
                    fileGoodObj.data=data;
                    fileGoodObj.fileId=file.id;
                    fileGoodObj.index=filesize++;
                    //多文件表格插入上传文件的数据
                    $newRow = $("#row0").clone();
                    var newRowHtml = $newRow.html();
                    for(var attr in fileGoodObj){
                        //普通浏览器
                        newRowHtml = newRowHtml.replace(new RegExp("\\{" + attr + "}","g"),fileGoodObj[attr]+"");
                        //火狐浏览器需要重新编码
                        var oldStr = encodeURI("{" + attr + "}");
                        newRowHtml = newRowHtml.replace(new RegExp("\\" + oldStr + "","g"),fileGoodObj[attr]+"");
                    }

                    $newRow.html(newRowHtml);
                    $newRow.show();
                    $("#row0").parent().append($newRow);


                    if(data !=null){
                        document.getElementById("isuploadpack").value="true"; // 文件修改完成修改上传的状态位
                    }
                }
            });
        });

        function updateFile(index,file,data,response){
            var fileName = $("input[name='fileGoodsList["+index+"].merchandiseName']");
            var merchandiseName=file.name.substring(0,file.name.lastIndexOf("."));
            fileName.val(merchandiseName);

            var fileType = $("input[name='fileGoodsList["+index+"].goodsForm']");
            fileType.val(file.type);
            fileType.prev().text(file.type);

            var filesize = $("input[name='fileGoodsList["+index+"].filesize']");

            var infoArr = data.split(";");
            var fileUploadpath = "<input type=\"hidden\" name=\"fileGoodsList["+index+"].fileUploadpath\" value=\""+infoArr[1]+"\"/>";

            filesize.after(fileUploadpath);
            filesize.val(file.size);
            var filesizeshow = file.size / (1024*1024) + "MB";
            filesize.prev().text(filesizeshow);

        }

        $(function(){
            $("#resBody").sortable({
                update: function( event, ui ) {

                    var checks = $("[onClick='deletefileMap(this);']:visible");

                    for (var i=0;i<checks.length;i++)
                    {
                        $(checks[i]).siblings("input[name$='orders']").val(i);
                    }


                }
            });
        });

        //20170216 关联资源组，点击保存生效  开始
        function related(){
            window.open("/clientInterface/tbResourceAssociateGroupController/getResourceAssociateGroupApi.do","资源关联组","fullscreen=no,modal=yes,top=224,left=400, width=460,height=400,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no, status=no");
        }
        //弹出关联资源组，确认选中后的方法
        function groupCheck(result){
            drawGroupList(result);
        }
        function drawGroupList(jsonList){
            var count = 0;
            $.each(jsonList, function(i, item){
                var groupId = item['id'];
                var groupName = item['groupName'];
                $("#groupName").text(groupName);
                $("#groupId").val(groupId);
            });
        }
        //删除关联资源组，点击保存后生效
        function deleteRelated(){
            $("#groupName").text("无");
            $("#groupId").val("");
        }
        //20170216 关联资源组，点击保存生效  结束
        //20170313 资源关联课程 点击保存生效 开始
        //点击 展示出该资源的关联课程列表
        function relatedCourse(){
            var resType = "1";//电子书和多文件
            window.open("/clientInterface/tbCourseController/showResourceCourse.do?resourceId=${parentId}&resourceType="+resType,
                "设置关联课程",
                "fullscreen=no,modal=yes,top=224,left=400, width=460,height=400,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no, status=no");
        }

        //20170313 资源关联课程 点击保存生效 结束

        //对当前商品已上传成功的在文件服务器上的文件进行扫描并显示
        function checkRealFile(){
            //获取所有有的上传文件路径信息
            var  uploadPaths = [];
            var  path_name = [];
            $(".merchandiseName-fileUploadpath").each(function(){
                var info = $(this).text();
                if(info.indexOf("{data}")!=-1)  return true;
                info = info.substring(info.lastIndexOf("/")+1);
                var  infos = info.split(";");
                path_name[infos[0]]=infos[1];
                uploadPaths.push(infos[0]) ;
            });
            $.post("goods!ajaxScanRealFile.action",{filePaths:JSON.stringify(uploadPaths)},function(data){
                var files = data;
                console.log(files)
                if(files==undefined||files.length==0){
                    $("#realfiletable").hide();
                    $("#norealfile").show();
                    return ;
                }
                $("#realfiles").html("");
                var innerhtml="";
                $.each(files,function(index,file){
                    innerhtml='<tr class="idd ui-sortable-handle" align="center">';
                    innerhtml+='<td>'+path_name[file.name]+'</td>';
                    innerhtml+='<td>'+file.type+'</td>';
                    innerhtml+='<td>'+file.size+'MB</td>';
                    innerhtml+='<td>'+file.changetime+'</td>';
                    innerhtml+='</tr>';
                    $("#realfiles").append(innerhtml);
                });
                $("#norealfile").hide();
                $("#realfiletable").show();
            });
        }
    </script>
    <script language="JavaScript">
        javascript:window.history.forward(1);
    </script>

</div>


</body>
</html>