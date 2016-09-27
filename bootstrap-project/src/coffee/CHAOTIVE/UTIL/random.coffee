class CHAOTIVE.UTIL.Random

  #https://gist.github.com/lukehedger/7322553
  @number: (max,min=0) ->
    # min is set to 0 by default but a different value can be passed to function
    return Math.floor(Math.random() * (max - min) + min)
