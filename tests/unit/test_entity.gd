extends GutTest


func test_entity_init_all_zeros():
	var correct_health_values = [1.0, 1.0, 1.0]
	var correct_speed_values = [2.0, 2.0, 2.0]
	var correct_attack_speed_values = [1.0, 1.0, 1.0]

	var initialized_entity: Entity = Entity.new("test")

	assert_eq(
		[
			initialized_entity.health.current_value,
			initialized_entity.health.max_value,
			initialized_entity.health.min_value
		],
		correct_health_values
	)
	assert_eq(
		[
			initialized_entity.speed.current_value,
			initialized_entity.speed.max_value,
			initialized_entity.speed.min_value
		],
		correct_speed_values
	)
	assert_eq(
		[
			initialized_entity.attack_speed.current_value,
			initialized_entity.attack_speed.max_value,
			initialized_entity.attack_speed.min_value
		],
		correct_attack_speed_values
	)


func test_entity_init_with_values():
	var correct_health_values = [100.0, 100.0, 0.0]
	var correct_speed_values = [50.0, 50.0, 0.0]
	var correct_attack_speed_values = [1.0, 2.0, 1.0]

	var initialized_entity: Entity = Entity.new("skeleton")

	assert_eq(
		[
			initialized_entity.health.current_value,
			initialized_entity.health.max_value,
			initialized_entity.health.min_value
		],
		correct_health_values
	)
	assert_eq(
		[
			initialized_entity.speed.current_value,
			initialized_entity.speed.max_value,
			initialized_entity.speed.min_value
		],
		correct_speed_values
	)
	assert_eq(
		[
			initialized_entity.attack_speed.current_value,
			initialized_entity.attack_speed.max_value,
			initialized_entity.attack_speed.min_value
		],
		correct_attack_speed_values
	)
