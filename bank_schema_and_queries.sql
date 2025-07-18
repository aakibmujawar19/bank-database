-- TABLE CREATION
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(200),
    ADDRESS VARCHAR2(255),
    PHONE NUMBER(20) UNIQUE,
    EMAIL VARCHAR2(200) UNIQUE
);

CREATE TABLE ACCOUNTS (
    ACCOUNT_ID NUMBER PRIMARY KEY,
    CUSTOMER_ID NUMBER NOT NULL,
    ACCOUNT_TYPE VARCHAR2(20) CHECK (ACCOUNT_TYPE IN ('SAVINGS','CURRENT')),
    BALANCE NUMBER(12,2) DEFAULT 0,
    STATUS VARCHAR2(20) CHECK (STATUS IN ('ACTIVE','INACTIVE')),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);

CREATE TABLE TRANSACTIONS (
    TRANSACTION_ID NUMBER PRIMARY KEY,
    ACCOUNT_ID NUMBER NOT NULL,
    TRANSACTION_TYPE VARCHAR2(20) CHECK (TRANSACTION_TYPE IN ('DEPOSIT','WITHDRAW')),
    AMOUNT NUMBER(12,2) NOT NULL,
    TRANSACTION_DATE DATE DEFAULT SYSDATE,
    FOREIGN KEY (ACCOUNT_ID) REFERENCES ACCOUNTS(ACCOUNT_ID)
);

CREATE TABLE USERS (
    USER_ID NUMBER PRIMARY KEY,
    USERNAME VARCHAR2(50) UNIQUE,
    PASSWORD VARCHAR2(20) NOT NULL,
    ROLE VARCHAR2(20) CHECK (ROLE IN ('ADMIN','CLERK','MANAGER'))
);

CREATE TABLE LOANS (
    LOAN_ID NUMBER PRIMARY KEY,
    CUSTOMER_ID NUMBER NOT NULL,
    LOAN_TYPE VARCHAR2(30),
    AMOUNT NUMBER(12,2),
    INTEREST_RATE NUMBER(5,2),
    START_DATE DATE,
    END_DATE DATE,
    STATUS VARCHAR2(20) CHECK (STATUS IN ('Active','Closed')),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);

CREATE TABLE LOAN_PAYMENTS (
    PAYMENT_ID NUMBER PRIMARY KEY,
    LOAN_ID NUMBER NOT NULL,
    PAYMENT_DATE DATE DEFAULT SYSDATE,
    AMOUNT_PAID NUMBER(12,2),
    FOREIGN KEY (LOAN_ID) REFERENCES LOANS(LOAN_ID)
);

CREATE TABLE BRANCHES (
    BRANCH_ID NUMBER PRIMARY KEY,
    BRANCH_NAME VARCHAR2(100),
    ADDRESS VARCHAR2(255),
    PHONE VARCHAR2(15)
);

CREATE TABLE EMPLOYEE (
    EMPLOYEE_ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    DESIGNATION VARCHAR2(50),
    SALARY NUMBER(10,2),
    BRANCH_ID NUMBER,
    FOREIGN KEY (BRANCH_ID) REFERENCES BRANCHES(BRANCH_ID)
);

CREATE TABLE CARDS (
    CARD_ID NUMBER PRIMARY KEY,
    ACCOUNT_ID NUMBER NOT NULL,
    CARD_NUMBER VARCHAR2(20) UNIQUE,
    CARD_TYPE VARCHAR2(20) CHECK (CARD_TYPE IN ('Debit','Credit')),
    ISSUE_DATE DATE,
    EXPIRY_DATE DATE,
    STATUS VARCHAR2(20) CHECK (STATUS IN ('Active','Blocked')),
    FOREIGN KEY (ACCOUNT_ID) REFERENCES ACCOUNTS(ACCOUNT_ID)
);

