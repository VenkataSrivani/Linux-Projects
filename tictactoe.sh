#!/bin/bash
#simple tictac toe game
#code by venkata srivani yeduru
#Initialize the board
board=(1 2 3 4 5 6 7 8 9)

#Display the board
display_board() {
  echo " ${board[0]} | ${board[1]} | ${board[2]} "
  echo "---|---|---"
  echo " ${board[3]} | ${board[4]} | ${board[5]} "
  echo "---|---|---"
  echo " ${board[6]} | ${board[7]} | ${board[8]} "
}

#Check if the current player has won

check_winner() {
  local player=$1

#Check rows, columns, and diagonals

if [[ "${board[0]}" == "$player" && "${board[1]}" == "$player" && "${board[2]}" == "$player" ]] ||
   [[ "${board[3]}" == "$player" && "${board[4]}" == "$player" && "${board[5]}" == "$player" ]] ||
   [[ "${board[6]}" == "$player" && "${board[7]}" == "$player" && "${board[8]}" == "$player" ]] ||
   [[ "${board[0]}" == "$player" && "${board[3]}" == "$player" && "${board[6]}" == "$player" ]] ||
   [[ "${board[1]}" == "$player" && "${board[4]}" == "$player" && "${board[7]}" == "$player" ]] ||
   [[ "${board[2]}" == "$player" && "${board[5]}" == "$player" && "${board[8]}" == "$player" ]] ||
   [[ "${board[0]}" == "$player" && "${board[4]}" == "$player" && "${board[8]}" == "$player" ]] ||
   [[ "${board[2]}" == "$player" && "${board[4]}" == "$player" && "${board[6]}" == "$player" ]]; then
echo "Player $player wins!"
exit
fi
}

#Check if the game is a draw

check_draw() {
  for i in "${board[@]}"; do
      if [[ "$i" =~ [0-9] ]]; then
   return
fi
done
echo "It's a draw!"
exit
}

# Main game loop
while true; do
  display_board

  # Player X move
  echo -n "Player X, enter your move (1-9): "
  read -r move
  if [[ "${board[move-1]}" =~ [0-9] ]]; then
    board[move-1]="X"
  else
    echo "Invalid move, try again."
    continue
  fi
  check_winner "X"
  check_draw

  display_board

  # Player O move
  echo -n "Player O, enter your move (1-9): "
  read -r move
  if [[ "${board[move-1]}" =~ [0-9] ]]; then
    board[move-1]="O"
  else
    echo "Invalid move, try again."
    continue
  fi
  check_winner "O"
  check_draw
done
