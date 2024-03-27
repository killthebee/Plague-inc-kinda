func makeCount(_ num: Int) -> String {
    if num >= 100 {
        return String(num)
    } else if num > 9 && num < 100 {
            return "0\(num)"
    } else {
        return "00\(num)"
    }
}
