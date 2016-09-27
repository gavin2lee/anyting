package com.gl.anything.vo;

public class DepartmentVo extends BaseVo {
	private String name;
	private String code;
	private DepartmentVo parentDept;
	private UserVo header;
	private UserVo viceHeader;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public DepartmentVo getParentDept() {
		return parentDept;
	}

	public void setParentDept(DepartmentVo parentDept) {
		this.parentDept = parentDept;
	}

	public UserVo getHeader() {
		return header;
	}

	public void setHeader(UserVo header) {
		this.header = header;
	}

	public UserVo getViceHeader() {
		return viceHeader;
	}

	public void setViceHeader(UserVo viceHeader) {
		this.viceHeader = viceHeader;
	}

}
