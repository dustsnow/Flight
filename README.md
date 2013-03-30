Components of the APP:
[UI] - User Interface
[BE] = Back End

	1. [UI] Facebook-like Slidebar
	2. [UI] tableList showing list of flights
	3. [BE] Get data from server
	4. [BE] Send data to server
	5. [BE] MapAPI
	6. [BE] Push Notification
	7. [BE] Save user profile, preference, history flight, etc.


Workflow:

	APP sends flight list search request to SERVER.
		1. SERVER looks up flight list on FTT 
		2. SERVER wraps look-up result into JSON
		3. SERVER sends reponse to APP
	APP sends a flight time request to SERVER
		1. SERVER do calculation
		2. SERVER wraps results into JSON
		3. SERVER sends response to APP
		4. SERVER keeps monitering this flight
			a. if delay, cancel, etc., send updated flight info to PARSE
			b. PARSE push notification to APP
			c. if no situation happens, APP push notification to remind user 30mins before arrival.
