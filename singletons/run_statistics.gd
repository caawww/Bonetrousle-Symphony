extends Node

const SCORE_TO_REWARD_FACTOR: float = 1

var score: int = 0


func add_score(value: int):
	score += value
	get_node("/root/Main").get_node("%Score").text = str(score)


func reset_score():
	score = 0


func get_score() -> int:
	return score


func calculate_rewards() -> int:
	Currency.add_to_currency(score * SCORE_TO_REWARD_FACTOR)
	return score * SCORE_TO_REWARD_FACTOR
