import Cocoa


enum TaskError: Error {
    case emptyArray
    case notASquareMatrix
}

func findSurroundingsOfX(input: [[ String ]]) throws -> [[String]] {
    var array = input
    
    // Base checks
    if array.count == 0  {  throw TaskError.emptyArray  }
    if !checkForSquareMatrix(matrix: array) {    throw TaskError.notASquareMatrix    }
    
    for i in 0..<array.count {
        for j in 0..<array[i].count {
            var numberOfXs = 0
            
            if array[i][j] == "X" { continue    }
            
            // left
            if (j - 1) >= 0 && array[i][j - 1] == "X"  {
                numberOfXs += 1
            }
            
            // right
            if (j + 1) < array[i].count && array[i][j + 1] == "X" {
                numberOfXs += 1
            }
            
            // top
            if (i - 1) >= 0 && array[i - 1][j] == "X"  {
                numberOfXs += 1
            }
            
            // bottom
            if (i + 1) < array.count && array[i + 1][j] == "X" {
                numberOfXs += 1
            }
            
            // top left
            if (j - 1) >= 0 && (i - 1) >= 0 && array[i - 1][j - 1] == "X" {
                numberOfXs += 1
            }
            
            // top right
            if (j + 1) < array[i].count && (i - 1) >= 0 && array[i - 1][j + 1] == "X" {
                numberOfXs += 1
            }
            
            // bottom left
            if (j - 1) >= 0 && (i + 1) < array.count && array[i + 1][j - 1] == "X" {
                numberOfXs += 1
            }
            
            // bottom right
            if (j + 1) < array[i].count && (i + 1) < array.count && array[i + 1][j + 1] == "X" {
                numberOfXs += 1
            }
            
            array[i][j] = "\(numberOfXs)"
        }
    }
    
    return array
}

func checkForSquareMatrix(matrix: [[ String ]]) -> Bool {
    // check for square matrix
    var isSquareMatrix = true
    for i in 0..<matrix.count {
        if matrix[i].count != matrix.count {
            isSquareMatrix = false
        }
    }
    return isSquareMatrix
}

func print2dArray(input: [[String]]) {
    for i in 0..<input.count {
        var string = "["
        for j in 0..<input[i].count {
            string += " \(input[i][j]) "
        }
        string += "]"
        string += "\n"
        print(string)
    }
}

let input = [ [ "X", "0" , "0" ], [ "0", "0", "0" ], [ "X", "X", "0" ] ]
print2dArray(input: input)
do {
    let result = try findSurroundingsOfX(input: input)
    print2dArray(input: result)
} catch let ex {
    print(ex.localizedDescription)
}
