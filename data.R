ranks <- as.array(c("2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"))

handRanks <- Reduce(rbind, apply(ranks, c(1), function(x) {
  t(apply(as.array(ranks[match(x, ranks):length(ranks)]), c(1), function(y) {
    as.array(c(x, y))
  }))
}))

allHands <- Reduce(rbind, apply(handRanks, c(1), function(x) {
  if (x[1] == x[2]) {
    as.array(c(x[1], x[2], FALSE))
  } else {
    rbind(as.array(c(x[1], x[2], FALSE)),
          as.array(c(x[1], x[2], TRUE)))
  }
}))

firstSet <- read.csv("texasHoldEmHeadsUp_01_1000000.csv")
secondSet <- read.csv("texasHoldEmHeadsUp_02_1000000.csv")
thirdSet <- read.csv("texasHoldEmHeadsUp_03_1000000.csv")
fourthSet <- read.csv("texasHoldEmHeadsUp_04_1000000.csv")
fifthSet <- read.csv("texasHoldEmHeadsUp_05_1000000.csv")
sixthSet <- read.csv("texasHoldEmHeadsUp_06_1000000.csv")
seventhSet <- read.csv("texasHoldEmHeadsUp_07_1000000.csv")
eighthSet <- read.csv("texasHoldEmHeadsUp_08_1000000.csv")
ninthSet <- read.csv("texasHoldEmHeadsUp_09_1000000.csv")
tenthSet <- read.csv("texasHoldEmHeadsUp_10_1000000.csv")

totalSet <- rbind(firstSet,
                  secondSet,
                  thirdSet,
                  fourthSet,
                  fifthSet,
                  sixthSet,
                  seventhSet,
                  eighthSet,
                  ninthSet,
                  tenthSet)
