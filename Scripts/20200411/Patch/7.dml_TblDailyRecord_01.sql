 -- Declare an  cursor based      
    DECLARE @bkEmpId bigint
    DECLARE c_dailyRec CURSOR FOR   
    select DISTINCT  t.BackupEmpID 
	from TblDailyRecord_temp t  
	--where t.BackupEmpID='7743'
  
    OPEN c_dailyRec  
    FETCH NEXT FROM c_dailyRec INTO @bkEmpId  
  
    IF @@FETCH_STATUS <> 0   
        PRINT '         <<None>>'       
  
    WHILE @@FETCH_STATUS = 0  
    BEGIN  
  
        update TblDailyRecord 
        set EmployeeID= @bkEmpId   
        where BackupEmpID=@bkEmpId    
        FETCH NEXT FROM c_dailyRec INTO @bkEmpId  
    END  
  
    CLOSE c_dailyRec  
    DEALLOCATE c_dailyRec