-- DATA INSERT
INSERT INTO CUSTOMERS VALUES (1, 'Sneha Deshmukh', '210 Shivaji Nagar, Nagpur', 918866554433, 'sneha.deshmukh@example.com');
INSERT INTO CUSTOMERS VALUES (2, 'Irfan Shaikh', '66 Hussain Ganj, Mumbai', 919911223344, 'irfan.shaikh@example.com');
INSERT INTO CUSTOMERS VALUES (3, 'Neha Bhat', '65 Residency Road, Bhopal', 919812344556, 'neha.bhat@example.com');
INSERT INTO CUSTOMERS VALUES (4, 'Bilal Hashmi', '101 Hazratganj, Lucknow', 919844556677, 'bilal.hashmi@example.com');
INSERT INTO CUSTOMERS VALUES (5, 'Preeti Kulkarni', '15 FC Road, Pune', 919900223344, 'preeti.kulkarni@example.com');
INSERT INTO CUSTOMERS VALUES (6, 'Zoya Sheikh', '109 Park Lane, Bhopal', 918888888888, 'zoya.sheikh@example.com');
INSERT INTO CUSTOMERS VALUES (7, 'Mary Fernandes', '33 Church Street, Kochi', 919855667788, 'mary.fernandes@example.com');
INSERT INTO CUSTOMERS VALUES (8, 'Khalid Usmani', '23 Lal Chowk, Srinagar', 918822334455, 'khalid.usmani@example.com');
INSERT INTO CUSTOMERS VALUES (9, 'Rajat Agarwal', '35 Park Street, Kolkata', 918877665544, 'rajat.agarwal@example.com');
INSERT INTO CUSTOMERS VALUES (10, 'Amanpreet Singh', '17 Rajpura Road, Amritsar', 918800334455, 'amanpreet.singh@example.com');
INSERT INTO CUSTOMERS VALUES (11, 'Adnan Farooqui', '55 Lal Bagh, Indore', 919988776655, 'adnan.farooqui@example.com');
INSERT INTO CUSTOMERS VALUES (12, 'Rajesh Sharma', '12 Nehru Nagar, Delhi', 919812300001, 'rajesh.sharma@example.com');
INSERT INTO CUSTOMERS VALUES (13, 'Parveen Alam', '89 Garden Road, Patna', 918899445566, 'parveen.alam@example.com');
INSERT INTO CUSTOMERS VALUES (16, 'Mahira Khan', '4 Charbagh, Lucknow', 919877223311, 'mahira.khan@example.com');
INSERT INTO CUSTOMERS VALUES (18, 'Nazia Sultana', '24 Moti Mahal Rd, Lucknow', 917700556677, 'nazia.sultana@example.com');
INSERT INTO CUSTOMERS VALUES (21, 'Vijay Shetty', '12 MG Road, Mangalore', 919812300002, 'vijay.shetty@example.com');
INSERT INTO CUSTOMERS VALUES (22, 'Suresh Patel', '201 Gandhi Marg, Ahmedabad', 917733221100, 'suresh.patel@example.com');
INSERT INTO CUSTOMERS VALUES (23, 'Simran Kaur', '22 Sector 15, Chandigarh', 918899998877, 'simran.kaur@example.com');
INSERT INTO CUSTOMERS VALUES (24, 'Salman Baig', '19 Red Hills, Hyderabad', 919811112222, 'salman.baig@example.com');
INSERT INTO CUSTOMERS VALUES (28, 'Joseph D’Souza', '9 Beach Road, Goa', 918800112233, 'joseph.dsouza@example.com');
INSERT INTO CUSTOMERS VALUES (29, 'Lata Iyer', '20 Brigade Road, Bengaluru', 919811443322, 'lata.iyer@example.com');
INSERT INTO CUSTOMERS VALUES (30, 'Ayesha Khan', '12 MG Road, Lucknow', 919812345678, 'ayesha.khan@example.com');
INSERT INTO CUSTOMERS VALUES (31, 'Sana Parveen', '7 Golconda Fort Rd, Hyderabad', 919977665544, 'sana.parveen@example.com');
INSERT INTO CUSTOMERS VALUES (33, 'Gitanjali Joshi', '99 Lakshmi Road, Pune', 919811334455, 'gitanjali.joshi@example.com');
INSERT INTO CUSTOMERS VALUES (34, 'Rafiq Qadri', '82 Chowk Bazaar, Ahmedabad', 919988112233, 'rafiq.qadri@example.com');
INSERT INTO CUSTOMERS VALUES (37, 'Manpreet Kaur', '101 Sector 35, Chandigarh', 919988123456, 'manpreet.kaur@example.com');
INSERT INTO CUSTOMERS VALUES (38, 'Zahra Mirza', '5 Dal Lake View, Srinagar', 919922334455, 'zahra.mirza@example.com');
INSERT INTO CUSTOMERS VALUES (40, 'Arvind Pillai', '45 Anna Salai, Chennai', 919811998877, 'arvind.pillai@example.com');
INSERT INTO CUSTOMERS VALUES (42, 'Imran Ansari', '45 Civil Lines, Jaipur', 919876543210, 'imran.ansari@example.com');
INSERT INTO CUSTOMERS VALUES (43, 'Kavita Verma', '42 Sector 14, Noida', 919811223344, 'kavita.verma@example.com');
INSERT INTO CUSTOMERS VALUES (47, 'Sanjay Menon', '6 MG Road, Ernakulam', 918812334455, 'sanjay.menon@example.com');
INSERT INTO CUSTOMERS VALUES (49, 'Farida Fernandes', '55 Chapel Road, Mumbai', 919988445566, 'farida.fernandes@example.com');

INSERT INTO ACCOUNTS VALUES (101, 1, 'SAVINGS', 15000, 'ACTIVE');
INSERT INTO ACCOUNTS VALUES (102, 2, 'CURRENT', 25000, 'ACTIVE');
INSERT INTO ACCOUNTS VALUES (103, 3, 'SAVINGS', 18000, 'ACTIVE');
INSERT INTO ACCOUNTS VALUES (104, 4, 'CURRENT', 32000, 'INACTIVE');
INSERT INTO ACCOUNTS VALUES (105, 5, 'SAVINGS', 5000, 'ACTIVE');

INSERT INTO TRANSACTIONS VALUES (1001, 101, 'DEPOSIT', 5000, SYSDATE);
INSERT INTO TRANSACTIONS VALUES (1002, 101, 'WITHDRAW', 1000, SYSDATE);
INSERT INTO TRANSACTIONS VALUES (1003, 102, 'DEPOSIT', 10000, SYSDATE);
INSERT INTO TRANSACTIONS VALUES (1004, 103, 'WITHDRAW', 2000, SYSDATE);
INSERT INTO TRANSACTIONS VALUES (1005, 105, 'DEPOSIT', 1500, SYSDATE);

