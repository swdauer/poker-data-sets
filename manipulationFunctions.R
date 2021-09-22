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

ranks <- c("A", "K", "Q", "T", "9", "8", "7", "6", "5", "4", "3", "2")

possibleHandRanks <- lapply(ranks, function(y) lapply(ranks[match(y,ranks):length(ranks)],function(x) c(y, x)))

winRateHand1 <- function(set, lowRank, highRank, suited) {
  if (suited) {
    nrow(set[hasRanks(set$hand1_0, set$hand1_1, lowRank, highRank) & suited(set$hand1_0, set$hand1_1) & set$winner == 1,]) /
      nrow(set[hasRanks(set$hand1_0, set$hand1_1, lowRank, highRank) & suited(set$hand1_0, set$hand1_1),])
  } else {
    nrow(set[hasRanks(set$hand1_0, set$hand1_1, lowRank, highRank) & !suited(set$hand1_0, set$hand1_1) & set$winner == 1,]) /
      nrow(set[hasRanks(set$hand1_0, set$hand1_1, lowRank, highRank) & !suited(set$hand1_0, set$hand1_1),])
  }
}
