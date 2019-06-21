class Combination {
    func combine(list: [String]) -> [[String]]{
        var pairs = [[String]]()
        for i in 0 ..< list.count {
            for j in i + 1 ..< list.count {
                pairs.append([list[i], list[j]])
            }
        }
        return pairs
    }
    
    func getCombinations(persons: [String]) -> [[String]] {
        var array_persons = [String]()
        for person in persons.split(separator: "\n") {
            array_persons.append(contentsOf: person)
        }
        return combine(list: array_persons)
    }
}
