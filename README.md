# poker-data-sets

This repo encompasses some data sets for poker created by my [simulator](https://github.com/swdauer/card-simulation)

## texasHoldEmHeadsUp Description

These filenames have the form "texasHoldEmHeadsUp_\<i\>_\<n\>.csv" where \<i\> is the file number and \<n\> is the number of data points.

### Schema

The header is

```
hand1_0,hand1_1,h1_type,hand2_0,hand2_1,h2_type,board_0,board_1,board_2,board_3,board_4,winner
```

- `hand1_j` is the j'th card of the first player's hand
- `hand2_j` is the j'th card of the second player's hand
- `h1_type` is the "type" of the first player's hand e.g. flush, three of a kind, pair
- `h2_type` is the same but for the second player
- `board_j` is the j'th card of the board
- `winner` is the winner of the hand i.e. 1 is a first player win, 2 is a second player win, and 0 is a tie

    Note: `j` is an integer which lies in the range `[0,numCards)`
