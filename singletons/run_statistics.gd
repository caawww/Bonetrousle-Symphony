extends Node

const SCORE_TO_REWARD_FACTOR: float = 1

var score: int = 0


func add_score(value: int):
	score += value
	print("Score: ", score)


func reset_score():
	score = 0


func get_score() -> int:
	return score


func calculate_rewards() -> int:
	print("Reward: ", score * SCORE_TO_REWARD_FACTOR)
	Currency.add_to_currency(score * SCORE_TO_REWARD_FACTOR)
	return score * SCORE_TO_REWARD_FACTOR
