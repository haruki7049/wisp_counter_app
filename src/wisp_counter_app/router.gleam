import lustre/element
import lustre/attribute
import lustre/element/html
import wisp.{type Request, type Response}
import wisp_counter_app/web.{type Context}

pub fn handle_request(req: Request, ctx: Context) -> Response {
  use _req <- web.middleware(req, ctx)

  let body =
    html.html([], [
      html.head([], [
        html.title([], "wisp_counter_app"),
        html.link([attribute.rel("stylesheet"), attribute.href("/static/styles.css")]),
      ]),
      html.body([], [
        html.p([], [element.text("Hello from constructed text by Lustre")])
      ]),
    ])

  body
  |> element.to_string()
  |> wisp.html_response(200)
}
