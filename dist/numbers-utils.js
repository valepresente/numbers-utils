(function() {
  this.NumbersUtils = (function() {
    function NumbersUtils() {}

    NumbersUtils.prototype._round = function(amount, digits) {
      var multiplicator;
      digits = Math.floor(digits);
      if (isNaN(digits) || digits === 0) {
        return Math.round(amount);
      }
      if (digits < 0 || digits > 16) {
        throw 'RangeError: NumbersUtils.round() digits argument must be between 0 and 16';
      }
      multiplicator = Math.pow(10, digits);
      return Math.round(amount * multiplicator) / multiplicator;
    };

    NumbersUtils.prototype._fixed = function(amount, digits) {
      var fraction, parts;
      digits = Math.floor(digits);
      if (isNaN(digits) || digits === 0) {
        return Math.round(amount).toString();
      }
      parts = this._round(amount, digits).toString().split('.');
      fraction = parts.length === 1 ? '' : parts[1];
      if (digits > fraction.length) {
        fraction += new Array(digits - fraction.length + 1).join('0');
      }
      return parts[0] + '.' + fraction;
    };

    NumbersUtils.prototype.toFloat = function(amount) {
      if (typeof amount === "string") {
        amount = parseFloat(amount.replace(/[,]+/g, ""));
      } else if (typeof amount !== "number") {
        amount = false;
      }
      return amount;
    };

    NumbersUtils.prototype.toCurrency = function(amount, precision) {
      if (precision == null) {
        precision = 2;
      }
      amount = this._fixed(this.toFloat(amount), precision);
      return amount.replace(/(^|[^\w.])(\d{4,})/g, function($0, $1, $2) {
        return $1 + $2.replace(/\d(?=(?:\d\d\d)+(?!\d))/g, "$&,");
      });
    };

    return NumbersUtils;

  })();

}).call(this);

//# sourceMappingURL=numbers-utils.js.map
