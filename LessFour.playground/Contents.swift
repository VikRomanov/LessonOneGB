import Cocoa

/* 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
   2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
   3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
   4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
   5. Создать несколько объектов каждого класса. Применить к ним различные действия.
   6. Вывести значения свойств экземпляров в консоль.*/


enum CarEngine: String {
    case on
    case off
}

enum CarDoor {
    case open
    case close
}

enum ColorCar: String {
    case red = "red"
    case green = "green"
    case white = "white"
    case black = "black"
    case blue = "blue"
}

class Cars {
    let brand: String
    let color: ColorCar
    let year: Int
    var door: CarDoor
    var engine: CarEngine {
        willSet {
            newValue == .on ? print ("Engine started") : print ("Engine stopped")
        }
    }
    var km: Double {
        didSet {
            let distance = km - oldValue
            print("Passed a new section with a distance of \(distance)")
        }
    }
    static var carCount = 0

    init(brand: String,
         color: ColorCar,
         year: Int,
         door: CarDoor,
         engine: CarEngine,
         km: Double) {

        self.brand = brand
        self.color = color
        self.year = year
        self.door = door
        self.engine = engine
        self.km = km
        Cars.carCount += 1
    }

    convenience init(brand: String, color: ColorCar) {
        self.brand = brand
        self.color = color
    }

    static func countInfo() {
        print("Автомобилей произведено: \(self.carCount)")
    }

    func closeDoor() {
        door = .close
    }
    func openDoor() {
        door = .open
    }

    func signal () {}

    func printInfoOfCar () {
        print("""
            Car Info:
            - Brand is \(brand)
            - Color is \(color)
            - Production in \(year)
            """)
    }

}



final class Cars: SportCar {

    enum Sunroof {
        case open
        case close
    }

    var sunroof: Sunroof

    init(brand: String,
         color: ColorCar,
         year: Int,
         door: CarDoor,
         engine: CarEngine,
         km: Double,
         sunroof: Sunroof) {
        self.sunroof = sunroof

        super.init(brand: brand, color: color, year: year, door: door, engine: engine, km: km)
    }

    func sunroofOpenClose() {
        sunroof == .open ? print("Люк открыт") : print("Люк закрыт")
    }
    override func signal() {
        super.signal()
        print("Beeeep")
    }
}


final class Cars: TrunkCar {

    enum Webasto {
        case on
        case off
    }

    var webasto: Webasto

    init(brand: String,
         color: ColorCar,
         year: Int,
         door: CarDoor,
         engine: CarEngine,
         km: Double,
         webasto: Webasto) {

        self.webasto = webasto

        super.init(brand: brand, color: color, year: year, door: door, engine: engine, km: km)
    }

    func webastoOnOff() {
        webasto == .on ? print("Прогрев двигателя включен") : print("Прогрев двигателя выключен")
    }
    override func signal() {
        super.signal()
        print("У данной модели нет сигнала")
    }
}


var car = Cars (brand: Volvo, color: red, year: 2000, door: close, engine: off, km: 10000)

var carInitTwo = Cars (brand: Volvo, color: red, year: 2000)

var car1 = SportCar (brand: "Maseratti", color: .black, year: 2015, door: .open, engine: .off, km: 2000, sunroof: close)

var car2 = SportCar (brand: "Porshe", color: .blue, year: 2017, door: .open, engine: .on, km: 500, sunroof: open)

var car3 = TrunkCar (brand: "Ford", color: .green, year: 2003, door: .open, engine: .off, km: 25000, webasto: off)

var car4 = TrunkCar (brand: "Chevrolet", color: .red, year: 1999, door: .open, engine: .on, km: 250000, webasto: on)


car1.sunroof = .open
car2.sunroof = .close
car3.webasto = .on
car4.webasto = .off

car.signal()
car1.signal()
car2.signal()
car3.signal()
car4.signal()

car.printInfoOfCar()
carInitTwo.printInfoOfCar()
car1.printInfoOfCar()
car2.printInfoOfCar()
car3.printInfoOfCar()
car4.printInfoOfCar()
