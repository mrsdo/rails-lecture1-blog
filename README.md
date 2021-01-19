# REQUIREMENTS

1. Plan out URLS's for the features
2. Does the database need to change? Tables?
3. If I need a new table, do I have that model? No, use the model generator
4. After I generate a new model and migrate the DB, I need to make sure it works 

### ActiveRecord Conventions
* Table name: lowercase plural name of model - posts
* Model filename: singular lowercase (underscored) - post.rb
* Class name: singular camelcase - Post

#### Example: Author
* Table name: authors
* Model name: author.rb
* Class name: Author 

* Multiple blog posts

* CRUD blog post


## Features



### URL's

* GET /post -> show and index of all blog post

* GET /posts/:id -> show blog post by id

* GET /post/new -> a form for new blog posts

* POST /post -> submit new blog post

* GET /posts/:id/edit -> edit blog post

### MODELS
* Model filename: singular lowercase (underscored) - i.e, post.rb


### Rails (G)enerate Model

mj163@dolcehome rails-lecture1-blog % rails g model

Running via Spring preloader in process 26998

Usage:
rails generate model NAME [field[:type][:index] field[:type][:index]] [options]

Options:
[--skip-namespace], [--no-skip-namespace]              # Skip namespace (affects only isolated engines)
[--skip-collision-check], [--no-skip-collision-check]  # Skip collision check
[--force-plural], [--no-force-plural]                  # Forces the use of the given model name
-o, --orm=NAME                                             # ORM to be invoked
# Default: active_record

ActiveRecord options:
[--migration], [--no-migration]        # Indicates when to generate migration
# Default: true
[--timestamps], [--no-timestamps]      # Indicates when to generate timestamps
# Default: true
[--parent=PARENT]                      # The parent class for the generated model
[--indexes], [--no-indexes]            # Add indexes for references and belongs_to columns
# Default: true
[--primary-key-type=PRIMARY_KEY_TYPE]  # The type for primary key
--db, [--database=DATABASE]                # The database for your model's migration. By default, the current environment's primary database is used.
-t, [--test-framework=NAME]                # Test framework to be invoked
# Default: test_unit

TestUnit options:
[--fixture], [--no-fixture]   # Indicates when to generate fixture
# Default: true
-r, [--fixture-replacement=NAME]  # Fixture replacement to be invoked

Runtime options:
-f, [--force]                    # Overwrite files that already exist
-p, [--pretend], [--no-pretend]  # Run but do not make any changes
-q, [--quiet], [--no-quiet]      # Suppress status output
-s, [--skip], [--no-skip]        # Skip files that already exist

Description:
Generates a new model. Pass the model name, either CamelCased or
under_scored, and an optional list of attribute pairs as arguments.

    Attribute pairs are field:type arguments specifying the
    model's attributes. Timestamps are added by default, so you don't have to
    specify them by hand as 'created_at:datetime updated_at:datetime'.

    As a special case, specifying 'password:digest' will generate a
    password_digest field of string type, and configure your generated model and
    tests for use with Active Model has_secure_password (assuming the default ORM
    and test framework are being used).

    You don't have to think up every attribute up front, but it helps to
    sketch out a few so you can start working with the model immediately.

    This generator invokes your configured ORM and test framework, which
    defaults to Active Record and TestUnit.

    Finally, if --parent option is given, it's used as superclass of the
    created model. This allows you create Single Table Inheritance models.

    If you pass a namespaced model name (e.g. admin/account or Admin::Account)
    then the generator will create a module with a table_name_prefix method
    to prefix the model's table name with the module name (e.g. admin_accounts)

Available field types:

    Just after the field name you can specify a type like text or boolean.
    It will generate the column with the associated SQL type. For instance:

        `bin/rails generate model post title:string body:text`

    will generate a title column with a varchar type and a body column with a text
    type. If no type is specified the string type will be used by default.
    You can use the following types:

        integer
        primary_key
        decimal
        float
        boolean
        binary
        string
        text
        date
        time
        datetime

    You can also consider `references` as a kind of type. For instance, if you run:

        `bin/rails generate model photo title:string album:references`

    It will generate an `album_id` column. You should generate these kinds of fields when
    you will use a `belongs_to` association, for instance. `references` also supports
    polymorphism, you can enable polymorphism like this:

        `bin/rails generate model product supplier:references{polymorphic}`

    For integer, string, text and binary fields, an integer in curly braces will
    be set as the limit:

        `bin/rails generate model user pseudo:string{30}`

    For decimal, two integers separated by a comma in curly braces will be used
    for precision and scale:

        `bin/rails generate model product 'price:decimal{10,2}'`

    You can add a `:uniq` or `:index` suffix for unique or standard indexes
    respectively:

        `bin/rails generate model user pseudo:string:uniq`
        `bin/rails generate model user pseudo:string:index`

    You can combine any single curly brace option with the index options:

        `bin/rails generate model user username:string{30}:uniq`
        `bin/rails generate model product supplier:references{polymorphic}:index`

    If you require a `password_digest` string column for use with
    has_secure_password, you can specify `password:digest`:

        `bin/rails generate model user password:digest`

    If you require a `token` string column for use with
    has_secure_token, you can specify `auth_token:token`:

        `bin/rails generate model user auth_token:token`

