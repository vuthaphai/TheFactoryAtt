alter table TblControldailydataSettings
 add  LeaveHours float,
		LeaveTypeID int,
		WorkDayTypeID varchar(2),--( --ND=NormalWorking, HD=Holiday,SD=Sunday
		WorkingHours	float,
		wdtype	int,
		leavetype int,
		RowNo int
;

update TblControldailydataSettings
set  leaveHours=1,
	 LeaveTypeId=1,
	 WorkDayTypeId=1,
	 WorkingHours=1,
	 wdtype=1,
	 leavetype=1,
	 RowNo=1