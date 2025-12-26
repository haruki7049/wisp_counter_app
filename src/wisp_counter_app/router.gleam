import wisp.{type Request, type Response}
import wisp_counter_app/web.{type Context}

const html = "<!DOCTYPE html>
<html lang=\"en\">
  <head>
    <meta charset=\"utf-8\">
    <title>Wisp Example</title>
    <link rel=\"stylesheet\" href=\"/static/styles.css\">
  </head>
  <body>
    <p>Hello</p>
  </body>
</html>
"

pub fn handle_request(req: Request, ctx: Context) -> Response {
  use _req <- web.middleware(req, ctx)
  wisp.html_response(html, 200)
}
