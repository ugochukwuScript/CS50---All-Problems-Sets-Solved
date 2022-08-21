-- Keep a log of any SQL queries you execute as you solve the mystery.

-- We know that the theft took place on July 28, 2021 and that it took place on Humphrey Street.
SELECT * FROM crime_scene_reports WHERE month = 7 AND day = 28 AND street = 'Humphrey Street';


-- From the desciption the crime took place at 10:15 at the bakery
SELECT * FROM bakery_security_logs WHERE year = 2021 AND day = 28 AND month = 7 AND hour = 10 AND  minute >= 15;


-- If the crime took place at 10:15 then we should track the first exits on or after that time as one of them is the thief
SELECT people.id, people.name, people.phone_number, people.passport_number, people.license_plate FROM people
JOIN bakery_security_logs ON people.license_plate = bakery_security_logs.license_plate
WHERE year = 2021 AND day = 28 AND month = 7 AND hour = 10 AND  minute >= 15 AND activity = 'exit';

-- We know that shortly afterwards the thief took a flight out of town, so let's look for people that took a flight after the robery that day
-- that are among the suspects from the result set above

SELECT * FROM passengers
JOIN (
    SELECT people.id, people.name, people.phone_number, people.passport_number, people.license_plate FROM people
    JOIN bakery_security_logs ON people.license_plate = bakery_security_logs.license_plate
    WHERE year = 2021 AND day = 28 AND month = 7 AND hour = 10 AND  minute >= 15 AND activity = 'exit'
    ) AS suspects
    ON passengers.passport_number = suspects.passport_number
JOIN flights ON passengers.flight_id = flights.id
WHERE flights.day = 28 AND flights.month = 7 AND flights.hour >= 10 AND flights.minute >= 15;