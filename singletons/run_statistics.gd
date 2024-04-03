extends Node

const SCORE_TO_REWARD_FACTOR: float = 0.1

var score: int = 0

func add_score(value: int):
	print("Score: ", score)
	score += value
	
func reset_score():
	score = 0

func calculate_rewards() -> int:
	print("Reward: ", score * SCORE_TO_REWARD_FACTOR)
	return score * SCORE_TO_REWARD_FACTOR
