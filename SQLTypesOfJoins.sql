select * from [dbo].[Student]

select * from [dbo].[Course]

select * from student s
inner join course c
on s.RollNo=c.RollNO

select s.rollno,s.studentname,c.courseid from student s
inner join course c
on s.RollNo=c.RollNO

select s.rollno,s.studentname,c.courseid from student s
join course c
on s.RollNo=c.RollNO

select s.rollno,s.studentname,c.courseid from student s
left join course c
on s.RollNo=c.RollNO

select s.rollno,s.studentname,c.courseid from student s
right join course c
on s.RollNo=c.RollNO

select c.rollno,s.studentname,c.courseid from student s
full join course c
on s.RollNo=c.RollNO