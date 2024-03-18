extends GutTest

func test_entity_innit_all_zeros():
	var correct_health_values = [0, 0, 0]
	var correct_speed_values = [0, 0, 0]
	
	var innitialized_entity: Entity = Entity.new(0, 0, 0, 0, 0, 0)
	
	assert_eq([
		innitialized_entity.health.current_value, 
		innitialized_entity.health.max_value, 
		innitialized_entity.health.min_value], correct_health_values)
	assert_eq([
		innitialized_entity.speed.current_value, 
		innitialized_entity.speed.max_value, 
		innitialized_entity.speed.min_value], correct_speed_values)

func test_entity_innit_with_values():
	var correct_health_values = [5, 100, 0]
	var correct_speed_values = [5, 10, 0]
	
	var innitialized_entity: Entity = Entity.new(5, 100, 0, 5, 10, 0)
	
	assert_eq([
		innitialized_entity.health.current_value, 
		innitialized_entity.health.max_value, 
		innitialized_entity.health.min_value], correct_health_values)
	assert_eq([
		innitialized_entity.speed.current_value, 
		innitialized_entity.speed.max_value, 
		innitialized_entity.speed.min_value], correct_speed_values)
