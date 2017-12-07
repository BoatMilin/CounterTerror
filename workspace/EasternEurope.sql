.output 1_2016_EasternEurope.json

-- select target_country, group_name, count(attack_id)
select json_object("source", target_country, "target", group_name, "value", count(attack_id))
from detailed_terror_attack
where year=2016 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2016 and target_region='Eastern Europe' 
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2016 and target_region='Eastern Europe'
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by target_country, group_name;

--terrorist group -> attack target
-- select group_name, attack_target, count(attack_id)
select json_object("source", group_name, "target", attack_target, "value", count(attack_id))
from detailed_terror_attack
where year=2016 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2016 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_target
        from detailed_terror_attack
        where year=2016 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by group_name, attack_target;

--attack target -> attack type
-- select attack_target, attack_type, count(attack_id)
select json_object("source", attack_target, "target", attack_type, "value", count(attack_id))
from detailed_terror_attack
where year=2016 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2016 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2016 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by attack_target, attack_type;

.output 1_2016_EasternEurope_0.json

select distinct json_object('name', target_country) 
from detailed_terror_attack
where year=2016 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2016 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
)
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2016 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2016_EasternEurope_1.json

select distinct json_object('name', group_name) 
from detailed_terror_attack
where year=2016 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2016 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2016 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2016_EasternEurope_2.json

select distinct json_object('name', attack_target) 
from detailed_terror_attack
where year=2016 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2016 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2016 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2016_EasternEurope_3.json

select distinct json_object('name', attack_type) 
from detailed_terror_attack
where year=2016 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2016 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2016 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2015_EasternEurope.json

-- select target_country, group_name, count(attack_id)
select json_object("source", target_country, "target", group_name, "value", count(attack_id))
from detailed_terror_attack
where year=2015 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2015 and target_region='Eastern Europe' 
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2015 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by target_country, group_name;

--terrorist group -> attack target
-- select group_name, attack_target, count(attack_id)
select json_object("source", group_name, "target", attack_target, "value", count(attack_id))
from detailed_terror_attack
where year=2015 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2015 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2015 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by group_name, attack_target;

--attack target -> attack type
-- select attack_target, attack_type, count(attack_id)
select json_object("source", attack_target, "target", attack_type, "value", count(attack_id))
from detailed_terror_attack
where year=2015 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2015 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2015 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by attack_target, attack_type;

.output 1_2015_EasternEurope_0.json

select distinct json_object('name', target_country) 
from detailed_terror_attack
where year=2015 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2015 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
)
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2015 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2015_EasternEurope_1.json

select distinct json_object('name', group_name) 
from detailed_terror_attack
where year=2015 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2015 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2015 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2015_EasternEurope_2.json

select distinct json_object('name', attack_target) 
from detailed_terror_attack
where year=2015 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2015 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2015 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2015_EasternEurope_3.json

select distinct json_object('name', attack_type) 
from detailed_terror_attack
where year=2015 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2015 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2015 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2014_EasternEurope.json

-- select target_country, group_name, count(attack_id)
select json_object("source", target_country, "target", group_name, "value", count(attack_id))
from detailed_terror_attack
where year=2014 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2014 and target_region='Eastern Europe' 
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2014 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by target_country, group_name;

--terrorist group -> attack target
-- select group_name, attack_target, count(attack_id)
select json_object("source", group_name, "target", attack_target, "value", count(attack_id))
from detailed_terror_attack
where year=2014 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2014 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2014 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by group_name, attack_target;

--attack target -> attack type
-- select attack_target, attack_type, count(attack_id)
select json_object("source", attack_target, "target", attack_type, "value", count(attack_id))
from detailed_terror_attack
where year=2014 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2014 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2014 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by attack_target, attack_type;

.output 1_2014_EasternEurope_0.json

select distinct json_object('name', target_country) 
from detailed_terror_attack
where year=2014 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2014 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
)
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2014 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2014_EasternEurope_1.json

