class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless game[0][1] =~ /^[prs]$/i and game[1][1] =~ /^[prs]$/i

  case game[0][1]
  when /p/i
    return game[1] if game[1][1] =~ /s/i
  when /r/i
    return game[1] if game[1][1] =~ /p/i
  when /s/i
    return game[1] if game[1][1] =~ /r/i
  end

  game[0]  
end

def rps_tournament_winner(t)
  if t[0][0].is_a?(String)
    return rps_game_winner(t)
  else
    return rps_game_winner( [rps_tournament_winner(t[0]), rps_tournament_winner(t[1])] )    
  end
end
