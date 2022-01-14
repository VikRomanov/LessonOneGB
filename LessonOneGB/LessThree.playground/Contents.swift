import Cocoa

/* 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
   2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
   3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
   4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
   5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
   6. Вывести значения свойств экземпляров в консоль.*/

enum CarEngine: String {
    case on
    case off
}

enum CarWindow {
    case open, close
}

enum CarDoor {
    case open, close
}

enum Transmission {
    case manual
    case auto
}

enum ColorCar: String {
    case red = "red"
    case green = "green"
    case white = "white"
    case black = "black"
    case blue = "blue"
}

struct SportCar {
    let brand: String
    let transmission: Transmission
    let color: ColorCar
    let year: Int
    let horsePower: Int
    var door: CarDoor
    var engine: CarEngine {
        willSet {
            newValue == .on ? print ("Engine started") : print ("Engine stopped")
        }
    }
    var window: CarWindow {
        willSet {
            newValue == .open ? print("Windows open") : print("Windows close")
        }
    }
    var trunkVolumeLiters: Int {
        willSet {
            if newValue == trunkVolumeLiters {
                print("Trunk FULL")
            }
            if newValue < trunkVolumeLiters {
                print("In the trunk: \(newValue)/\(trunkVolumeLiters) liters")
            } else {
                print("Your volume exceeds the volume of the trunk")
            }
        }
    }
    var km: Double {
        didSet {
            let distance = km - oldValue
            print("Passed a new section with a distance of \(distance)")
        }
    }

    mutating func closeDoor() {
        self.door = .close
    }
    mutating func openDoor() {
        self.door = .open
    }
    func engineStatus() {
        engine == .on ? print("Engine running") : print("Engine off")
    }

    func printInfoOfCar () { // ПОДГЛЯНУЛ как у Ореста)) саму идею)
        print("""
            Car Info:
            - Brand is \(brand)
            - Transmission: \(transmission)
            - Color is \(color)
            - MAX trunk volume: \(trunkVolumeLiters)
            - Horse power: \(horsePower)
            - Production in \(year)
            """)
    }

}


struct TrunkCar {
    let brand: String
    let transmission: Transmission
    let color: ColorCar
    let year: Int
    let horsePower: Int
    var door: CarDoor
    var engine: CarEngine {
           willSet {
               newValue == .on ? print ("Engine started") : print ("Engine stopped")
           }
       }
       var window: CarWindow {
           willSet {
               newValue == .open ? print("Windows open") : print("Windows close")
           }
       }
    var trunkVolumeLiters: Int {
        willSet {
            if newValue == trunkVolumeLiters {
                print("Trunk FULL")
            }
            if newValue < trunkVolumeLiters {
                print("In the trunk: \(newValue)/\(trunkVolumeLiters) liters")
            } else {
                print("Your volume exceeds the volume of the trunk")
            }
        }
    }
    var km: Double {
        didSet {
            let distance = km - oldValue
            print("Passed a new section with a distance of \(distance)")
        }
    }

    mutating func closeDoor() {
        self.door = .close
    }
    mutating func openDoor() {
        self.door = .open
    }
    func engineStatus() {
        engine == .on ? print("Engine running") : print("Engine off")
    }
    func printInfoOfCar () {
        print("""
            Car Info:
            - Brand is \(brand)
            - Transmission: \(transmission)
            - Color is \(color)
            - MAX trunk volume: \(trunkVolumeLiters)
            - Horse power: \(horsePower)
            - Production in \(year)
            """)
    }
}

var car1 = SportCar (brand: "Maseratti", transmission: .auto, color: .black, year: 2015, horsePower: 500, door: .open, engine: .off, window: .close, trunkVolumeLiters: 120, km: 2000)

var car2 = SportCar (brand: "Porshe", transmission: .manual, color: .blue, year: 2017, horsePower: 380, door: .open, engine: .on, window: .open, trunkVolumeLiters: 200, km: 500)

var car3 = TrunkCar (brand: "Ford", transmission: .manual, color: .green, year: 2003, horsePower: 250, door: .open, engine: .off, window: .close, trunkVolumeLiters: 900, km: 25000)

var car4 = TrunkCar (brand: "Chevrolet", transmission: .manual, color: .red, year: 1999, horsePower: 190, door: .open, engine: .on, window: .open, trunkVolumeLiters: 1000, km: 250000)

car1.engine = .on
car2.engine = .off
car3.engine = .on
car4.engine = .off

car1.window = .open
car2.window = .close
car3.window = .open
car4.window = .close

car1.km = 2500
car4.km = 270000

car1.trunkVolumeLiters = 300
car2.trunkVolumeLiters = 120
car3.trunkVolumeLiters = 10
car4.trunkVolumeLiters = 1000

car1.engineStatus()
car1.openDoor()
car1.closeDoor()

car1.printInfoOfCar()
car2.printInfoOfCar()
car3.printInfoOfCar()
car4.printInfoOfCar()
