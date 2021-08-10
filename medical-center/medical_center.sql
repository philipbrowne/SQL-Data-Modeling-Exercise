DROP DATABASE medical_center;
CREATE DATABASE medical_center;
\c medical_center;

CREATE TABLE "medical_centers" (
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
address TEXT NOT NULL,
phone_number TEXT NOT NULL);

CREATE TABLE "doctors" (
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
center_id INTEGER REFERENCES medical_center ON DELETE SET NULL);

CREATE TABLE "patients" (
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
dob DATE NOT NULL);

CREATE TABLE "doctor_patient" (
id SERIAL PRIMARY KEY,
doctor_id INTEGER REFERENCES doctor ON DELETE CASCADE,
patient_id INTEGER REFERENCES patient ON DELETE CASCADE); 

CREATE TABLE "visit" (
id SERIAL PRIMARY KEY,
date DATE NOT NULL,
center_id REFERENCES medical_centers ON DELETE SET NULL,
doctor_patient_id REFERENCES doctor_patient ON DELETE SET NULL);

CREATE TABLE "diagnosis" (
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
visit_id INTEGER REFERENCES visit ON DELETE SET NULL,
disease_id INTEGER REFERENCES diseases ON DELETE SET NULL);

CREATE TABLE "diseases" (
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
description TEXT);