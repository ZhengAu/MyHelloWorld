<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 编辑弹出层 -->
<div class="popupLayerOfEdit">
	<div class="layer">
		<div class="layer-top">
			<span>编辑联系人</span>
			<button type="button" name="button" class="cancel">关闭</button>
		</div>
		<div class="editForm">
			<form action="${pageContext.request.contextPath }/person?method=editPersonById" id="editForm" method="post">
				<input type="hidden" name="id" value="">
				<div class="row">
					<div class="col-sm-3 text-right">
						姓名：
					</div>
					<div class="col-sm-8">
						<input type="text" name="username" value="">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3 text-right">
						出生日期：
					</div>
					<div class="col-sm-8">
						<input type="date" name="birthDate" value="1990-01-01">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3 text-right">
						性别：
					</div>
					<div class="col-sm-4">
						<input type="radio" name="gender" value="男" checked>男
						&nbsp;&nbsp;&nbsp;
						<input type="radio" name="gender" value="女">女
					</div>
					<div class="col-sm-3" style="padding-left:3px;">
						<label id="gender-error" class="error" for="gender"></label>					
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3 text-right">
						联系电话：
					</div>
					<div class="col-sm-8">
						<input type="text" name="telephone" value="">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3 text-right">
						邮箱：
					</div>
					<div class="col-sm-9">
						<input type="email" name="email" value="">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3 text-right">
						QQ：
					</div>
					<div class="col-sm-8">
						<input type="text" name="qq" value="">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3 text-right">
						备注：
					</div>
					<div class="col-sm-8">
						<textarea rows="4" cols="30" name="remarks"></textarea>
					</div>
				</div>
				<div class="row button-group">
					<div class="col-sm-offset-3 col-sm-1">
						<button type="submit" name="button" class="btn btn-primary">保存</button>
					</div>
					<div class="col-sm-offset-1 col-sm-1">
						<button type="reset" name="button" class="btn btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
