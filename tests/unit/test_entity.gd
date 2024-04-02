extends GutTest


func test_entity_innit_all_zeros():
	var correct_health_values = [1, 1, 1]
	var correct_speed_values = [2, 2, 2]

	var innitialized_entity: Entity = Entity.new("test")

	assert_eq(
		[
			innitialized_entity.health.current_value,
			innitialized_entity.health.max_value,
			innitialized_entity.health.min_value
		],
		correct_health_values
	)
	assert_eq(
		[
			innitialized_entity.speed.current_value,
			innitialized_entity.speed.max_value,
			innitialized_entity.speed.min_value
		],
		correct_speed_values
	)


func test_entity_innit_with_values():
	var correct_health_values = [100, 100, 0]
	var correct_speed_values = [50, 50, 0]

	var innitialized_entity: Entity = Entity.new("skeleton")

	assert_eq(
		[
			innitialized_entity.health.current_value,
			innitialized_entity.health.max_value,
			innitialized_entity.health.min_value
		],
		correct_health_values
	)
	assert_eq(
		[
			innitialized_entity.speed.current_value,
			innitialized_entity.speed.max_value,
			innitialized_entity.speed.min_value
		],
		correct_speed_values
	)
