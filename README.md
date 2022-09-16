# Todo ![CI](https://github.com/nskins/todo/actions/workflows/ci.yml/badge.svg)

This is the last straw. You just can't stand it anymore. You're tired of trying to scrawl down your to-do items on a piece of notebook paper with a pen that doesn't work. You've been doing this for such a long time because you really value your privacy. But wouldn't it be great if you could track everything with an app that empowers you to accomplish more?

Todo is the app that's here to save the day. It's free and open source software so you can easily deploy your own instance and have control over your own data. Isn't that awesome?! It's possible that there may even be an official deployment in the future. If that comes to be, our promise to you is that we'll never sell your personal data.

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

## Database

Todo utilizes PostgreSQL for persistent storage. Here's a [really great tutorial](https://www.postgresql.org/docs/current/tutorial.html) for newbies.

## Deployment

Ready to run in production? Please [check the official guides](https://hexdocs.pm/phoenix/deployment.html).
