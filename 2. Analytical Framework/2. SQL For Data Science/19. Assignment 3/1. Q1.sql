
show datestyle
SEt datestyle to german

CREATE TABLE order_tb(

        id INTEGER,
        user_id INTEGER,
        total INTEGER,
        created TIMESTAMP
)


copy order_tb from '/home/codeversepro/Documents/DataScienceNotes/2. Analytical Framework/2. SQL For Data Science/19. Assignment 3/data/Q1.csv' with header

