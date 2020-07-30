 -- Declare an  cursor based      
    DECLARE @y int,@m int,@rn varchar(6)
    DECLARE c_dailyRec CURSOR FOR   
    select  vp.vpYear
		,vp.vpMonth
		,cast(vp.vpYear as varchar(4))+ replicate('0', 2 - len(vp.vpMonth)) + cast (vp.vpMonth as varchar) as Run_Num 
	from TblValidatePayroll vp;

  
    OPEN c_dailyRec  
    FETCH NEXT FROM c_dailyRec INTO @y,@m,@rn  
  
    IF @@FETCH_STATUS <> 0   
        PRINT '         <<None>>'       
  
    WHILE @@FETCH_STATUS = 0  
    BEGIN  
  
        update TblValidatePayroll 
        set run_num= @rn   
        where vpYear=@y and vpMonth=@m    
        FETCH NEXT FROM c_dailyRec INTO @y,@m,@rn  
    END  
  
    CLOSE c_dailyRec  
    DEALLOCATE c_dailyRec