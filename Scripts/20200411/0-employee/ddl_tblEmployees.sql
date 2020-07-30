ALTER TABLE TblEmployee
   ALTER COLUMN SSN nvarchar(50);
      
ALTER TABLE TblEmployee
add  WorkBook nvarchar(1),
	 HealthCheckUp nvarchar(1),
	 recstatus varchar(1)
		