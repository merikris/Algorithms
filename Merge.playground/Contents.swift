import Foundation

func merge(array1 array1: [Int], array2: [Int], result: [Int] = []) -> [Int] {
    if array1.isEmpty  || array2.isEmpty {
        return result + array1 + array2
    }
    
    var array1 = array1
    var array2 = array2
    var result = result
    
    if array1[0] < array2[0] {
        result.append(array1[0])
        array1.removeFirst()
    }
    else {
        result.append(array2[0])
        array2.removeFirst()
    }
    
    return merge(array1: array1, array2: array2, result: result)
}

func mergeSort(array: [Int]) -> [Int] {
    if array.count <= 1 {
        return array
    }
    
    let index = Int(ceil(Double(array.count) / 2.0))
    let half1 = Array(array.prefix(index))
    let half2 = Array(array.suffix(array.count - index))
    
    return merge(array1: mergeSort(half1), array2: mergeSort(half2))
}

let array = [3, 6, 1, 4, 2, 9, 8, 4, 8]

mergeSort(array)
