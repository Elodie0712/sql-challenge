  CREATE TABLE departments (
	dept_no VARCHAR (4) Not null PRIMARY KEY, 
	dept_name VARCHAR Not Null,
	 CONSTRAINT uc_departments_dept_name UNIQUE (dept_name)
);
 
 CREATE TABLE employees (
	emp_no INTEGER Primary Key Not null,
    emp_title_id INTEGER  Not null,
    birth_date DATE Not null,
    first_name VARCHAR (45) Not null, 
    last_name VARCHAR (45) Not null,
    sex VARCHAR (1) Not null,
    hire_date DATE Not Null	
);

 CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
 
 CREATE TABLE dept_manager  (
	dept_no VARCHAR (6) Not null,
    emp_no INTEGER Not null,
	foreign key (emp_no) references employees (emp_no)
);

CREATE TABLE salaries (
	emp_no Integer Not null, 
	salary  INTEGER Not Null,
	foreign key (emp_no) references employees (emp_no)
);
 
 CREATE TABLE titles (
	title_id VARCHAR (5) Not null PRIMARY KEY, 
	title VARCHAR (30) Not null,
    CONSTRAINT uc_titles_title UNIQUE (title)
);

 
 
 
 

  


-