# Overview

This example repository accompanies a demo video for Red Gate SQL SQL Source Control Migrations v2.  It's showing how to work through a scenario where two developers have created migration scripts in different git branches and you need to merge them together.

- You are playing the part of a developer who will add a migration script to add a NOT NULL constraint to an existing column 
- You then 'find' another developer has renamed the table you are working on in another branch

# Setup

If you want to run this scenario yourself you can follow the instructions below to reach a set-up exactly the same as the start of the video.

- Repository setup
	- Clone this repository to your local machine
	- Fetch and create a tracking copy of the 'refactor/rename-people-table' branch
	- Make sure your working copy is a checked out version of the 'master' branch

```
$ git clone git@github.com:jonathanhickford/migrations-v2-demo.git
$ git checkout refactor/rename-people-table
$ git checkout master
```

- Database setup
	- Create three databases
		- migrations-demo-dev
		- migrations-demo-uat
		- migrations-demo-cli
	- Run the three scripts in the setup_scripts folder to populate these with data (including NULL values)

- SQL Source Control setup
	- Link the 'migrations-demo-dev' database to the db_source_control folder with SQL Source Control

# Demo Video Instructions

You can watch the demo video on YouTube

## Check everything is setup
- Your working copy is on the 'master' branch of this repository
- You have three databases which are all identical from a schema point of view
	- They contain one table called 'People' with an 'id' and a 'name' column.  
	- The 'name' column  currently accepts NULLs
	- There is data in all three tables including at least one NULL value for 'name'
- Your 'migrations-demo-dev' database is linked to SQL Source Control, there are no changes on the Commit or  the Get Latest tab

```
$ git branch
* master
  refactor/rename-people-table
```

## Create your branch and make your migration
	
- Create a new branch and check it out, call this branch 'feature/not-null'
```
$ git branch feature/not-null
$ git checkout feature/not-null
$ git branch
* feature/not-null
  master
  refactor/rename-people-table
```
- Open SSMS and select your 'migrations-demo-dev' database
- Open the SQL Source Control tab
- Create a new migration script, name it 'Adding a NOT NULL constraint to the People table'
- Paste in the contents of the 'sample_not_null_column_migration.sql'
	- This script contains a guard clause, checking that this table and column are present in the database
	- There is a line to set any NULL names to 'unknown name'
	- There is a line to alter the name column to forbid NULL values
- Run the script on your database by pressing F5
- Save the migration script
- Go to the commit tab and save the changes (migrations history, Red Gate schema)
- Open your git client and add and commit these changes
```
$ git add .
$ git commit . -m 'Added migration script to add NOT NULL constraint to the name column'
```

## Merge
