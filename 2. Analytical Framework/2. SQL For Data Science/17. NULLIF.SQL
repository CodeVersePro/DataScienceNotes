

CREATE TABLE student_branch (

    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) not NULL,
    student_branch VARCHAR(100) not null

)

INSERT INTO student_branch (student_name,student_branch)
values
('X','A'),
('Y','A'),
('Z','B')

select * from student_branch

/* how we can find ration woth help of case */

SELECT (

    SUM(

        CASE
            WHEN (student_branch = 'A') THEN 1
            ELSE 0
        END

    ) /

    SUM (

        CASE
            WHEN (student_branch = 'B') THEN 1
            ELSE 0
        END
    )

) from student_branch

/* but the challenge in above like sysntex is division by zero error */
/* we have to use NULLIF statemenrt to solve this */

/* now lest delete student with branch b */

DELETE from student_branch
WHERE student_branch = 'B'

select * from student_branch

/* now calculate ration */

SELECT (

    SUM(

        CASE
            WHEN (student_branch = 'A') THEN 1
            ELSE 0
        END
    ) /

    SUM(

        CASE
            WHEN (student_branch = 'B') THEN 1
            ELSE 0
        END
    )
) as BRANCH_RATION
from student_branch

/* the above statement thrown 0 division error, we can solve it using nullif */


SELECT (

    SUM (

        CASE
            WHEN (student_branch = 'A') THEN 1
            else 0 
        END
        
    ) /

   nullif( SUM (

        CASE
            WHEN (student_branch = 'B') then 1
            else 0
        END
    ),0 )
) as ration
from student_branch