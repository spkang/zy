<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="struts-tags.tld" %>
<%@ taglib uri="/WEB-INF/tld/tiles-jsp.tld" prefix="tiles" %>
<link type="text/css" href="css/header.css" rel="stylesheet"/>

<div id="header">
        <s:a action="index" cssClass="logoImg"></s:a>
        <p class="words"><s:property value="%{getText('share.happy.share.knowlege')}"/></p>
        <%-- 海林注意，如果是中文版，中文版三个字有下划线style="text-decoration:underline;"，如果是英文版给对English加上相应的CSS设置 --%>
        <!--p class="lan_select">
            <a href="javascript:;" style="text-decoration:underline;">中文版</a> / <a href="javascript:;">English</a>
        </p-->

    <s:set name="SESSION_LOCALE" value="#session['WW_TRANS_I18N_LOCALE']" />
    <s:bean id="locales" name="com.gogowise.action.user.Locales">
        <s:param name="current"
            value="#SESSION_LOCALE == null?locale:#SESSION_LOCALE" />
   </s:bean>



        <form action="<s:url/>" id="langForm">
        <p class="lan_select">
         <%--   <s:text name="选择语言" />--%>
          <s:property value="%{getText('header.select.language')}"/>
          <s:select label="Language" list="#locales.locales" listKey="value"
              listValue="key"
              value="#SESSION_LOCALE == null ? locale : #SESSION_LOCALE"
              name="request_locale" id="langSelecter"
             onchange="langSelecter_onChanged()" theme="simple" />
          </p>
        </form>

        <p class="help">
            <a href="helpCenter.html" target="_blank"><s:property value="%{getText('system.normal.problem')}"/></a> /
            <%--<a href="javascript:;">站点地图</a> /--%>
            <a href="aboutUs.html"><s:property value="%{getText('link.contact.us')}"/></a>
        </p>
        <p class="tel"><s:property value="%{getText('system.contact.tel')}"/><span>4000-211-123</span></p>

        <a href="addLiveGoingAnnouncement.html" class="announce_btn" title="<s:property value="%{getText('live.trailer.announce')}"/>"></a>
        <s:if test="enteredRoom == null || !enteredRoom"><a class="begin_live act_btn" href="startPersonalOnlive.html"><s:property value="%{getText('frame.index.start.onlive')}"/></a></s:if>


</div>

<script type="text/javascript">
     function langSelecter_onChanged()
     {
         var currHref = document.location.href+"";
         var languageValue = $("#langSelecter").val();
         if(currHref.substr(currHref.lastIndexOf("=")) == "=zh_CN" || currHref.substr(currHref.lastIndexOf("=")) == "=en_US"){
             currHref = currHref.substr(0,currHref.lastIndexOf("=")) + "="+languageValue;
             window.location.href = currHref;
         } else{
                 var href;
                 if(currHref.substr(currHref.lastIndexOf(".")) == ".html"){
                     href = currHref +"?request_locale="+languageValue;
                 }else{
                     href = currHref +"&amp;request_locale="+languageValue;
                 }
                window.location.href = href;
         }
    }

</script>