select distinct json_object('name', group_name) 
from detailed_terror_attack
where year=2014 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2014 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2014 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2014_EasternEurope_2.json

select distinct json_object('name', attack_target) 
from detailed_terror_attack
where year=2014 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2014 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2014 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2014_EasternEurope_3.json

select distinct json_object('name', attack_type) 
from detailed_terror_attack
where year=2014 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2014 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2014 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2013_EasternEurope.json

-- select target_country, group_name, count(attack_id)
select json_object("source", target_country, "target", group_name, "value", count(attack_id))
from detailed_terror_attack
where year=2013 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2013 and target_region='Eastern Europe' 
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2013 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by target_country, group_name;

--terrorist group -> attack target
-- select group_name, attack_target, count(attack_id)
select json_object("source", group_name, "target", attack_target, "value", count(attack_id))
from detailed_terror_attack
where year=2013 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2013 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2013 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by group_name, attack_target;

--attack target -> attack type
-- select attack_target, attack_type, count(attack_id)
select json_object("source", attack_target, "target", attack_type, "value", count(attack_id))
from detailed_terror_attack
where year=2013 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2013 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2013 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by attack_target, attack_type;

.output 1_2013_EasternEurope_0.json

select distinct json_object('name', target_country) 
from detailed_terror_attack
where year=2013 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2013 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
)
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2013 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2013_EasternEurope_1.json

select distinct json_object('name', group_name) 
from detailed_terror_attack
where year=2013 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2013 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2013 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2013_EasternEurope_2.json

select distinct json_object('name', attack_target) 
from detailed_terror_attack
where year=2013 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2013 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2013 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2013_EasternEurope_3.json

select distinct json_object('name', attack_type) 
from detailed_terror_attack
where year=2013 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2013 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2013 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2012_EasternEurope.json

-- select target_country, group_name, count(attack_id)
select json_object("source", target_country, "target", group_name, "value", count(attack_id))
from detailed_terror_attack
where year=2012 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2012 and target_region='Eastern Europe' 
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2012 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by target_country, group_name;

--terrorist group -> attack target
-- select group_name, attack_target, count(attack_id)
select json_object("source", group_name, "target", attack_target, "value", count(attack_id))
from detailed_terror_attack
where year=2012 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2012 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2012 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by group_name, attack_target;

--attack target -> attack type
-- select attack_target, attack_type, count(attack_id)
select json_object("source", attack_target, "target", attack_type, "value", count(attack_id))
from detailed_terror_attack
where year=2012 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2012 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2012 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by attack_target, attack_type;

.output 1_2012_EasternEurope_0.json

select distinct json_object('name', target_country) 
from detailed_terror_attack
where year=2012 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2012 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
)
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2012 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2012_EasternEurope_1.json

select distinct json_object('name', group_name) 
from detailed_terror_attack
where year=2012 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2012 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2012 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2012_EasternEurope_2.json

select distinct json_object('name', attack_target) 
from detailed_terror_attack
where year=2012 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2012 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2012 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2012_EasternEurope_3.json

select distinct json_object('name', attack_type) 
from detailed_terror_attack
where year=2012 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2012 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2012 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2011_EasternEurope.json

-- select target_country, group_name, count(attack_id)
select json_object("source", target_country, "target", group_name, "value", count(attack_id))
from detailed_terror_attack
where year=2011 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2011 and target_region='Eastern Europe' 
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2011 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by target_country, group_name;

--terrorist group -> attack target
-- select group_name, attack_target, count(attack_id)
select json_object("source", group_name, "target", attack_target, "value", count(attack_id))
from detailed_terror_attack
where year=2011 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2011 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2011 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by group_name, attack_target;

--attack target -> attack type
-- select attack_target, attack_type, count(attack_id)
select json_object("source", attack_target, "target", attack_type, "value", count(attack_id))
from detailed_terror_attack
where year=2011 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2011 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2011 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by attack_target, attack_type;

