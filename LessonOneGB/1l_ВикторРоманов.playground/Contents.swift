import Cocoa

/* 1. Решить квадратное уравнение */

let a: Double = 15
let b: Double = -25
let c: Double = 7 // коэффициенты и свободный член

var discriminant = b * b - 4 * a * c

var x1: Double = 0, x2: Double = 0

if discriminant < 0 {
    print("Корней в уравнении нет")
} else if discriminant == 0 {
    x1 = -b / (2 * a)
    print("Один корень: " + "x = \(x1)")
} else {
    x1 = (-b + sqrt(discriminant) / (2 * a))
    x2 = (-b - sqrt(discriminant) / (2 * a))
    print("Уравнение имеет два корня: " + "x1 =" + String(x1) + ", " + "x2 = " + String(x2))
}


// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

let legOne: Double = 12
let legTwo: Double = 5

var area = (legOne * legTwo) / 2
var hypotenuse = sqrt(legOne * legOne + legTwo * legTwo)
var perimeter = legOne + legTwo + hypotenuse

print("Площадь равна ", area)
print("Периметр равен ", perimeter)
print("Гипотенуза равна ", hypotenuse)

// 3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.


var deposit: Double = 100000

postfix operator %
postfix func % (percent: Int) -> Double {
    return Double(percent) / 100
}
var percent: Double = 7%

//расчитываем процент на каждый год, так как каждый год депозит растет (хотя логичнее циклить на каждый месяц, но я не разобрался как)
let yearOne = deposit + deposit * percent
let yearTwo = yearOne + yearOne * percent
let yearThree = yearTwo + yearTwo * percent
let yearFour = yearThree + yearThree * percent
let yearFive = yearFour + yearFour * percent

print("Сумма вклада через 5 лет: ", Int(yearFive), "рублей")
