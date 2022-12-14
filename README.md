# Todo ![CI](https://github.com/nskins/todo/actions/workflows/ci.yml/badge.svg)

This is the last straw. You just can't stand it anymore. You're tired of trying to scrawl down your to-do items on a piece of notebook paper with a pen that doesn't work. You've been doing this for such a long time because you really value your privacy. But wouldn't it be great if you could track everything with an app that empowers you to accomplish more?

Todo is the app that's here to save the day. It's free and open source software so you can easily deploy your own instance and have control over your own data. Isn't that awesome?! Todo supports login for multiple users, so you could setup an instance for your family, workplace, etc.

Why a to-do app? The author is working on this application in order to learn Phoenix LiveView and Tailwind CSS for web application development. A multi-user to-do app covers quite a bit of ground in learning a web framework.

## How to Build

In order to build the application, you'll need to install the following software (if you haven't already):

- Elixir: https://elixir-lang.org/install.html
- PostgreSQL: https://www.postgresql.org/download/

Clone the repository and then navigate your terminal to the `todo` directory.

You'll need to install application dependencies with the following command:

```
mix deps.get
```

Then you can setup a development database like this:

```
mix ecto.setup
```

Finally, you can fire up the server as such:

```
mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser!!

## Testing

In this project, we utilize test-driven development to ensure that new features correctly handle our expected use cases. Therefore, it's usually a good idea to write a few tests for a new feature *before* we implement the feature. This also improves developer efficiency; if your test cases are thorough enough and passing, then your implementation is more likely to be correct!

Our test suite consists of unit tests and integration tests. A unit test verifies the correctness of a function (without side effects). This means that, given some input, a function should always produce the same output. In contrast, integration tests allow us to test how our code interacts with its environment. This enables us to verify that our code behaves correctly given, say, the state of the database or the state of the browser.

In order to run the test suite, just run the following command:

```
mix test
```

## Continuous Delivery

There is a GitHub Actions workflow that builds and tests the code on any pull request to the `main` branch. This helps us to prevent bugs from reaching `main` because the code must compile and pass test cases before a merge is allowed. If we ever setup an official instance, we could setup automatic deployment on pushes to `main`.

## Database

Todo utilizes [Ecto](https://github.com/elixir-ecto/ecto) to interact with PostgreSQL. To learn more about Ecto, please visit the [official documentation](https://hexdocs.pm/ecto/Ecto.html).

You can configure database connection parameters in the `/config` directory. Specifically, you can update [dev.exs](config/dev.exs) for local development and [test.exs](config/test.exs) for the test environment. For the production environment, it is recommended to set the value `DATABASE_URL` in [runtime.exs](config/runtime.exs) as a system environment variable to protect the security of your credentials.

## Deployment

To learn how to deploy the app, please visit the [official documentation](https://hexdocs.pm/phoenix/deployment.html).

## Architecture

Todo is built on the standard MVC architecture common to most Phoenix applications. There is a very particular directory structure that indicates precisely where each different piece goes; [here](https://hexdocs.pm/phoenix/directory_structure.html) is more information if you'd like to learn more. In fact, I'd recommend reading through most of the [official Phoenix guides](https://hexdocs.pm/phoenix/overview.html) if you haven't already. Todo follows the recommended best practices given by that documentation... and honestly, the documentation is so good that it's going to be the best reference for any questions you have.
