NumbersUtils = require('../source/numbers-utils').NumbersUtils

describe 'NumbersUtils', ->
  numberUtils = null

  beforeEach ->
    numberUtils = new NumbersUtils

  describe '#toFloat', ->
    it 'must convert string', ->
      result = numberUtils.toFloat '11.2'
      expect(result).toBe 11.2

    it 'must accept strings with commas', ->
      result = numberUtils.toFloat '3,000.00'
      expect(result).toBe 3000

    it 'must accept integer', ->
      result = numberUtils.toFloat 140
      expect(result).toBe 140

    it 'must accept float', ->
      result = numberUtils.toFloat 20.30
      expect(result).toBe 20.3

    it 'must reset value when only letters', ->
      result = numberUtils.toFloat 'my name is'
      expect(result).toEqual NaN

    it 'must not accept objects', ->
      result = numberUtils.toFloat {}
      expect(result).toBeFalsy()

  describe '#toCurrency', ->
    it 'must accept integer', ->
      result = numberUtils.toCurrency 10
      expect(result).toBe '10.00'

    it 'must accept float', ->
      result = numberUtils.toCurrency 150.26
      expect(result).toBe '150.26'

    it 'must round float', ->
      result = numberUtils.toCurrency 10.357
      expect(result).toBe '10.36'

    it 'must accept string', ->
      result = numberUtils.toCurrency '320'
      expect(result).toBe '320.00'

    it 'must accept precision as second argument', ->
      result = numberUtils.toCurrency 320.324, 4
      expect(result).toBe '320.3240'

    it 'must put commas every three digits', ->
      result = numberUtils.toCurrency 21202001201.2
      expect(result).toBe '21,202,001,201.20'
