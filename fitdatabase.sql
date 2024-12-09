DROP DATABASE IF EXISTS `FitnessManagement`;
CREATE DATABASE `FitnessManagement`; 
USE `FitnessManagement`;

CREATE TABLE members(`memberID` int(11) not null auto_increment,
					 `firstName` varchar(50) not null,
					 `lastName` varchar(50) not null ,
                     `gender` enum('Male','Female') not null,
                     `dateOfBirth` date , 
                     `phoneNumber` varchar(15),
                     `email` varchar(100),
                     PRIMARY KEY (`memberID`) 
                     );
CREATE TABLE workoutPlans( `planID` int(11) not null auto_increment,
							`memberID` int(11) not null,
                            `trainerID` int(11)not null,
                            `instructions` varchar(255) not null,
                            
                            primary key (`planID`),
                            FOREIGN KEY (`memberID`) references members(memberID)
							);
CREATE TABLE departements(`departementID` int(11) not null auto_increment,
						  `departementName` varchar(50),
                          `location` varchar(100),
                          PRIMARY KEY (`departementID`)
                          );
CREATE TABLE rooms(`roomID` int(11) not null auto_increment,
				   `roomNumber` varchar (10),
				   `roomType` enum('Cardio','Weights','Studio') , 
                   `capacity` int(11),
                   
                   PRIMARY KEY (`roomID`)
                   );
CREATE TABLE memberships(`membershipID` int(11) not null auto_increment,
						 `memberID` int(11) ,
                         `roomID` int(11),
                         `startDate` date,
                         PRIMARY KEY (`membershipID`),
                         FOREIGN KEY (`memberID`) references members(memberID),
                         FOREIGN KEY (`roomID`) references rooms(roomID)
                         );
	
CREATE TABLE appointments(`appointmentID` int(11) not null auto_increment,
						  `appointmentDate` date ,
                          `appointmentTime` time ,
                          `trainerID` int(11),
                          `memberID` int(11),
                          PRIMARY KEY (`appointmentID`),
                          FOREIGN KEY (`trainerID`) references trainers(trainerID),
                          FOREIGN KEY (`memberID`) references members(membreID)
                          );



                          
                   


