pub fn factorial(n: Int) -> Int {
  case n > 0 {
    True -> n * factorial(n - 1)
    False -> 1
  }
}

pub fn all_pairs(f: fn(a, a) -> Bool, s: List(a)) -> Bool {
  case s {
    [x, y, ..rest] -> f(x, y) && all_pairs(f, [y, ..rest])
    _ -> True
  }
}
pub fn show_pairs(s: List(a)) -> List(#(a, a)) {
  case s {
    [x, y, ..rest] -> [#(x, y), ..show_pairs([y, ..rest])]
    _ -> []
  }
}
 pub fn unpair(s: List(#(a, a))) -> List(a) {
   case s {
     [] -> []
     [#(x, y)] -> [x, y]
     [#(x, _), ..rest] -> [x, ..unpair(rest)]
   }
 }
 assert unpair(show_pairs([3, 5, 7, 9])) == [3, 5, 7, 9]
pub fn all_pairs_calls(f: fn(a, a) -> Bool, s: List(a)) -> List(fn() -> Bool) {
  list.map(show_pairs(s), fn(pair) { fn() { f(pair.0, pair.1) } })
}

pub fn run_all(calls: List(fn() -> Bool)) -> Bool {
  list.all(calls, fn(call) { call() })
}


pub fn find_pair(s: List(Int)) -> List(Int) {
  case s {
    [] -> []
    [x, ..rest] ->
      case list.contains(rest, 2020 - x) {
        True -> [x, 2020 - x]
        False -> find_pair(rest)
      }
  }
}


pub fn no_eleven(n: Int) -> List(List(Int)) {
  case n {
    0 -> [[]]
    1 -> [[6], [1]]
    _ ->
      list.append(
        list.map(no_eleven(n - 1), fn(s) { [6, ..s] }),
        list.map(no_eleven(n - 2), fn(s) { [1, 6, ..s] }),
      )
  }
}


pub fn combo(a: List(Int), b: List(Int)) -> List(Int) {
  case a, b {
    [], _ -> b
    _, [] -> a
    [x, ..ar], [y, ..br] if x == y -> [x, ..combo(ar, br)]
    [x, ..ar], [y, ..br] ->
      smaller([x, ..combo(ar, b)], [y, ..combo(a, br)])
  }
}


pub fn promote(f: fn(a) -> Bool, s: List(a)) -> List(a) {
  list.append(list.filter(s, f), list.filter(s, fn(x) { !f(x) }))
}
pub fn bigger_first(s: List(Int)) -> List(Int) {
  curry_call(promote)(curry(less_than), first)(s)
}


fn draw(shape_slider: Int) -> Int {
  case True {
    True -> abs(3)
    False -> abs(1)
  }
}
eval case True { True -> abs(3) False -> abs(1) }
  eval True
eval abs(3)
  eval abs
  eval 3
  apply abs to 3 → 3

result: 3
fn draw(shape_slider: Int) -> Point {
  case abs(2) {
    2 -> Point(1, 2)
    _ -> Point(0, 0)
  }
}
eval case abs(2) { 2 -> Point(1, 2) _ -> Point(0, 0) }
  eval abs(2)
    eval abs
    eval 2
    apply abs to 2 → 2
eval Point(1, 2)
  eval Point
  eval 1
  eval 2
  apply Point to 1, 2 → Point(1, 2)

result: Point(1, 2)
fn twin(x: Int) -> Point {
  Point(x, x)
}

fn draw(shape_slider: Int) -> Point {
  twin(abs(3))
}
eval twin(abs(3))
  eval twin
  eval abs(3)
    eval abs
    eval 3
    apply abs to 3 → 3
  apply twin to 3
    eval Point(x, x)
      eval Point
      eval x
      eval x
      apply Point to 3, 3 → Point(3, 3)
  apply twin to 3 → Point(3, 3) // same call as apply twin to 3

result: Point(3, 3)
fn pair(x: Int, y: Int) -> Point {
  Point(x, y)
}

fn draw(shape_slider: Int) -> Point {
  pair(abs(3), case True {
    True -> 2
    False -> 0
  })
}
eval pair(abs(3), case True { True -> 2 False -> 0 })
  eval pair
  eval abs(3)
    eval abs
    eval 3
    apply abs to 3 → 3
  eval case True { True -> 2 False -> 0 }
    eval True
  eval 2
  apply pair to 3, 2
    eval Point(x, y)
      eval Point
      eval x
      eval y
      apply Point to 3, 2 → Point(3, 2)
  apply pair to 3, 2 → Point(3, 2) // same call as apply pair to 3, 2

result: Point(3, 2)


pub fn simplify(expr: Expr) -> Expr {
  case expr {
    Binary(operator, left, right) ->
      case simplify(left), simplify(right) {
        N(a), N(b) -> N(calculate(operator, a, b))
        l, r -> Binary(operator, l, r)
      }
    _ -> expr
  }
}


pub fn substitute(expr: Expr, name: String, replacement: Expr) -> Expr {
  case expr {
    Var(v) if v == name -> replacement
    Var(_) | N(_) -> expr
    Binary(operator, left, right) -> {
      let new_left = substitute(left, name, replacement)
      let new_right = substitute(right, name, replacement)
      Binary(operator, new_left, new_right)
    }
  }
}


pub fn curry(f: UserFn, arg: Int) -> Result(UserFn, EvalError) {
  case f.params {
    [] -> Error(WrongArgumentCount(want: 0, got: 1))
    [first, ..rest] -> {
      let new_body = substitute(f.body, first, N(arg))
      Ok(UserFn(rest, new_body))
    }
  }
}


pub fn compose(f: UserFn, g: UserFn) -> Result(UserFn, EvalError) {
  case f.params {
    [x] -> {
      let new_body = substitute(f.body, x, g.body)
      Ok(UserFn(g.params, new_body))
    }
    params -> Error(WrongArgumentCount(want: list.length(params), got: 1))
  }
}


