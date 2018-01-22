$(function(){
	/* 点击添加，弹出添加层 */
	$(".addPersonBtn").click(function(){
		$(".error").text("");
		//把框中内容清空
		$("#addForm input[name=username][name=telephone][name=email][name=qq][name=remarks]").val("");
		$(".popupLayerOfAdd").show();
	});
	/* 点击编辑，弹出编辑层 
	 为ajax动态添加的数据，添加事件， 弹出编辑层 
	$(".tbody").on("click",".editPerson",function(){
		$(".popupLayerOfEdit").show();
	});*/
	/* 隐藏搜索内容框 */
	/* function HiddenTheShowResult(){
		$("#showResult").css("display","none");
	} */
	/* 点击，把内容显示在搜索框中 */
	/* function clickFn(obj){
		$("#searchInput").val($(obj).html());
		$("#showResult").css("display","none");
	} */
			
	/* 点击取消，隐藏添加弹出层或修改弹出层 */
	$(".cancel").click(function(){
		$(".popupLayerOfAdd").hide();
		$(".popupLayerOfEdit").hide();
	});
	
});