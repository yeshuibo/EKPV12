<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resource/jsp/common.jsp"%>
<%@page import="com.landray.kmss.sys.relation.forms.SysRelationConditionForm"%>
<%@page import="com.landray.kmss.sys.relation.forms.SysRelationStaticNewForm"%>
<%@page import="com.landray.kmss.sys.relation.forms.SysRelationEntryForm"%>
<%@page import="com.landray.kmss.sys.relation.util.SysRelationUtil"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.util.List"%>
<c:if test="${param.formName!=null}">
<ui:accordionpanel id="" channel="relation" style="min-width:200px;"> 
	<c:set var="mainModelForm" value="${requestScope[param.formName]}" scope="request"/>
	<c:set var="currModelId" value="${mainModelForm.fdId}" scope="request"/>
	<c:set var="currModelName" value="${mainModelForm.modelClass.name}" scope="request"/>
	<c:if test="${mainModelForm.method_GET=='add' || mainModelForm.method_GET=='edit'}">
		<c:set var="sysRelationMainForm" value="${mainModelForm.sysRelationMainForm}" scope="request"/>
		<script type="text/javascript">
			var relationEntrys={};
			<c:forEach items="${sysRelationMainForm.sysRelationEntryFormList}" varStatus="vstatus" var="sysRelationEntryForm">
				var relationConditions={};
				var staticInfos={};
				<%
					JSONObject relationEntry = new JSONObject();
					SysRelationEntryForm sysRelationEntryForm = (SysRelationEntryForm) pageContext.getAttribute("sysRelationEntryForm");
					relationEntry.accumulate("fdId",sysRelationEntryForm.getFdId());
					relationEntry.accumulate("fdType",sysRelationEntryForm.getFdType());
					relationEntry.accumulate("fdModuleName",sysRelationEntryForm.getFdModuleName());
					relationEntry.accumulate("fdModuleModelName",sysRelationEntryForm.getFdModuleModelName());
					relationEntry.accumulate("fdOrderBy",sysRelationEntryForm.getFdOrderBy());
					relationEntry.accumulate("fdOrderByName",sysRelationEntryForm.getFdOrderByName());
					relationEntry.accumulate("fdPageSize",sysRelationEntryForm.getFdPageSize());
					relationEntry.accumulate("fdParameter",sysRelationEntryForm.getFdParameter());
					relationEntry.accumulate("fdKeyWord",sysRelationEntryForm.getFdKeyWord());
					relationEntry.accumulate("docCreatorId",sysRelationEntryForm.getDocCreatorId());
					relationEntry.accumulate("docCreatorName",sysRelationEntryForm.getDocCreatorName());
					relationEntry.accumulate("fdFromCreateTime",sysRelationEntryForm.getFdFromCreateTime());
					relationEntry.accumulate("fdToCreateTime",sysRelationEntryForm.getFdToCreateTime());
					relationEntry.accumulate("fdSearchScope",sysRelationEntryForm.getFdSearchScope());
					relationEntry.accumulate("fdOtherUrl",sysRelationEntryForm.getOtherUrlNoPattern());
					relationEntry.accumulate("fdIndex",sysRelationEntryForm.getFdIndex());
					out.println("relationEntrys['"+SysRelationUtil.replaceJsonQuotes(sysRelationEntryForm.getFdId())+"'] = "+ relationEntry.toString()+";");
					List conditionList = sysRelationEntryForm.getSysRelationConditionFormList();
					if(!conditionList.isEmpty()){
						for(int m=0; m<conditionList.size();m++){
							JSONObject conditionEntry = new JSONObject();
							SysRelationConditionForm sysRelationConditionForm = (SysRelationConditionForm)conditionList.get(m);
							conditionEntry.accumulate("fdId",sysRelationConditionForm.getFdId());
							conditionEntry.accumulate("fdItemName",sysRelationConditionForm.getFdItemName());
							conditionEntry.accumulate("fdParameter1",sysRelationConditionForm.getFdParameter1());
							conditionEntry.accumulate("fdParameter2",sysRelationConditionForm.getFdParameter2());
							conditionEntry.accumulate("fdParameter3",sysRelationConditionForm.getFdParameter3());
							conditionEntry.accumulate("fdBlurSearch",sysRelationConditionForm.getFdBlurSearch());
							conditionEntry.accumulate("fdVarName",sysRelationConditionForm.getFdVarName());
							out.println("relationConditions['"+SysRelationUtil.replaceJsonQuotes(sysRelationConditionForm.getFdItemName())+"'] = " +conditionEntry.toString()+";");
						}
						out.println("relationEntrys['" + SysRelationUtil.replaceJsonQuotes(sysRelationEntryForm.getFdId())+"'].relationConditions = relationConditions;");
					}
					
					List staticInfoList = sysRelationEntryForm .getSysRelationStaticNewFormList();
					if (!staticInfoList.isEmpty()) {
						JSONObject staticEntry = new JSONObject();
						for (int i = 0; i < staticInfoList.size(); i++) {
							JSONObject staticMsg = new JSONObject();
							SysRelationStaticNewForm sysRelationStaticNewForm = (SysRelationStaticNewForm) staticInfoList.get(i);
							staticMsg.accumulate("fdId",
									sysRelationStaticNewForm.getFdId());
							staticMsg.accumulate("fdSourceId",
									sysRelationStaticNewForm.getFdSourceId());
							staticMsg.accumulate("fdSourceModelName",
									sysRelationStaticNewForm.getFdSourceModelName());
							staticMsg.accumulate("fdSourceDocSubject",
									sysRelationStaticNewForm.getFdSourceDocSubject());
							staticMsg.accumulate("fdRelatedId",
									sysRelationStaticNewForm.getFdRelatedId());
							staticMsg.accumulate("fdRelatedModelName",
									sysRelationStaticNewForm.getFdRelatedModelName());
							staticMsg.accumulate("fdRelatedUrl",
									sysRelationStaticNewForm.getFdRelatedUrl());
							staticMsg.accumulate("fdRelatedName",
									sysRelationStaticNewForm.getFdRelatedName());
							staticMsg.accumulate("fdRelatedType",
									sysRelationStaticNewForm.getFdRelatedType());
							staticMsg.accumulate("fdEntryId",
									sysRelationStaticNewForm.getFdEntryId());
							staticEntry.accumulate(i+"",staticMsg);
						}
							out
							.println("staticInfos['"
									+ sysRelationEntryForm.getFdId()
									+ "'] = "
									+ staticEntry.toString() + ";");
						
							out
								.println("relationEntrys['"
										+ SysRelationUtil
												.replaceJsonQuotes(sysRelationEntryForm
														.getFdId())
										+ "'].staticInfos = staticInfos;");
					}
				%>
			</c:forEach>
			var rela_params = {
					'varName':'rela_opt',
					'rela.mainform.name':'${param.formName}',
					'rela.button.ok':'<bean:message key="button.ok"/>',
					'rela.button.cancel':'<bean:message key="button.cancel"/>',
					'rela.setting.title':'<bean:message key="title.sysRelationMain.setting" bundle="sys-relation"/>'
			};
		</script>
		<script type="text/javascript">
			Com_IncludeFile("rela.js","${KMSS_Parameter_ContextPath}sys/relation/import/resource/","js",true);
		</script>
		<script type="text/javascript">
			new RelationOpt('${currModelName}','','',rela_params);
		</script>
		<ui:button parentId="toolbar" 
			text="${lfn:message('sys-relation:title.sysRelationMain.setting')}" order="4" id="rela_config_btn">
			</ui:button>
		<div style="display: none;">
			<input type="hidden" name="sysRelationMainForm.fdId" value="<c:out value='${sysRelationMainForm.fdId}' />" />
			<input type="hidden" name="sysRelationMainForm.fdKey" value="<c:out value='${param.fdKey}' />"/>
			<input type="hidden" name="sysRelationMainForm.fdModelName" value="<c:out value='${currModelName}' />"/>
			<input type="hidden" name="sysRelationMainForm.fdModelId" value="<c:out value='${currModelId}' />"/>
			<input type="hidden" name="sysRelationMainForm.fdParameter" value="<c:out value='${sysRelationMainForm.fdParameter}' />"/>
		</div>
		<ui:event event="layoutDone">
			if(window.relationConditions!=null && relationConditions!={}){	
				window['rela_opt'].refreshConfig();
			}else{
				var _self = this;
				/*由于draw中layout处理为异步，此处用定时器做组件隐藏处理*/
				var interNum = window.setInterval(function(){
					if(_self.isDrawed){
						_self.element.hide();
						window.clearInterval(interNum);
					}
				},50);
			}
		</ui:event>
	</c:if>
</ui:accordionpanel>
</c:if>
