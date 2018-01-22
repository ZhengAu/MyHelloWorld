<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 添加弹出层 -->
<div class="popupLayerOfAdd">
	<div class="layer">
		<div class="layer-top">
			<span>添加联系人</span>
			<button type="button" name="button" class="cancel">关闭</button>
		</div>
		<div class="addForm">
			<form action="${pageContext.request.contextPath}/person?method=addPerson" method="post" id="addForm">
				<div class="row">
					<div class="col-sm-3 text-right">
						<i class="redStar">*</i> 姓名：
					</div>
					<div class="col-sm-8">
						<input type="text" name="username" value="">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3 text-right">
						<i class="redStar">*</i> 出生日期：
					</div>
					<div class="col-sm-8">
						<input type="date" name="birthDate" value="1990-01-01">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3 text-right">
						<i class="redStar">*</i> 性别：
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
						<i class="redStar">*</i> 联系电话：
					</div>
					<div class="col-sm-8">
						<input type="text" name="telephone" value="">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3 text-right">
						<i class="redStar">*</i> 邮箱：
					</div>
					<div class="col-sm-9">
						<input type="email" name="email" value="">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3 text-right">
						<i class="redStar">*</i> QQ：
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
						<button type="submit" name="button" class="btn btn-primary">确定</button>
					</div>
					<div class="col-sm-offset-1 col-sm-1">
						<button type="reset" name="button" class="btn btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
