
-- Applications with status
SELECT ja.ApplicationID, j.JobTitle, ja.Status, ja.DateApplied
FROM JobApplications ja
JOIN Jobs j ON ja.JobID = j.JobID
JOIN Users u ON ja.UserID = u.UserID
WHERE u.Email = 'sara@example.com';

-- Upcoming Interviews
SELECT j.JobTitle, i.InterviewDate, i.InterviewType, i.Outcome
FROM Interviews i
JOIN JobApplications ja ON i.ApplicationID = ja.ApplicationID
JOIN Jobs j ON ja.JobID = j.JobID
JOIN Users u ON ja.UserID = u.UserID
WHERE u.Email = 'sara@example.com' AND i.InterviewDate >= CURRENT_DATE;

-- Follow-up Reminders
SELECT r.ReminderType, r.ReminderDate, j.JobTitle
FROM Reminders r
JOIN JobApplications ja ON r.ApplicationID = ja.ApplicationID
JOIN Jobs j ON ja.JobID = j.JobID
JOIN Users u ON ja.UserID = u.UserID
WHERE u.Email = 'sara@example.com' AND r.ReminderDate > CURRENT_DATE;

-- Companies that offered jobs
SELECT c.CompanyName, j.JobTitle, jo.SalaryOffered, jo.OfferDate, jo.OfferStatus
FROM JobOffers jo
JOIN JobApplications ja ON jo.ApplicationID = ja.ApplicationID
JOIN Jobs j ON ja.JobID = j.JobID
JOIN Companies c ON j.CompanyID = c.CompanyID
JOIN Users u ON ja.UserID = u.UserID
WHERE u.Email = 'sara@example.com';

-- Accept a job offer
UPDATE JobApplications
SET Status = 'Offer Accepted'
WHERE ApplicationID = 1012;
