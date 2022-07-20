def mantain_ranks(main_scoreList,playerRank) #This function returns the main resultant rank array of all the players
	score_list = main_scoreList.clone   
	score_list = score_list.push(playerRank)
	score_list = score_list.sort_by{|x| x}.reverse
	puts "Updated Scores #{score_list}"
	rank = []
	position = 1
	n = (score_list.length) 
	for i in 1..n do
			if (score_list[i] == score_list[i-1])    #compairing the score of player with next player and assign the possitions 
				rank << position

			else
				rank<<position                      # in else case no need to compre because the array is already in sorted form
				position = position+1
			end 
	end 
	return rank
end


def climbingTheLeaderBoard(main_scoreList,player)
	score_list = main_scoreList.clone
	length = player.length() 
	i=0
	cal_result =[]
	rank = []
	length.times do                                     #loop to calculate the rank of the player
		add_score = score_list.push(player[i])      #push the first game score to ranked array
		cal_result = add_score.uniq.sort_by{|x| x}.reverse    #getting unique values because same scores shows the same rank
		playerRank = cal_result.index(player[i]) + 1    #getting the index which shows the rank 
		rank << playerRank
		puts "---------------------------------------------"
		puts "player Scored #{player[i]} and his rank is #{playerRank}"
		puts "Rank List is #{mantain_ranks(main_scoreList,player[i])}"
		i = i +1
	end 
	return rank
end 


main_scoreList = [100,60,90,80,75,75]
playerScore = [50,65,77,90,102]
puts "Scores of Players:  #{main_scoreList}"
puts "*******************************"
#puts "Player :  #{player}"
#mantain_ranks(score_list,player)
climbingTheLeaderBoard(main_scoreList,playerScore)
