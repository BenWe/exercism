func generateCombination(forRoom room: Int, usingFunction f: (Int) -> Int) -> (Int, Int, Int) {
    return (f(room), f(f(room)), f(f(f(room))))
}

func protectSecret(_ secret: String, withPassword password: String) -> (String) -> String {
    return { pw in
        return pw == password ? secret : "Sorry. No hidden secrets here."
    }
}
