CREATE STREAM clean_data
with (
    KAFKA_TOPIC = 'topic2',
    VALUE_FORMAT = 'AVRO',
    PARTITIONS = 2
) as SELECT food_id,
CASE 
	WHEN gender = 1 THEN 'Female'
	WHEN gender = 2 THEN 'Male'
	ELSE 'Unknown'
END AS gender,
CASE 
	WHEN breakfast = 1 THEN 'Cereal'
	WHEN breakfast = 2 THEN 'Donut'
	ELSE 'Unknown'
END AS breakfast,calories_chicken,
CASE 
	WHEN coffee = 1 THEN 'creamy frapuccino'
	WHEN coffee = 2 THEN 'espresso shown'
	ELSE 'Unknown'
END AS coffee,
CASE 
    WHEN comfort_food_reasons_coded_1 = 1 THEN 'Stress'
    WHEN comfort_food_reasons_coded_1 = 2 THEN 'Boredom'
    WHEN comfort_food_reasons_coded_1 = 3 THEN 'Depression/Sadness'
    WHEN comfort_food_reasons_coded_1 = 4 THEN 'Hunger'
    WHEN comfort_food_reasons_coded_1 = 5 THEN 'Laziness'
    WHEN comfort_food_reasons_coded_1 = 6 THEN 'Cold Weather'
    WHEN comfort_food_reasons_coded_1 = 7 THEN 'Happiness'
    WHEN comfort_food_reasons_coded_1 = 8 THEN 'Watching TV'
    WHEN comfort_food_reasons_coded_1 = 9 THEN 'None'
    ELSE 'Unknown'
END AS comfort_food_reasons_coded_1,
CASE 
    WHEN diet_current_coded = 1 THEN 'Healthy/Balanced/Moderated'
    WHEN diet_current_coded = 2 THEN 'Unhealthy/Cheap/Too Much/Random'
    WHEN diet_current_coded = 3 THEN 'The Same Thing Over and Over'
    WHEN diet_current_coded = 4 THEN 'Unclear'
    ELSE 'Unknown'
END AS diet_current_coded,
CASE 
    WHEN eating_changes_coded = 1 THEN 'Worse'
    WHEN eating_changes_coded = 2 THEN 'Better'
    WHEN eating_changes_coded = 3 THEN 'The Same'
    WHEN eating_changes_coded = 4 THEN 'Unclear'
    ELSE 'Unknown'
END AS eating_changes_coded,
CASE 
    WHEN employment = 1 THEN 'Full-Time'
    WHEN employment = 2 THEN 'Part-Time'
    WHEN employment = 3 THEN 'Not Employed'
    WHEN employment = 4 THEN 'Other'
    ELSE 'Unknown'
END AS employment,
CASE 
    WHEN exercise = 1 THEN 'Everyday'
    WHEN exercise = 2 THEN '2-3 Times per Week'
    WHEN exercise = 3 THEN 'Once per Week'
    WHEN exercise = 4 THEN 'Sometimes'
    WHEN exercise = 5 THEN 'Never'
    ELSE 'Unknown'
END AS exercise
FROM stream1
EMIT CHANGES;
