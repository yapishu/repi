### %repi

compare lists of `@p`s for overlap without revealing non-overlapping values

```hoon
:repi &set-pals `(list @p)`~[~fen ~bus ~dev ~fed]
:repi &set-their-product .^(@ %gx /=repi=/get-my-product/noun)
:repi &set-pals `(list @p)`~[~zod ~bus ~dev ~wet]
=my-product .^(@ %gx /=repi=/get-my-product/noun)
:repi &noun %compare-pals
```
