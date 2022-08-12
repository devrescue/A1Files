# Postgres Integration with Jupyter Notebook

[PostgreSQL](https://www.postgresql.org/), or Postgres, is a free and open source object-relational database management system. It's very similar to traditional relational database management systems, such as SQL Server and MySQL, except that it includes object-oriented programming (OOP) specific concepts in its functionality. Postgres was ranked the number one most popular database among professional developers in the [2022 Stack Overflow Developer Survey](https://survey.stackoverflow.co/2022/#most-popular-technologies-database-prof) .

[Jupyter Notebook](https://jupyter.org/) is a web application that combines live code, data, and visualizations into interactive, dynamic documents called **notebooks**.

What you will learn in this article is how to use Jupyter Notebook to query, manipulate, and seamlessly integrate data and functionality from a PostgreSQL database into a Jupyter Notebook. Your notebook will contain the live code that will extract and manipulate rows from the database for simple Exploratory Data Analysis (EDA).

There are two parts to this process:

- Setting up the environment and loading sample data
- Creating a Python notebook and integrating with PostgreSQL Data

## Set Up Environment and Load Sample Data

The first step is to prepare the environment. You will need to have the following up and running on your workstation before moving forward:

- PostgreSQL 14.3 (or more recent version)
- Jupyter Notebook (or more recent version)

Setting up the environment may take a fair amount of work. In this tutorial, both Jupyter Notebook and Postgres were set up on the same Ubuntu 22.04 LTS (Jammy Jellyfish) VM for simplicity.

You have the option of setting up a completely new Ubuntu 22.04 VM environment if any of the following steps prove problematic on your usual OS.

### PostgreSQL Set Up

You can download and install PostgreSQL for your OS at the [official site](https://www.postgresql.org/download/). Ensure that your PostgreSQL instance is configured to allow incoming connections. Consult the [documentation](https://www.postgresql.org/docs/14/index.html) for your version if you need guidance setting it up.

While the example code can be adapted to work with whatever data you'd like, in this article, the [World Health Statistics 2020 dataset](https://www.kaggle.com/datasets/utkarshxy/who-worldhealth-statistics-2020-complete) will be used. It was originally posted on Kaggle, but a small subset of this data is available at [this Github repo](https://github.com/devrescue/postgres-sampledb) for easy import into PostgreSQL.

Clone the repo to your workstation, and edit the CSV locations in the `import.sql` file to point to the absolute paths. On Ubuntu 22.04, importing the data would then be as simple as navigating to the repo folder and running the following commands in the terminal:

```shell
sudo -i -u postgres psql -c "CREATE DATABASE \"sampledb\";"
sudo -i -u postgres psql -d sampledb < create_tables.sql
sudo -i -u postgres psql -d sampledb < import.sql
```

The first command creates the `sampledb` database. The second command creates the schema and tables and the third copies the rows from the CSV files into the database tables. In all statements, `psql`, the terminal-based front-end for PostgreSQL, is used to execute the commands against the DB. If you're using an existing configuration, ensure that you have a user with full permissions on this database; with a new installation, the default user, `postgres`, will already have these.

### Jupyter Notebook Set Up

Next, ensure that Jupyter Notebook is installed and functional. You can reference the [installation instructions](https://jupyter.org/install) for more details, but in most cases, installation is as simple as running the following command at the terminal:

```shell
pip install notebook
```

Installing Jupyter Notebook will also install the `IPython Kernel`. A **kernel** is what Jupyter Notebook uses to provide programming language support. The `IPython Kernel` provides support for Python programming language notebooks via [IPython](https://ipython.org/), the enhanced interactive Python shell.

With Jupyter Notebook installed, you can then launch it with:

```shell
jupyter notebook
```

When you launch Jupyter Notebook, you will see the following options under `New`. The notebook you will soon create will be a Python 3 notebook:

![New Notebook](https://i.imgur.com/uYkLgP1.png)
![New Notebook](https://i.imgur.com/Z7XGJni.png)

Quit Jupyter Notebook and install the [IPython SQL extension](https://github.com/catherinedevlin/ipython-sql), which will allow you to use SQL statements from within Jupyter Notebook. The command to install is:

```shell
pip install ipython-sql
```

You also need to install the [pgspecial package](https://github.com/dbcli/pgspecial), which allows you to execute meta-commands against the PostgreSQL instance, such as `\l` (list all databases), `\dt` (list all tables), and `\dn` (list all schemas).

```shell
pip install pgspecial
```

Install the [psycopg PostgreSQL database adapter](https://www.psycopg.org/docs/install.html#quick-install) for Python with the following command:

```shell
pip install psycopg2-binary
```

Finally, you'll install a few additional Python libraries that will be used for the upcoming example code:

```shell
pip install pandas
pip install matplotlib
pip install seaborn
```

You should recognize these three well known Python libraries: [pandas](https://pandas.pydata.org/) is used for its versatile and powerful DataFrames, while [Matplotlib](https://matplotlib.org/) and [Seaborn](https://seaborn.pydata.org/) are used to create impactful charts and other visualizations.

## Creating A Python Notebook and Integrating with PostgreSQL Data

With the environment now prepared, launch Jupyter Notebook and create a new Python 3 Notebook. Navigate to the **New** button on the right, click it, and then select **Python 3 (ipykernel)** or similar.

The `ipykernel` is a kernel of our Python notebook. You can think of it as the "brain" of the notebook document.

You will now use the IPython SQL extension installed earlier to connect to the Postgres database and perform some simple, Postgres specific meta-commands, as well as some Data Manipulation Language (DML) and Data Definition Language (DDL) SQL operations:

Load the extension with the following magic command in a new cell in the notebook:

```python
%load_ext sql
```

**Magic commands**, or **magics**, are built-in enhancements to the kernel that add special functionality to the notebook. For Python notebooks, they are preceded by `%` if on one line of code (line magic), or `%%` if on multiple lines of code (cell magic).

Connect to your PostgreSQL database with the following magic command:

```python
%sql postgresql://postgres:*******@localhost/sampledb
```

That was a [SQLAlchemy URL connection string](https://docs.sqlalchemy.org/en/14/core/engines.html#database-urls) magic command. The URL connection string is presented in the following format:

```python
dialect://username:password@host/database
```

Where:

- `dialect` is the database server type, which in this instance is `postgres`
- `username` is the database account username
- `password` is the database account password
- `host` is the server name, which is `localhost`
- `database` is the database name, `sampledb`

The username you use in the connection string _must_ have the permissions to `SELECT`, `INSERT`, `UPDATE`, and `DELETE` rows in `sampledb`. Remember that you need to execute the code in the notebook cell before the database connection can be made.

Now try some meta-commands. Meta-commands allow you to perform administrative type functions against the Postgres instance easily and quickly. While only three are shown below, there are [a lot more](https://www.postgresql.org/docs/current/app-psql.html) :

```text
%sql \l
%sql \dn
%sql \dt healthstats.*
```

![PostgreSQL Meta-Commands](https://i.imgur.com/hz6ghwP.png)
![PostgreSQL Meta-Commands](https://i.imgur.com/zCDCmIX.png)

Next, you will run a simple `SELECT` command against the database:

```sql
SELECT * FROM HealthStats.TobaccoAge LIMIT 10
```

If your connection to the database was successful and the sample data was imported correctly, you should see ten rows returned from the `HealthStats.TobaccoAge` table:

![IPython SQL Extension Query Results](https://i.imgur.com/veWURO7.png)
![IPython SQL Extension Query Results](https://i.imgur.com/KVFs07y.png)

Query results are loaded as a list. It's good practice to limit your rows during testing so you don't use too much memory.

`INSERT`, `UPDATE`, and `DELETE` DML statements also work as expected:

```sql
INSERT INTO HealthStats.TobaccoAge ("Location", "Indicator", "Period", "Dim1", "First Tooltip")
VALUES ('TEST','TEST',9999,'TEST',0.00)
RETURNING *

UPDATE HealthStats.TobaccoAge SET "First Tooltip" = 9999.99
WHERE "tobaccoage"."Location" = 'TEST'
RETURNING *

DELETE FROM HealthStats.TobaccoAge WHERE "tobaccoage"."Location" = 'TEST'
```

![DML statements](https://i.imgur.com/2JMJRZr.png)
![DML statements](https://i.imgur.com/zc1NjjX.png)

Recall that the `%%sql` syntax indicates cell magic, and is required for multiple lines of code.

Joins also work as expected:

```sql
SELECT
a."Location" as "HALE Location",
a."Dim1" as "Sex",
a."First Tooltip" as "HALE at Birth (Years)",
b."First Tooltip" as "Medical Doctors (per 10,000)",
a."Period"
FROM HealthStats.HealthyLifeExpectancyAtBirth a
INNER JOIN (SELECT * FROM HealthStats.MedicalDoctors WHERE "Period" = 2010) b
ON a."Location" = b."Location"
WHERE a."Period" = 2010 and a."Dim1" = 'Both sexes'
ORDER BY a."Location"
LIMIT 10
```

This is a simple `INNER JOIN` on two tables from the database. When you execute that query, it will return the healthy life expectancy at birth in years for both sexes, as well as the number of medical doctors per ten thousand people, for all countries in the year 2010:

![INNER JOIN query](https://i.imgur.com/YUuT57q.png)
![INNER JOIN query](https://i.imgur.com/tVcjg6m.png)

It's possible to return the results of a SQL extension magic command as a pandas DataFrame. Declare a new variable, which in this case is `result`, use the assignment operator `<<`, and then define the query that will return the rows. Once it executes successfully, the rows will be stored in the variable declared to the left of the assignment operator. This variable will have a `DataFrame()` method that returns the rows as a pandas DataFrame once invoked.

![SQL extension result to DataFrame](https://i.imgur.com/mgbuZ79.png)
![SQL extension result to DataFrame](https://i.imgur.com/gHgrGlB.png)

Above, the DataFrame in the `result` variable is stored as `df`. The `df` DataFrame can now be treated as any regular DataFrame.

DDL operations such as `CREATE VIEW` are also possible. You will now rewrite the `INNER JOIN` query to include two additional tables, and save it as a new `VIEW` on the `HealthStats` schema in the `sampledb` database:

```sql
CREATE VIEW HealthStats."STATS_2010"
AS
SELECT
a."Location" as "HALE Location",
a."Dim1" as "Sex",
a."First Tooltip" as "HALE at Birth (Years)",
b."First Tooltip" as "Medical Doctors (per 10,000)",
c."First Tooltip" as "Prev. of Tobacco Smoking (15 plus)",
d."First Tooltip" as "% Pop Basic Drinking Water Serv.",
a."Period"
FROM HealthStats.HealthyLifeExpectancyAtBirth a
INNER JOIN (SELECT * FROM HealthStats.MedicalDoctors WHERE "Period" = 2010) b
ON a."Location" = b."Location"
INNER JOIN (SELECT * FROM HealthStats.TobaccoAge WHERE "Period" = 2010 and "Dim1"= 'Both sexes') c
ON a."Location" = c."Location"
INNER JOIN (SELECT * FROM HealthStats.BasicDrinkingWater WHERE "Period" = 2010) d
ON a."Location" = d."Location"
WHERE a."Period" = 2010 and a."Dim1" = 'Both sexes'
ORDER BY a."Location"
```

![`INNER JOIN` on three tables](https://i.imgur.com/zezGIbn.png)
![`INNER JOIN` on three tables](https://i.imgur.com/atvoArO.png)

You can now close the current PostgreSQL database connection with the following code. The first line uses a SQL Extension magic command to return all the current database connections, and the second line terminates all the database connections returned from the first:

```python
connections = %sql -l
[c.session.close() for c in connections.values()]
```

Another approach to integrating PostgreSQL data would be to connect to the PostgreSQL database and use the `psycopg` library within a Python script. Run the following in a new cell:

```python
import psycopg2

try:
    conn = psycopg2.connect("host=localhost dbname=sampledb user=postgres password=*****")

    cur = conn.cursor()
    cur.execute("SELECT * FROM HealthStats.BasicDrinkingWater LIMIT 20")
    result = cur.fetchall()
    print(result)

except psycopg2.DatabaseError as e:
    print(f'Error: {e}')
    sys.exit(1)
finally:
    if conn:
        conn.close()
```

This approach may be the most popular way to integrate Postgres with Jupyter Notebook. You supply the connection information, execute your query, and the result is returned as a `list` called `result`. When you execute the above code in a new cell your, output would look something like this:

```text
[('Afghanistan', 2017, 'Population using at least basic drinking-water services (%)', 57.32), ('Afghanistan', 2016, 'Population using at least basic drinking-water services (%)', 54.84)...
```

That may not look like much, but Python scripts that integrate Postgres data can accomplish great things. Not only can you use pandas to create DataFrames out of the raw data for querying and manipulation, but you can leverage other powerful libraries such as Seaborn and Matplotlib for quantitative analysis and visualizations.

Re-writing the above Python script to create three plots:

```python
import psycopg2

import pandas as pd
import pandas.io.sql as sqlio

import matplotlib.pyplot as plt
import seaborn as sns

try:
    conn = psycopg2.connect("host=localhost dbname=sampledb user=postgres password=*****")
    sql_query = 'SELECT * FROM HealthStats.\"STATS_2010\"'
    df = sqlio.read_sql_query(sql_query,conn)
except psycopg2.DatabaseError as e:
    print(f'Error {e}')
    sys.exit(1)
finally:
    if conn:
        conn.close()

sns.set_theme(color_codes=True)

# HALE vs Doctors per 10,000, HALE = Healthy Age Life Expectancy
sns.lmplot(x="HALE at Birth (Years)",
           y="Medical Doctors (per 10,000)",
           fit_reg = True,
           hue="HALE at Birth (Years)",
           palette = "coolwarm_r",
           legend = False,
           data=df)
plt.show()

# HALE vs Prevalence (%) of Tobacco Smoker over 15 years
sns.lmplot(x ="HALE at Birth (Years)",
           y="Prev. of Tobacco Smoking (15 plus)",
           data=df)
plt.show()


# HALE vs % Population with Basic Drinking Water Service
sns.lmplot(x="HALE at Birth (Years)",
           y="% Pop Basic Drinking Water Serv.",
           data=df)
plt.show()
```

Essentially, this code is importing the pandas, Matplotlib, and Seaborn libraries, connecting to the PostgreSQL database, extracting rows, and drawing three simple scatter plots from the `STATS_2010` VIEW that was created earlier.

These plots can be used as part of your EDA to investigate likely relationships between the variables in the dataset.

![Scatter plot using PostgreSQL data](https://i.imgur.com/iBI8BK0.png)
![Scatter plot using PostgreSQL data](https://i.imgur.com/BMapLas.png)

It appears that for the World Health Statistics 2010 data set, there is a clear positive correlation between the healthy age life expectancy and medical doctors per ten thousand, as well as with the percentage of population with basic drinking water services. There's a weaker correlation between healthy age life expectancy and the prevalence of tobacco smoking in ages fifteen and over.

These are elementary insights, but illustrate the potential of these integrations. As the data in your Postgres database increases over time, you can stay abreast of how these relationships evolve, and even possibly discover new ones.

## Wrapping Up

In this article you learned how to integrate Jupyter Notebook with PostgreSQL by using the IPython SQL extension magic commands `%sql` and `%%sql` to connect to a PostgreSQL database to perform DML and DDL operations from a notebook, using the `pgspecial` package to perform meta-commands against a PostgreSQL database from a notebook, and using a Python script that leverages the power of the pandas, Seaborn, and Matplotlib libraries to extract data from PostgreSQL for visualization and analysis in a notebook.

This is just skimming the surface of what's possible with Jupyter Notebook. Using Jupyter Notebook, you can potentially implement entire data science workflows using live or static PostgreSQL data, making it an essential tool for many data scientists.
