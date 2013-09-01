﻿<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>

<link href="css/orgLeague/<s:text name='orgleague.css.filename'/>" rel="stylesheet" type="text/css"/>
<style type="text/css">
    table th,table td{
        border: 1px solid #ccc;
        padding:4px;
    }
    table{
        width: 100%;
        border-collapse: collapse;
    }
</style>

<div >

    <s:a action="higSecOrgCreateInit" cssStyle="font-size: 26px">增加</s:a>
    <div >
        <div >
            <s:property value="message"/>
    </div>
       <s:fielderror/>

        <table width="881" height="136" border="1">
            <tr>
                <th width="234" scope="col">LOGO</th>
                <th width="120" scope="col">申请人EMAIL</th>
                <th width="120" scope="col">申请人昵称</th>
                <th width="140" scope="col">组织名称</th>
                <th width="101" scope="col">电话</th>
                <th width="71" scope="col">输入者</th>
                <th width="71" scope="col">操作</th>
            </tr>

        <s:iterator value="organizations" >
            <tr>
                <td height="72"><img src="<s:property value="logoUrl"/>" width="196" height="62" /></td>
                <td><s:property value="responsiblePerson.email" /> </td>
                <td><s:property value="responsiblePerson.nickName" /> </td>
                <td><s:property value="schoolName" /></td>
                <td><s:property value="cellPhone" /></td>
                <td><s:property value="creator.email" /></td>
                <td>
                    <s:if test="canEdit">
                        <s:a action="higSecOrgCreateInit"><s:param name="org.id" value="id"></s:param> 编辑</s:a>
                    </s:if>
                    <s:if test="canReview">
                        <a onclick="confirmOrg('<s:property value="id"/>')"> 确认</a>
                    </s:if>
                </td>
            </tr>
        </s:iterator>

        </table>


    </div>
</div>
<s:form id="hidForm" action="higSecConfirmOrgByAdmin">
    <s:hidden name="org.id" id="orgId" />
</s:form>

<script type="text/javascript">
    function confirmOrg (id) {
        if(confirm("确定要确认该组织吗?")){
             document.getElementById("orgId").value = id;
             document.getElementById("hidForm").submit();
        }
    }
</script>

