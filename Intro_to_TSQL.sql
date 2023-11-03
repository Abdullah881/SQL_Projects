-- Intro TO using Transact TSQL 

Print 'Hello world!'

Declare @myVariable INT
SET @myVariable = 6
print @myVariable

Declare @var1 INT, @var2 INT
SET @var1 = 3
SET @var2 = 5

Print 'I am using'  + 'TQL and MS SQL Server'

Print 'I have' + CONVERT(VARCHAR(50),@var1) + ' dollars...'

Print 'Variable 1 = ' + CONVERT(VARCHAR(50),@var1) + CHAR(13) + 'Variable 2 = ' + CONVERT(VARCHAR(5),@var2)


Print 'Variable 1 = ' + CONVERT(VARCHAR(50),@var1) + CHAR(13) + 'Variable 2 = ' + CONVERT(VARCHAR(5),@var2) + CHAR(13) + 'Total = '   
PRINT (@var1 + @var2)

if @var1 <= 3
    Begin 
        Print 'Variable 1 <=' + CONVERT(VARCHAR(5),@var1) +CHAR(13)
    End
Else
    Begin
        Print'Variable 1 is not ' + CONVERT(VARCHAR(5),@var1) + CHAR(13)
    End

if @var1 != 3
    Begin 
        Print 'Variable 1 is not ' + CONVERT(VARCHAR(5),@var1) +CHAR(13)
    End
Else
    Begin
        Print'Variable 1 is not <' + CONVERT(VARCHAR(5),@var1) + CHAR(13)
    End



DECLARE @var3 INT, @var4 INT;
SET @var3 = 3;
SET @var4 = 5;

IF @var3 < 2
    BEGIN
        PRINT '@var3 < 2';
    END
ELSE IF @var3 > 1 AND @var3 < 3
    BEGIN
        PRINT '@var3 > 1 AND @var3 < 3';
    END
ELSE IF @var3 = 4 OR @var3 < 6
    BEGIN
        PRINT '@var3 = 4 OR @var3 < 6';
    END
ELSE
    BEGIN
        PRINT '@var3 does not qualify!';
    END;

