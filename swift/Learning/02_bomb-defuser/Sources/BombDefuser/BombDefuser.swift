let flip: (_ tuple: (String, String, String)) -> (String, String, String) = {
    return ($0.1, $0.0, $0.2)
}

let rotate: (_ tuple: (String, String, String)) -> (String, String, String) = {
    return ($0.1, $0.2, $0.0)
}

func makeShuffle(
  flipper: @escaping ((String, String, String)) -> (String, String, String),
  rotator: @escaping ((String, String, String)) -> (String, String, String)
) -> (UInt8, (String, String, String)) -> (String, String, String) {
    return { id, wireTuple in
        var returnTuple = wireTuple
        var key = id
        for _ in 0...7 {
          if key.isMultiple(of: 2) {
            print("flip")
            returnTuple = flipper(returnTuple)
          } else {
            print("rotate")
            returnTuple = rotator(returnTuple)
          }
          key /= 2
        }
        return returnTuple
    }
}
