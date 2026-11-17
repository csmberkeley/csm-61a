pub fn current_player(board: List(Cell)) -> Player {
  let taken = list.count(board, fn(cell) { ____________ })
  case ____________ {
    0 -> ____
    _ -> ____
  }
}

assert current_player(list.repeat(Empty, 9)) == X
assert current_player([Empty, Empty, Empty, Empty, Taken(X), Empty, Empty, Empty, Empty])
  == O
assert current_player([Taken(O), Empty, Empty, Empty, Taken(X), Empty, Empty, Empty, Empty])
  == X


pub fn place(board: List(Cell), i: Int, player: Player) -> List(Cell) {
  list.index_map(board, fn(cell, j) {
    case ____________ {
      True -> ____________
      False -> ____________
    }
  })
}

assert place(list.repeat(Empty, 9), 4, X)
  == [Empty, Empty, Empty, Empty, Taken(X), Empty, Empty, Empty, Empty]
assert place([Empty, Empty, Empty, Empty, Taken(X), Empty, Empty, Empty, Empty], 0, O)
  == [Taken(O), Empty, Empty, Empty, Taken(X), Empty, Empty, Empty, Empty]


pub fn update(model: Model, msg: Msg) -> Model {
  case msg {
    UserClickedCell(i) ->
      case ____________(______________________) {
        Empty ->
          Model(board: ____________(________________, ____,
            ____________________(________________)))
        Taken(_) -> _________
      }
    UserClickedNewGame -> init(Nil)
  }
}

assert update(init(Nil), UserClickedCell(4)).board
  == [Empty, Empty, Empty, Empty, Taken(X), Empty, Empty, Empty, Empty]
assert cell_at(update(update(init(Nil), UserClickedCell(4)), UserClickedCell(0)).board, 0)
  == Taken(O)
assert update(update(init(Nil), UserClickedCell(4)), UserClickedCell(4))
  == update(init(Nil), UserClickedCell(4))


pub fn view_cell(cell: Cell, i: Int) -> Element(Msg) {
  case cell {
    Empty ->
      html.button(
        [attribute.class("cell"), _________________(____________________)],
        [],
      )
    Taken(p) ->
      html.button([attribute.class("cell"), attribute.disabled(True)], [
        ______________(________________),
      ])
  }
}

assert element.to_string(view_cell(Empty, 3))
  == "<button class=\"cell\"></button>"
assert element.to_string(view_cell(Taken(O), 3))
  == "<button class=\"cell\" disabled>O</button>"












