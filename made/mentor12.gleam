pub fn factorial(n: Int) -> Int {
  case n > 0 {
    True -> ____________ * ______________________________
    False -> ____________
  }
}


pub fn inc(x: Int, y: Int) -> Bool {
  x + 1 == y
}

pub fn all_pairs(f: fn(a, a) -> Bool, s: List(a)) -> Bool {
  case s {
    [x, y, ..rest] -> ____________ && all_pairs(f, ______________)
    _ -> True
  }
}
assert all_pairs(inc, [3, 4, 5, 6, 7, 8]) == True
assert all_pairs(inc, [3, 4, 5, 8, 7, 8]) == False
assert all_pairs(inc, [3, 4, 6, 7]) == False
assert all_pairs(inc, [3]) == True
assert all_pairs(inc, []) == True
pub fn show_pairs(s: List(a)) -> List(#(a, a)) {
  case s {
    [x, y, ..rest] -> [__________, ..show_pairs(______________)]
    _ -> []
  }
}
assert show_pairs([3, 5, 7, 9, 11, 13])
  == [#(3, 5), #(5, 7), #(7, 9), #(9, 11), #(11, 13)]
assert show_pairs([1, 2]) == [#(1, 2)]
assert show_pairs([1]) == []
 pub fn unpair(s: List(#(a, a))) -> List(a) {
   case s {
     [] -> []
     [#(x, y)] -> [x, y]
     [#(x, _), ..rest] -> [x, ..unpair(rest)]
   }
 }
 assert unpair(show_pairs([3, 5, 7, 9])) == [3, 5, 7, 9]
pub fn all_pairs_calls(f: fn(a, a) -> Bool, s: List(a)) -> List(fn() -> Bool) {
  list.map(show_pairs(s), fn(pair) { ______________________________ })
}

pub fn run_all(calls: List(fn() -> Bool)) -> Bool {
  list.all(calls, ______________________)
}
assert list.length(all_pairs_calls(inc, [3, 4, 5, 6, 7, 8])) == 5
assert run_all(all_pairs_calls(inc, [3, 4, 5, 6, 7, 8])) == True
assert run_all(all_pairs_calls(inc, [3, 4, 5, 8, 7, 8])) == False
assert run_all([]) == True


pub fn find_pair(s: List(Int)) -> List(Int) {
  case s {
    [] -> []
    [x, ..rest] ->
      case ______________________________ {
        True -> ________________
        False -> ________________
      }
  }
}
assert find_pair([979, 1721, 366, 299, 675, 1456]) == [1721, 299]
assert find_pair([2000, 20]) == [2000, 20]
assert find_pair([1, 1010, 3, 1010]) == [1010, 1010]


pub fn no_eleven(n: Int) -> List(List(Int)) {
  case n {
    0 -> ________
    1 -> [[6], [1]]
    _ ->
      list.append(
        list.map(____________, fn(s) { [6, ..s] }),
        list.map(____________, fn(s) { ______________ }),
      )
  }
}
assert no_eleven(0) == [[]]
assert no_eleven(2) == [[6, 6], [6, 1], [1, 6]]
assert no_eleven(3)
  == [[6, 6, 6], [6, 6, 1], [6, 1, 6], [1, 6, 6], [1, 6, 1]]
assert no_eleven(4)
  == [[6, 6, 6, 6], [6, 6, 6, 1], [6, 6, 1, 6], [6, 1, 6, 6],
      [6, 1, 6, 1], [1, 6, 6, 6], [1, 6, 6, 1], [1, 6, 1, 6]]


pub fn smaller(s: List(Int), t: List(Int)) -> List(Int) {
  // Implementation omitted
}

pub fn combo(a: List(Int), b: List(Int)) -> List(Int) {
  case a, b {
    [], _ -> ____
    _, [] -> a
    [x, ..ar], [y, ..br] if x == y -> ______________________
    [x, ..ar], [y, ..br] ->
      smaller(____________________, ____________________)
  }
}
assert combo([5, 3, 1], [4, 3, 2]) == [4, 5, 3, 1, 2]
assert combo([5, 3, 1], [4, 3, 2, 1]) == [4, 5, 3, 2, 1]
assert combo([1, 2, 3, 4], [9, 1, 2, 3]) == [9, 1, 2, 3, 4]
assert combo([], [3, 2, 1]) == [3, 2, 1]


pub fn promote(f: fn(a) -> Bool, s: List(a)) -> List(a) {
  __________(list.filter(s, __________), list.filter(s, __________))
}
assert promote(fn(x) { x % 2 == 0 }, [1, 2, 3, 4, 5, 6, 7])
  == [2, 4, 6, 1, 3, 5, 7]
assert promote(fn(x) { x % 2 == 1 }, [1, 2, 3, 4, 5, 6, 7])
  == [1, 3, 5, 7, 2, 4, 6]
assert promote(fn(x) { x > 100 }, [1, 2, 3]) == [1, 2, 3]
pub fn curry(f: fn(a, b) -> c) -> fn(a) -> fn(b) -> c {
  fn(x) { fn(y) { f(x, y) } }
}
 
pub fn curry_call(f: fn(x, y) -> r) -> fn(fn(z) -> x, fn(y) -> z) -> fn(y) -> r {
  fn(x, g) { fn(y) { f(x(g(y)), y) } }
}
 
pub fn less_than(x: Int, y: Int) -> Bool {
  x < y
}
 
pub fn first(s: List(Int)) -> Int {
  let assert [x, ..] = s
  x
}
 
pub fn bigger_first(s: List(Int)) -> List(Int) {
  ______________________________________________(s)
}
assert bigger_first([3, 1, 4, 1, 5, 9, 2, 6]) == [4, 5, 9, 6, 3, 1, 1, 2]
assert bigger_first([5, 1, 2]) == [5, 1, 2]
assert bigger_first([1, 2, 3]) == [2, 3, 1]


fn draw(shape_slider: Int) -> Int {
  case True {
    True -> abs(3)
    False -> abs(1)
  }
}
fn draw(shape_slider: Int) -> Point {
  case abs(2) {
    2 -> Point(1, 2)
    _ -> Point(0, 0)
  }
}
fn twin(x: Int) -> Point {
  Point(x, x)
}

fn draw(shape_slider: Int) -> Point {
  twin(abs(3))
}
fn pair(x: Int, y: Int) -> Point {
  Point(x, y)
}

fn draw(shape_slider: Int) -> Point {
  pair(abs(3), case True {
    True -> 2
    False -> 0
  })
}


pub fn simplify(expr: Expr) -> Expr {
  case expr {
    Binary(operator, left, right) ->
      case ____________(__________), ____________(__________) {
        N(a), N(b) -> __________________________________
        l, r -> __________________________________
      }
    _ -> ____________
  }
}

assert simplify(Binary(Add, Var("x"), Binary(Mul, N(2), N(3))))
  == Binary(Add, Var("x"), N(6))
assert simplify(Binary(Mul, Binary(Sub, N(5), N(1)), N(2))) == N(8)
assert simplify(Binary(Add, Binary(Add, Var("x"), N(1)), Binary(Add, N(2), N(3))))
  == Binary(Add, Binary(Add, Var("x"), N(1)), N(5))
assert simplify(Var("x")) == Var("x")


pub fn substitute(expr: Expr, name: String, replacement: Expr) -> Expr {
  case expr {
    Var(v) if ____________ -> ____________
    Var(_) | N(_) -> ____________
    Binary(operator, left, right) -> {
      let new_left = ____________(___________, ___________, ___________)
      let new_right = ____________(___________, ___________, ___________)
      Binary(___________, ___________, ___________)
    }
  }
}

assert substitute(Binary(Add, Var("x"), Var("y")), "x", N(4))
  == Binary(Add, N(4), Var("y"))
assert substitute(Binary(Mul, Var("x"), Var("x")), "x", Binary(Sub, Var("a"), N(1)))
  == Binary(Mul, Binary(Sub, Var("a"), N(1)), Binary(Sub, Var("a"), N(1)))
assert substitute(Binary(Mul, N(2), Var("y")), "x", N(9))
  == Binary(Mul, N(2), Var("y"))


pub fn curry(f: UserFn, arg: Int) -> Result(UserFn, EvalError) {
  case f.params {
    [] -> Error(WrongArgumentCount(want: 0, got: 1))
    [first, ..rest] -> {
      let new_body = ____________(___________, ___________, ___________)
      Ok(UserFn(___________, ___________))
    }
  }
}

assert curry(UserFn(["x", "y"], Binary(Sub, Var("y"), Var("x"))), 1)
  == Ok(UserFn(["y"], Binary(Sub, Var("y"), N(1))))
assert curry(UserFn(["c"], Binary(Add, N(10), Var("c"))), 1)
  == Ok(UserFn([], Binary(Add, N(10), N(1))))
assert curry(UserFn([], N(7)), 1) == Error(WrongArgumentCount(want: 0, got: 1))


pub fn compose(f: UserFn, g: UserFn) -> Result(UserFn, EvalError) {
  case f.params {
    _______ -> {
      let new_body = ____________(___________, ___________, ___________)
      Ok(UserFn(___________, ___________))
    }
    params -> Error(WrongArgumentCount(want: ___________(______), got: 1))
  }
}

assert compose(
    UserFn(["x"], Binary(Mul, Var("x"), Var("x"))),
    UserFn(["x", "y"], Binary(Sub, Var("y"), Var("x"))),
  )
  == Ok(UserFn(
    ["x", "y"],
    Binary(Mul, Binary(Sub, Var("y"), Var("x")), Binary(Sub, Var("y"), Var("x"))),
  ))
assert compose(UserFn(["x", "y"], Binary(Sub, Var("y"), Var("x"))), UserFn(["x"], Var("x")))
  == Error(WrongArgumentCount(want: 2, got: 1))


