
import Foundation

/* 1. Написать функцию, которая определяет, четное число или нет. */

func parity(number: Int) {
   number % 2 == 0 ? print("Число четное") : print("Число нечетное")
}

parity(number: 24)
parity(number: 21)

/* 2. Написать функцию, которая определяет, делится ли число без остатка на 3. */
// Чтобы не повторять функцию первой задачи, сделал другим способом:

func whithoutThree(number: Int) {
   if number % 3 == 0 {
        print("Число \(number) делится без остатка на 3")
    } else {
        print("Число \(number) не делится без остатка на 3")
    }
}

whithoutThree(number: 23)
whithoutThree(number: 12)


/* 3. Создать возрастающий массив из 100 чисел. */

var arrayHundred = Array(1...100)

/* 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3. */
//Поломав голову часок и немного погуглив, разобравшись пришел к 2м вариантам, но для варианта с фильтром не подходит функция из 1 и 2 задания, пришлось написать новую)))

//Вариант 1
func evenOrTriples (_ numb: Int) -> Bool {
    return (numb % 2 == 0) || (numb % 3 == 0)
}
let delete = arrayHundred.filter { !evenOrTriples($0) }

//print(delete)

//Вариант 2
for deleteElement in arrayHundred {
    if (deleteElement % 2 == 0 || deleteElement % 3 == 0), let delete = arrayHundred.firstIndex(of: deleteElement) {
        arrayHundred.remove(at: delete)
    }
}
//print(arrayHundred)


/* 5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов. */

func fibonacciSequence (n: Int) -> [Int]  {

    var fibonacciArray: [Int] = []

    for n in 0...n {

        if n == 0 {
            fibonacciArray.append(0)
        }
        else if n == 1 {
            fibonacciArray.append(1)
        }
        else {
            fibonacciArray.append (fibonacciArray[n-1] + fibonacciArray[n-2] )
        }
    }
    return fibonacciArray
}

print(fibonacciSequence(n: 50))

