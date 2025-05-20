/*
GRANT CONTROL ON SCHEMA::Sales TO sqluser01;


     EXECUTE AS USER = 'sqluser01';
     SELECT * FROM fn_my_permissions ('Sales', 'SCHEMA');
     REVERT;
     GO


     REVOKE CONTROL ON SCHEMA::Sales TO sqluser01;
     DENY EXECUTE ON SCHEMA::Sales TO sqluser01;




     GRANT CONTROL ON SCHEMA::Sales TO sqluser01;


     EXECUTE AS USER = 'sqluser01';
     -- SELECT * FROM fn_my_permissions ('Sales', 'SCHEMA');
     
     select * from [Sales].[CreditCard]
     REVERT;
     GO


     REVOKE UPDATE ON SCHEMA::Sales TO sqluser01;
     DENY EXECUTE ON SCHEMA::Sales TO sqluser01;
     


    
     GRANT SELECT ON SCHEMA::Sales TO sqluser01;


     EXECUTE AS USER = 'sqluser01';
      SELECT * FROM fn_my_permissions ('Sales', 'SCHEMA');
     
     -- select * from [Sales].[CreditCard]
     REVERT;
     GO


     REVOKE UPDATE ON SCHEMA::Sales TO sqluser01;
     DENY SELECT ON SCHEMA::Sales TO sqluser01;
     


	 PLease note that I did not run these codes as I did not create a user on my laptop, but I followed the video and took notes

	 /*