Examples:
`bin/rails generate model account`

        For Active Record and TestUnit it creates:

            Model:      app/models/account.rb
            Test:       test/models/account_test.rb
            Fixtures:   test/fixtures/accounts.yml
            Migration:  db/migrate/XXX_create_accounts.rb

    `bin/rails generate model post title:string body:text published:boolean`

        Creates a Post model with a string title, text body, and published flag.

    `bin/rails generate model admin/account`

        For Active Record and TestUnit it creates:

            Module:     app/models/admin.rb
            Model:      app/models/admin/account.rb
            Test:       test/models/admin/account_test.rb
            Fixtures:   test/fixtures/admin/accounts.yml
            Migration:  db/migrate/XXX_create_admin_accounts.rb


***


### DATABASE
* Table name: lowercase plural name of model - i.e, posts

***
### ROUTES

Routes must map to controller actions:

* Rails route map a URL to a Controller (Class) and and Action (Methods)

***
### CONTROLLER ACTIONS
* Class name: singular camelcase - i.e, Post or CreatePost

mj163@dolcehome rails-lecture1-blog % rails g controller

Running via Spring preloader in process 30301

Usage:

rails generate controller NAME [action action] [options]

Options:
[--skip-namespace], [--no-skip-namespace]              # Skip namespace (affects only isolated engines)
[--skip-collision-check], [--no-skip-collision-check]  # Skip collision check
[--skip-routes], [--no-skip-routes]                    # Don't add routes to config/routes.rb.
[--helper], [--no-helper]                              # Indicates when to generate helper
# Default: true
[--assets], [--no-assets]                              # Indicates when to generate assets
# Default: true
-e, [--template-engine=NAME]                               # Template engine to be invoked
# Default: erb
-t, [--test-framework=NAME]                                # Test framework to be invoked
# Default: test_unit

Asset options:
-j, [--javascripts], [--no-javascripts]       # Generate JavaScripts
-y, [--stylesheets], [--no-stylesheets]       # Generate Stylesheets
# Default: true
-je, [--javascript-engine=JAVASCRIPT_ENGINE]  # Engine for JavaScripts
-se, [--stylesheet-engine=STYLESHEET_ENGINE]  # Engine for Stylesheets
# Default: scss

Runtime options:
-f, [--force]                    # Overwrite files that already exist
-p, [--pretend], [--no-pretend]  # Run but do not make any changes
-q, [--quiet], [--no-quiet]      # Suppress status output
-s, [--skip], [--no-skip]        # Skip files that already exist

Description:
Generates a new controller and its views. Pass the controller name, either
CamelCased or under_scored, and a list of views as arguments.

    To create a controller within a module, specify the controller name as a
    path like 'parent_module/controller_name'.

    This generates a controller class in app/controllers and invokes helper,
    template engine, assets, and test framework generators.

Example:
`bin/rails generate controller CreditCards open debit credit close`

    CreditCards controller with URLs like /credit_cards/debit.
        Controller: app/controllers/credit_cards_controller.rb
        Test:       test/controllers/credit_cards_controller_test.rb
        Views:      app/views/credit_cards/debit.html.erb [...]
        Helper:     app/helpers/credit_cards_helper.rb




***
### VIEWS

### Additional Generators - Hierarchy

* Scaffolce -> controller, routes, models, migration, views
* Resource -> controller, routes, models, migration
* Model -> model and the migration for the model
* Migration -> just the migration

