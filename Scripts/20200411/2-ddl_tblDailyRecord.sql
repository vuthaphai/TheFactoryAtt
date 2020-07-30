alter table TblDailyRecord 
	add LeaveHours float,
		LeaveTypeID int,
		WorkDayTypeID varchar(2), --( --ND=NormalWorking, HD=Holiday,SD=Sunday
		WorkingHours	float
		