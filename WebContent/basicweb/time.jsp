<meta charset="UTF-8">
<link rel="stylesheet" href="../css/laydate.css" />
<script src="../js/jquery-1.8.3.min.js"></script>
<script src="../js/laydate.js"></script>
<style type="text/css">
.select-date{font-family:"sta cartman"}
</style>
<div class="laydate-box">
	<input type="text" name="birth" id="laydateInput" placeholder=<%=bi%>>
	<img src="../images/calendar.png" alt="" class="icon data-icon"/>
	<div class="select-date">
		<div class="select-date-header">
			<ul class="heade-ul">
				<li class="header-item header-item-one">
					<select name="" id="yearList"></select>
				</li>
				<li class="header-item header-item-two" onselectstart="return false">
					<select name="" id="monthList"></select>
				</li>
				<li class="header-item header-item-three" onselectstart="return false" >
					<span class="reback">today</span>
				</li>
			</ul>
		</div>
		<div class="select-date-body">
			<ul class="week-list">
				<li>Sun</li><li>Mon</li><li>Tues</li><li>Wed</li><li>Thurs</li><li>Fri</li><li>Sat</li>
			</ul>
			<ul class="day-tabel"></ul>
		</div>
	</div>
</div>

<script>
	function getSelectDate(result){
		//这里获取选择的日期
		console.log(result);
	}
</script>
