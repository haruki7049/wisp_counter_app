import gleam/erlang/process
import wisp_counter_app/router
import wisp_counter_app/web.{Context}
import mist
import wisp
import wisp/wisp_mist

pub fn main() {
  // This sets the logger to print INFO level logs, and other sensible defaults
  // for a web application.
  wisp.configure_logger()

  // Here we generate a secret key, but in a real application you would want to
  // load this from somewhere so that it is not regenerated on every restart.
  let secret_key_base = wisp.random_string(64)

  let ctx = Context(static_directory: static_directory())

  let handler = router.handle_request(_, ctx)

  // Start the Mist web server.
  let assert Ok(_) =
    wisp_mist.handler(handler, secret_key_base)
    |> mist.new
    |> mist.bind("0.0.0.0")
    |> mist.port(8000)
    |> mist.start

  // The web server runs in new Erlang process, so put this one to sleep while
  // it works concurrently.
  process.sleep_forever()
}

fn static_directory() -> String {
  let assert Ok(priv_directory) = wisp.priv_directory("wisp_counter_app")
  priv_directory <> "/static"
}
