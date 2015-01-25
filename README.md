# Sharpie

Simple image conversion web service built with Elixir.

## How to

To start your new Phoenix application:

1. Install dependencies with `mix deps.get`
2. Start Phoenix endpoint with `mix phoenix.start`

Now you can visit `localhost:4000` from your browser.

## API

- `POST /api/images/` -> Convert image

### Query params for conversion

- `format=jpg` -> format convertion
- `h=100` -> resize height with same ratio
- `w=100` -> resize width with same ratio
- `w=100&h=200` -> resize with both sizes
