val a = 0 to 10
a.foreach(x => println(x))

val b = 0 until 10
b.foreach(x => println(x))

class Compass {
  println("Directions! " + Compass.directions)
}

object Compass {
  val directions = List("n","e","s","w")
}

println("Create compass")
val myCompass = new Compass()

def printAny(x: Any): Unit = println(x)
printAny("foo")

// Fold with operator
val list = List(1,2,3)
val sum = (0 /: list) { (sum, x) => sum + x }

// Fold with method
list.foldLeft(0)((sum, x) => sum + x )
