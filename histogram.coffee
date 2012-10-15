class Histogram
  module.exports = Histogram
  constructor: (@binBorders) ->
    @binBorders.push Infinity
    @binsNumber = @binBorders.length
    @bins = new Array(@binsNumber)
    for bin,k in @bins
      @bins[k] = 0
    
  update: (value) ->
    bindex = 0
    while (bindex<(@binsNumber-1)&&value>@binBorders[bindex])
      bindex++
    @bins[bindex]++
   
  status: ->
    status = []
    last = "-Infinity"
    for bin,k in @bins
      current = @binBorders[k]
      range = "#{last}-#{current}"
      status[range]=bin
      last = current
    return status
