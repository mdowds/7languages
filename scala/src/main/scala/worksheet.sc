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
