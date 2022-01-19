drop database if exists too_many_cooks;
create database too_many_cooks;
use too_many_cooks;

-- creating tables and relationships

create table cuisine (
	cuisine_id int primary key auto_increment,
    `name` varchar(30) not null
);

create table app_user (
	app_user_id int primary key auto_increment,
    username varchar(50) not null unique,
    password_hash varchar (2048) not null,
    disabled boolean not null default 0,
    email varchar (320) unique
);

create table app_role (
	app_role_id int primary key auto_increment,
    `name` varchar(50) not null unique
);

create table recipe (
	recipe_id int primary key auto_increment,
    `name` varchar(100) not null,
    `description` varchar(10000) not null,
    image_ref varchar(150) null,
    date_posted date not null,
    cuisine_id int not null,
    app_user_id int not null,
    constraint fk_cuisine_id
		foreign key (cuisine_id)
        references cuisine(cuisine_id),
	constraint fk_app_user_id
		foreign key (app_user_id)
        references app_user(app_user_id)
);

create table ingredient (
	ingredient_id int primary key auto_increment,
    `name` varchar(100) not null,
    quantity varchar(30) not null,
    recipe_id int not null,
    constraint fk_recipe_id
		foreign key (recipe_id)
        references recipe(recipe_id)
);


create table app_user_role (
	app_user_id int not null,
    app_role_id int not null,
    constraint pk_app_user_role
		primary key (app_user_id, app_role_id),
	constraint fk_app_user_role_user_id
		foreign key (app_user_id)
        references app_user(app_user_id),
    constraint fk_app_user_role_role_id
        foreign key (app_role_id)
        references app_role(app_role_id)
);

