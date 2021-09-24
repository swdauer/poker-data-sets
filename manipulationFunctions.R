getSuit <- function(card) {
  substr(as.character(card),2,2)
}

getRank <- function(card) {
  substr(as.character(card),1,1)
}

hasRanks <- function(lowCard, highCard, lowRank, highRank) {
  getRank(lowCard) == lowRank & getRank(highCard) == highRank
}

suited <- function(lowCard, highCard) {
  getSuit(lowCard) == getSuit(highCard)
}

occurHandI <- function(set, playerNum, lowRank, highRank, suited) {
  card1 = paste0("hand", toString(playerNum), "_0")
  card2 = paste0("hand", toString(playerNum), "_1")
  set[hasRanks(set[[card1]],
               set[[card2]],
               lowRank,
               highRank)
      & !xor(suited,suited(set[[card1]], set[[card2]])),]
}

occurAllHandsTables <- function(set, playerNum) {
  apply(allHands, c(1), function(x) occurHandI(set, playerNum, x[1], x[2], str2lang(x[3])))
}
