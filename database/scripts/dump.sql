create table districts (
    id serial primary key,
    name text,
    description text,
    municipality text,
    create_date timestamp default now(),
    update_date timestamp DEFAULT now()
);

insert into districts (name, description, municipality) values 
    ('mt lebo', 'the best school district', 'allegheny county'),
    ('city of pittsburgh', 'the most diverse town', 'allegheny county'),
    ('butler township', 'we love football', 'butler');

create table schools (
    id serial primary key,
    name text,
    description text,
    type text,
    create_date timestamp default now(),
    update_date timestamp DEFAULT now()
);

insert into schools (name, description, type) values 
    ('fulton elementry', 'math focused city school', 'elementry'),
    ('detrich', 'music focused city school', 'middle'),
    ('nattily high', 'ethinic focused city school', 'high'),
    ('mt lebo', 'high school in the burbs', 'high');