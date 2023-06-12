create database if not exists billing_app_main;
use billing_app_main;
create table if not exists patient(
	id int auto_increment primary key,
    patient_name varchar(255) not null,
    date_of_birth date,
    gender enum('Male', 'Female', 'Other'),
    address varchar(255),
    contact_number varchar(255),
    diagnosis varchar(500)
);
create table if not exists invoice(
	id int auto_increment primary key,
    consulting_charge int,
    spectacles_charge int,
    additional_charge int,
	total_amount int,
    patient_id int,
    foreign key(patient_id) references patient(id) on delete cascade
);

create table if not exists invoice_medicine(
	id int auto_increment primary key,
    invoice_id int not null,
    medicine_name varchar(255),
    medicine_price int,
    medicine_quantity int,
    medicine_total int,
    foreign key (invoice_id) references invoice(id) on delete cascade
);

create table if not exists medicine(
	id int auto_increment primary key,
    medicine_name varchar(255),
    price int
);
