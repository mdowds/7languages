def totalSize(strings: List[String]) = strings.foldLeft(0)((total, string) => total + string.length)

trait Censor {

  private val alternatives = Map(
    "shoot" -> "pucky",
    "Shoot" -> "Pucky",
    "darn" -> "beans",
    "Darn" -> "Beans"
  )

  def apply(str: String) = {
    alternatives.foldLeft(str)(
      (censoredStr, alternative) => censoredStr.replace(alternative._1, alternative._2)
    )
  }
}

object Censor extends Censor

Censor.apply("What a darn mess")

Censor.apply("Shoot! I forgot something")
