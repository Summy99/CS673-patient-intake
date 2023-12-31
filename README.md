# Team Roster: Patient Intake & Referral
1. Dylan Hensley - UI/UX Developer
2. Darryl Ortiz - Microservices Developer
3. Jitesh Chavan - Data Architect
4. Sarah Hart - Product Management

# Far Vision
 Work on improving front-end intake features. Make the interface more visually appealing and add more accessbility features to be more inclusive. Improve the referral system by recommending specialized care plans based on disabilities. 
# Near Vision
 Design an intake form that will gather user information and be connected to the database to store information. Do this through an interface that will allow the users to easily input and submit information. Consider implementing early stage accesibility features for users. Add a document upload feature for medical records or required documents. Work on grouping users based on disabilites to refer them to matching providers. 
# Stakeholder Types
1. Clients
2. Providers
3. Government Agencies

# User Persona
1. People with disabilities (wheelchairs, etc) who can't get around with their own transportation.
2. People living under assisted living.
3. People with language barriers or need for multi-language support.
4. People with general disabilities that requires them to need external support (physical or mental blocks)
5. Families or individuals in charge of the person with disabilities.
# Backlog
URL: https://www.pivotaltracker.com/n/projects/2677911
1. As a person with disabilities I want the intake form to be user-friendly and concise so I won't feel overwhelmed providing information. - Value = 1

2. As an individual requiring aid for independent living, I want to be able to fill out the patient intake form
   electronically to provide my personal information and medical history. - Value = 1

3. As a caregiver, I want the patient intake form to include emergency contact information for patients, in case
   of medical emergencies. - Value = 1

4. As a caregiver, I want the intake form to have an integrated validation system that ensures that all required
   fields are completed before submission. - Value = 1

5. As a caregiver, I want the intake form to present a concise summary for the patient's case. - Value = 1

6. As a provider, I want to receive real-time notifications when a patient is referred to me. - Value = 1
   (i think intake portal does not own this feature, I might be wrong.)
   
7. As a person with language barriers and who has a need for multi-language support, I want the intake form to be
   available in multiple languages so I can comfortably provide information. - Value = 1

8. As a patient, I want to have the option to save my progress through the patient intake form and return to
   complete it at a later time. Value = 3

9. As a patient, I want the intake form to be customizable so that I can add information records specific to my
   particular case. - Value = 2
 
10. As a patient with color blindness, I want the patient intake portal have an option to change visual themes so that I can traverse the form with ease. - Value = 1

# Rationale: 

We prioritize Story 1 because accesibility and experience is extremely crucial, especially for individuals with disabilities, to ensure inclusivity and usability for people from a broad spectrum.

Story 2 addresses the crux of the patient intake portal, allowing users to provide vital information electronically,
facilitating a seamless intake process for those who require aid.

Story 3 is prioritized next. Safety and immediate medical care in case of emergencies being critical concerns, they should be addressed early in the development process.

Story 4 is up next because data accuracy and completeness are important for providing care to individuals in requirement of aid for achieving independent living.

Story 4 is follwed by Story 5 because, to ensure proper and efficient delivery of care/assistance it is crucial that caregivers are provided with a concise summary of the case.

Story 6 : Prompt communication between the patient and caregiver is vital for seamless patient care delivery, making
making this one of the core functionalities. 

Story 7 : Having multilingual support is important for inclusivity for individuals with language barriers, however
it can be implemented after having setup the essential core functionalities.

Story 8 : Offering an option for the users to save and resume their partially filled forms improves usability but
it can be implemented after core features are in place.

Story 9 : Having the option to add custom information records is valuable for tailoring care delivery as per requirements of specific cases, however it can be implemented after core functionalities.

Story 10 : Although important for accessibility, this feature can be addressed after core features because it caters
to a specific/niche group of users.



# Definition of Ready:



# Team relative size estimating activity:

# "Greedy Sort" for estimating relative size

As a team we decided to follow a Greedy approach activity to estimate the relative size of features to be implemented.
The activity goes as follows:

1. Initially a group member out of 4 is chosen at random to serve as an arbitrator who decides in what order we iterate over the backlog features, however this arbitrator does not get to vote in the current round.

2. Arbitrator selects a feature at random and asks the other 3 group members to vote if they think the feature is easier to implement compared to all the other features from the "unsorted" fraction of the backlog items.
Majority wins!

3. At the end of first cycle, the group arrives at consensus which is the easies task to implement. This task is treated as reference task and is assigned a value of 1 point. All the other tasks are required to be estimated as an integral multiple of this reference baseline easiest task.

4. Then another group member takes the role of arbitrator for next round and the group follows the same procedure for the fraction of the backlog that has not been estimated yet.


# Definition of Ready

Sprint 1 : Patient Intake Portal

User Story Opening Sentence Structure : As a [Type of User] I want/need [feature], so that [benefit/goal].

Estimated Story Point Value = 13 story points

Acceptance criteria for story : 
1. A user story should be axiomatic in conveying what it requires to be implemented.
2. A user story should correspond to only one primitive/atomic feature.