.output 1_2011_EasternEurope_0.json

select distinct json_object('name', target_country) 
from detailed_terror_attack
where year=2011 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2011 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
)
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2011 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2011_EasternEurope_1.json

select distinct json_object('name', group_name) 
from detailed_terror_attack
where year=2011 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2011 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2011 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2011_EasternEurope_2.json

select distinct json_object('name', attack_target) 
from detailed_terror_attack
where year=2011 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2011 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2011 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2011_EasternEurope_3.json

select distinct json_object('name', attack_type) 
from detailed_terror_attack
where year=2011 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2011 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2011 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2010_EasternEurope.json

-- select target_country, group_name, count(attack_id)
select json_object("source", target_country, "target", group_name, "value", count(attack_id))
from detailed_terror_attack
where year=2010 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2010 and target_region='Eastern Europe' 
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2010 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by target_country, group_name;

--terrorist group -> attack target
-- select group_name, attack_target, count(attack_id)
select json_object("source", group_name, "target", attack_target, "value", count(attack_id))
from detailed_terror_attack
where year=2010 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2010 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2010 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by group_name, attack_target;

--attack target -> attack type
-- select attack_target, attack_type, count(attack_id)
select json_object("source", attack_target, "target", attack_type, "value", count(attack_id))
from detailed_terror_attack
where year=2010 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2010 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2010 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by attack_target, attack_type;

.output 1_2010_EasternEurope_0.json

select distinct json_object('name', target_country) 
from detailed_terror_attack
where year=2010 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2010 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
)
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2010 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2010_EasternEurope_1.json

select distinct json_object('name', group_name) 
from detailed_terror_attack
where year=2010 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2010 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2010 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2010_EasternEurope_2.json

select distinct json_object('name', attack_target) 
from detailed_terror_attack
where year=2010 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2010 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2010 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2010_EasternEurope_3.json

select distinct json_object('name', attack_type) 
from detailed_terror_attack
where year=2010 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2010 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2010 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2009_EasternEurope.json

-- select target_country, group_name, count(attack_id)
select json_object("source", target_country, "target", group_name, "value", count(attack_id))
from detailed_terror_attack
where year=2009 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2009 and target_region='Eastern Europe' 
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2009 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by target_country, group_name;

--terrorist group -> attack target
-- select group_name, attack_target, count(attack_id)
select json_object("source", group_name, "target", attack_target, "value", count(attack_id))
from detailed_terror_attack
where year=2009 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2009 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2009 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by group_name, attack_target;

--attack target -> attack type
-- select attack_target, attack_type, count(attack_id)
select json_object("source", attack_target, "target", attack_type, "value", count(attack_id))
from detailed_terror_attack
where year=2009 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2009 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2009 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by attack_target, attack_type;

.output 1_2009_EasternEurope_0.json

select distinct json_object('name', target_country) 
from detailed_terror_attack
where year=2009 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2009 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
)
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2009 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2009_EasternEurope_1.json

select distinct json_object('name', group_name) 
from detailed_terror_attack
where year=2009 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2009 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2009 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2009_EasternEurope_2.json

select distinct json_object('name', attack_target) 
from detailed_terror_attack
where year=2009 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2009 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2009 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2009_EasternEurope_3.json

select distinct json_object('name', attack_type) 
from detailed_terror_attack
where year=2009 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2009 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2009 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2008_EasternEurope.json

-- select target_country, group_name, count(attack_id)
select json_object("source", target_country, "target", group_name, "value", count(attack_id))
from detailed_terror_attack
where year=2008 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2008 and target_region='Eastern Europe' 
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2008 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by target_country, group_name;

--terrorist group -> attack target
-- select group_name, attack_target, count(attack_id)
select json_object("source", group_name, "target", attack_target, "value", count(attack_id))
from detailed_terror_attack
where year=2008 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2008 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2008 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by group_name, attack_target;