insert into cuisine (`name`)
	values
		('Italian'),
		('Thai'),
		('French'),
		('Japanese'),
		('Spanish'),
		('German'),
		('Indian'),
		('Korean'),
		('Australian'),
		('Scottish'),
		('Mexican'),
		('Turkish'),
		('Greek'),
		('Lebanese'),
		('Caribbean'),
		('Arab'),
		('English'),
		('Russian'),
		('Portuguese'),
		('Filipino'),
		('American'),
		('South African'),
		('Brazilian'),
		('Chinese'),
		('Other'),
		('Fusion');

	-- Passwords are set to "password-hash" without the quotes
	insert into app_user (username, password_hash, disabled, email)
	values
		('Spencer', '$2a$04$v.DIBoRQr9yyuZUgbOy0mOQo5a/vhLerhMFh0a7SyYjtTBsb7xCp.', 0, 'spencer@dev.com'),
		('Nell', '$2a$04$v.DIBoRQr9yyuZUgbOy0mOQo5a/vhLerhMFh0a7SyYjtTBsb7xCp.', 0, 'nell@dev.com'),
		('Auren', '$2a$04$v.DIBoRQr9yyuZUgbOy0mOQo5a/vhLerhMFh0a7SyYjtTBsb7xCp.', 0, 'auren@dev.com');

	insert into app_role (`name`)
	values
		('USER'),
		('ADMIN');

	insert into recipe (`name`, `description`, image_ref, date_posted, cuisine_id, app_user_id)
	values
		('Lasagna', 'Step 1: In a large skillet over medium heat, brown ground beef. Drain grease. Add spaghetti sauce and simmer for 5 minutes. Step 2: In a bowl mix mozzarella cheese, eggs, parmesan cheese, parsley, salt, pepper. Step 3: Spread sauce along 9x13 inch baking pan. Layer noodles on top. Layer cheese then sauce. Repeat layers once more. Top with sauce then cheese. Add 1/2 cup water to edges of pan. Cover with aluminum foil. Step 4: Bake at 350 degrees F for 45 minutes. Uncover and bake another 10 minutes. Let stand 10 minutes to cool.', 'https://www.modernhoney.com/wp-content/uploads/2019/08/Classic-Lasagna-14-scaled.jpg', '2022-01-11', 1, 2),
		('Buttered Noodles', 'Step 1: Boil half a medium saucepan of lightly salted water. Step 2: Pour in box of noodles and bring back to a boil. Let cook for 8-10 minutes or until desired texture. Step 3: Drain and return pasta to pot. Step 4: Mix in butter until fully melted.', 'https://www.culinaryhill.com/wp-content/uploads/2021/02/Buttered-noodlesCulinary-Hill-1200x800-1.jpg', '2022-01-11', 1, 3),
		('Garlic Bread', 'Step 1: In a small bowl combine garlic and butter. Cut bread and brush butter mix over cut sides of bread. Place cut side up on a tin foil covered baking sheet. Step 2: Bake at 350 degrees F for 8 minutes or until golden brown.', 'https://i.ytimg.com/vi/ZxZO9wdOHPU/maxresdefault.jpg', '2022-01-11', 1, 3),
		('Salmon Nigiri', 'Step 1: Cook sushi rice, transfer to a large bowl and mix in sushi vinegar. Step 2: Slice salmon into slivers. Step 3: Shape 3 tablespoons of rice in your hand. Step 4: Assemble the nigiri by placing salmon over shaped rice.', 'https://izzycooking.com/wp-content/uploads/2020/10/Salmon-Nigiri-2.jpg', '2022-01-11', 4, 2),
		('Teriyaki Chicken Tacos', 'Step 1: Combine chicken and teriyaki sauce in a large ziploc, seal and chill for 30 minutes. Step 2: Cook chicken in a pan for 5-8 minutes or until cooked through. Step 3: Prepare asian slaw, mix together cabbage, onion, cucumber, cilantro, sour cream, salt, pepper, and sriracha. Step 4: Slice chicken, serve in tortillas with asian slaw garnish.', 'https://www.lecremedelacrumb.com/wp-content/uploads/2019/05/teriyaki-chicken-tacos-3.jpg', '2022-01-11', 26, 1);

	insert into ingredient (`name`, quantity, recipe_id)
	values
		('Ground Beef', '1 Pound', 1),
		('Spaghetti Sauce', '1 Jar (32 Ounces)', 1),
		('Mozzarella Cheese', '3 Cups', 1),
		('Eggs', '2', 1),
		('Parmesan Cheese', '1/2 Cup', 1),
		('Parsley', '2 Teaspoons', 1),
		('Salt', 'To taste', 1),
		('Pepper', 'To taste', 1),
		('Lasagna Noodles', '1 Box', 1),
		('Noodles', '1 Box', 2),
		('Butter', '6 Tablespoons', 2),
		('Parmesan Cheese', '1/3 Cup', 2),
		('Salt', 'To taste', 2),
		('Pepper', 'To taste', 2),
		('Butter', '1/2 Cup', 3),
		('Garlic', '4 Cloves', 3),
		('Bread', '1 Loaf', 3),
		('Raw Salmon', '1 Pound', 4),
		('Sushi Vinegar', '1 Tablespoon', 4),
		('Sushi Rice', '2 Cups', 4),
		('Boneless Chicken Breast', '3 Breasts', 5),
		('Teriyaki Sauce', '1 1/2 Cups', 5),
		('Flour Tortillas', '8-10', 5),
		('Shredded Cabbage', '1 Cup', 5),
		('Sliced Red Onion', '1/4 Onion', 5),
		('Sliced Cucumber', '1/4 Cucumber', 5),
		('Chopped Cilantro', '1 Tablespoon', 5),
		('Sour Cream', '1/3 Cup', 5),
		('Sriracha Sauce', '1/2 Teaspoon', 5),
		('Salt', 'To taste', 5),
		('Pepper', 'To taste', 5);

	insert into app_user_role (app_user_id, app_role_id)
	values
		(1, 1),
		(2, 2),
		(3, 1);

