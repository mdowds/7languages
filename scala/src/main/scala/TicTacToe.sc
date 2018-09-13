def hasWinner(tiles: List[String]): Boolean = tiles.forall(_ == "X") || tiles.forall(_ == "O")

class TileSet(first: String, second: String, third: String) {
  def this(list: List[String]) = this(list(0), list(1), list(2))
  val tiles = List(first, second, third)
  val winner = if(hasWinner(tiles)) tiles.head else null
}

type Row = TileSet
type Column = TileSet
type Diagonal = TileSet

class Board(firstRow: Row, secondRow: Row, thirdRow: Row) {
  private val rows = List(firstRow, secondRow, thirdRow)

  def winner(): String = {
    if(rowsWithWinner.nonEmpty) return rowsWithWinner.head.winner + " is a row winner!"
    if(columnsWithWinner.nonEmpty) return columnsWithWinner.head.winner + " is a column winner!"
    if(diagonalsWithWinner.nonEmpty) return diagonalsWithWinner.head.winner + " is a diagonal winner!"

    "No winner"
  }

  private val rowsWithWinner = rows.filter(_.winner != null)

  private val columnsWithWinner = {
    (0 to 2).map({ columnIndex =>
      new Column(rows.map(_.tiles(columnIndex)))
    }).filter(_.winner != null)
  }

  private val diagonalsWithWinner = {
    val firstDiagonal = new Diagonal(rows(0).tiles(0), rows(1).tiles(1), rows(2).tiles(2))
    val secondDiagonal = new Diagonal(rows(0).tiles(2), rows(1).tiles(1), rows(2).tiles(0))

    List(firstDiagonal, secondDiagonal).filter(_.winner != null)
  }
}

val boardWithRowWinner = new Board(
  new Row("X","X","X"),
  new Row("X"," ","O"),
  new Row("O","X","X")
)

println(boardWithRowWinner.winner())

val boardWithColumnWinner = new Board(
  new Row("O","X","X"),
  new Row("O"," ","O"),
  new Row("O","X","X")
)

println(boardWithColumnWinner.winner())

val boardWithDiagonalWinner = new Board(
  new Row("O","X","X"),
  new Row("X","O","O"),
  new Row("O","X","O")
)

println(boardWithDiagonalWinner.winner())

val boardWithNoWinner = new Board(
  new Row("O","O","X"),
  new Row("X","X","O"),
  new Row("O","X","O")
)

println(boardWithNoWinner.winner())
