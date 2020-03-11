En enkelt og nem måde at konvertere til 2 complement:

Gå fra LSB mod MSB, drop alle 0'er og gå til først 1. Dette lades stå som det er, og alt efter (mod venstre) inverteres:

---
- `01010100`  normal
- `10101100`  2 komplement
---
- `0110`  normal
- `1010`  2 komplement
---
- `111011001`  normal
- `000100111`  2 komplement
---
- `001100110011010`  normal
- `110011001100110`  2 komplement
---











`assert(b!=0)` <- bestemmer at noget er som det er assert'ed