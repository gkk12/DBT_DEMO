{% macro function_example1(x) %}
CASE 
    WHEN TO_TIMESTAMP({{x}}) < CURRENT_DATE
        THEN 'PAST'
    WHEN TO_TIMESTAMP({{x}}) > CURRENT_DATE
        THEN 'FUTURE'
    ELSE 'PRESENT'
END
{% endmacro %}

{% macro get_season(started_at) %}
CASE 
    WHEN MONTH(TO_TIMESTAMP({{started_at}})) in (12, 1, 2)
        THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP({{started_at}})) in (3, 4, 5)
        THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP({{started_at}})) in (6, 7, 8)
        THEN 'SUMMER'
    ELSE 'AUTUMN'
END
{% endmacro %}

{% macro get_day_type(started_at)%}
CASE 
    WHEN DAYNAME(TO_TIMESTAMP(started_at)) in ('Sun', 'Sat')
        THEN 'WEEKEND'
    ELSE 'WEEKDAY'
END
{% endmacro %}