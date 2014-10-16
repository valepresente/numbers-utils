class @NumbersUtils
  # from http://stackoverflow.com/a/22477069/1129927
  _round: (amount, digits) ->
    digits = Math.floor(digits)
    return Math.round amount if isNaN(digits) || digits == 0
    throw 'RangeError: NumbersUtils.round() digits argument must be between 0 and 16' if digits < 0 || digits > 16
    multiplicator = Math.pow 10, digits
    Math.round(amount * multiplicator) / multiplicator

  _fixed: (amount, digits) ->
    digits = Math.floor digits
    return Math.round(amount).toString() if isNaN(digits) || digits == 0
    parts = @_round(amount, digits).toString().split '.'
    fraction = if parts.length == 1 then '' else parts[1]
    fraction += new Array(digits - fraction.length + 1).join('0') if digits > fraction.length
    parts[0] + '.' + fraction

  toFloat: (amount) ->
    if typeof amount == "string"
      amount = parseFloat amount.replace(/[,]+/g, "")
    else if typeof amount != "number"
      amount = false
    amount

  toCurrency: (amount, precision = 2) ->
    amount = @_fixed @toFloat(amount), precision
    # from http://blog.stevenlevithan.com/archives/commafy-numbers
    amount.replace /(^|[^\w.])(\d{4,})/g,
      ($0, $1, $2) -> $1 + $2.replace /\d(?=(?:\d\d\d)+(?!\d))/g, "$&,"