### RAILS CONSOLE
`mj163@dolcehome rails-lecture1-blog % rails console

Running via Spring preloader in process 29735

Loading development environment (Rails 6.1.1)

2.6.1 :001 > Post

=> Post (call 'Post.connection' to establish a connection)

2.6.1 :002 > Post.create(:title => "Post made from Console"

2.6.1 :003?>   ) #forgot to add this at the end of previous line

(1.0ms)  SELECT sqlite_version(*)

TRANSACTION (0.0ms)  begin transaction

Post Create (0.8ms)  INSERT INTO "posts" ("title", "created_at", "updated_at") VALUES (?, ?, ?)  [["title", "Post made from Console"], ["created_at", "2021-01-19 13:21:03.321286"], ["updated_at", "2021-01-19 13:21:03.321286"]]

TRANSACTION (0.5ms)  commit transaction

=> #<Post id: 1, title: "Post made from Console", content: nil, created_at: "2021-01-19 13:21:03.321286000 +0000", updated_at: "2021-01-19 13:21:03.321286000 +0000">
2.6.1 :004 >`


***
### RAILS (G)enerate

mj163@dolcehome rails-lecture1-blog % rails g

Running via Spring preloader in process 20408
Usage: rails generate GENERATOR [args] [options]

General options:

-h, [--help]     # Print generator's options and usage

-p, [--pretend]  # Run but do not make any changes

-f, [--force]    # Overwrite files that already exist

-s, [--skip]     # Skip files that already exist

-q, [--quiet]    # Suppress status output


Please choose a generator below.

Rails:

* application_record
* assets
* benchmark
* channel
* controller
* generator
* helper
* integration_test
* jbuilder
* job
* mailbox
* mailer
* migration
* model
* resource
* scaffold
* scaffold_controller
* system_test
* task

ActiveRecord:

* active_record:application_record

RackProfiler:
* rack_profiler:install

TestUnit:
* test_unit:channel
* test_unit:generator
* test_unit:install
* test_unit:mailbox
* test_unit:plugin


***
### RAILS (G)enerate Migration

mj163@dolcehome rails-lecture1-blog % rails generate migration

Running via Spring preloader in process 21263

Usage:

`rails generate migration NAME [field[:type][:index] field[:type][:index]] [options]`

Options:

`[--skip-namespace], [--no-skip-namespace] `                # Skip namespace (affects only isolated engines)

`[--skip-collision-check], [--no-skip-collision-check]`     # Skip collision check

`-o, --orm=NAME`                                            # ORM to be invoked

### Default: active_record

ActiveRecord options:
[--timestamps], [--no-timestamps]      # Indicates when to generate timestamps
### Default: true
[--primary-key-type=PRIMARY_KEY_TYPE]  # The type for primary key
--db, [--database=DATABASE]                # The database for your migration. By default, the current environment's primary database is used.

Runtime options:
-f, [--force]                    # Overwrite files that already exist
-p, [--pretend], [--no-pretend]  # Run but do not make any changes
-q, [--quiet], [--no-quiet]      # Suppress status output
-s, [--skip], [--no-skip]        # Skip files that already exist

Description:

Generates a new database migration. Pass the migration name, either
CamelCased or under_scored, and an optional list of attribute pairs as arguments.

    A migration class is generated in db/migrate prefixed by a timestamp of the current date and time.

    You can name your migration in either of these formats to generate add/remove
    column lines from supplied attributes: AddColumnsToTable or RemoveColumnsFromTable

Example:
`bin/rails generate migration AddSslFlag`

    If the current date is May 14, 2008 and the current time 09:09:12, this creates the AddSslFlag migration
    db/migrate/20080514090912_add_ssl_flag.rb

    `bin/rails generate migration AddTitleBodyToPost title:string body:text published:boolean`

    This will create the AddTitleBodyToPost in db/migrate/20080514090912_add_title_body_to_post.rb with this in the Change migration:

      add_column :posts, :title, :string
      add_column :posts, :body, :text
      add_column :posts, :published, :boolean

Migration names containing JoinTable will generate join tables for use with
has_and_belongs_to_many associations.

Example:
`bin/rails g migration CreateMediaJoinTable artists musics:uniq`

    will create the migration

    create_join_table :artists, :musics do |t|
      # t.index [:artist_id, :music_id]
      t.index [:music_id, :artist_id], unique: true
    end


***
### Rails (G)enerate Model

mj163@dolcehome rails-lecture1-blog % rails g model

Running via Spring preloader in process 26998

Usage:
rails generate model NAME [field[:type][:index] field[:type][:index]] [options]

Options:
[--skip-namespace], [--no-skip-namespace]              # Skip namespace (affects only isolated engines)
[--skip-collision-check], [--no-skip-collision-check]  # Skip collision check
[--force-plural], [--no-force-plural]                  # Forces the use of the given model name
-o, --orm=NAME                                             # ORM to be invoked
# Default: active_record

