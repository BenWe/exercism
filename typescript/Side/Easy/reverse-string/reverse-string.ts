export default class ReverseString {
    static reverse(name: String): String {
        const result = []

        for (let i = name.length - 1, j = 0; i >= 0; i--, j++) {
            result[j] = name[i]
        }

        return result.join('')
    }
}