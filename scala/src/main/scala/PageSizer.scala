import scala.io.Source
import akka.actor._

object PageSizer {

  object PageLoader {
    def getPageSize(url: String): Int = Source.fromURL(url, "ISO-8859-1").mkString.length
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
        val size = PageLoader.getPageSize(url)
        self ! SizeResponse(url, size)
      case SizeResponse(url, size) =>
        println("Size for " + url + ": " + size)
    }
  }

  def getPageSizesSequentially(): Unit = {
    urls.foreach(url => println("Size for " + url + ": " + PageLoader.getPageSize(url)))
  }

  private val system = ActorSystem()
  private val sizer = system.actorOf(Props[Sizer], "Sizer")

  def getPageSizesConcurrently(): Unit = {

    urls.foreach(url =>
      sizer ! SizeRequest(url)
    )
  }


  def main(args: Array[String]): Unit = {
    println("Sequential:")
    timeMethod { getPageSizesSequentially }

    println("Concurrent:")
    // Because the akka implementation is different the timer isn't accurate
    timeMethod { getPageSizesConcurrently }
  }
}
