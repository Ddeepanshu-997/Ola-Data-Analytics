create database bookings_bengaluru;
use bookings_bengaluru;


/* Retrieve all successful bookings             */
SELECT * FROM bengaluru_ride_data WHERE Booking_Status = 'Completed';


 /*Find the average ride distance for each vehicle type   */
 select Vehicle_Type , avg(Ride_Distance) from bengaluru_ride_data group by Vehicle_Type;

 /* Get the total number of cancelled rides by customers  */
 select count(Booking_Status) from bengaluru_ride_data where Booking_Status = 'Cancelled by Driver' or Booking_Status = 'Cancelled by Customer';

 /*  List the top 5 customers who booked the highest number of rides  */
 select top 5((Customer_ID)), count(Booking_ID) as total_rides from bengaluru_ride_data group by Customer_ID ORDER BY total_rides DESC;

 /*  Get the number of rides cancelled by drivers due to personal and car-related issues:     */

SELECT COUNT(*) 
FROM bengaluru_ride_data  
WHERE Reason_for_Cancelling_by_Driver = 'Personal & Car related issues';


/*Find the maximum and minimum driver ratings for Prime Sedan bookings  */
select max(Driver_Ratings) as max_D , min(Driver_Ratings) as min_D from bengaluru_ride_data  where Vehicle_Type = 'Prime Sedan';

/* . Find the average customer rating per vehicle type */
select  Vehicle_Type , AVG(Customer_Rating) as Ratings_out_of_5 from bengaluru_ride_data group by Vehicle_type;

/*  Calculate the total booking value of rides completed successfully */
select Booking_Status , count(Booking_Status)as value from bengaluru_ride_data  group by Booking_Status;


/* List all incomplete rides along with the reason*/

 SELECT  Incomplete_Rides_Reason , count(Incomplete_Rides) as num_of_cancelations FROM bengaluru_ride_data 
 WHERE Incomplete_Rides =1 group by Incomplete_Rides_Reason;

 
