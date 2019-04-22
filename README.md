# HubtelUssdPhoenixExample
Hubtel USSD app built with Elixir's Phoenix Framework for learning purposes 



### Prerequisites

* [Elixir](https://elixir-lang.org/)
* [ngrok](https://ngrok.com/)
* [Hubtel USSD Simulator](http://apps.smsgh.com/USSDSimulator/)



### Getting Started

1. These instructions will get you a copy of the project up and running on your local machine for development purposes.

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.



2. Start a seperate command line/terminal and change directory to your project root. Start ngrok with the same port as above: 

```bash
ngrok http 4000
```


3. Visit the Hubtel USSD Simulator webpage on [http://apps.smsgh.com/USSDSimulator/](http://apps.smsgh.com/USSDSimulator/) and replace the **Client Url** with one of the links generate by ngrok. e.g. http://e19d8c69.ngrok.io/ussd or http://e19d8c69.ngrok.io/ussd


<!-- ### Ready to run in production?

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)
 -->


### Authors

* **Benjamin Manford** - *Initial work* - [manfordbenjamin](https://github.com/manfordbenjamin)


### License

This project is licensed under the MIT License