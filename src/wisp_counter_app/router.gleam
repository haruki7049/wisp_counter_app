import lustre/element
import wisp.{type Request, type Response}
import wisp_counter_app/view
import wisp_counter_app/web.{type Context}

pub fn handle_request(req: Request, ctx: Context) -> Response {
  use _req <- web.middleware(req, ctx)

  let initial_model = 0

  let html_content =
    view.view(initial_model)
    |> element.to_string()

  html_content
  |> wisp.html_response(200)
}
