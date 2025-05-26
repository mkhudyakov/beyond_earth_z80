## Scenarios

| #  | A        | B        | A + B    | Flags Set       | Notes                                     |
|----|----------|----------|----------|-----------------|-------------------------------------------|
| 1  | 00000000 | 00000000 | 00000000 | Z=1             | Zero result                               |
| 2  | 00000000 | 00000001 | 00000001 | -               | No flags set                              |
| 3  | 00001111 | 00000001 | 00010000 | H=1             | Half-carry from bit 3                     |
| 4  | 01111111 | 00000001 | 10000000 | S=1, P/V=1, H=1 | Signed overflow (+127 + 1 → -128)         |
| 5  | 10000000 | 10000000 | 00000000 | Z=1, C=1, P/V=1 | -128 + -128 = 0 with signed overflow      |
| 6  | 11111111 | 00000001 | 00000000 | Z=1, C=1, H=1   | Wraparound with full carry                |
| 7  | 10000000 | 01111111 | 11111111 | S=1             | No overflow (mixed signs), no half-carry  |
| 8  | 11111110 | 00000001 | 11111111 | S=1             | No half-carry, no overflow                |
| 9  | 00000001 | 11111110 | 11111111 | S=1             | Sign set, no overflow, no half-carry      |
| 10 | 01111111 | 11111111 | 01111110 | C=1, H=1        | Carry and half-carry, no signed overflow  |
