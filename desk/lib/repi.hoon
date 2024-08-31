|%
++  prime-list
  ^-  (list @)
  :~  101
      103
      107
      109
      113
      127
      131
      137
      139
      149
      151
      157
      163
      167
      173
      179
      181
      191
      193
      197
      199
      211
      223
      227
      229
  ==

++  ship-to-prime-index
  |=  s=@p
  ^-  @
  (mod (mug s) (lent prime-list))

++  ship-to-prime
  |=  s=@p
  ^-  @
  (snag (ship-to-prime-index s) prime-list)

++  mul-mod
  |=  [a=@ b=@ m=@]
  (mod (mul a b) m)

++  process-list
  |=  pals=(list @p)
  ^-  [product=@ pal-primes=(list [=@p =@])]
  =/  acc=[product=@ pal-primes=(list [=@p =@])]  [1 ~]
  =/  m=@  :(pow 2 64)  :: 2^64, our modulus
  |-
  ?~  pals  acc
  =/  prime=@  (ship-to-prime i.pals)
  %=  $
    pals  t.pals
    acc  [(mul-mod product.acc prime m) [[i.pals prime] pal-primes.acc]]
  ==

++  get-overlap
  |=  [my-pals=(list @p) their-product=@]
  ^-  (list @p)
  =/  [my-product=@ my-pal-primes=(list [=@p =@])]
    (process-list my-pals)
  %+  turn
    %+  skim  my-pal-primes
    |=  [=@p prime=@]
    =(0 (mod their-product prime))
  |=([=@p *] p)

++  compare-lists
  |=  [my-pals=(list @p) their-pals=(list @p)]
  ^-  (list @p)
  =/  [their-product=@ *]  (process-list their-pals)
  (get-overlap my-pals their-product)
--
