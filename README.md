Write a web service in one of the following languages:Java, Python, Ruby, JavaScript. It will perform unit conversion to SI from their “widely used” counterparts. Our tests are automated, so be sure to design your API path exactly as described below. It has a single method to convert units.

Method:  GET
Path:  /units/si

Query parameter:  units . “A string containing any number of SI units multiplied or divided, which might contain parenthesis. Examples: “degree”, “degree/minute”, “(degree/(minute*hectare)) ”,  “ha*°”
Return a JSON object with two values:
  unit_name : a string of units converted to their SI counterpart. They do not need to be reduced, so something like “(s/s)” for “(min/min)” is acceptable. The parenthesis should match the input.

  multiplication_factor : a floating point number (rounded to 14 decimal places) you can use to convert any input in the original units to the new widely-used SI units. 

Example:
GET "/units/si?units=degree/minute"
->
{ “unit_name”: "rad/s", “multiplication_factor”: 0.00029088820867 }
The table below denotes valid input & conversion factors for you to implement. Either values from the left 2 columns are valid input, with the exception of ‘minute’: please use only the quote (‘) character to denote plane angle, and reserve “minute” and “min” for time.

Name
Symbol
Type
SI Unit Conversion
minute
min
time
60s
hour
h
time
3600s
day
d
time
86400s
degree
 °
Plane angle
(π / 180)  rad
‘
Plane angle
(π / 10800) rad
second
“
Plane angle
(π / 648000) rad
hectare
ha
area
 10000 m2 
litre
L
volume
 0.001  m3 
tonne
t
mass
103     kg
