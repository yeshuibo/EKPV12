package com.landray.kmss.tib.sys.sap.connector.model;

import com.landray.kmss.common.convertor.ModelToFormPropertyMap;
import com.landray.kmss.common.model.BaseModel;
import com.landray.kmss.tib.sys.sap.connector.forms.TibSysSapRfcImportForm;

/**
 * 传入参数配置
 * 
 * @author 573
 * @version 1.0 2011-10-09
 */
public class TibSysSapRfcImport extends BaseModel {

	/**
	 * 排序号
	 */
	protected Integer fdOrder;

	/**
	 * @return 排序号
	 */
	public Integer getFdOrder() {
		return fdOrder;
	}

	/**
	 * @param fdOrder
	 *            排序号
	 */
	public void setFdOrder(Integer fdOrder) {
		this.fdOrder = fdOrder;
	}

	/**
	 * 启用
	 */
	protected Boolean fdParameterUse;

	/**
	 * @return 启用
	 */
	public Boolean getFdParameterUse() {
		return fdParameterUse;
	}

	/**
	 * @param fdParameterUse
	 *            启用
	 */
	public void setFdParameterUse(Boolean fdParameterUse) {
		this.fdParameterUse = fdParameterUse;
	}

	/**
	 * 参数名称
	 */
	protected String fdParameterName;

	/**
	 * @return 参数名称
	 */
	public String getFdParameterName() {
		return fdParameterName;
	}

	/**
	 * @param fdParameterName
	 *            参数名称
	 */
	public void setFdParameterName(String fdParameterName) {
		this.fdParameterName = fdParameterName;
	}

	/**
	 * 对象类型
	 */
	protected String fdParameterType;

	/**
	 * @return 对象类型
	 */
	public String getFdParameterType() {
		return fdParameterType;
	}

	/**
	 * @param fdParameterType
	 *            对象类型
	 */
	public void setFdParameterType(String fdParameterType) {
		this.fdParameterType = fdParameterType;
	}

	/**
	 * 最大长度
	 */
	protected Integer fdParameterLength;

	/**
	 * @return 最大长度
	 */
	public Integer getFdParameterLength() {
		return fdParameterLength;
	}

	/**
	 * @param fdParameterLength
	 *            最大长度
	 */
	public void setFdParameterLength(Integer fdParameterLength) {
		this.fdParameterLength = fdParameterLength;
	}

	/**
	 * 数据类型
	 */
	protected String fdParameterTypeName;

	/**
	 * @return 数据类型
	 */
	public String getFdParameterTypeName() {
		return fdParameterTypeName;
	}

	/**
	 * @param fdParameterTypeName
	 *            数据类型
	 */
	public void setFdParameterTypeName(String fdParameterTypeName) {
		this.fdParameterTypeName = fdParameterTypeName;
	}

	/**
	 * 必填
	 */
	protected Boolean fdParameterRequired;

	/**
	 * @return 必填
	 */
	public Boolean getFdParameterRequired() {
		return fdParameterRequired;
	}

	/**
	 * @param fdParameterRequired
	 *            必填
	 */
	public void setFdParameterRequired(Boolean fdParameterRequired) {
		this.fdParameterRequired = fdParameterRequired;
	}

	/**
	 * 显示顺序
	 */
	protected String fdDisp;
	
	public String getFdDisp() {
		return fdDisp;
	}

	public void setFdDisp(String fdDisp) {
		this.fdDisp = fdDisp;
	}

	/**
	 * 说明
	 */
	protected String fdParameterMark;

	/**
	 * @return 说明
	 */
	public String getFdParameterMark() {
		return fdParameterMark;
	}

	/**
	 * @param fdParameterMark
	 *            说明
	 */
	public void setFdParameterMark(String fdParameterMark) {
		this.fdParameterMark = fdParameterMark;
	}

	/**
	 * 层级ID
	 */
	protected String fdHierarchyId;

	/**
	 * @return 层级ID
	 */
	public String getFdHierarchyId() {
		return fdHierarchyId;
	}

	/**
	 * @param fdHierarchyId
	 *            层级ID
	 */
	public void setFdHierarchyId(String fdHierarchyId) {
		this.fdHierarchyId = fdHierarchyId;
	}

	/**
	 * 所属函数
	 */
	protected TibSysSapRfcSetting fdFunction;

	/**
	 * @return 所属函数
	 */
	public TibSysSapRfcSetting getFdFunction() {
		return fdFunction;
	}

	/**
	 * @param fdFunction
	 *            所属函数
	 */
	public void setFdFunction(TibSysSapRfcSetting fdFunction) {
		this.fdFunction = fdFunction;
	}

	/**
	 * 父ID
	 */
	protected TibSysSapRfcImport fdParent;

	/**
	 * @return 父ID
	 */
	public TibSysSapRfcImport getFdParent() {
		return fdParent;
	}

	/**
	 * @param fdParent
	 *            父ID
	 */
	public void setFdParent(TibSysSapRfcImport fdParent) {
		this.fdParent = fdParent;
	}

	protected String fdRfcParamXml = null;

	public String getFdRfcParamXml() {
		return (String) readLazyField("fdRfcParamXml", fdRfcParamXml);
	}

	public void setFdRfcParamXml(String fdRfcParamXml) {
		this.fdRfcParamXml = (String) writeLazyField("fdRfcParamXml",
				this.fdRfcParamXml, fdRfcParamXml);
	}

	public Class getFormClass() {
		return TibSysSapRfcImportForm.class;
	}

	private static ModelToFormPropertyMap toFormPropertyMap;

	public ModelToFormPropertyMap getToFormPropertyMap() {
		if (toFormPropertyMap == null) {
			toFormPropertyMap = new ModelToFormPropertyMap();
			toFormPropertyMap.putAll(super.getToFormPropertyMap());
			toFormPropertyMap.put("fdFunction.fdId", "fdFunctionId");
			toFormPropertyMap.put("fdFunction.fdId", "fdFunctionName");
			toFormPropertyMap.put("fdParent.fdId", "fdParentId");
			toFormPropertyMap.put("fdParent.fdId", "fdParentName");
		}
		return toFormPropertyMap;
	}
}
