import scala.io.Source
import akka.actor._

object PageLoader {
  def getPageSize(url: String) = Source.fromURL(url, "ISO-8859-1").mkString.length
}

val urls = List(
  "http://google.co.uk",
  "http://amazon.co.uk"
)

def timeMethod(method: () => Unit): Unit = {
  val start = System.nanoTime
  method()
  val end = System.nanoTime

  println("Method took " + (end-start)/1000000000.0 + " seconds")
}

case class SizeResponse(url: String, size: Int)
case class SizeRequest(url: String)

class Sizer extends Actor {
  override def receive: Receive = {
    case SizeRequest(url) =>
      println("Getting size")
      val size = PageLoader.getPageSize(url)
      self ! SizeResponse(url, size)
    case SizeResponse(url, size) =>
      println("Size for" + url + ": " + size)
  }
}

def getPageSizesSequentially(): Unit = {
  urls.foreach(url => println("Size for " + url + ": " + PageLoader.getPageSize(url)))
}

def getPageSizesConcurrently(): Unit = {
  val system = ActorSystem()
  // Getting intermittent error about not finding a valid constructor on Sizer
  val sizer = system.actorOf(Props[Sizer], "")
  println("Getting concurrently")

//  urls.foreach(url =>
//    sizer ! SizeRequest(url)
//  )
}

//println("Sequential:")
//timeMethod { getPageSizesSequentially }

println("Concurrent:")
timeMethod { getPageSizesConcurrently }
