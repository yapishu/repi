/+  default-agent, dbug
/=  repi  /lib/repi
|%
+$  versioned-state
  $%  state-1
  ==
+$  state-1
  $:  %1
      my-pals=(list @p)
      their-product=(unit @)
  ==
+$  card  card:agent:gall
--
%-  agent:dbug
=|  state-1
=*  state  -
^-  agent:gall
|_  bol=bowl:gall
+*  this  .
    def   ~(. (default-agent this %.n) bol)
::
++  on-init
  ^-  (quip card _this)
  `this(my-pals ~)
::
++  on-save   !>(state)
++  on-load
  |=  old-vase=vase
  ^-  (quip card _this)
  `this(state !<(versioned-state old-vase))
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?+    mark  (on-poke:def mark vase)
      %noun
    ?+    q.vase  (on-poke:def mark vase)
        %compare-pals
      =/  start-time=@da  now.bol
      ~&  >>  "Comparing pals"
      ~&  >>>  "my-pals: {<my-pals>}"
      ~&  >>>  "their-product: {<their-product>}"
      ?~  their-product
        ~|("peer's product not set" !!)
      =/  overlapping-pals=(list @p)
        %+  get-overlap:repi
          my-pals  u.their-product
      ~&  >>  "Overlapping pals: {<overlapping-pals>}"
      ~&  >>  "Time taken: {<(sub now.bol start-time)>}"
      :_  this
      [%give %fact ~[/repi] %pal-overlap !>(overlapping-pals)]~
    ::
        %clear-state
      `this(my-pals ~, their-product ~)
    ==
  ::
      %set-pals
    =/  new-pals=(list @p)  !<((list @p) vase)
    ~&  >>  "Setting pals to {<new-pals>}"
    `this(my-pals new-pals)
  ::
      %set-their-product
    =/  product=@  !<(@ vase)
    ~&  >>  "Setting their product to {<product>}"
    `this(their-product `product)
  ==
::
++  on-watch  on-watch:def
++  on-leave  on-leave:def
++  on-peek
  |=  =path
  ^-  (unit (unit cage))
  ?+    path  (on-peek:def path)
      [%x %get-my-product ~]
    =/  start-time=@da  now.bol
    =/  [my-product=@ *]
      (process-list:repi my-pals)
    ~&  >>  "Calculated my product: {<my-product>}"
    ~&  >>  "Time taken: {<(sub now.bol start-time)>}"
    ``noun+!>(my-product)
  ::
      [%x %get-my-pals ~]
    ``noun+!>(my-pals)
  ==
::
++  on-agent  on-agent:def
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
--