--attack target -> attack type
-- select attack_target, attack_type, count(attack_id)
select json_object("source", attack_target, "target", attack_type, "value", count(attack_id))
from detailed_terror_attack
where year=2008 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2008 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2008 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by attack_target, attack_type;

.output 1_2008_EasternEurope_0.json

select distinct json_object('name', target_country) 
from detailed_terror_attack
where year=2008 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2008 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
)
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2008 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2008_EasternEurope_1.json

select distinct json_object('name', group_name) 
from detailed_terror_attack
where year=2008 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2008 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2008 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2008_EasternEurope_2.json

select distinct json_object('name', attack_target) 
from detailed_terror_attack
where year=2008 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2008 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2008 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2008_EasternEurope_3.json

select distinct json_object('name', attack_type) 
from detailed_terror_attack
where year=2008 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2008 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2008 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2007_EasternEurope.json

-- select target_country, group_name, count(attack_id)
select json_object("source", target_country, "target", group_name, "value", count(attack_id))
from detailed_terror_attack
where year=2007 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2007 and target_region='Eastern Europe' 
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2007 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by target_country, group_name;

--terrorist group -> attack target
-- select group_name, attack_target, count(attack_id)
select json_object("source", group_name, "target", attack_target, "value", count(attack_id))
from detailed_terror_attack
where year=2007 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2007 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2007 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by group_name, attack_target;

--attack target -> attack type
-- select attack_target, attack_type, count(attack_id)
select json_object("source", attack_target, "target", attack_type, "value", count(attack_id))
from detailed_terror_attack
where year=2007 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2007 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2007 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by attack_target, attack_type;

.output 1_2007_EasternEurope_0.json

select distinct json_object('name', target_country) 
from detailed_terror_attack
where year=2007 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2007 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
)
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2007 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2007_EasternEurope_1.json

select distinct json_object('name', group_name) 
from detailed_terror_attack
where year=2007 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2007 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2007 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2007_EasternEurope_2.json

select distinct json_object('name', attack_target) 
from detailed_terror_attack
where year=2007 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2007 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2007 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2007_EasternEurope_3.json

select distinct json_object('name', attack_type) 
from detailed_terror_attack
where year=2007 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2007 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2007 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2006_EasternEurope.json

-- select target_country, group_name, count(attack_id)
select json_object("source", target_country, "target", group_name, "value", count(attack_id))
from detailed_terror_attack
where year=2006 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2006 and target_region='Eastern Europe' 
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2006 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by target_country, group_name;

--terrorist group -> attack target
-- select group_name, attack_target, count(attack_id)
select json_object("source", group_name, "target", attack_target, "value", count(attack_id))
from detailed_terror_attack
where year=2006 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2006 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2006 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by group_name, attack_target;

--attack target -> attack type
-- select attack_target, attack_type, count(attack_id)
select json_object("source", attack_target, "target", attack_type, "value", count(attack_id))
from detailed_terror_attack
where year=2006 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2006 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2006 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    )
group by attack_target, attack_type;

.output 1_2006_EasternEurope_0.json

select distinct json_object('name', target_country) 
from detailed_terror_attack
where year=2006 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2006 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
)
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2006 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2006_EasternEurope_1.json

select distinct json_object('name', group_name) 
from detailed_terror_attack
where year=2006 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2006 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2006 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2006_EasternEurope_2.json

select distinct json_object('name', attack_target) 
from detailed_terror_attack
where year=2006 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2006 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2006 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

.output 1_2006_EasternEurope_3.json

select distinct json_object('name', attack_type) 
from detailed_terror_attack
where year=2006 and target_region='Eastern Europe'
    and group_name in (
       select group_name
        from detailed_terror_attack
        where year=2006 and target_region='Eastern Europe'
        group by group_name
        order by count(group_name) desc
        limit 5
    )
    and attack_target in (
       select attack_Target
        from detailed_terror_attack
        where year=2006 and target_region='Eastern Europe' 
        group by attack_target
        order by count(attack_target) desc
        limit 5 
    );

