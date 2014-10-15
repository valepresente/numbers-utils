NumbersUtils.js
===============

A great coffee utils to work with numbers. 

Signatures
----------

First, the programmer needs to instanciate `NumbersUtils` class.

```coffee
numberUtils = new NumberUtils
```

In sequence, the result object has the follow methods


### .toFloat(amount)

```coffee
numberUtils.toFloat '11.2'
-> 11.2
numberUtils.toFloat '3,000.00'
-> 3000
```

### .toCurrency(amount, precision)

```coffee
numberUtils.toCurrency 21202001201.2, 4
-> '21,202,001,201.20000'
```

#### Contributors
* [@igorescobar](https://github.com/igorescobar)
* [@dgmike](https://github.com/dgmike)
