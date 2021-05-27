<%-- 
    Document   : displayWarring
    Created on : Mar 22, 2021, 12:10:51 AM
    Author     : sonng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<style>
    .button {
        background-color: #FF0011;
        -webkit-border-radius: 10px;
        border-radius: 10px;
        border: none;
        color: #FFFFFF;
        cursor: pointer;
        display: inline-block;
        font-family: Arial;
        font-size: 20px;
        padding: 5px 10px;
        text-align: center;
        text-decoration: none;
    }
    @-webkit-keyframes glowing {
        0% { background-color: #004A7F; -webkit-box-shadow: 0 0 3px #FF0011; }
        50% { background-color: #0094FF; -webkit-box-shadow: 0 0 10px #FF0011; }
        100% { background-color: #004A7F; -webkit-box-shadow: 0 0 3px #FF0011; }
    }
    @-moz-keyframes glowing {
        0% { background-color: #004A7F; -moz-box-shadow: 0 0 3px #FF0011; }
        50% { background-color: #0094FF; -moz-box-shadow: 0 0 10px #FF0011; }
        100% { background-color: #004A7F; -moz-box-shadow: 0 0 3px #FF0011; }
    }
    @-o-keyframes glowing {
        0% { background-color: #004A7F; box-shadow: 0 0 3px #FF0011; }
        50% { background-color: #0094FF; box-shadow: 0 0 10px #FF0011; }
        100% { background-color: #004A7F; box-shadow: 0 0 3px #FF0011; }
    }
    @keyframes glowing {
        0% { background-color: #004A7F; box-shadow: 0 0 3px #FF0011; }
        50% { background-color: #0094FF; box-shadow: 0 0 10px #FF0011; }
        100% { background-color: #004A7F; box-shadow: 0 0 3px #FF0011; }
    }
    #caution {
        -webkit-animation: glowing 500ms infinite;
        -moz-animation: glowing 500ms infinite;
        -o-animation: glowing 500ms infinite;
        animation: glowing 500ms infinite;
    }
</style>
<s:set name="counttb"><s:property value="countTrungBinhTask"/></s:set>
<s:if  test="#counttb == 'na'">
    
</s:if>
<s:else>
    <div id="caution" class="alert bg-danger alert-icon-right alert-dismissible mb-2" role="alert" >
    <span class="alert-icon"><i class="la la-warning"></i></span>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">×</span>
    </button>
    <strong>CẢNH BÁO !</strong> Hiện tại, công việc của bạn chỉ đạt <s:property value="countTrungBinhTask"/>%
    và chưa đạt chỉ số nguồn lực 120%. Vui lòng thông báo cho Quản lý dự án để nhận thêm việc.
</div>
</s:else>