ActiveRecord options:
[--migration], [--no-migration]        # Indicates when to generate migration
# Default: true
[--timestamps], [--no-timestamps]      # Indicates when to generate timestamps
# Default: true
[--parent=PARENT]                      # The parent class for the generated model
[--indexes], [--no-indexes]            # Add indexes for references and belongs_to columns
# Default: true
[--primary-key-type=PRIMARY_KEY_TYPE]  # The type for primary key
--db, [--database=DATABASE]                # The database for your model's migration. By default, the current environment's primary database is used.
-t, [--test-framework=NAME]                # Test framework to be invoked
# Default: test_unit

TestUnit options:
[--fixture], [--no-fixture]   # Indicates when to generate fixture
# Default: true
-r, [--fixture-replacement=NAME]  # Fixture replacement to be invoked

Runtime options:
-f, [--force]                    # Overwrite files that already exist
-p, [--pretend], [--no-pretend]  # Run but do not make any changes
-q, [--quiet], [--no-quiet]      # Suppress status output
-s, [--skip], [--no-skip]        # Skip files that already exist

Description:
Generates a new model. Pass the model name, either CamelCased or
under_scored, and an optional list of attribute pairs as arguments.

    Attribute pairs are field:type arguments specifying the
    model's attributes. Timestamps are added by default, so you don't have to
    specify them by hand as 'created_at:datetime updated_at:datetime'.

    As a special case, specifying 'password:digest' will generate a
    password_digest field of string type, and configure your generated model and
    tests for use with Active Model has_secure_password (assuming the default ORM
    and test framework are being used).

    You don't have to think up every attribute up front, but it helps to
    sketch out a few so you can start working with the model immediately.

    This generator invokes your configured ORM and test framework, which
    defaults to Active Record and TestUnit.

    Finally, if --parent option is given, it's used as superclass of the
    created model. This allows you create Single Table Inheritance models.

    If you pass a namespaced model name (e.g. admin/account or Admin::Account)
    then the generator will create a module with a table_name_prefix method
    to prefix the model's table name with the module name (e.g. admin_accounts)

Available field types:

    Just after the field name you can specify a type like text or boolean.
    It will generate the column with the associated SQL type. For instance:

        `bin/rails generate model post title:string body:text`

    will generate a title column with a varchar type and a body column with a text
    type. If no type is specified the string type will be used by default.
    You can use the following types:

        integer
        primary_key
        decimal
        float
        boolean
        binary
        string
        text
        date
        time
        datetime

    You can also consider `references` as a kind of type. For instance, if you run:

        `bin/rails generate model photo title:string album:references`

    It will generate an `album_id` column. You should generate these kinds of fields when
    you will use a `belongs_to` association, for instance. `references` also supports
    polymorphism, you can enable polymorphism like this:

        `bin/rails generate model product supplier:references{polymorphic}`

    For integer, string, text and binary fields, an integer in curly braces will
    be set as the limit:

        `bin/rails generate model user pseudo:string{30}`

    For decimal, two integers separated by a comma in curly braces will be used
    for precision and scale:

        `bin/rails generate model product 'price:decimal{10,2}'`

    You can add a `:uniq` or `:index` suffix for unique or standard indexes
    respectively:

        `bin/rails generate model user pseudo:string:uniq`
        `bin/rails generate model user pseudo:string:index`

    You can combine any single curly brace option with the index options:

        `bin/rails generate model user username:string{30}:uniq`
        `bin/rails generate model product supplier:references{polymorphic}:index`

    If you require a `password_digest` string column for use with
    has_secure_password, you can specify `password:digest`:

        `bin/rails generate model user password:digest`

    If you require a `token` string column for use with
    has_secure_token, you can specify `auth_token:token`:

        `bin/rails generate model user auth_token:token`

Examples:
`bin/rails generate model account`

        For Active Record and TestUnit it creates:

            Model:      app/models/account.rb
            Test:       test/models/account_test.rb
            Fixtures:   test/fixtures/accounts.yml
            Migration:  db/migrate/XXX_create_accounts.rb

    `bin/rails generate model post title:string body:text published:boolean`

        Creates a Post model with a string title, text body, and published flag.

    `bin/rails generate model admin/account`

        For Active Record and TestUnit it creates:

            Module:     app/models/admin.rb
            Model:      app/models/admin/account.rb
            Test:       test/models/admin/account_test.rb
            Fixtures:   test/fixtures/admin/accounts.yml
            Migration:  db/migrate/XXX_create_admin_accounts.rb


***

* Deployment instructions

* ...
