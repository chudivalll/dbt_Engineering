# Union Analytics Engineer Code Challenge

## Setup

### Docker
The environment is set up in docker to give you access to a Postgres database. You'll need to download Docker Desktop https://docs.docker.com/docker-for-mac/install/ (most of us are on Version 2.3.0.3).
If you aren't on Mac, let us know before continuing.

1. Complete commands in [GIT section](#GIT)
2. Run `sh ./.dev_env/dev_env`
 - Shell prompts will tell you if Docker containers were setup properly
 - For more information on how DBT is setup [see section below](#Working-in-the-container)
3. Make sure to run a `dbt seed --full-refresh` command from inside dev_env container!
4. Begin [Challenge Section](#Challenges)

#### Access to postgres:
* **URL:** `localhost:5432`
* **Username:** postgres
* **Password:** postgres

#### Access to PgAdmin:
* **URL:** `http://localhost:5050`
* **Username:** pgadmin4@pgadmin.org
* **Password:** admin
* if connecting to postgres from pgadmin, use host `datastreet` (containers use different network resolvers)

### Data Build Tool
You will be using DBT to create and test models for our data. https://docs.getdbt.com/docs/introduction

### Working in the container
To get started simply type `sh ./.dev_env/dev_env`

### Develop
`sh ./.dev_env/dev_env` opens your environment. use `sh ./.dev_env/dev_env --help` to see your env options.

Once in the container, your dbt run commands will automagically use a schema prefixed with your git branch. So the prod schema on branch DATA-444 will materialize as DATA444_prod.

To run your build-test workflow, use the alias `redgreen <model> [option]` to build the model and test it. For example, to build and test the dim_i_user model and all dowstream models, you would use `redgreen dim_i_user+`

To generate a new template Yaml test file, use the alias command `get-test <database> <schema> <model>`. For example, to build the new model DATA_WAREHOUSE.WORDPRESS.DIM_USER you would do:

`gen-test data_warehouse wordpress DIM-USER` ## note the args are case-insensitive and always coerce dashes

### GIT
You will be committing all code, README files, etc to a feature branch in this repository.

1. Checkout a new feature branch to house your work
  - Run `git checkout -b tech-challenge-{your name in camel case}`
2. Commit code for each challenge below
  - Run `git commit -am "{max 80 character description of what you're committing}"`
3. Once challenge is complete make sure to push your branch
  - Run `git push`


## Challenges
Below are a list of steps to complete the steps. Each step is desigend to build on the previous step.

You'll be working with DBT. Note that the setup of this project isn't necessarily ideal (hence why we are hiring!). You can place any notes that you want to share in the `MY_NOTES.md` markdown file.
Feel free to make any structural changes you deem necessary. 


1. Create schema test(s) for your first model and comment in the `posts_schema.yml` files on your reasoning for the tests. There should be a logical relation to product business rules based on the data that will be included in the model.

2. Create​ ​a​ ​model​,​ ​materialized​ ​as​ ​a​ ​view,​ ​that​ ​will​ ​aggregate​ ​all​ available ​community `posts​` ​tables.​ ​This​ ​will​ ​allow​ ​you​ ​to​ ​query​ ​all​ ​content​ ​across​ ​any community from a single `ref()`-able model.​
  - consider using jinja `for` loops

3. Using the posts model you created in step 2, create another table from that model. This new table will seek to answer some questions about the authors on our sites. At minimum, we're looking for `site_prefix`, `post_author`, the `comment_count`, as well as adding 3 new columns.

Columns to be considered:
1. The first column will be a concatenation of month and year.
  * There are multiple date fields, so for this excersice use post_date_gmt
2. The next column is the total number of posts made by the author in that time frame
3. The final new column will contain the amount of time between author posts (on average)
  * In order for a post to "count" it must be published during the time frame (`post_status = 'publish'`)

### Wrapping Up
When you're ready to submit your challenge, please submit a Pull Request in BitBucket
