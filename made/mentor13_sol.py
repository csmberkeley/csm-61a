pub fn current_player(board: List(Cell)) -> Player {
  let taken = list.count(board, fn(cell) { cell != Empty })
  case taken % 2 {
    0 -> X
    _ -> O
  }
}


pub fn place(board: List(Cell), i: Int, player: Player) -> List(Cell) {
  list.index_map(board, fn(cell, j) {
    case j == i {
      True -> Taken(player)
      False -> cell
    }
  })
}


pub fn update(model: Model, msg: Msg) -> Model {
  case msg {
    UserClickedCell(i) ->
      case cell_at(model.board, i) {
        Empty ->
          Model(board: place(model.board, i, current_player(model.board)))
        Taken(_) -> model
      }
    UserClickedNewGame -> init(Nil)
  }
}


pub fn view_cell(cell: Cell, i: Int) -> Element(Msg) {
  case cell {
    Empty ->
      html.button(
        [attribute.class("cell"), event.on_click(UserClickedCell(i))],
        [],
      )
    Taken(p) ->
      html.button([attribute.class("cell"), attribute.disabled(True)], [
        html.text(player_name(p)),
      ])
  }
}


SELECT chair FROM lift WHERE couple > single;


SELECT chair, single - 2 * couple AS difference
FROM lift
WHERE single >= 4;


CREATE TABLE lift_totals AS
    SELECT chair, single + 2 * couple AS people FROM lift;


SELECT chair, single + 2 * couple AS people
FROM lift
WHERE couple >= 3
ORDER BY people DESC, chair ASC
LIMIT 2;


SELECT * FROM lift
ORDER BY single DESC, chair ASC
LIMIT 3;


