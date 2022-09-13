# Todo ![CI](https://github.com/nskins/todo/actions/workflows/ci.yml/badge.svg)

This is the last straw. You just can't stand it anymore. You're tired of trying to scrawl down your to-do items on a piece of notebook paper with a pen that doesn't work. You've been doing this for such a long time because you really value your privacy. But wouldn't it be great if you could track everything with an app that empowers you to accomplish more?

Todo is the app that's here to save the day. It's free and open source software so you can easily deploy your own instance and have control over your own data. Isn't that awesome?! It's possible that there may even be an official deployment in the future. If that comes to be, our promise to you is that we'll never sell your personal data.

## How to Build

In order to build the application, you'll need to install the following software (if you haven't already):

- Elixir: https://elixir-lang.org/install.html
- PostgreSQL: https://www.postgresql.org/download/

Clone the repository and then navigate your terminal to the `todo` directory.

You'll need to install application dependencies with the following command:

```bash
mix deps.get
```

Then you can setup a development database like this:

```bash
mix ecto.setup
```

Finally, you can fire up the server as such:

```bash
mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser!!

## Database

Todo utilizes PostgreSQL for persistent storage. Here's a [really great tutorial](https://www.postgresql.org/docs/current/tutorial.html) for newbies.

## Deployment

Ready to run in production? Please [check the official guides](https://hexdocs.pm/phoenix/deployment.html).
