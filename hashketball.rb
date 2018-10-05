require "pry"

def game_hash
  game_hash = {
    :home => {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    :away => {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
  game_hash
end

def num_points_scored(name)
  answer = nil
   game_hash.each do |team, hash|
    if game_hash[team][:players].has_key?(name)
      answer = game_hash[team][:players][name][:points]
    end
  end 
   answer
end


def shoe_size(name)
  answer = nil
  game_hash.each do |team, hash|
    if game_hash[team][:players].has_key?(name)
      answer = game_hash[team][:players][name][:shoe]
    end
  end 
  answer
end

def team_colors(team_string)
  answer = nil
  game_hash.each do |team, hash|
    if game_hash[team][:team_name] == team_string
      answer = game_hash[team][:colors]
    end
  end
  answer
end

def team_names
  answer = []
  game_hash.each do |team, hash|
    answer.push(game_hash[team][:team_name])
  end
  answer
end

def player_numbers(team_string)
  answer = []
  game_hash.each do |team, hash|
    if game_hash[team][:team_name] == team_string
      hash.each do |attributes, hash_of_details|
       game_hash[team][:players].each do |player, hash_of_stats|
        answer.push(game_hash[team][:players][player][:number])
      end
      end
    end
  end
  answer.uniq
end

def player_stats(name)
  answer = {}
  game_hash.each do |team, hash|
    if game_hash[team][:players].has_key?(name)
      answer = game_hash[team][:players][name]
    end
  end
  answer
end

def big_shoe_rebounds
  biggest_shoe = 0
  player_with_biggest_shoe = ""
  player_rebound = nil
  game_hash.each do |team, hash|
    game_hash[team].each do |attributes, hash_of_details|
      if attributes == :players
        game_hash[team][:players].each do |name, hash_of_stats|
          game_hash[team][:players][name].each do |statistic, value|
            if statistic == :shoe && value > biggest_shoe
              biggest_shoe = value
              player_with_biggest_shoe = name
            end
          end
        end
      end
    end
  end
   game_hash.each do |team, hash|
    if game_hash[team][:players].has_key?(player_with_biggest_shoe)
      player_rebound = game_hash[team][:players][player_with_biggest_shoe][:rebounds]
    end
  end 
   player_rebound
end



def most_points_scored
  points_scored = 0
  player_with_most_points = ""
  game_hash.each do |team, hash|
    game_hash[team].each do |attributes, hash_of_details|
      if attributes == :players
        game_hash[team][:players].each do |name, hash_of_stats|
          game_hash[team][:players][name].each do |statistic, value|
            if statistic == :points && value > points_scored
              points_scored = value
              player_with_most_points = name
            end
          end
        end
      end
    end
  end
  player_with_most_points
end


def winning_team
  team1 = 0 
  team2 = 0 
  winning_team_name = ""
  game_hash.each do |team, hash|
    if team == :home
      game_hash[:home][:players].each do |name, hash_of_stats|
        game_hash[:home][:players][name].each do |statistic, value|
          if statistic == :points
            team1 += value
          end
        end
      end
    else
       game_hash[:away][:players].each do |name, hash_of_stats|
        game_hash[:away][:players][name].each do |statistic, value|
          if statistic == value
            team2 += points 
          end
        end
      end
    end
    if team1 > team2
      winning_team_name = game_hash[:home][:team_name]
    elsif team2 > team1
      winning_team_name = game_hash[:away][:team_name]
    else
      winning_team_name = "It's a draw!"
    end
    winning_team_name
  end
end

def player_with_longest_name
  name_length = 0 
  player_name = ""
  game_hash.each do |team, hash|
    game_hash[team].each do |attributes, hash_of_details|
      if attributes == :players
        game_hash[team][:players].each do |name, hash_of_stats|
          if name.length > name_length
            name_length = name.length
            player_name = name
          end
        end
      end
    end
  end
 player_name        
end

def long_name_steals_a_ton?
  steals = 0 
  name_of_player_with_most_steals = ""
  game_hash.each do |team, hash|
    game_hash[team].each do |attributes, hash_of_details|
      if attributes == :players
        game_hash[team][:players].each do |name, hash_of_stats|
          game_hash[team][:players][name].each do |statistic, value|
            if statistic == :steals && value > steals
              steals = value
              name_of_player_with_most_steals = name
            end
          end
        end
      end
    end
  end
  if name_of_player_with_most_steals == player_with_longest_name
     true 
  else
     false
  end
end

long_name_steals_a_ton?